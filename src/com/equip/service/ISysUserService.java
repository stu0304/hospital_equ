package com.equip.service;

import java.util.List;

import com.equip.model.Page;
import com.equip.model.TSysUser;
import com.equip.model.VOUserPerson;


public interface ISysUserService {
	
	public String selectCountSysUser();
	
	public boolean addUser(TSysUser user);

	public boolean updateUser(TSysUser user);
	
	public boolean deleteUser(TSysUser user);
	
	public List<TSysUser> getAllSysUser(TSysUser user);
	
	public TSysUser loginUser(TSysUser user);
	
	public int userReview(String userId,String personId);
	
	public TSysUser getSysUserById(String userId);

	public boolean checkOriginalPwd(TSysUser user);
	
	public  String selectUserPerson(String userName,Page pager);
	
}
