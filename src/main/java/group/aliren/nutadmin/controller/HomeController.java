package group.aliren.nutadmin.controller;
import com.alibaba.fastjson.JSONObject;
import group.aliren.nutadmin.entity.ResourceEntity;
import group.aliren.nutadmin.mapper.ResourceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;


@Controller
public class HomeController {

    @Autowired
    public ResourceMapper resourceMapper;

    @RequestMapping("/get/url")
    @ResponseBody
    public String getUrl(@RequestBody String json) {
        JSONObject jsonObject = JSONObject.parseObject(json);
        Integer resourceId = jsonObject.getInteger("resourceId");
        List<ResourceEntity> asideList = resourceMapper.listByCatalogId(resourceId);
        JSONObject j = new JSONObject();
        j.put("code", 1);
        j.put("msg", "success");
        j.put("data", asideList);
        return j.toJSONString();
    }

    @RequestMapping("/home")
    public String homePage(ModelMap modelMap, HttpServletRequest request) {
        // 获取第一级导航
        List<ResourceEntity> navList = resourceMapper.listByCatalogId(0);

        modelMap.put("navList", navList);

        modelMap.put("headerIndex", "0");
        modelMap.put("asideIndex", "0");

        if (request.getCookies() != null) {
            for (int i = 0; i < request.getCookies().length; i++) {
                Cookie c = request.getCookies()[i];
                if (c.getName().equals("headerIndex")) {
                    modelMap.put("headerIndex", c.getValue());
                }
                if (c.getName().equals("asideIndex")) {
                    modelMap.put("asideIndex", c.getValue());
                }
            }
        }

        // 获取右边栏导航
        Integer headerIndex = Integer.valueOf(modelMap.get("headerIndex").toString());

        Integer index = 2;
        for (int i = 0; i < navList.size(); i++) {
            ResourceEntity re = navList.get(i);
            if (i == headerIndex) {
                index = re.resourceId;

            }
        }

        List<ResourceEntity> asideList = resourceMapper.listByCatalogId(index);

        Integer asideIndex = Integer.valueOf(modelMap.get("asideIndex").toString());
        for (int i = 0; i < asideList.size(); i++) {
            ResourceEntity re = asideList.get(i);
            if (i == asideIndex) {
                modelMap.put("initUrl", re.url);
            }
        }

        modelMap.put("asideList", asideList);
        return "home";
    }

    @RequestMapping("/ajax/home/level")
    @ResponseBody
    public String getLevel(@RequestBody Map<String, Object> json) {

        Integer catalogId = (Integer) json.get("catalogId");

        // 获取导航列表
        List<ResourceEntity> aList = resourceMapper.listByCatalogId(catalogId);

        return JSONObject.toJSONString(aList);
    }

}
