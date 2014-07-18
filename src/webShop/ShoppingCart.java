package webShop;

import java.util.ArrayList;

/**
 * Represents cart. A vector of items (ordered pair 
 * (product, quantity)).
 */
public class ShoppingCart {
	
	private ArrayList<ShoppingCartItem> items;

	public ShoppingCart() {
		items = new ArrayList<ShoppingCartItem>();
	}

	public void addItem(Product product, int count) {
		items.add(new ShoppingCartItem(product, count));
	}

	public ArrayList<ShoppingCartItem> getItems() {
		return items;
	}
}
