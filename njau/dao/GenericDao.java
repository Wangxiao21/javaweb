package njau.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
@Repository
public class GenericDao<T> {
	@Autowired
    @Qualifier("sessionFactory")
	protected SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}	
	protected Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	public void saveAll(List<T> entityList){
		for(T entity:entityList){
			save(entity);
		}
	}
	public void save(T entity){
		getSession().save(entity);	
	}
	

}
