package group.aliren.nutadmin.entity;

import lombok.Data;

@Data
public class CourseEntity {
    public long courseId;
    public int lessonId;
    public int type;
    public int grade;
    public long userId;
    public String students;
}
