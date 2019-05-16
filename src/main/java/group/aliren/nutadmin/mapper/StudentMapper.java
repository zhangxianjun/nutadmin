package group.aliren.nutadmin.mapper;

import group.aliren.nutadmin.entity.StudentEntity;
import org.apache.ibatis.annotations.*;

import java.util.Date;
import java.util.List;

@Mapper
public interface StudentMapper {
    @Insert("INSERT INTO student (student_id, mobile, mobile_owner, name, remark, state, source_id, date, datetime)" +
            "VALUES (#{student_id}, #{mobile}, #{mobile_owner}, #{name}, #{remark}, #{state}, #{source_id}, #{date}, #{datetime})")
    @Options(useGeneratedKeys = true)
    int addStudent(long student_id, String mobile, int mobile_owner, String name, String remark, int state,
                   int source_id, int date, Date datetime);


    @Select("SELECT * FROM student WHERE state = #{state}")
    List<StudentEntity> listByState(int state);

    @Select("SELECT * FROM student WHERE student_id = #{student_id}")
    StudentEntity getStudentById(@Param("student_id") int studentId);
}
