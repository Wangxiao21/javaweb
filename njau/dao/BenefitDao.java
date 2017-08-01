package njau.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import njau.model.Benefit;



@Repository
public class BenefitDao extends GenericDao<Benefit>{

	public List<Benefit> getByShopId(int shopid) {
		return (List<Benefit>) getSession().createQuery("from Benefit where shopid=:id")
			.setInteger("id", new Integer(shopid))
			.list();
	
	}

	public List<Benefit> getByIdList(String ids) {
		List<Benefit> benefitList=new ArrayList<Benefit>();
		String[] list=ids.split(",");
		for(int i=0;i<list.length;i++){
			if(list[i]!=null){
				benefitList.add(getById(Integer.valueOf(list[i])));
			}
		}
		return benefitList;
	}
	public Benefit getById(int benefitid) {
		return (Benefit) getSession().createQuery("from Benefit where id=:id")
				.setInteger("id", new Integer(benefitid))
				.uniqueResult();
	}

}
