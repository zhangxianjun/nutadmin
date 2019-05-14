package group.aliren.nutadmin.controller.teaching;

import com.alibaba.fastjson.JSONObject;
import group.aliren.nutadmin.entity.CourseEntity;
import group.aliren.nutadmin.mapper.CourseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
        return "/teaching/course";
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


    @RequestMapping("/course/detail")
    public String addCourse(@RequestParam("lessonId") String lessonId, ModelMap modelMap) {
        // 时段ID 用户ID 授课形式 年级 学生名字
        modelMap.put("lessonId", lessonId);
        return "teaching/course_detail";
    }

    @RequestMapping("/course/save")
    @ResponseBody
    public String saveCourse(@RequestBody String json) {
        JSONObject jsonObject = JSONObject.parseObject(json);
        Long lessonId = jsonObject.getLong("lessonId");
        Long type = jsonObject.getLong("form");
        Long grade = jsonObject.getLong("grade");
        String students = jsonObject.getString("students");
        // 查找出ID, 是否存在ID做是否添加 和 修改
        CourseEntity ce = courseMapper.findByUserIdAndLessonId(1, lessonId);
        if (ce != null) {
            // 修改课程
        } else {
            // 新加课程
            courseMapper.add(lessonId, type, grade,1, students);
        }
        return json;
    }

}
