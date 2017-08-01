package njau.dao;


import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import njau.model.User;

@Repository
public class UserDao extends GenericDao<User>{

	public User getByPhone(String phone){
		User u=null;
		try{
			u=(User)getSession().createQuery("from User where phone=:phone")
					.setString("phone",phone)
					.uniqueResult();
		}catch(Exception e){
			System.out.println(e);
		}
		return u;
		//return (User) getSession().load(User.class,new Integer(id));	
	}
	

	public void updatePassword(String psw,String phone){
		getSession().createQuery("update User as u set u.password=:password where u.phone=:phone")
			.setString("password",psw).setString("phone",phone)
			.executeUpdate();
		/*
		String hql="update User as user set user.password=:password,user.phone=:phone,user.mail=:mail where user.id=:id";
		Query query = getSession().createQuery(hql);
		query.setInteger("id",user.getId());
		query.setString("password",user.getPassword());
		query.setString("phone",user.getPhone());
		query.setString("mail", user.getMail());
		query.executeUpdate();	
		*/
	}
	public void updateAvatar(String avatar,String phone){
		getSession().createQuery("update User as u set u.avatar=:avatar where u.phone=:phone")
		.setString("avatar",avatar).setString("phone",phone)
		.executeUpdate();	
	}
	public void updateAddress(String address,String phone){
		getSession().createQuery("update User as u set u.address=:address where u.phone=:phone")
		.setString("address",address).setString("phone",phone)
		.executeUpdate();	
	}
	public void updateSex(String sex,String phone){
		getSession().createQuery("update User as u set u.sex=:sex where u.phone=:phone")
		.setString("sex", sex).setString("phone",phone)	
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
    public List<User> getByPage(int pageNo, int pageSize, String hql){    	
		List<User> result = null;
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
	public void delete(String phone){		
		getSession().createQuery("delete User u where u.phone=:phone")
			.setString("phone",phone)
			.executeUpdate();
		
	}
}
