package com.pichub.pic.dto.request;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class PictureInsertRequest {
    private MultipartFile file;

    private Integer styleTypeId;

    private Integer contentTypeId;

    private Integer regionTypeId;

    private Integer ownerId;

    private String description;

    private Boolean isCounted;
}
