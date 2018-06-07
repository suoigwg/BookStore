package blog.yisheng.bookstore.core;

import blog.yisheng.bookstore.entity.Book;


import java.util.Date;
import java.util.HashMap;

/**
 * Created by ysyang on 12/12/2016.
 */
public class Order {
    private int orderid, mobile;
    private String email;
    private String address;
    private String receiver;
    private Date orderDate;
    private HashMap<Book,Integer> itemList;

    public Order() {
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getMobile() {
        return mobile;
    }

    public void setMobile(int mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public HashMap<Book, Integer> getItemList() {
        return itemList;
    }

    public void setItemList(HashMap<Book, Integer> itemList) {
        this.itemList = itemList;
    }
}
