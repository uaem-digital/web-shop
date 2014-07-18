package webShop;

/** Represents an item in the shopping cart. Items make up the product and quantity. */
public class ShoppingCartItem {

	private Product product;
	private int count;

	public ShoppingCartItem(Product p, int count) {
		this.product = p;
		this.count = count;
	}
	
	
	public void setProduct(Product p) {
		product = p;
	}

	public Product getProduct() {
		return product;
	}

	public void setCount(int c) {
		count = c;
	}

	public int getCount() {
		return count;
	}

}
