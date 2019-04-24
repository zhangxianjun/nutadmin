package group.aliren.nutadmin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {
    @RequestMapping("/home")
    public String homePage(ModelMap modelMap) {
        // 导航选项
        List<Map<String, Object>> navList = new ArrayList<>();
        Map<String, Object> map1 = new HashMap<>();
        map1.put("title", "我的");
        map1.put("resourceId", 1);
        Map<String, Object> map2 = new HashMap<>();
        map2.put("title", "运营");
        map2.put("resourceId", 2);
        Map<String, Object> map3 = new HashMap<>();
        map3.put("title", "教学");
        map3.put("resourceId", 3);
        navList.add(map1);
        navList.add(map2);
        navList.add(map3);
        // 右边栏
        List<Map<String, Object>> asideList = new ArrayList<>();
        Map<String, Object> m1 = new HashMap<>();
        m1.put("title", "个人资料");
        m1.put("resourceId", 10);

        Map<String, Object> m2 = new HashMap<>();
        m2.put("title", "工作资料");
        m2.put("resourceId", 11);

        asideList.add(m1);
        asideList.add(m2);

        modelMap.put("navList", navList);
        modelMap.put("asideList", asideList);
        return "home";
    }
}
