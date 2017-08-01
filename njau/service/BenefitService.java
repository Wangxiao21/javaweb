package njau.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import njau.dao.BenefitDao;

import njau.model.Benefit;



@Service
public class BenefitService {
		
	@Autowired
	private BenefitDao benefitDao;
	
	
	public void save(Benefit benefit){
		benefitDao.save(benefit);
	}


	public List<Benefit> getByShopId(int shopid) {
		
		return benefitDao.getByShopId(shopid);
	}
	public List<Benefit> getByIdList(String ids) {
		
		return benefitDao.getByIdList(ids);
	}
}
