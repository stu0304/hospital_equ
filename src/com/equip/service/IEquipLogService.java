package com.equip.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.equip.model.Page;
import com.equip.model.TDicCode;
import com.equip.model.TEuipLog;

public interface IEquipLogService {
	String selectCountLog();
	
    List selectEquipLogByPersonId(String personId);
	
	List selectAllEquipLog(@Param("equipId")String equipName,@Param("personId")String codeType,@Param("nextStartPage") int nextStartPage,@Param("v_pageSize") int v_pageSize);
	
    int deleteByPrimaryKey(String tLogId);

    int insert(TEuipLog record);

    int insertSelective(TEuipLog record);

    TEuipLog selectByPrimaryKey(String tLogId);

    int updateByPrimaryKeySelective(TEuipLog record);

    int updateByPrimaryKey(TEuipLog record);
}