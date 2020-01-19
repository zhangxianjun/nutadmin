package group.aliren.nutadmin.controller.other;

import group.aliren.nutadmin.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2020/1/19 15:28
 * Description: .
 */

@Controller
public class WelcomeController {


    @RequestMapping("/welcome")
    public String getWelcomePage(ModelMap modelMap) {
        modelMap.put("name", "陈奕迅");

        return "other/welcome";
    }
}
