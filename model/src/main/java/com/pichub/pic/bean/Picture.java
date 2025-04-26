package com.pichub.pic.bean;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "picture")
public class Picture {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "p_id")
    private Integer id;

    @Column(name = "p_str", length = 255)
    private String pStr;

    @Column(name = "style_type_id", nullable = false)
    private Integer styleTypeId; // 仅存储ID

    @Column(name = "content_type_id", nullable = false)
    private Integer contentTypeId;

    @Column(name = "region_type_id", nullable = false)
    private Integer regionTypeId;

    @Column(name = "hue")
    private Float hue;

    @Column(name = "saturation")
    private Float saturation;

    @Column(name = "value")
    private Float value;

    @Column(name = "is_delete")
    private Integer isDelete;

    @Column(name = "discribe", length = 500)
    private String discribe;

    @Column(name = "owner_id") // 仅存储ID，不加@ManyToOne
    private int ownerId;

    // 新增字段 2: 是否被计数
    @Column(name = "is_counted", nullable = false, columnDefinition = "boolean default false")
    private Boolean isCounted = false;
}