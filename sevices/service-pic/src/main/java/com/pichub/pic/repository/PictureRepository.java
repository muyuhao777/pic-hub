package com.pichub.pic.repository;

import com.pichub.pic.bean.Picture;
import feign.Param;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public interface PictureRepository extends JpaRepository<Picture, Integer> {
    @Query(value = """
        WITH RECURSIVE style_tree AS (
            SELECT id FROM picture_type WHERE name = :styleName
            UNION ALL
            SELECT t.id FROM picture_type t
            JOIN style_tree st ON t.parent_id = st.id
        ),
        content_tree AS (
            SELECT id FROM picture_type WHERE name = :contentName
            UNION ALL
            SELECT t.id FROM picture_type t
            JOIN content_tree ct ON t.parent_id = ct.id
        ),
        region_tree AS (
            SELECT id FROM picture_type WHERE name = :regionName
            UNION ALL
            SELECT t.id FROM picture_type t
            JOIN region_tree rt ON t.parent_id = rt.id
        )
        SELECT p.* FROM picture p
        WHERE (:styleName IS NULL OR 
               p.style_type_id IN (SELECT id FROM style_tree))
          AND (:contentName IS NULL OR 
               p.content_type_id IN (SELECT id FROM content_tree))
          AND (:regionName IS NULL OR 
               p.region_type_id IN (SELECT id FROM region_tree))
          AND (:minHue IS NULL OR p.hue >= :minHue)
          AND (:maxHue IS NULL OR p.hue <= :maxHue)
          AND (:minSaturation IS NULL OR p.saturation >= :minSaturation)
          AND (:maxSaturation IS NULL OR p.saturation <= :maxSaturation)
          AND (:minValue IS NULL OR p.value >= :minValue)
          AND (:maxValue IS NULL OR p.value <= :maxValue)
        """,
            countQuery = """
        WITH RECURSIVE style_tree AS (
            SELECT id FROM picture_type WHERE name = :styleName
            UNION ALL
            SELECT t.id FROM picture_type t
            JOIN style_tree st ON t.parent_id = st.id
        ),
        content_tree AS (
            SELECT id FROM picture_type WHERE name = :contentName
            UNION ALL
            SELECT t.id FROM picture_type t
            JOIN content_tree ct ON t.parent_id = ct.id
        ),
        region_tree AS (
            SELECT id FROM picture_type WHERE name = :regionName
            UNION ALL
            SELECT t.id FROM picture_type t
            JOIN region_tree rt ON t.parent_id = rt.id
        )
        SELECT p.* FROM picture p
        WHERE (:styleName IS NULL OR 
               p.style_type_id IN (SELECT id FROM style_tree))
          AND (:contentName IS NULL OR 
               p.content_type_id IN (SELECT id FROM content_tree))
          AND (:regionName IS NULL OR 
               p.region_type_id IN (SELECT id FROM region_tree))
          AND (:minHue IS NULL OR p.hue >= :minHue)
          AND (:maxHue IS NULL OR p.hue <= :maxHue)
          AND (:minSaturation IS NULL OR p.saturation >= :minSaturation)
          AND (:maxSaturation IS NULL OR p.saturation <= :maxSaturation)
          AND (:minValue IS NULL OR p.value >= :minValue)
          AND (:maxValue IS NULL OR p.value <= :maxValue)
        """,
            nativeQuery = true)
    Page<Picture> findByTypeTrees(
            @Param("styleName") String styleName,
            @Param("contentName") String contentName,
            @Param("regionName") String regionName,

            @Param("minHue") Integer minHue,
            @Param("maxHue") Integer maxHue,

            @Param("minSaturation") Integer minSaturation,
            @Param("maxSaturation") Integer maxSaturation,

            @Param("minValue") Integer minValue,
            @Param("maxValue") Integer maxValue,

            Pageable pageable);
}
