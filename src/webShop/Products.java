package webShop;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.Collection;
import java.util.HashMap;
import java.util.StringTokenizer;

/**
 * A class that represents a list of products available for purchase. List 
  * product is initialized from a text file, which is a form <br> 
  * Id, name, unit price
 */
public class Products {
	
	private HashMap<String, Product> products = new HashMap<String, Product>();

	public Products(String path) {
		BufferedReader in = null;
		try {
			File file = new File(path + "/shop/products.txt");
			System.out.println(file.getCanonicalPath());
			in = new BufferedReader(new FileReader(file));
			readProducts(in);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if ( in != null ) {
				try {
					in.close();
				}
				catch (Exception e) { }
			}
		}
	}

	/**
	 * Reads products from a file and places them in an associative list of products. 
* 	 * The key is the id of the product.
	 */
	private void readProducts(BufferedReader in) {
		String line, id = "", name = "", price = "";
		StringTokenizer st;
		try {
			while ((line = in.readLine()) != null) {
				line = line.trim();
				if (line.equals("") || line.indexOf('#') == 0)
					continue;
				st = new StringTokenizer(line, ";");
				while (st.hasMoreTokens()) {
					id = st.nextToken().trim();
					name = st.nextToken().trim();
					price = st.nextToken().trim();
				}
				products.put(id, new Product(id, name, Double
						.parseDouble(price)));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/** Returns a collection of products. */
	public Collection<Product> values() {
		return products.values();
	}

	/** Returning a product based on its id. */
	public Product getProduct(String id) {
		return products.get(id);
	}
}
