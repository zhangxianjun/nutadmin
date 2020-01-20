package group.aliren.nutadmin.controller.system;

import group.aliren.nutadmin.entity.ResourceEntity;
import group.aliren.nutadmin.mapper.ResourceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2020/1/20 10:04
 * Description: .
 */

@Controller
public class NavigationController {

    @Autowired
    private ResourceMapper resourceMapper;

    @RequestMapping("system/navigation/list")
    public String getFunctionListPage(ModelMap modelMap) {
        List<ResourceEntity> list = resourceMapper.listByCatalogId(0);
        modelMap.put("list", list);
        return "/system/navigation_list";
    }

    @RequestMapping("ajax/system/navigation/edit")
    public String login(@RequestBody Map<String, Object> json, HttpServletResponse response) {

        return "";
    }
}
