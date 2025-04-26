CREATE TABLE `pichub-pic`.`picture` (
                                        `p_id` INT NOT NULL AUTO_INCREMENT COMMENT '图片ID',
                                        `p_str` VARCHAR(255) COMMENT '图片存储路径/URL',
                                        `style_type_id` INT NOT NULL COMMENT '风格类型ID',
                                        `content_type_id` INT NOT NULL COMMENT '内容类型ID',
                                        `region_type_id` INT NOT NULL COMMENT '地区类型ID',
                                        `hue` INT COMMENT '色调值',
                                        `saturation` INT COMMENT '饱和度',
                                        `value` INT COMMENT '明度值',
                                        `is_delete` INT COMMENT '删除标记(0-未删除 1-已删除)',
                                        `discribe` VARCHAR(500) COMMENT '图片描述',
                                        `owner_id` BIGINT COMMENT '用户ID（无外键约束）',
                                        `is_counted` BOOLEAN NOT NULL DEFAULT FALSE COMMENT '是否被计数',

                                        PRIMARY KEY (`p_id`),

                                        INDEX `idx_owner` (`owner_id`),
                                        INDEX `idx_delete` (`is_delete`),
                                        INDEX `idx_style` (`style_type_id`),
                                        INDEX `idx_content` (`content_type_id`),
                                        INDEX `idx_region` (`region_type_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图片表';



CREATE TABLE `picture_type` (
                                `id` INT NOT NULL AUTO_INCREMENT,
                                `name` VARCHAR(50) NOT NULL,
                                `category` ENUM('STYLE','CONTENT','REGION') NOT NULL,
                                `parent_id` INT DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                UNIQUE KEY `uk_category_name` (`category`, `name`), -- 同一类别下名称唯一
                                KEY `idx_category_parent` (`category`, `parent_id`), -- 加速按类别查父子
                                CONSTRAINT `fk_type_parent` FOREIGN KEY (`parent_id`) REFERENCES `picture_type` (`id`)
) ENGINE=InnoDB COMMENT='图片类型总表';