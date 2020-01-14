package group.aliren.nutadmin.mapper;

import group.aliren.nutadmin.entity.StudentEntity;
import group.aliren.nutadmin.entity.UserEntity;
import org.apache.ibatis.annotations.*;

import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2020/1/13 16:44
 * Description: 用户表.
 */

@Mapper
public interface UserMapper {
//    @Insert("INSERT INTO user (user_id, mobile, name, remark, state, source_id, date, datetime)" +
//            "VALUES (#{student_id}, #{mobile}, #{mobile_owner}, #{name}, #{remark}, #{state}, #{source_id}, #{date}, #{datetime})")
//    @Options(useGeneratedKeys = true)
//    int add(long student_id, String mobile, int mobile_owner, String name, String remark, int state,
//                   int source_id, int date, Date datetime);

    @Select("SELECT * FROM `user` WHERE mobile = #{mobile} AND password = #{password}")
    UserEntity getUserByMobileAndPassword(@Param("mobile") String mobile, @Param("password") String password);

    @Update("UPDATE `user` SET t_id = #{tId} WHERE mobile = #{mobile} AND password = #{password}")
    int updateTId(
             @Param("tId") String tId, @Param("mobile") String mobile, @Param("password") String password);
}
