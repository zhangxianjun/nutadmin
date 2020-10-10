package group.aliren.nutadmin.experiment;

import group.aliren.nutadmin.NutadminApplication;
import org.springframework.boot.SpringApplication;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.util.StringJoiner;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2020/6/3 14:23
 * Description: .
 */

public class JavabeanModel {
    private String name;
    private int age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void testClass() throws Exception {
        BeanInfo beanInfo = Introspector.getBeanInfo(JavabeanModel.class);

        for (PropertyDescriptor pd : beanInfo.getPropertyDescriptors()) {
            System.out.println(pd.getName());
            System.out.println("  " + pd.getReadMethod());
            System.out.println("  " + pd.getWriteMethod());
        }
    }
}
