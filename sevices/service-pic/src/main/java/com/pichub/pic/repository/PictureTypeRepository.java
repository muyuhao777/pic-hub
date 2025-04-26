package com.pichub.pic.repository;

import com.pichub.pic.bean.PictureType;
import com.pichub.pic.bean.TypeCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PictureTypeRepository extends JpaRepository<PictureType, Integer> {
    // 假设有category字段时的查询方法
    @Query(value="SELECT t.* FROM picture_type t WHERE t.category = :category", nativeQuery = true)
    List<PictureType> findByCategory(@Param("category") String category);
}
