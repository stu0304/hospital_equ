package com.equip.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.equip.dao.TPersonDao;
import com.equip.model.TPerson;
import com.equip.model.VOPersonAtt;
import com.equip.service.IPersonService;
@Service
public class PersonService implements IPersonService {

	@Resource
	private TPersonDao personDao;
	
	@Override
	public int deleteByPrimaryKey(String tId) {
		return personDao.deleteByPrimaryKey(tId);
	}

	@Override
	public int insert(TPerson record) {
		
		return personDao.insertSelective(record);
	}

	@Override
	public int insertSelective(TPerson record) {
		
		return personDao.insertSelective(record);
	}

	@Override
	public TPerson selectByPrimaryKey(String tId) {
		
		return personDao.selectByPrimaryKey(tId);
	}

	@Override
	public int updateByPrimaryKeySelective(TPerson record) {
		
		return personDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(TPerson record) {
		
		return personDao.updateByPrimaryKey(record);
	}

	@Override
	public VOPersonAtt selectByUserId(String userId) {
		
		return personDao.selectByUserId(userId);
	}

}
