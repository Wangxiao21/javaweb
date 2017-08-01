package njau.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import njau.model.Food;
import njau.model.Shop;

import njau.service.FoodService;
import njau.service.ShopService;


@Controller  
@RequestMapping("shop")
public class ShopController {
	@Autowired
	private ShopService shopService;

	@Autowired
	private FoodService foodService;


	
	@RequestMapping("shopmesg")
	public ModelAndView shopMesg(HttpSession session){
		int shopid=(int) session.getAttribute("shopid");
		Shop shop=shopService.getById(shopid);
		Map<String,Object> model=new HashMap<String,Object>();
		model.put("shop",shop);
		return new ModelAndView("shop_mesg",model);
	}

	
	@RequestMapping("index")
	public ModelAndView index(){
		Map<String,Object> result=new HashMap<String,Object>();
		result.put("shoplist",shopService.getAll());
		return new ModelAndView("shop_list",result);		
	}

	
	@RequestMapping("detail/{id}")
	public ModelAndView getshop(@PathVariable("id") String id, HttpSession session){
		Map<String,Object> model=new HashMap<String,Object>();	
		List<Food> foodList=foodService.getFoodByShopid(Integer.valueOf(id));
			
			
		Shop shop=shopService.getById(Integer.valueOf(id));
		List<String> types=foodService.getFoodType(Integer.valueOf(id));
		
		
		model.put("shop", shop);
		model.put("types", types);
		model.put("foodlist", foodList);		
		
		return new ModelAndView("shop_detail",model);
	}
	

	@ResponseBody
	@RequestMapping("getshop")
	public Shop getShop(String shopid){
		return shopService.getById(Integer.valueOf(shopid));
	}

	@ResponseBody
	@RequestMapping("getByTag")
	public Map<String,List<Shop>> getByTag(String tag){
		Map<String,List<Shop>> result=new HashMap<String,List<Shop>>();
		List<Shop> l=shopService.getByTag(tag);
		result.put("result",l);

		return result;
	}
	@ResponseBody
	@RequestMapping("select")
	public Map<String,List<Shop>> select(String value){
		Map<String,List<Shop>> result=new HashMap<String,List<Shop>>();
		List<Shop> lt=shopService.getByTag(value);
		List<Shop> ln=shopService.getByName(value);
		lt.addAll(ln);
		result.put("result",lt);
		return result;
	}
	@ResponseBody
	@RequestMapping("getAll")
	public Map<String,List<Shop>> getAll(String value){
		Map<String,List<Shop>> result=new HashMap<String,List<Shop>>();
		List<Shop> l=shopService.getAll();
		result.put("result",l);
		return result;
	}
	@ResponseBody
	@RequestMapping("getMore")
	public Map<String,List<Shop>> getMore(int start,int size){
		Map<String,List<Shop>> result=new HashMap<String,List<Shop>>();
		List<Shop> l=shopService.getMore(start,size);
		result.put("result",l);

		return result;
	}
	@ResponseBody
	@RequestMapping("prelogin")
	public Map<String,String> prelogin(int name,String password){
		String result="";
		Shop shop=shopService.getById(name);
		if(shop==null){
			result="faild";
		}
		else{
			if(shop.getPassword().equals(password)){
				result="success";
			}
			else{
				result="faild";
			}
		}
		Map<String,String> map=new HashMap<String,String>();
		map.put("result", result);
		return map;
	}
}
