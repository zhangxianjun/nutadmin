package group.aliren.nutadmin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;

@Controller
public class CourseController {

    final static int DAY = 7;
    final static int LESSON = 5;

    @RequestMapping("/course")
    public String coursePage(ModelMap modelMap) {
//        //从数据库读取出设置的课程
//        Map<String, Object> courseMap = new HashMap<>();
//
//        // 列表
//        List<List<Map<String, Object>>> weekList = new ArrayList<>();
//        for (int i = 1; i <= DAY; i++) {
//            List<Map<String, Object>> dayMap = new ArrayList<>();
//            for (int j = 1; j <= LESSON; j++) {
//                Map<String, Object> m = new HashMap<>();
//                Object s = courseMap.get(i + "" + j);
//                if (s == null) {
//                    m.put(i + "" + j, "");
//                    dayMap.add(m);
//                } else {
//                    m.put(i + "" + j, "");
//                    dayMap.add(m);
//                }
//            }
//            weekList.add(dayMap);
//        }
//        modelMap.put("list", weekList);
        return "course";
    }
}
