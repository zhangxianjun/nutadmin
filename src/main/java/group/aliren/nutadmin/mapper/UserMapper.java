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

    @Select("SELECT * FROM `user` WHERE mobile = #{mobile} AND password = #{password}")
    UserEntity getUserByMobileAndPassword(@Param("mobile") String mobile, @Param("password") String password);

    @Update("UPDATE `user` SET t_id = #{tId} WHERE user_id = #{userId}")
    int updateTIdByUserId(@Param("tId") String tId, @Param("userId") Long userId);
}
