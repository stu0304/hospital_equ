package com.equip.service.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.equip.dao.TSysUserDao;
import com.equip.model.Page;
import com.equip.model.TSysUser;
import com.equip.model.VOUserPerson;
import com.equip.service.ISysUserService;
import com.equip.util.CommonUtil;
import com.equip.util.MyUtil;
import com.google.gson.Gson;

@Service
public class SysUserService implements ISysUserService {
	@Resource
	private TSysUserDao sysUserDao;
	@Override
	public boolean addUser(TSysUser user) {
		user.settRole("2");
		return sysUserDao.insertSelective(user)>0?true:false;
	}

	@Override
	public boolean updateUser(TSysUser user) {
		return sysUserDao.updateByPrimaryKeySelective(user)>0?true:false;
		
	}

	@Override
	public boolean deleteUser(TSysUser user) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public TSysUser loginUser(TSysUser user) {
		return sysUserDao.loginUser(user);

	}

	@Override
	public int userReview(String userId, String personId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public TSysUser getSysUserById(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TSysUser> getAllSysUser(TSysUser user) {
		List userList = sysUserDao.selectAllSysUser(user);
		return userList;
	}

	@Override
	public boolean checkOriginalPwd(TSysUser user) {
		
		return sysUserDao.checkOriginalPwd(user)!=null?true:false;
	}

	@Override
	public String selectUserPerson(String userName,Page pager) {
		return new Gson().toJson(sysUserDao.selectUserPerson(userName,pager.getNextStartPage(),pager.getV_pageSize()));
	}

	@Override
	public String selectCountSysUser() {
		return sysUserDao.selectCountSysUser();
	}



}
