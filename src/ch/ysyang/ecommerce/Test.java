package ch.ysyang.ecommerce;

/**
 * Created by ysyang on 10/12/2016.
 */
public class Test {
    public static void main(String  args[]){
        String email = "admin@jx.com";
        String password = "admin";
        String sql = "SELECT * from User where email = \'"+email+"\' and password = \'"+password+"\'";
        System.out.print(sql);
    }
}
