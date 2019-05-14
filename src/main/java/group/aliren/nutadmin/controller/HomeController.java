package group.aliren.nutadmin.controller;
import com.alibaba.fastjson.JSONObject;
import group.aliren.nutadmin.entity.ResourceEntity;
import group.aliren.nutadmin.mapper.ResourceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;


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
    public String homePage(ModelMap modelMap) {
        // 获取第一级导航
        List<ResourceEntity> navList = resourceMapper.listByCatalogId(0);

        // 获取右边栏导航
        List<ResourceEntity> asideList = resourceMapper.listByCatalogId(navList.get(0).resourceId);

        modelMap.put("navList", navList);
        modelMap.put("asideList", asideList);
        return "home";
    }


}
