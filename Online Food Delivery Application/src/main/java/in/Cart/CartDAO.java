package in.Cart;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
public class CartDAO {
   private Map<Integer,CartItem>items;
    public CartDAO() {
    	this.items=new HashMap<>();
    }
    public Map<Integer,CartItem> addItem(CartItem item){
    	int itemid=item.getItemid();
    	if(items.containsKey(itemid)) {
    		CartItem existingItem=items.get(itemid);
    	}else {
    		items.put(itemid, item);
    	}
    	return items;
    }
    public void updateItem(int itemid,int quantity) {
    	if(items.containsKey(itemid)) {
    		if(quantity<=0) {
    			items.remove(itemid);    	
    			}
    	}else 
    	{
    		items.get(itemid).setQuantity(quantity);
    	}
    }
public void removeItem(int itemid) {
	items.remove(itemid);
}
public Map<Integer,CartItem>getItems() {
	return items;
}
public void clear() {
	items.clear();
	
}
}