package group.aliren.nutadmin.experiment;

import java.util.StringJoiner;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2020/6/4 09:49
 * Description: .
 */

public class JavaApi {
    /**
     * 测试StringJoiner类
     */
    public static void testStringJoiner() {
        String[] names = {"jim", "john", "jack"};

        StringJoiner sj = new StringJoiner(",", "prefix ", " suffix");

        for (String name : names) {
            sj.add(name);
        }

        System.out.println(sj.toString());
    }

    // 自动装箱和自动拆箱只发生在编译阶段，目的是为了少写代码。
    public static void testBox() {
        Integer i = new Integer(100);
        i = Integer.valueOf(200);

        i.intValue();

        System.out.println(i);
    }
}
