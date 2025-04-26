CREATE TABLE user (
                      u_id INT PRIMARY KEY AUTO_INCREMENT,  -- 主键，自增
                      u_pwd VARCHAR(255) NOT NULL,         -- 密码，非空
                      is_delete INT NOT NULL DEFAULT 0,    -- 是否删除，默认值为 0
                      name VARCHAR(255),                   -- 姓名
                      is_administrator INT NOT NULL DEFAULT 0 -- 是否是管理员，默认值为 0
);