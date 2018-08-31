package com.equip.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.equip.model.Page;
import com.equip.model.TDevice;
import com.equip.model.TEuipLog;
import com.equip.model.TPerson;
import com.equip.model.TSysUser;
import com.equip.model.VOUserPerson;
import com.equip.service.IDeviceService;
import com.equip.service.IDicCodeService;
import com.equip.service.IEquipLogService;
import com.equip.service.impl.SysUserService;
import com.equip.util.CommonUtil;
import com.equip.util.StringUtil;
import com.google.gson.Gson;

@Controller
public class EquipLogController {

	@Resource
	private IEquipLogService logService;
	@Resource
	private IDeviceService deviceService;
	
	@RequestMapping(value = "/addOrUpdateLogJSON.do")
	@ResponseBody
	public void addOrUpdateLogJSON(TEuipLog log,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		TDevice device = new TDevice();
		device.settEquipId(log.gettEquipId());
		device.settCheckDate(log.gettLogAddtime());
		
		if(!"".equals(log.gettLogId())&&log.gettLogId()!=null)
		{

			pw.write((logService.updateByPrimaryKeySelective(log)>0&&deviceService.updateByPrimaryKeySelective(device)>0)?"allok":"myfail");
		}else{
			log.settLogId(UUID.randomUUID().toString());
			pw.write((logService.insertSelective(log)>0&&deviceService.updateByPrimaryKeySelective(device)>0)?"allok":"myfail");
		}
		
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/getAllLogJSON.do")
	@ResponseBody
	public void getAllLogJSON(TEuipLog log,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		
		String currentPage = request.getParameter("curpage")==null?"0":request.getParameter("curpage");
		String rows = request.getParameter("page_Size")==null?"10":request.getParameter("page_Size");
		
		Page pager = new Page(currentPage,rows);
		
		PrintWriter  pw = response.getWriter();
		pw.write(new Gson().toJson(logService.selectAllEquipLog(log.getEquipName(),log.gettPresonId(), pager.getNextStartPage(), pager.getV_pageSize())));
		pw.flush();
		pw.close();
	}
	
	
	@RequestMapping(value = "/getOneLogJSON.do")
	@ResponseBody
	public void getOneLogJSON(TEuipLog log,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		pw.write(new Gson().toJson(logService.selectByPrimaryKey(log.gettLogId())));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/deleteOneLogJSON.do")
	@ResponseBody
	public void deleteOneLogJSON(TEuipLog log,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		pw.write(logService.deleteByPrimaryKey(log.gettLogId())>0?"allok":"myfail");
		pw.flush();
		pw.close();
	}

	



}
