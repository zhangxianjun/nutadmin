package group.aliren.nutadmin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.ArrayList;
import java.util.List;

@SpringBootApplication
@MapperScan("group.aliren.nutadmin.mapper")
public class NutadminApplication {

	public static void main(String[] args) {
		SpringApplication.run(NutadminApplication.class, args);
//		sortTest();
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

		for (int i: array) {
			System.out.println(i);
		}
	}


}
