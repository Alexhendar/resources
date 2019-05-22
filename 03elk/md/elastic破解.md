# elastic破解



# 1  class修改

1、找到x-pack-core-7.0.1.jar，位于elasticsearch-7.0.1\modules\x-pack-core\目录下(linux上默认在/usr/share/elasticsearch)，

2、使用luyten反编译x-pack-core-7.0.1.jar

3、修改LicenseVerifier.java

LicenseVerifier 中有两个静态方法，这就是验证授权文件是否有效的方法，我们把它修改为全部返回true

```
package org.elasticsearch.license;

import java.nio.*;
import org.elasticsearch.common.bytes.*;
import java.security.*;
import java.util.*;
import org.elasticsearch.common.xcontent.*;
import org.apache.lucene.util.*;
import org.elasticsearch.core.internal.io.*;
import java.io.*;

public class LicenseVerifier
{
    public static boolean verifyLicense(final License license, final byte[] publicKeyData) {
		return true;
    }
    
    public static boolean verifyLicense(final License license) {
		return true;
    }
}
```

4、修改XPackBuild.java，中最后一个静态代码块中 try的部分全部删除，这部分会验证jar包是否被修改.

```
package org.elasticsearch.xpack.core;

import org.elasticsearch.common.io.*;
import java.net.*;
import org.elasticsearch.common.*;
import java.nio.file.*;
import java.io.*;
import java.util.jar.*;

public class XPackBuild
{
    public static final XPackBuild CURRENT;
    private String shortHash;
    private String date;
    
    @SuppressForbidden(reason = "looks up path of xpack.jar directly")
    static Path getElasticsearchCodebase() {
        final URL url = XPackBuild.class.getProtectionDomain().getCodeSource().getLocation();
        try {
            return PathUtils.get(url.toURI());
        }
        catch (URISyntaxException bogus) {
            throw new RuntimeException(bogus);
        }
    }
    
    XPackBuild(final String shortHash, final String date) {
        this.shortHash = shortHash;
        this.date = date;
    }
    
    public String shortHash() {
        return this.shortHash;
    }
    
    public String date() {
        return this.date;
    }
	    
	static{
		 String shortHash = "Unknown";
         String date = "Unknown";
		 CURRENT = new XPackBuild(shortHash, date);
	}
    /* static {
        final Path path = getElasticsearchCodebase();
        String shortHash = null;
        String date = null;
        Label_0109: {
            if (path.toString().endsWith(".jar")) {
                try {
                    final JarInputStream jar = new JarInputStream(Files.newInputStream(path, new OpenOption[0]));
                    try {
                        final Manifest manifest = jar.getManifest();
                        shortHash = manifest.getMainAttributes().getValue("Change");
                        date = manifest.getMainAttributes().getValue("Build-Date");
                        jar.close();
                    }
                    catch (Throwable t) {
                        try {
                            jar.close();
                        }
                        catch (Throwable t2) {
                            t.addSuppressed(t2);
                        }
                        throw t;
                    }
                    break Label_0109;
                }
                catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
            shortHash = "Unknown";
            date = "Unknown";
        }
        CURRENT = new XPackBuild(shortHash, date);
    } */
}

```



编译修改后的java文件放在`elasticsearch-7.0.1`目录下

5、执行

```
javac -cp “.;./modules/x-pack-core/x-pack-core-7.0.1.jar;./lib/*” LicenseVerifier.java
javac -cp “.;./modules/x-pack-core/x-pack-core-7.0.1.jar;./lib/*” XPackBuild.java
```

```
需要注意的是，编译这两个文件的时候 需要指定依赖包的位置，注意修改。
```

6、将编译好的class文件重新压回x-pack-core-7.0.1.jar

 解压x-pack-core-7.0.1.jar 会得到一个 x-pack-core-7.0.1目录，
按照其位置将编译好的2个class文件放到我们目录里面，替换老的。
直接用命令即可
[unjar]   jar -xvf x-pack-core-7.0.1.jar
[jar]        jar cf x-pack-core-7.0.1.jar

# 2  导入授权文件

## 2.1  修改license到期时间

这里修改为2050年

```
{
  "license": {
    "uid": "9f9443d7-f48f-4141-a7df-551dd7868e0d",
    "type": "platinum",
	"issue_date_in_millis": 1557573991000,
    "expiry_date_in_millis": 2546011910000,
    "max_nodes": 1000,
    "issued_to": "Alex(HelloWorld)",
    "issuer": "AUser",
    "signature": "AAAAAwAAAA2OamcbwjbOtF7/y1QJAAABmC9ZN0hjZDBGYnVyRXpCOW5Bb3FjZDAxOWpSbTVoMVZwUzRxVk1PSmkxaktJRVl5MUYvUWh3bHZVUTllbXNPbzBUemtnbWpBbmlWRmRZb25KNFlBR2x0TXc2K2p1Y1VtMG1UQU9TRGZVSGRwaEJGUjE3bXd3LzRqZ05iLzRteWFNekdxRGpIYlFwYkJiNUs0U1hTVlJKNVlXekMrSlVUdFIvV0FNeWdOYnlESDc3MWhlY3hSQmdKSjJ2ZTcvYlBFOHhPQlV3ZHdDQ0tHcG5uOElCaDJ4K1hob29xSG85N0kvTWV3THhlQk9NL01VMFRjNDZpZEVXeUtUMXIyMlIveFpJUkk2WUdveEZaME9XWitGUi9WNTZVQW1FMG1XXXXlZ4NTltbU1CVE5lR09Bck93V2J1Y3c9PQAAAQBAXDSpRK5vJaJ4DduuK35/flhEXes5cCAKJ40rIkR0kDx9Nd5ZaiIxiEXQLbpT2ZG5H6znytn1/BITYvP9pOZsDgZBK7hL32UPC4j8Lar05A009NDIX8Tp0bhHT0iFB4dvYGmE3eZpgAoKD5FvRRsM9YuS3bUyMhVJwCdJqi2g6GfD2MTywEXSj+2CNMv5gUCMa2CM2x2Z+iIx+FbbpSpnsk4F3jqr+U83i1Fpkitv+ZSSSOD6yWc692MHFUBVGnTDW5vkxp+gMK6RK30kvZvmobOjqUvgaXbBPav7DEW1EGpfgXsdsMbZ6ZzvmF28tPUHpZxb4jUbHDjHRCggNXXB"
  }
}
```

## 2.2  修改安全配置

修改  elasticsearch.yml  文件，在最后加上

```
xpack.security.enabled: false
```

## 2.3  上传证书

```
curl -H "Content-Type: application/json" -XPUT "http://localhost:9200/_xpack/license?acknowledge=true" -d @license.json
```

## 2.4  查看证书状态

```
curl -H “Content-Type: application/json” -XGET “http://172.16.1.160:9200/_license”
```

```
{
  license: {
    status: "active",
    uid: "9f9443d7-f48f-4141-a7df-551dd7868e0d",
    type: "platinum",
    issue_date: "2019-05-11T11:26:31.000Z",
    issue_date_in_millis: 1557573991000,
    expiry_date: "2050-09-05T17:31:50.000Z",
    expiry_date_in_millis: 2546011910000,
    max_nodes: 1000,
    issued_to: "Alex(HelloWorld)",
    issuer: "AUser",
    start_date_in_millis: -1
  }
}
```





参考：

1、<http://log.magicwall.org:8/?p=1559>

2、<https://blog.csdn.net/qq_29202513/article/details/82747798>

3、<https://blog.csdn.net/myfmyfmyfmyf/article/details/53179395>