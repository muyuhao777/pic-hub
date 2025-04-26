package com.pichub.login.bean;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "user")
public class User {

    @Id
    @Column(name = "u_id") // 对应数据库列名
    private int UId; // 主键

    @Column(name = "u_pwd")
    private String UPwd;

    @Column(name = "is_delete")
    private int IsDelete;

    @Column(name = "name")
    private String Name;

    @Column(name = "is_administrator")
    private int IsAdministrator;

    @Column(name = "pic_num")
    private int PicNum;

    // 无参构造函数（JPA 需要）
    public User() {
    }

    // 带参构造函数（可选）
    public User(int uId, String uPwd, int isDelete, String name, int isAdministrator, int picNum) {
        this.UId = uId;
        this.UPwd = uPwd;
        this.IsDelete = isDelete;
        this.Name = name;
        this.IsAdministrator = isAdministrator;
        this.PicNum = picNum;
    }
}
