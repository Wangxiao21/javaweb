package njau.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import njau.model.Address;


@Repository
public class AddressDao extends GenericDao<Address>{
	
	public Address get(int id){		
		String hql="from Address where id=:id";
		Query query=getSession().createQuery(hql);
		query.setInteger("id",id);		
		return (Address) query.uniqueResult();
	}
	public List<Address> getAllByUserId(int id){		
		String hql="from Address where userid=:id";
		Query query=getSession().createQuery(hql);
		query.setInteger("id",id);		
		return query.list();
	}
	
	public void update(Address ads){
		String hql="update Address as ads set ads.address=:address,ads.name=:name,ads.phone=:phone where id=:id";
		Query query = getSession().createQuery(hql);
		query.setString("name", ads.getName());
		query.setString("address", ads.getAddress());
		query.setString("phone",ads.getPhone());
		query.setInteger("id",ads.getId());
		query.executeUpdate();	
	}
	public void delete(int id){
		String hql="delete Address where id=:id";
		Query query = getSession().createQuery(hql);
		query.setInteger("id",id);
		query.executeUpdate();
	}
}
