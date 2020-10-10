package group.aliren.nutadmin;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2020/9/30 10:00
 * Description: .
 */

@Configuration
@MapperScan("group.aliren.nutadmin.mapper")
public class Config {

    @Bean
    @Autowired
    public SqlSessionFactoryBean sqlSessionFactoryBean(DataSource dataSource) {
        SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();

        sessionFactoryBean.setDataSource(dataSource);

        return sessionFactoryBean;
    }

    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dmd = new DriverManagerDataSource();
        dmd.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dmd.setUsername("root");
        dmd.setPassword("9z77MgNB#5");
        dmd.setUrl("jdbc:mysql://47.96.185.234:3306/nut?useUnicode=true&characterEncoding=utf8&useSSL=false&autoReconnect=true&rewriteBatchedStatements=true");
        return dmd;
    }
}
