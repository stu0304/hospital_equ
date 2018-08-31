package com.equip.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.equip.dao.TAttenchmentDao;
import com.equip.model.TAttenchment;
import com.equip.service.IUploadService;
import com.google.gson.Gson;
@Service
public class UploadService implements IUploadService{

	@Resource
	private TAttenchmentDao attDao;
	@Override
	public boolean uploadFile(TAttenchment record) {
		return attDao.insertSelective(record)>0?true:false;
	}

	@Override
	public boolean deleteFile(TAttenchment record) {
		return attDao.deleteByPrimaryKey(record.gettAttid())>0?true:false;
	}

	@Override
	public boolean checkFile(String tid) {
		List temp = attDao.getAllAttByTid(tid);
	return temp.size()>0?true:false;
	}

	@Override
	public boolean updateFile(TAttenchment att) {
		return attDao.updateByPrimaryKeySelective(att)>0?true:false;
	}

	@Override
	public String getAllAttJSON(String tid) {
		return new Gson().toJson(attDao.getAllAttByTid(tid));
	}

}
