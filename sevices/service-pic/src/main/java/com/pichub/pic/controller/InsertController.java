package com.pichub.pic.controller;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.pichub.login.bean.User;
import com.pichub.pic.bean.Picture;
import com.pichub.pic.bean.PictureType;
import com.pichub.pic.dto.request.PictureInsertRequest;
import com.pichub.pic.feign.PicFeignClient;
import com.pichub.pic.repository.PictureTypeRepository;
import com.pichub.pic.service.InsertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
//import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/pic")
public class InsertController {

    @Autowired
    InsertService insertService;

    @Autowired
    PictureTypeRepository typeRepository;

    @Autowired
    PicFeignClient picFeignClient;

    @GetMapping("/insert")
    public String showUploadForm(Model model) {
        List<PictureType>  temp= typeRepository.findByCategory("STYLE");
        // 获取所有类型用于下拉框
        model.addAttribute("styleTypes", typeRepository.findByCategory("STYLE"));
        model.addAttribute("contentTypes", typeRepository.findByCategory("CONTENT"));
        model.addAttribute("regionTypes", typeRepository.findByCategory("REGION"));
        return "insert";
    }

    @PostMapping(value = "/insert/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String uploadPicture(
            @RequestPart MultipartFile file,
            @RequestParam Integer styleTypeId,
            @RequestParam Integer contentTypeId,
            @RequestParam Integer regionTypeId,
            @RequestParam Integer ownerId) {

        PictureInsertRequest dto = new PictureInsertRequest();
        dto.setFile(file);
        dto.setStyleTypeId(styleTypeId);
        dto.setContentTypeId(contentTypeId);
        dto.setRegionTypeId(regionTypeId);
        dto.setOwnerId(ownerId);


        int picNum = picFeignClient.getPicNum(ownerId);
        boolean add_succ = picFeignClient.addPicNum(ownerId, picNum + 1);

        if (add_succ) {
            dto.setIsCounted(true);
        }else{
            dto.setIsCounted(false);
        }

        try {
            Picture saved = insertService.uploadPicture(
                    dto);
            return "redirect:http://localhost/pic/search";
        } catch (Exception e) {
            return "redirect:http://localhost/pic/search";
        }
//        try {
//            Picture saved = new Picture();
//            saved.setId(picNum);
//            saved.setIsCounted(true);
//            saved.setDiscribe("正常");
//            return ResponseEntity.ok(saved);
//        } catch (Exception e) {
//            return ResponseEntity.internalServerError().build();
//        }
    }

//    public ResponseEntity<Picture> uploadPictureFallback(@RequestPart MultipartFile file,
//                                                 @RequestParam Integer styleTypeId,
//                                                 @RequestParam Integer contentTypeId,
//                                                 @RequestParam Integer regionTypeId,
//                                                 @RequestParam Integer ownerId,
//                                                 BlockException exception){
//        try {
//            Picture saved = new Picture();
//            saved.setId(-1);
//            saved.setIsCounted(false);
//            saved.setDiscribe("异常:"+exception.getClass());
//            return ResponseEntity.ok(saved);
//        } catch (Exception e) {
//            return ResponseEntity.internalServerError().build();
//        }
//    }
}
