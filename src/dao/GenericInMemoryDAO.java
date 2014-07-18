package dao;

import java.util.ArrayList;
import java.util.List;

public class GenericInMemoryDAO<T extends DataObject> implements DAOInterface<T> {

	ArrayList<T> items = new ArrayList<T>();
	
	public synchronized T save(T item) {
		items.add(item);
		
		item.setId(items.indexOf(item));
		return item;
	}

	public synchronized T update(T item) {
		if (!items.contains(item)) {
			return null;
		}
		
		
		items.set(items.indexOf(item), item);
		
		return item;
	}

	public synchronized T find(Integer id) {
		return items.get(id);
	}

	public synchronized List<T> findAll() {
		
		return items;
	}

	public synchronized void  delete(T item) {
		items.remove(item);
	}

	public synchronized boolean has(T item) {
		return items.indexOf(item)!=-1;
	}

	

}
