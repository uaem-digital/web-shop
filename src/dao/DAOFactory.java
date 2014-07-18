package dao;

import java.util.HashMap;

public class DAOFactory {
	private static HashMap<Class, DAOInterface> daos = new HashMap<>();
	
	private DAOFactory() {	}
	
	public static <T extends DataObject> DAOInterface<T> getDao(Class<T> type) {
		DAOInterface<T> dao = daos.get(type);
		
		if (dao == null) {
			dao = new GenericInMemoryDAO<T>();
			daos.put(type, dao);
		}
		return dao;
	}
}
