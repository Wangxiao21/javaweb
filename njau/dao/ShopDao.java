package njau.dao;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;

import org.springframework.stereotype.Repository;

import njau.model.Food;
import njau.model.Shop;

@Repository
public class ShopDao extends GenericDao<Shop>{
	
    public Shop getById(int id){    	
    	return (Shop) getSession().createQuery("from Shop where id=:id")
    		.setInteger("id",new Integer(id))
    		.uniqueResult();				
    }
	public List<Shop> getByName(String name){
		String hql="from Shop where name like :name";
		Query query = getSession().createQuery(hql);
		query.setString("name","%"+name+"%");
		return query.list();
	}
	public List<Shop> getByStatus(int status){
		String hql="from Shop where status=:status";
		Query query = getSession().createQuery(hql);
		query.setInteger("status",status);
		return query.list();
	}
	public List<Shop> getByTag(String tag){
		String hql="from Shop where tags like :tag";
		Query query = getSession().createQuery(hql);
		query.setString("tag","%"+tag+"%");
		return query.list();
	}

    public void updateAddress(String ads,int id){
    	 getSession().createQuery("update Shop as p set p.address=:address where p.id=id")
    	 	.setString("address",ads).setInteger("id", new Integer(id))
    	 	.executeUpdate();
    }
    public void updatePassword(String psd,int id){
   	 getSession().createQuery("update Shop as p set p.password=:password where p.id=id")
   	 	.setString("password",psd).setInteger("id", new Integer(id))
   	 	.executeUpdate();
    }
    public void updateTips(String tips,int id){
   	 getSession().createQuery("update Shop as p set p.tips=:tips where p.id=id")
   	 	.setString("tips",tips).setInteger("id", new Integer(id))
   	 	.executeUpdate();
   }
    public void updateTags(String tags,int id){
   	 getSession().createQuery("update Shop as p set p.tags=:tags where p.id=id")
   	 	.setString("tags",tags).setInteger("id", new Integer(id))
   	 	.executeUpdate();
    }
    public void updateStatus(int status,int id){
      	 getSession().createQuery("update Shop as p set p.status=:status where p.id=id")
      	 	.setInteger("status",status).setInteger("id", new Integer(id))
      	 	.executeUpdate();
    }
    public void updateBfname(String bfname,int id){
      	 getSession().createQuery("update Shop as p set p.bfname=:bfname where p.id=id")
      	 	.setString("bfname",bfname).setInteger("id", new Integer(id))
      	 	.executeUpdate();
    }
    public void updateBfvalue(String bfvalue,int id){
     	 getSession().createQuery("update Shop as p set p.bfname=:bfname where p.id=id")
     	 	.setString("bfvalue",bfvalue).setInteger("id", new Integer(id))
     	 	.executeUpdate();
     }

    public int getTotalCount(String hql){		
		Integer i=null;
		try{
			Query query = getSession().createQuery(hql);			
			Number num = (Number) query.list().get(0);
			i=num.intValue();
		} catch (RuntimeException re){
			re.printStackTrace();
		}
		return i;
	}
    public List<Shop> findPage(int pageNo, int pageSize, String hql){    	
		List<Shop> result = null;
		try{
			Query query = getSession().createQuery(hql);			
			query.setFirstResult((pageNo - 1) * pageSize);
			query.setMaxResults(pageSize);
			result = query.list();
		} catch (RuntimeException re){
			re.printStackTrace();
		}
		return result;
	} 
    public List<Shop> getAll(){
    	String hql="from Shop";
    	Query query = getSession().createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(12);
    	return query.list();
    }
	public List<Shop> getMore(int start,int size){
		String hql="from Shop";
		Query query = getSession().createQuery(hql);
		query.setFirstResult(start);
		query.setMaxResults(size);
		return query.list();
	}

    public void updatePic(int id,String pic){
    	String hql="update Shop as p set p.picture=:picture where p.id=:id";
		Query query = getSession().createQuery(hql);
		query.setInteger("id",id);
		query.setString("picture",pic);
		query.executeUpdate();
    }

    public void updateSpeed(int shopid,int speed){
    	String hql="update Shop as p set p.speed=:speed where p.id=:id";
    	Query query = getSession().createQuery(hql);
    	query.setInteger("speed",speed);
    	query.setInteger("id",shopid);
    	query.executeUpdate(); 
    }
    public void delete(int shopid){
    	String hql="delete Shop shop where shop.id=:id";
    	Query query = getSession().createQuery(hql);
    	query.setInteger("id",shopid);
    	query.executeUpdate();
    }
    public void updateAds(String context,int id){
    	String hql="update Shop as shop set shop.ads=:ads where shop.id=:id";
    	Query query = getSession().createQuery(hql);
    	query.setString("ads",context);
    	query.setInteger("id",id);
    	query.executeUpdate();
    }
	public void updateId(int nid,int oid) {
		String hql="update Shop as p set p.id=:nid where p.id=:id";
    	Query query = getSession().createQuery(hql);
    	query.setInteger("nid",nid);
    	query.setInteger("id",oid);
    	query.executeUpdate(); 
	}
}
