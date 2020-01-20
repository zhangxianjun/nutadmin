package group.aliren.nutadmin.controller.system;

import group.aliren.nutadmin.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2020/1/20 09:57
 * Description: 功能列表.
 */

@Controller
public class FunctionController {
    @Autowired
    private UserMapper userMapper;

    @RequestMapping("system/function/list")
    public String getFunctionListPage() {

        return "/system/function_list";
    }
}
