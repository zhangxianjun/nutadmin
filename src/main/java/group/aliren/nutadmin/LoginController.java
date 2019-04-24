package group.aliren.nutadmin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class LoginController {
    @RequestMapping("/login")
    public String loginPage(ModelMap modelMap) {
        modelMap.addAttribute("name", "zxj");
        return "login";
    }

    @ResponseBody()
    @RequestMapping("/login/login")
    public String login(@RequestBody Map<String, Object> json) {
        return "{\"code\": 1, \"msg\":\"登录成功!\", \"data\":{}}";
    }
}
