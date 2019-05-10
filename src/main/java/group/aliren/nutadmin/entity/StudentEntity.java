package group.aliren.nutadmin.entity;

import lombok.Data;

import java.util.Date;

@Data
public class StudentEntity {
    public long studentId;
    public String mobile;
    public int mobileOwner;
    public String name;
    public String remark;
    public int state;
    public int sourceId;
    public int date;
    public Date dateTime;
}
