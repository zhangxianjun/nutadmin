package group.aliren.nutadmin;

import group.aliren.nutadmin.experiment.JavabeanModel;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.StringJoiner;

@SpringBootApplication
@MapperScan("group.aliren.nutadmin.mapper")
public class NutadminApplication {

    public static void main(String[] args) {

        int[] tmp = {1, 5, 8, 3, 7, 9};

        int[] result = bubbleSort(tmp);

        System.out.println(Arrays.toString(result));

        SpringApplication.run(NutadminApplication.class, args);

    }

    private static void sortTest() {
        List<Integer> array = new ArrayList<>();
        array.add(1);
        array.add(8);
        array.add(6);
        array.add(9);
        for (int i = 0; i < array.size(); i++) {
            int vi = array.get(i);

            for (int j = 0; j < array.size(); j++) {
                int vj = array.get(j);
                int tmp;
                if (vi < vj) {
                    tmp = vi;
                    vi = vj;
                    vj = tmp;
                }
            }
        }

        for (int i : array) {
            System.out.println(i);
        }
    }

    public static int[] bubbleSort(int[] array) {

//		{1, 5, 8, 3, 7, 9};

        for (int i = 0; i < array.length; i++) {


            for (int j = i+1 ; j < array.length; j++) {

                int tmp;

                if (array[i] > array[j]) {
                    tmp = array[j];
                    array[j] = array[i];
                    array[i] = tmp;
                }
            }

        }
		return array;
    }

}
