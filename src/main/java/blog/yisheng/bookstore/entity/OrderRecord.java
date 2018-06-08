package blog.yisheng.bookstore.entity;

public class OrderRecord extends BaseEntity {
    private int orderID, id, amount;

    public OrderRecord() {
    }

    public OrderRecord(int orderID, int id, int amount) {

        this.orderID = orderID;
        this.id = id;
        this.amount = amount;
    }

    public int getOrderID() {

        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
