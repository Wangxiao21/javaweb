package njau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import njau.dao.FoodDao;
import njau.model.Food;

@Service
public class FoodService {
	@Autowired
	private FoodDao foodDao;
	public void save(Food food){
		foodDao.save(food);
	}
	public Food getById(int id){
		return foodDao.get(id);
	}
	public List<Food> getFoodByShopid(int shopid){
		return foodDao.getFoodByShop(shopid);
	}
	
	public void deleteFood(int foodid){
		foodDao.delete(foodid);
	}
	public List<String> getFoodType(int shopid){
		return foodDao.getFoodType(shopid);
	}
}
