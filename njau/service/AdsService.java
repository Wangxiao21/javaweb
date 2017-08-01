package njau.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import njau.dao.AdsDao;

import njau.model.Ads;

@Service
public class AdsService {
	@Autowired
	private AdsDao adsDao;
 
	public void save(Ads a){
		adsDao.save(a);
	}
}
