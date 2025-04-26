package com.pichub.pic.bean;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "picture_type")
@Data
public class PictureType {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, length = 50, unique = true)
    private String name;

    @Column(name = "parent_id")
    private Integer parentId; // 仅存储ID，不关联实体

    @Column(name = "category")
    private String category; // 明确区分三类
}
