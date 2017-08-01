package njau.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import njau.model.Food;
import njau.service.FoodService;


@Controller  
@RequestMapping("food")
public class FoodController {
	@Autowired
	private FoodService foodService;
	
	@ResponseBody
	@RequestMapping("showfood.json")
	public List<Food> showfood(String shopid){	
		return foodService.getFoodByShopid(Integer.valueOf(shopid));	
	}
	

	@RequestMapping("showfood")
	public ModelAndView showFood(HttpSession session){
		int shopid=(int) session.getAttribute("shopid");
		Map<String,Object> result=new HashMap<String,Object>();
		result.put("foodlist",foodService.getFoodByShopid(shopid));
		return new ModelAndView("shop_menu",result);
	}
	
	@RequestMapping("add")
	public String add(@RequestParam(value = "file", required = false) MultipartFile file,
			String name,String id,String picture,String price,String descript,HttpServletRequest request,HttpSession session){
		int shopid=(int) session.getAttribute("shopid");
		Food food=new Food();
		if(file!=null){			
			String path ="D:/eclipse/workspace/webApp/WebContent/res/img";
	        File targetFile = new File(path, picture); 
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }  
	        try {  
	            file.transferTo(targetFile);
	           
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        } 
	        food.setAvatar(picture);
		}
		food.setName(name);
		
		food.setPrice(Integer.valueOf(price));
		food.setReserve(0);	
		
		foodService.save(food);
		return "redirect:/food/showfood";
	}
	
	@ResponseBody
	@RequestMapping("getfood")
	public Food getFood(String foodid){
		return foodService.getById(Integer.valueOf(foodid));
	}
	@ResponseBody
	@RequestMapping("deletefood")
	public String deleteFood(String foodid){
		foodService.deleteFood(Integer.valueOf(foodid));
		return "success";
	}
	
	
}
