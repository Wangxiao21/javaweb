package njau.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import njau.model.User;
import njau.service.UserService;

@Controller  
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("logout")  
	 public String logout(HttpServletRequest request, @RequestHeader HttpHeaders header){
		String referer=header.get("Referer").get(0).toString();
		String page="redirect:"+referer.replaceAll("http://localhost:8080","");
		request.getSession().removeAttribute("user");
		return page;
	}
	@RequestMapping(value="login",method = RequestMethod.POST)
	public String login(String phone,String password,HttpServletRequest request){
		String page="/shop/index";
		User user = userService.getByPhone(phone);
		if (password.equals(user.getPassword())) {
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("hasLogin", true);
			String referer=(String)request.getSession().getAttribute("refererLogin");
			if(referer!=null) {
				page="redirect:"+referer.replaceAll("http://localhost:8080","");
			}
		}
		return page;
	}

	@RequestMapping(value="login",method = RequestMethod.GET)
	public String login(@RequestHeader HttpHeaders header,HttpServletRequest request){
		request.getSession().setAttribute("refererLogin",header.get("Referer").get(0).toString());
		return "redirect:/login.jsp";
	}


	@ResponseBody
	@RequestMapping("getuser")
	public User getUser(String phone){
		return userService.getByPhone(phone);
	}

}
