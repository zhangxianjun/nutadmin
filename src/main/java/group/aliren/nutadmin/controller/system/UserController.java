package group.aliren.nutadmin.controller.system;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2020/1/14 10:14
 * Description: 用户管理.
 */

@Controller
public class UserController {

    @RequestMapping("system/user/list")
    public String getUserListPage(ModelMap modelMap) {
        return "system/user_list";
    }
}
