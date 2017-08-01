package njau.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import njau.dao.ShopDao;
import njau.model.Food;
import njau.model.Shop;

@Service
public class ShopService {
	@Autowired
	private ShopDao shopDao;
	
	public void insert(Shop shop){
		shopDao.save(shop);
	}
	
	public Shop getById(int id){
		return shopDao.getById(id);		
	
	}
	public void deleteShop(int shopid){
		shopDao.delete(shopid);
	}
	
	public List<Shop> getAll(){
		return shopDao.getAll();
	}
	public List<Shop> getMore(int start,int size){
		return shopDao.getMore(start,size);
	}
	public List<Shop> getByName(String name){
		return shopDao.getByName(name);
	}

	public List<Shop> getByTag(String tag){
		return shopDao.getByTag(tag);
	}
	public Pager getPage(int pageNo,int pageSize){
		String hql="select count(*) from Shop where 1=1";		
		
		int rowCount = shopDao.getTotalCount(hql);
		String queryHql = hql.substring(16);
		List<Shop> shopList=shopDao.findPage(pageNo, pageSize, queryHql);
		Pager pager=new Pager(pageSize, pageNo, rowCount, shopList);
		return pager;
	}
	public void updatePic(int id,String picture){
		shopDao.updatePic(id,picture);
	}
	public List<Shop> getRegistByStatus(int status){
		return shopDao.getByStatus(status);
				
	}
	public void updateConfirm(int shopid){
		shopDao.updateStatus(shopid,1);
	}
	public void updateAds(String context,int shopid){
		shopDao.updateAds(context, shopid);
	}

	public void updateId(int nid,int oid) {
		shopDao.updateId(nid,oid);
		
	}
}
