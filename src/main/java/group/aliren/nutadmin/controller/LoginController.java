package group.aliren.nutadmin.controller;

import com.alibaba.fastjson.JSONObject;
import group.aliren.nutadmin.entity.UserEntity;
import group.aliren.nutadmin.kit.CryptoKit;
import group.aliren.nutadmin.mapper.StudentMapper;
import group.aliren.nutadmin.mapper.UserMapper;
import group.aliren.nutadmin.util.IdUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller
public class LoginController {
    @Autowired
    public UserMapper userMapper;


    @RequestMapping(value = {"/", "/login"})
    public String loginPage() {
//        modelMap.addAttribute("name", "zxj");
//        Cookie c = new Cookie("zxj", "MD5");
//        response.addCookie(c);
        return "login";
    }

    @ResponseBody()
    @RequestMapping("/ajax/login")
    public String login(@RequestBody Map<String, Object> json, HttpServletResponse response) {
        // 鉴定数据
        String mobile = String.valueOf(json.get("mobile"));
        String password = String.valueOf(json.get("password"));

        String md5Password = CryptoKit.enMd5(password);

        // 查询到用户
        UserEntity ue = userMapper.getUserByMobileAndPassword(mobile, md5Password);

        if (ue.userId <= 0) {
            return "{\"code\": 10000, \"msg\":\"未知身份!\"}";
        }

        // 生成t_id
        String tId = IdUtil.generateTId(mobile, password);

        userMapper.updateTIdByUserId(tId, ue.userId);

        // 返回t_id、用户名字

        JSONObject resp = new JSONObject();

        resp.put("code", 10001);
        resp.put("msg", "登录成功!");

        JSONObject data = new JSONObject();
        data.put("t_id", tId);
        data.put("name", ue.name);

        resp.put("data", data);

        return resp.toJSONString();
    }
}
