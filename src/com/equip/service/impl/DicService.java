package com.equip.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.equip.dao.TCodeDicDao;
import com.equip.model.Page;
import com.equip.model.TDicCode;
import com.equip.service.IDicCodeService;
import com.google.gson.Gson;
@Service
public class DicService implements IDicCodeService {

	@Resource
	TCodeDicDao codeDao;

	@Override
	public boolean deleteByPrimaryKey(String tDicId) {
		return codeDao.deleteByPrimaryKey(tDicId)>0?true:false;
	}

	@Override
	public boolean insert(TDicCode record) {
		return codeDao.insert(record)>0?true:false;
	}

	@Override
	public boolean insertSelective(TDicCode record) {
	return codeDao.insertSelective(record)>0?true:false;
	}

	@Override
	public TDicCode selectByPrimaryKey(String tDicId) {
	return codeDao.selectByPrimaryKey(tDicId);
	}

	@Override
	public String getDataByType(String dType) {
	return (new Gson().toJson(codeDao.getDataByType(dType)));
	}

	@Override
	public List selectDicAll(TDicCode record,Page pager) {
		
	return codeDao.selectDicAll(record.gettName(),record.gettType(),pager.getNextStartPage(),pager.getV_pageSize());
	}

	@Override
	public String selectDicType() {
		return (new Gson().toJson(codeDao.selectDicType()));
	}

	@Override
	public boolean updateByPrimaryKeySelective(TDicCode record) {
	return codeDao.updateByPrimaryKeySelective(record)>0?true:false;
	}

	@Override
	public boolean updateByPrimaryKey(TDicCode record) {
	return codeDao.updateByPrimaryKey(record)>0?true:false;
	}

	@Override
	public String selectCountDicCode() {
		return codeDao.selectCountDicCode();
	}
	


	
}
