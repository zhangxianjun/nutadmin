package group.aliren.nutadmin.mapper;

import group.aliren.nutadmin.entity.CourseEntity;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CourseMapper {

    @Insert("INSERT INTO course (lesson_id, type, grade, user_id, students)"
            + "VALUES (#{lesson_id}, #{type}, #{grade}, #{user_id}, #{students})")
    @Options(useGeneratedKeys = true)
    int add(CourseEntity coffee);


    @Select("SELECT * FROM course WHERE course_id = #{courseId}")
    CourseEntity findById(@Param("courseId") long courseId);

    @Select("SELECT * FROM course WHERE user_id = #{userId} ORDER BY lesson_id")
    List<CourseEntity> listById(@Param("userId") long userId);
}
