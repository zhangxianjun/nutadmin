package group.aliren.nutadmin.entity;

import lombok.Data;

import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2020/1/13 16:47
 * Description: .
 */

@Data
public class UserEntity {
    public long userId;
    public int groupId;
    public String openId;
    public String tId;

    public String mobile;
    public String name;
    public String password;

    public Date logDateTime;
}
