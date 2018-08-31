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
import com.equip.model.TAgency;
import com.equip.model.TAttenchment;
import com.equip.model.TDicCode;
import com.equip.service.IAgencyService;
import com.equip.service.IDicCodeService;
import com.equip.service.IUploadService;
import com.google.gson.Gson;

@Controller
public class AgencyController {

	@Resource
	private IAgencyService agencyService;
	@Resource
	private IDicCodeService codeService;
	@Resource
	private IUploadService uploadService;
	
	@RequestMapping(value = "/addOrUpdateAgencyJSON.do")
	@ResponseBody
	public void addOrUpdate(TAgency agency,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		if(agency.gettAgencyId()!=null)
		{
			pw.write(agencyService.updateByPrimaryKeySelective(agency)>0?"allok":"myfail");
		}else{
			agency.settAgencyId(UUID.randomUUID().toString());
			
			TDicCode dicCode = new TDicCode();
			dicCode.settDicId(agency.gettAgencyId());
			dicCode.settName(agency.gettAgencyName());
			dicCode.settType("供应商");
			dicCode.settDicCode(agency.gettAgencyId());
			
			codeService.insertSelective(dicCode);
			pw.write(agencyService.insertSelective(agency)>0?"allok":"myfail");
		}
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/getAllAgencySON.do")
	@ResponseBody
	public void getAllAgencySON(TAgency agency,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		
		String currentPage = request.getParameter("curpage")==null?"0":request.getParameter("curpage");
		String rows = request.getParameter("page_Size")==null?"10":request.getParameter("page_Size");
		
		Page pager = new Page(currentPage,rows);
		
		PrintWriter  pw = response.getWriter();
		pw.write(new Gson().toJson(agencyService.selectAllAgency(agency, pager)));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/getOneAgencyJSON.do")
	@ResponseBody
	public void getOneAgency(TAgency agency,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		pw.write(new Gson().toJson(agencyService.selectByPrimaryKey(agency.gettAgencyId())));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/deleteOneAgencyJSON.do")
	@ResponseBody
	public void deleteOneAgency(TAgency agency,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		codeService.deleteByPrimaryKey(agency.gettAgencyId());
		pw.write(agencyService.deleteByPrimaryKey(agency.gettAgencyId())>0?"allok":"myfail");
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/getAllAttJSON.do")
	@ResponseBody
	public void getAllAttJSON(TAgency agency,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		pw.write(uploadService.getAllAttJSON(agency.gettAgencyId()));
		pw.flush();
		pw.close();
	}


	



}
