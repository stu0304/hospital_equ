package com.equip.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.equip.model.TDevice;
import com.equip.model.VOAgencyAtt;
import com.equip.model.VODeviceAtt;

public interface TDeviceDao {
	
	TDevice getDevcieByName(String dname);
	
	VOAgencyAtt getDeviceDetail(String equipId);
	
	VODeviceAtt selectOneDeviceForUpdate(String equipId);
	
	String selectCountDevice();
	
	List getChartPieDeviceNum();
	
	List getCharColAlarmNum();
	
	List getCharColAlarmNumReady();
	
	List selectAllDevices(@Param("tDicCode")String tDicCode,@Param("tDeviceName")String tDeviceName,@Param("nextStartPage") int nextStartPage,@Param("v_pageSize") int v_pageSize);
	
    int deleteByPrimaryKey(String tId);

    int insert(TDevice record);

    int insertSelective(TDevice record);

    TDevice selectByPrimaryKey(String tId);

    int updateByPrimaryKeySelective(TDevice record);

    int updateByPrimaryKey(TDevice record);
    
    
}