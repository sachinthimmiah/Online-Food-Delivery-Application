package in.Cart;
import GetMenuitems.Menu;
public class CartItem {
     private int itemid;
     private int restid;
     public CartItem(Menu listmenu, int quantity) {
	}
	public int getRestid() {
		return restid;
	}
	@Override
	public String toString() {
		return "CartItem [itemid=" + itemid + ", restid=" + restid + ", name=" + name + ", quantity=" + quantity
				+ ", price=" + price + "]";
	}
	public CartItem(int itemid, int restid, String name, int quantity, double price) {
		super();
		this.itemid = itemid;
		this.restid = restid;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
	}
	public void setRestid(int restid) {
		this.restid = restid;
	}
	private  String name;
     private int quantity;
     private double price;
     
	public int getItemid() {
		return itemid;
	}
	public void setItemid(int itemid) {
		this.itemid = itemid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	 
}
