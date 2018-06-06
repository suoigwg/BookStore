package blog.yisheng.bookstore.util;

/**
 * Created by ysyang on 12/12/2016.
 */
public class Utility {
    public static String mergeString(String... args){
        String s = "";
        for (String arg: args){
            s += arg+",";
        }
        s = s.substring(0,s.length()-1);
        return s;
    }
}
