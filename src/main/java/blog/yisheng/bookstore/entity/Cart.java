package blog.yisheng.bookstore.entity;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

/**
 * Created by ysyang on 12/12/2016.
 */
public class Cart {
    private HashMap<Book, Integer> cartItems = null;

    public HashMap<Book, Integer> getCartItems() {
        return cartItems;
    }

    private double totalPrice = 0;

    public double getTotalPrice() {
        return totalPrice;
    }

    public Cart() {
        cartItems = new HashMap<Book, Integer>();
        totalPrice = 0;
    }

    public boolean addItem(Book b, Integer amount){
        if (cartItems == null){
            cartItems = new HashMap<Book, Integer>();
        }
        Integer amt = cartItems.get(b);
        if (cartItems.containsKey(b)){
            amt += amount;
            totalPrice += b.getPrice()*amount;
            cartItems.put(b,amt);
        }
        else {
            totalPrice += b.getPrice()*amount;
            cartItems.put(b,amount);
        }
        return true;
    }

    public boolean removeItem(Book b, Integer amount){
        if (cartItems == null){
            return false;
        }
        if (cartItems.containsKey(b)){
            Integer amt = cartItems.get(b);
            if (amt > amount){
                amt -= amount;
                totalPrice -= b.getPrice()*amount;
                cartItems.put(b,amt);
            }
            else{
                totalPrice -=b.getPrice()*amt;
                cartItems.remove(b);
            }
        }
        else {
            return false;
        }
        return true;
    }

    public void printItemList(){
        Set<Book> booklist = cartItems.keySet();
        Collection<Integer> amountlist = cartItems.values();
        Iterator<Integer> ait = amountlist.iterator();
        Iterator<Book> bit = booklist.iterator();
        while (bit.hasNext()){
            Book b = bit.next();
            Integer amt = ait.next();
            System.out.print(b.getBookName());
            System.out.print(amt);
        }
    }
}
