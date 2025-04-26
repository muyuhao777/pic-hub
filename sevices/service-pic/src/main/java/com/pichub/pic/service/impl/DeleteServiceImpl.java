package com.pichub.pic.service.impl;

import com.pichub.pic.bean.Picture;
import com.pichub.pic.repository.PictureRepository;
import com.pichub.pic.service.DeleteService;
import io.minio.MinioClient;
import io.minio.RemoveObjectArgs;
import io.minio.errors.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

@Service
@RequiredArgsConstructor
public class DeleteServiceImpl implements DeleteService {
    private final PictureRepository pictureRepository;
    private final MinioClient minioClient;

    @Override
    public void deletePicture(Picture picture) {
//        Picture picture = pictureRepository.findById(pid).orElse(null);
        String bucketName = picture.getPStr().split("/")[0];
        String objectName = picture.getPStr().split("/")[1];
        try {
            minioClient.removeObject(
                    RemoveObjectArgs.builder()
                            .bucket(bucketName)
                            .object(objectName)
                            .build());
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
        pictureRepository.deleteById(picture.getId());
    }
}
