package webShop;

import java.io.Serializable;

/** Represents a single product. Saves the id, name and unit price. */
public class Product implements Serializable{

	private static final long serialVersionUID = -4748194577472848822L;
	private String id;
	private String name;
	private double price;

	public Product(String id, String name, double price) {
		this.id = id;
		this.name = name;
		this.price = price;
	}
	
	
	public void setId(String i) {
		id = i;
	}

	public String getId() {
		return id;
	}

	public void setName(String n) {
		name = n;
	}

	public String getName() {
		return name;
	}

	public void setPrice(double p) {
		price = p;
	}

	public double getPrice() {
		return price;
	}

}
