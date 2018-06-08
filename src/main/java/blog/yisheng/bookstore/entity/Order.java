package blog.yisheng.bookstore.entity;


import java.util.Date;
import java.util.HashMap;

/**
 * Created by ysyang on 12/12/2016.
 */
public class Order extends BaseEntity {
    private int orderID, mobile;
    private String username;
    private String address;
    private String receiver;
    private Date date;
    private HashMap<Book,Integer> itemList;

    public Order(int mobile, String username, String address, String receiver, Date date) {
        this.mobile = mobile;
        this.username = username;
        this.address = address;
        this.receiver = receiver;
        this.date = date;
        itemList = new HashMap<Book, Integer>();
    }


    public Order() {
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getMobile() {
        return mobile;
    }

    public void setMobile(int mobile) {
        this.mobile = mobile;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public HashMap<Book, Integer> getItemList() {
        return itemList;
    }

    public void setItemList(HashMap<Book, Integer> itemList) {
        this.itemList = itemList;
    }
}
