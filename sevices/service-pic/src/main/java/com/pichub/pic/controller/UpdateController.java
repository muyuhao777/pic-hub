package com.pichub.pic.controller;

import com.pichub.pic.bean.Picture;
import com.pichub.pic.repository.PictureRepository;
import com.pichub.pic.repository.PictureTypeRepository;
import com.pichub.pic.service.InsertService;
import com.pichub.pic.service.UpdateService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/pic")
@RequiredArgsConstructor
public class UpdateController {
    @Autowired
    UpdateService updateService;

    @Autowired
    PictureTypeRepository typeRepository;

    private final PictureRepository pictureRepository;

    @GetMapping("/update/{id}")
    public String getUpdatePage(@PathVariable Integer id, Model model) {
        // 获取图片信息
        Picture pic = pictureRepository.findById(id).get();
        model.addAttribute("pic", pic);

        // 获取所有类型选项
        model.addAttribute("styleTypes", typeRepository.findByCategory("STYLE"));
        model.addAttribute("contentTypes", typeRepository.findByCategory("CONTENT"));
        model.addAttribute("regionTypes", typeRepository.findByCategory("REGION"));

        return "update";
    }

    // 提交修改
    @PostMapping("/update")
    public String updatePic(Picture pic, RedirectAttributes redirectAttributes) {
        updateService.update(pic);
        redirectAttributes.addFlashAttribute("message", "图片修改成功");
        return "redirect:http://localhost/pic/search";
    }
}
