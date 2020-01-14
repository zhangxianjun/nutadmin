package group.aliren.nutadmin.mapper;

import group.aliren.nutadmin.entity.ResourceEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ResourceMapper {
    @Select("SELECT * FROM resource WHERE catalog_id = #{catalogId} ORDER BY sort_id")
    List<ResourceEntity> listByCatalogId(@Param("catalogId") int catalogId);
}
