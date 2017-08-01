package njau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import njau.dao.UserDao;
import njau.model.Shop;
import njau.model.User;


@Service
public class UserService {
	@Autowired
	private UserDao userDao;
 
	public void save(User entity){		
		userDao.save(entity);
	}	
	
	public User getByPhone(String phone){
		return userDao.getByPhone(phone);
	}
	
	public void updateAvatar(String avatar,String phone){
		userDao.updateAvatar(avatar,phone);
	}
	public Pager getPage(int pageNo,int pageSize){
		String hql="select count(*) from User where 1=1";		
		
		int rowCount = userDao.getTotalCount(hql);
		String queryHql = hql.substring(16);
		List<User> userList=userDao.getByPage(pageNo, pageSize, queryHql);
		Pager pager=new Pager(pageSize, pageNo, rowCount, userList);
		return pager;
	}
	
	public void deleteUser(String phone){
		userDao.delete(phone);
	}
}
