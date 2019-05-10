package group.aliren.nutadmin.mapper;

import group.aliren.nutadmin.entity.CourseEntity;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CourseMapper {

    @Insert("INSERT INTO course (lesson_id, type, grade, user_id, students)"
            + "VALUES (#{lesson_id}, #{type}, #{grade}, #{user_id}, #{students})")
    @Options(useGeneratedKeys = true)
    int add(@Param("lesson_id") long lesson_id, @Param("type") long type, @Param("grade") long grade,
            @Param("user_id") long user_id, @Param("students") String students);


    @Select("SELECT * FROM course WHERE course_id = #{courseId}")
    CourseEntity findById(@Param("courseId") long courseId);

    @Select("SELECT * FROM course WHERE user_id = #{userId} ORDER BY lesson_id")
    List<CourseEntity> listById(@Param("userId") long userId);

    @Select("SELECT * FROM course WHERE user_id = #{userId} and lesson_id = #{lessonId}")
    CourseEntity findByUserIdAndLessonId(@Param("userId") long userId, @Param("lessonId") long lessonId);
}
