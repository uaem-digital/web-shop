package dao;

import java.util.List;

public interface DAOInterface<T extends DataObject> {
	// CRUD operations
	public T save(T item);
	public T update(T item);
	public T find(Integer id);
	public boolean has(T item);
	public List<T> findAll();
	public void delete(T item);
}
