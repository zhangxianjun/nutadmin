package group.aliren.nutadmin.controller.system;

import group.aliren.nutadmin.entity.UserEntity;
import group.aliren.nutadmin.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2020/1/14 10:14
 * Description: 用户管理.
 */

@Controller
public class UserController {

    @Autowired
    private UserMapper userMapper;

    @RequestMapping("system/user/list")
    public String getUserListPage(ModelMap modelMap) {
        List<UserEntity> list = userMapper.listUserByRowAndSize(0, 10);
        modelMap.put("list", list);
        return "system/user_list";
    }

    @RequestMapping("system/user/detail")
    public String getUserDetailPage() {
        return "";
    }

    @RequestMapping("/ajax/system/user/edit")
    public String editUserDetail() {
        return "";
    }
}
