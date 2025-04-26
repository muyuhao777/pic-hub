-- 插入第一个用户（普通用户）
INSERT INTO user (u_id, u_pwd, name, is_administrator, is_delete)
VALUES (1, '123456', 'user1', 0, 0);

-- 插入第二个用户（管理员用户，用户名为 muyh）
INSERT INTO user (u_id, u_pwd, name, is_administrator, is_delete)
VALUES (2, '123456', 'muyh', 1, 0);