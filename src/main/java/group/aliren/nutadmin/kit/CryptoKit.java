package group.aliren.nutadmin.kit;

import org.springframework.util.Base64Utils;
import org.springframework.util.DigestUtils;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: zxj
 * @date: 2020/1/13 16:22
 * Description: 加解密封装.
 */

public class CryptoKit {
    public static java.lang.String enMd5(String value) {
        byte[] b = value.getBytes();

        byte[] enB = DigestUtils.md5Digest(b);

        return Base64Utils.encodeToString(enB);
    }
}
