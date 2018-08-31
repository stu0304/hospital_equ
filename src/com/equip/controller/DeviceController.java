package com.equip.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.equip.model.Page;
import com.equip.model.TDevice;
import com.equip.model.TPerson;
import com.equip.model.TSysUser;
import com.equip.model.VOAgencyAtt;
import com.equip.model.VODeviceAtt;
import com.equip.service.IDeviceService;
import com.equip.service.IDicCodeService;
import com.equip.service.IExcelService;
import com.equip.util.CommonUtil;
import com.equip.util.DateUtil;
import com.equip.util.ExcelUtil;
import com.equip.util.StringUtil;
import com.google.gson.Gson;

@Controller
public class DeviceController {

	@Resource
	private IDeviceService deviceService;
	@Resource
	private IExcelService excelService;

	@RequestMapping(value = "/importExcelDevice.do")
	@ResponseBody
	public void importExcelDevice(@RequestParam(value = "myExcelFile", required = false) MultipartFile mfile,HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		List tempList = excelService.importExcel(mfile);
		if(deviceService.importDataByExcel(tempList))
		{
			response.getWriter().write("myok");
		}else{
			response.getWriter().write("myfail");
		}
	}
	@RequestMapping(value = "/getExcelDevice.do",method = RequestMethod.GET)
	public void getExcelDevice(TDevice record,HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		String currentPage = request.getParameter("curpage")==null?"1":request.getParameter("curpage");
		String rows = request.getParameter("page_Size")==null?"10":request.getParameter("page_Size");
		
		Page pager = new Page(currentPage,rows);
		response.setCharacterEncoding("UTF-8");
		
		List deviceList = deviceService.selectAllDevices(record,pager);
		ExcelUtil excelUtil = new ExcelUtil();
		excelUtil.exportExcel(request, response, deviceList);
	}
	
	
	@RequestMapping(value = "/addDevice.do")
	@ResponseBody
	public int addDevice(TDevice record) {
		if(record.gettEquipId().equals("")||record.gettEquipId()==null)
		{
			record.settCheckDate(DateUtil.dateToStringHHmm(new Date()));
			record.settEquipId(UUID.randomUUID().toString());
			return deviceService.insertSelective(record);
		}
	
		return deviceService.updateByPrimaryKeySelective(record);
	}

	@RequestMapping(value = "/deleteDevice.do")
	@ResponseBody
	public int deleteDevice(TDevice record,HttpServletRequest request) {
		return deviceService.deleteByPrimaryKey(record.gettEquipId());
	}

	@RequestMapping(value = "/updateDevice.do")
	@ResponseBody
	public int updateDevice(TDevice record,HttpServletRequest request) {
		//request.getParameter("deviceHiddenID");
		
		return deviceService.updateByPrimaryKeySelective(record);
	}
	
	@RequestMapping(value = "/getOneDevice.do")
	@ResponseBody
	public void getOneDevice(TDevice record,HttpServletRequest request,HttpServletResponse response) throws IOException {
		String tld = request.getParameter("deviceidPra");
		VODeviceAtt device= deviceService.selectOneDeviceForUpdate(tld);
		response.setCharacterEncoding("UTF-8");
		 response.getWriter().write(new Gson().toJson(device));
	}
	
	@RequestMapping(value = "/getDeviceDetail.do")
	@ResponseBody
	public void getDeviceDetail(TDevice record,HttpServletRequest request,HttpServletResponse response) throws IOException {
		String tld = request.getParameter("deviceidPra");
		VOAgencyAtt device= deviceService.getDeviceDetail(tld);
		response.setCharacterEncoding("UTF-8");
		 response.getWriter().write(new Gson().toJson(device));
	}

	@RequestMapping(value = "/getAllDevices.do")
	public void getAllDevices(TDevice device,HttpServletRequest request,HttpServletResponse response) throws IOException {
		String currentPage = request.getParameter("curpage")==null?"0":request.getParameter("curpage");
		String pageSize = request.getParameter("page_Size")==null?"10":request.getParameter("page_Size");
		
		Page pager = new Page(currentPage,pageSize);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(new Gson().toJson(deviceService.selectAllDevices(device,pager)));
	}
	
	@RequestMapping(value = "/getCharColAlarmNumJSON.do")
	public void getCharColAlarmNumJSON(TDevice device,HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("UTF-8");
		
		response.getWriter().write(deviceService.getCharColAlarmNum()+","+deviceService.getCharColAlarmNumReady());
	}
	
	@RequestMapping(value = "/getChartPieDeviceNumJSON.do")
	public void getChartPieDeviceNumJSON(TDevice device,HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("UTF-8");
		
		response.getWriter().write(deviceService.getChartPieDeviceNum());
	}



}
