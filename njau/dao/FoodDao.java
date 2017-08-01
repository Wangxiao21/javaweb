package njau.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import njau.model.Food;
import njau.model.Shop;

@Repository
public class FoodDao extends GenericDao<Food>{

	public Food get(Integer id){	
		return (Food) getSession().createQuery("from Food where id=:id")
	    		.setInteger("id",new Integer(id))
	    		.uniqueResult();		
    }
	
	public List<Food> getFoodByShop(int shopid){	
		return (List<Food>) getSession().createQuery("from Food where shopid=:shopid")
				.setInteger("shopid",new Integer(shopid))
	    		.list();
	}
	 public void updateType(String type,int id){
    	 getSession().createQuery("update Food as f set f.type=:type where f.id=id")
    	 	.setString("type",type).setInteger("id", new Integer(id))
    	 	.executeUpdate();
    }
	public void updatePrice(float price,int id){
    	 getSession().createQuery("update Food as f set f.price=:price where f.id=id")
    	 	.setFloat("price",price).setInteger("id", new Integer(id))
    	 	.executeUpdate();
    }
	public void updateReserve(int re,int id){
   	 getSession().createQuery("update Food as f set f.reserve=:reserve where f.id=id")
   	 	.setInteger("reserve",new Integer(re)).setInteger("id", new Integer(id))
   	 	.executeUpdate();
   }
	

	public void delete(int foodid){
		String hql="delete Food food where food.id=:id";
		Query query = getSession().createQuery(hql);
		query.setInteger("id",foodid);
		query.executeUpdate();
	}

	public List<String> getFoodType(int shopid) {
		return (List<String>) getSession().createQuery("select distinct type from Food where shopid=:shopid")
			.setInteger("shopid",new Integer(shopid))
			.list();		
	}
}
