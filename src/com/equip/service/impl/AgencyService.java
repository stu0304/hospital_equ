package com.equip.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.equip.dao.TAgencyDao;
import com.equip.model.Page;
import com.equip.model.TAgency;
import com.equip.service.IAgencyService;
@Service
public class AgencyService implements IAgencyService{

	@Resource
	private TAgencyDao agencyDao;
	
	@Override
	public int deleteByPrimaryKey(String tAgencyId) {
		return agencyDao.deleteByPrimaryKey(tAgencyId);
	}

	@Override
	public int insert(TAgency record) {
		return agencyDao.insert(record);
	}

	@Override
	public int insertSelective(TAgency record) {
		return agencyDao.insertSelective(record);
	}

	@Override
	public TAgency selectByPrimaryKey(String tAgencyId) {
		return agencyDao.selectByPrimaryKey(tAgencyId);
	}

	@Override
	public int updateByPrimaryKeySelective(TAgency record) {
		return agencyDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(TAgency record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List selectAllAgency(TAgency agency, Page pager) {
		return agencyDao.selectAllAgency(agency.gettAgencyName(), pager.getNextStartPage(), pager.getV_pageSize());
	}

	@Override
	public String selectCountAgency() {
		return agencyDao.selectCountAgency();
	}

}
