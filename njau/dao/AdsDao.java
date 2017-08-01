package njau.dao;



import org.springframework.stereotype.Repository;

import njau.model.Ads;

@Repository
public class AdsDao extends GenericDao<Ads>{
	
	public void delete(int id){		
		getSession().createQuery("delete Ads a where a.id=:id")
			.setInteger("id",id)
			.executeUpdate();
		
	}
}
