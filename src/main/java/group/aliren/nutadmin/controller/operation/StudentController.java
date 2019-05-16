package group.aliren.nutadmin.controller.operation;

import group.aliren.nutadmin.entity.StudentEntity;
import group.aliren.nutadmin.mapper.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class StudentController {

    @Autowired
    public StudentMapper studentMapper;

    @RequestMapping("contact")
    public String getStudentList(ModelMap modelMap) {
        List<StudentEntity> list = studentMapper.listByState(3);
        modelMap.put("list", list);
        return "/operation/student_list";
    }

    @RequestMapping("contact/page")
    public String getContactPage(ModelMap modelMap, @RequestParam("studentId") Integer studentId) {

        StudentEntity se = new StudentEntity();
        if (studentId == null || studentId == 0) {
            se.studentId = 0;
            se.name = "";
            se.mobile = "";
            se.mobileOwner = 0;
            se.state = 0;
        } else {
            // 修改
            se = studentMapper.getStudentById(studentId);
        }

        modelMap.put("model", se);
        return "operation/student_detail";
    }
}
