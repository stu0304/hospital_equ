package com.equip.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.equip.dao.TEquipLogDao;
import com.equip.model.TEuipLog;
import com.equip.service.IEquipLogService;
@Service
public class EquipLogService implements IEquipLogService {

	@Resource
	private TEquipLogDao logDao;
	@Override
	public List selectEquipLogByPersonId(String personId) {
		return logDao.selectEquipLogByPersonId(personId);
	}

	@Override
	public List selectAllEquipLog(String equipName, String personName, int nextStartPage, int v_pageSize) {
		return logDao.selectAllEquipLog(equipName, personName, nextStartPage, v_pageSize);
	}

	@Override
	public int deleteByPrimaryKey(String tLogId) {
		return logDao.deleteByPrimaryKey(tLogId);
	}

	@Override
	public int insert(TEuipLog record) {
		return logDao.insert(record);
	}

	@Override
	public int insertSelective(TEuipLog record) {
		return logDao.insertSelective(record);
	}

	@Override
	public TEuipLog selectByPrimaryKey(String tLogId) {
	return logDao.selectByPrimaryKey(tLogId);
	}

	@Override
	public int updateByPrimaryKeySelective(TEuipLog record) {
		return logDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(TEuipLog record) {
		return logDao.updateByPrimaryKey(record);
	}

	@Override
	public String selectCountLog() {
	return logDao.selectCountLogCode();
	}

}
