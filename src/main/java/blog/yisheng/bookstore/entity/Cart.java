package blog.yisheng.bookstore.entity;

import java.util.HashMap;

/**
 * Created by ysyang on 12/12/2016.
 */
public class Cart extends BaseEntity {
    private HashMap<Book, Integer> cartItems = null;
    private double totalPrice = 0;

    public HashMap<Book, Integer> getCartItems() {
        return cartItems;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public Cart() {
        cartItems = new HashMap<Book, Integer>();
        totalPrice = 0;
    }

    public boolean addItem(Book book, Integer amount) {
        if (cartItems.containsKey(book)) {
            totalPrice += book.getPrice() * amount;
            cartItems.put(book, cartItems.get(book) + amount);
        } else {
            totalPrice += book.getPrice() * amount;
            cartItems.put(book, amount);
        }
        return true;
    }

    public boolean removeItem(Book b, Integer amount) {
        if (cartItems.containsKey(b)) {
            Integer currentAmount = cartItems.get(b);
            if (currentAmount > amount) {
                currentAmount -= amount;
                totalPrice -= b.getPrice() * amount;
                cartItems.put(b, currentAmount);
            } else {
                totalPrice -= b.getPrice() * currentAmount;
                cartItems.remove(b);
            }
        } else {
            return false;
        }
        return true;
    }

    public void clear() {
        cartItems.clear();
    }

}
