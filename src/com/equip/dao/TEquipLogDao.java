package com.equip.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.equip.model.TEuipLog;

public interface TEquipLogDao {
	String selectCountLogCode();
	
	List selectEquipLogByPersonId(String personId);
	
	List selectAllEquipLog(@Param("equipName")String equipName,@Param("tPresonId")String personName,@Param("nextStartPage") int nextStartPage,@Param("v_pageSize") int v_pageSize);
	
    int deleteByPrimaryKey(String tLogId);

    int insert(TEuipLog record);

    int insertSelective(TEuipLog record);

    TEuipLog selectByPrimaryKey(String tLogId);

    int updateByPrimaryKeySelective(TEuipLog record);

    int updateByPrimaryKey(TEuipLog record);
}