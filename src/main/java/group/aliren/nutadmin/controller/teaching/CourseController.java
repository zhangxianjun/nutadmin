package group.aliren.nutadmin.controller.teaching;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import group.aliren.nutadmin.entity.CourseEntity;
import group.aliren.nutadmin.mapper.CourseMapper;
import group.aliren.nutadmin.mapper.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class CourseController {

    final static int DAY = 7;
    final static int LESSON = 5;

    @Autowired
    public CourseMapper courseMapper;

    @Autowired
    public StudentMapper studentMapper;

    @RequestMapping("/course")
    public String coursePage(ModelMap modelMap) {
        // 从数据库读取出计划的任务
        List<CourseEntity> csList = courseMapper.listById(1);

        // 把计划任务存到Map中
        Map<String, CourseEntity> courseMap = new HashMap<>();

        for (CourseEntity cs : csList) {
            courseMap.put(cs.lessonId + "", cs);
        }

        // 拼接数据
        List<List<CourseEntity>> lessonList = new ArrayList<>();

        for (int j = 1; j <= LESSON; j++) {
            List<CourseEntity> dayList = new ArrayList<>();
            for (int i = 1; i <= DAY; i++) {
                String k = j + "" + i;
                CourseEntity cs = courseMap.get(k);
                if (cs != null && !cs.students.equals("")) {
                    JSONArray ja = JSON.parseArray(cs.students);
                    if (ja.size() > 1) {
                        cs.students = "小班";
                    } else {
                        JSONObject jo = ja.getJSONObject(0);
                        cs.students = jo.getString("name");
                    }
                    dayList.add(cs);
                } else {
                    CourseEntity tmp = new CourseEntity();
                    tmp.students = "";
                    tmp.lessonId = Integer.valueOf(k);
                    dayList.add(tmp);
                }
            }
            lessonList.add(dayList);
        }
        modelMap.put("list", lessonList);

        modelMap.put("testDatetime", new Date());

        return "/teaching/course";
    }

    @RequestMapping("/course/detail")
    public String addCourse(@RequestParam("lessonId") Integer lessonId, ModelMap modelMap) {
        // 时段ID 用户ID 授课形式 年级 学生名字
        CourseEntity ce = courseMapper.findById(lessonId, 1);
        if (ce == null) {
            ce = new CourseEntity();
            ce.lessonId = lessonId;
            ce.grade = 0;
            ce.students = "";
        }
        modelMap.put("model", ce);
        return "teaching/course_detail";
    }

    @RequestMapping("/course/save")
    @ResponseBody
    public String saveCourse(@RequestBody String json) {
        JSONObject jsonObject = JSONObject.parseObject(json);
        Long lessonId = jsonObject.getLong("lessonId");
        Long grade = jsonObject.getLong("grade");
        String students = jsonObject.getString("students");
        // 查找出ID, 是否存在ID做是否添加 和 修改
        CourseEntity ce = courseMapper.findByUserIdAndLessonId(1, lessonId);
        if (ce != null) {
            // 修改课程
            courseMapper.save(ce.lessonId, grade, 1, ce.students);
        } else {
            // 新加课程
            courseMapper.add(lessonId, grade,1, students);
        }
        return json;
    }

}
