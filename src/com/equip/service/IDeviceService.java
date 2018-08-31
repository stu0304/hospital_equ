
package com.equip.service;

import java.util.List;

import com.equip.model.Page;
import com.equip.model.TDevice;
import com.equip.model.VOAgencyAtt;
import com.equip.model.VODeviceAtt;

public interface IDeviceService {
	
	public TDevice getDevcieByName(String dname);
	
	public boolean importDataByExcel(List dataList);
	
	public VOAgencyAtt getDeviceDetail(String equipId);
	
	public VODeviceAtt selectOneDeviceForUpdate(String equipId);
	
	public String selectCountDevice();
	
	public String getChartPieDeviceNum();
	
	public String getCharColAlarmNum();
	
	public String getCharColAlarmNumReady();
	
	public List selectAllDevices(TDevice record,Page pager);
	
	public int deleteByPrimaryKey(String tId);

    int insertSelective(TDevice record);

    TDevice selectByPrimaryKey(String tId);

    int updateByPrimaryKeySelective(TDevice record);

    int updateByPrimaryKey(TDevice record);
}