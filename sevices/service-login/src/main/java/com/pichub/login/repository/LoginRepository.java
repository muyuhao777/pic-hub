package com.pichub.login.repository;

import com.pichub.login.bean.User;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginRepository extends JpaRepository<User, Integer> {
    User findByUIdAndUPwd(Integer uId, String uPwd);

    @Transactional
    @Modifying
    @Query("UPDATE User u SET u.PicNum = u.PicNum + 1 WHERE u.UId = :userId")
    int incrementCountById(@Param("userId") Integer userId);

    @Transactional
    @Modifying
    @Query("UPDATE User u SET u.PicNum = :picNum WHERE u.UId = :uId")
    void setCountByIdAndPicNum(@Param("uId") Integer uId, @Param("picNum") Integer picNum);

    @Query("SELECT u.PicNum FROM User u WHERE u.UId = :uId")
    Integer getCountById(@Param("uId") Integer uId);
}
