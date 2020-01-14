package group.aliren.nutadmin.util;

import group.aliren.nutadmin.kit.CryptoKit;

import java.time.LocalDateTime;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2020/1/13 16:16
 * Description: ID生成工具.
 */

public class IdUtil {

    /**
     * 根据 手机号、时间戳、密码 生成TId
     * @param mobile
     * @param password
     * @return
     */
    public static String generateTId(String mobile, String password) {

        ZonedDateTime zbt = ZonedDateTime.now();

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");

        return CryptoKit.enMd5(mobile + dtf.format(zbt) + password);
    }
}
