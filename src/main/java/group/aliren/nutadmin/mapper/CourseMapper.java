package group.aliren.nutadmin.mapper;

import group.aliren.nutadmin.entity.CourseEntity;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CourseMapper {

    @Insert("INSERT INTO course (lesson_id, grade, user_id, students)"
            + "VALUES (#{lesson_id}, #{grade}, #{user_id}, #{students})")
    @Options(useGeneratedKeys = true)
    int add(@Param("lesson_id") long lesson_id, @Param("grade") long grade,
            @Param("user_id") long user_id, @Param("students") String students);


    @Select("SELECT * FROM course WHERE lesson_id = #{lessonId} AND user_id = #{userId}")
    CourseEntity findById(@Param("lessonId") long lessonId, @Param("userId") long userId);

    @Select("SELECT * FROM course WHERE user_id = #{userId} ORDER BY lesson_id")
    List<CourseEntity> listById(@Param("userId") long userId);

    @Select("SELECT * FROM course WHERE user_id = #{userId} and lesson_id = #{lessonId}")
    CourseEntity findByUserIdAndLessonId(@Param("userId") long userId, @Param("lessonId") long lessonId);

    @Update("UPDATE course SET grade = #{grade}, students = #{students} " +
            "WHERE lesson_id = #{lesson_id} AND user_id = #{user_id}")
    int save(@Param("lesson_id") long lesson_id, @Param("grade") long grade,
             @Param("user_id") long user_id, @Param("students") String students);
}
