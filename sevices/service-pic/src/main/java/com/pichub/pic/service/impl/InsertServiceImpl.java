package com.pichub.pic.service.impl;

import com.pichub.pic.bean.HSV;
import com.pichub.pic.bean.Picture;
import com.pichub.pic.dto.request.PictureInsertRequest;
import com.pichub.pic.repository.PictureRepository;
import com.pichub.pic.service.InsertService;
import com.pichub.pic.util.HSVCaculator;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import io.minio.errors.*;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class InsertServiceImpl implements InsertService {

    private final PictureRepository pictureRepository;
    private final MinioClient minioClient;
    private final HSVCaculator hsvCalculator; // 假设的HSV计算模块

    @Value("${minio.bucket-name}")
    private String bucketName;

    @Override
    public Picture uploadPicture(PictureInsertRequest dto) {
        MultipartFile file = dto.getFile();
        String objectName = generateObjectName(file.getOriginalFilename());
        try {
            minioClient.putObject(
                    PutObjectArgs.builder()
                            .bucket(bucketName)
                            .object(objectName)
                            .stream(file.getInputStream(), file.getSize(), -1)
                            .contentType(file.getContentType())
                            .build()
            );
        } catch (ErrorResponseException e) {
            throw new RuntimeException(e);
        } catch (InsufficientDataException e) {
            throw new RuntimeException(e);
        } catch (InternalException e) {
            throw new RuntimeException(e);
        } catch (InvalidKeyException e) {
            throw new RuntimeException(e);
        } catch (InvalidResponseException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        } catch (ServerException e) {
            throw new RuntimeException(e);
        } catch (XmlParserException e) {
            throw new RuntimeException(e);
        }
        // 2. 计算HSV值（模拟调用）
        HSV hsv = hsvCalculator.calculateHSV(file);

        // 3. 保存到数据库
        Picture picture = new Picture();
        picture.setPStr(bucketName + "/" + objectName);
        picture.setStyleTypeId(dto.getStyleTypeId());
        picture.setContentTypeId(dto.getContentTypeId());
        picture.setRegionTypeId(dto.getRegionTypeId());
        picture.setHue(hsv.getHue());
        picture.setSaturation(hsv.getSaturation());
        picture.setValue(hsv.getValue());
        picture.setOwnerId(dto.getOwnerId());
        picture.setIsDelete(0);
        if(dto.getOwnerId()==null){
            picture.setIsCounted(false);
        }else{
            picture.setIsCounted(true);
        }

        return pictureRepository.save(picture);
    }
    private String generateObjectName(String originalFilename) {
        return UUID.randomUUID() + "_" + originalFilename;
    }
}
