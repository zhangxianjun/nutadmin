package group.aliren.nutadmin;

import group.aliren.nutadmin.entity.CourseEntity;
import group.aliren.nutadmin.mapper.CourseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CourseController {

    final static int DAY = 7;
    final static int LESSON = 5;

    @Autowired
    public CourseMapper courseMapper;

    @RequestMapping("/course")
    public String coursePage(ModelMap modelMap) {
        // 从数据库读取出设置的课程
        List<CourseEntity> csList = courseMapper.listById(1);

        Map<String, CourseEntity> courseMap = new HashMap<>();

        for (CourseEntity cs : csList) {
            courseMap.put(cs.lessonId + "", cs);
        }

        // 列表
        List<List<Map<String, Object>>> lessonList = new ArrayList<>();
        for (int j = 1; j <= LESSON; j++) {
            List<Map<String, Object>> dayList = new ArrayList<>();
            for (int i = 1; i <= DAY; i++) {
                String k = j + "" + i;
                Map<String, Object> m = new HashMap<>();
                CourseEntity cs = courseMap.get(k);
                if (cs != null && !cs.students.equals("")) {
                    m.put("key", k);
                    String t = getTitle(cs.type);
                    if (cs.students.split("，").length > 1) {
                        m.put("class", t + "小班");
                    } else {
                        m.put("class", t + cs.students);
                    }
                    dayList.add(m);
                } else {
                    m.put("key", k);
                    m.put("class", "0");
                    dayList.add(m);
                }
            }
            lessonList.add(dayList);
        }
        modelMap.put("list", lessonList);
        return "course";
    }

    private String getTitle(int type) {
        String t = "";

        switch (type) {
            case 0 : {
                t = "小学";
                break;
            }

            case 1 : {
                t = "初一";
                break;
            }


            case 2 : {
                t = "初二";
                break;
            }

            case 3 : {
                t = "初三";
                break;
            }

            default: {

            }
        }
        return t;
    }


    @RequestMapping("/course/add")
    public String addCourse(@RequestBody String json) {
        // 时段ID 用户ID 授课形式 年级 学生名字
        return "";
    }



}
