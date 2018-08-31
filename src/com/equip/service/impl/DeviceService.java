package com.equip.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.equip.dao.TCodeDicDao;
import com.equip.dao.TDeviceDao;
import com.equip.model.ChartObject;
import com.equip.model.Page;
import com.equip.model.TDevice;
import com.equip.model.TDicCode;
import com.equip.model.VOAgencyAtt;
import com.equip.model.VODeviceAtt;
import com.equip.service.IDeviceService;
import com.google.gson.Gson;
@Service
public class DeviceService implements IDeviceService{

	@Resource
	private TDeviceDao deviceDao;
	@Resource
	private TCodeDicDao codeDao;
	@Override
	public int deleteByPrimaryKey(String tId) {
		return deviceDao.deleteByPrimaryKey(tId);
	}

	@Override
	public int insertSelective(TDevice record) {

		return deviceDao.insertSelective(record);
	}

	@Override
	public TDevice selectByPrimaryKey(String tId) {
	return deviceDao.selectByPrimaryKey(tId);
	}

	@Override
	public int updateByPrimaryKeySelective(TDevice record) {
		return deviceDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(TDevice record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List selectAllDevices(TDevice record,Page pager) {
		return  deviceDao.selectAllDevices(record.gettDicCode(),record.gettDeviceName(),pager.getNextStartPage(),pager.getV_pageSize());
	}

	@Override
	public String getCharColAlarmNum() {
		List<ChartObject> tempList = deviceDao.getCharColAlarmNum();
		StringBuffer buffer = new StringBuffer("");
		buffer.append("[{name: '待检测设备数量', data: [");
		for(ChartObject chart:tempList)
		{
			buffer.append(chart.getCnum()+",");
		}
		String result = buffer.substring(0,buffer.length()-1)+"], stack: 'female' }";
		return result;
	}

	@Override
	public String getCharColAlarmNumReady() {
		
		List<ChartObject> tempList = deviceDao.getCharColAlarmNumReady();
		StringBuffer buffer = new StringBuffer("{name: '正常使用设备数量', data: [");
		StringBuffer bufferType = new StringBuffer("[");
		for(ChartObject chart:tempList)
		{
			bufferType.append("'"+chart.getCtype()+"',");
			buffer.append(chart.getCnum()+",");
		}
	
		String result = buffer.substring(0,buffer.length()-1)+"], stack: 'female' }] | "+bufferType.substring(0,bufferType.length()-1)+"]";
		return result;
		
	}

	@Override
	public String getChartPieDeviceNum() {
		StringBuffer buffer = new StringBuffer("[{name: '设备数量',data: [");
	
		List<ChartObject> deviceList = deviceDao.getChartPieDeviceNum();
		for(ChartObject chart : deviceList)
		{
			buffer.append("['"+chart.getCtype()+"',"+chart.getCnum()+"],");
		}
		String result = buffer.substring(0,buffer.length()-1)+"] }]";
		return result;
	}

	@Override
	public String selectCountDevice() {
		return deviceDao.selectCountDevice();
	}

	@Override
	public VODeviceAtt selectOneDeviceForUpdate(String equipId) {
		return deviceDao.selectOneDeviceForUpdate(equipId);
	}

	@Override
	public VOAgencyAtt getDeviceDetail(String equipId) {
		return deviceDao.getDeviceDetail(equipId);
	}

	

	@Override
	public boolean importDataByExcel(List dataList) {
		try {
			List keshiList = codeDao.getDataByType("科室");
			List supportList = codeDao.getDataByType("供应商");
			List newDataList = new ArrayList();
			// 替换 科室 code
			for(int i=0;i<dataList.size();i++)
			{
				TDevice device = (TDevice)dataList.get(i);
				for(int j=0;j<keshiList.size();j++)
				{
					TDicCode dicCode = (TDicCode)keshiList.get(j);
					if(device.gettDicCode().equals(dicCode.gettName()))
					{
						device.settDicCode(dicCode.gettDicCode());
					}
				}
				
				for(int j=0;j<supportList.size();j++)
				{
					TDicCode dicCode = (TDicCode)supportList.get(j);
					if(device.gettAgencyId().equals(dicCode.gettName()))
					{
						device.settAgencyId(dicCode.gettDicCode());
					}
				}
				
				
				newDataList.add(device);
			}
			
			for(int i=0;i<newDataList.size();i++)
			{
				TDevice device = (TDevice)newDataList.get(i);
				if(getDevcieByName(device.gettDeviceName())!=null)
				{
					 deviceDao.updateByPrimaryKeySelective(device);
				}else{
					device.settEquipId(UUID.randomUUID().toString());
					 deviceDao.insertSelective(device);
				}
			}
		} catch (Exception e) {
			return false;
		}
		
		return true;
	}

	@Override
	public TDevice getDevcieByName(String dname) {
		return deviceDao.getDevcieByName(dname);
	
	}

}
