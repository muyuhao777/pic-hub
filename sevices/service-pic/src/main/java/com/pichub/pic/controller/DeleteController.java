package com.pichub.pic.controller;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.pichub.pic.bean.Picture;
import com.pichub.pic.feign.PicFeignClient;
import com.pichub.pic.repository.PictureRepository;
import com.pichub.pic.service.DeleteService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/pic/delete")
@RequiredArgsConstructor
public class DeleteController {
    private final DeleteService deleteService;

    private final PicFeignClient picFeignClient;

    private final PictureRepository pictureRepository;

    @PostMapping("/{id}")
    @SentinelResource(value = "delete", blockHandler = "deletePictureFallback")
    public String deletePicture(@PathVariable Integer id,
                                RedirectAttributes redirectAttributes){

        Picture picture = pictureRepository.findById(id).orElse(null);

        int picNum = picFeignClient.getPicNum(picture.getOwnerId());
        boolean add_succ = picFeignClient.addPicNum(picture.getOwnerId(), picNum - 1);

        if(add_succ) {
            deleteService.deletePicture(picture);
            redirectAttributes.addFlashAttribute("successMessage", "删除成功！");
            return "redirect:http://localhost/pic/search";
        }else{
            return "redirect:http://localhost/pic/search";
        }

    }
}
