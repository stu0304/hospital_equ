package com.equip.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.equip.model.TPerson;
import com.equip.model.TSysUser;
import com.equip.model.VOPersonAtt;
import com.equip.service.IAgencyService;
import com.equip.service.IDeviceService;
import com.equip.service.IDicCodeService;
import com.equip.service.IEquipLogService;
import com.equip.service.IPersonService;
import com.equip.service.ISysUserService;


@Controller
@Scope("prototype")
public class JumpController {

	@Resource
	private IPersonService personService;
	@Resource
	private ISysUserService sysUserService;
	@Resource
	private IDeviceService deviceService;
	@Resource
	private IDicCodeService codeService;
	@Resource
	private IEquipLogService logService;
	
	@Resource
	private IAgencyService agencyService;
	
	@RequestMapping(value="goToUpload", method = RequestMethod.GET)
	public String goToUpload(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		
		return "upload";
	}
	
	@RequestMapping(value="goToEquipLog", method = RequestMethod.GET)
	public String goToEquipLog(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		request.setAttribute("allLogNum", logService.selectCountLog());
		return "equipLog";
	}
	
	@RequestMapping(value="goToDateTime", method = RequestMethod.GET)
	public String goToDateTime(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		request.setAttribute("allCodeNum", codeService.selectCountDicCode());
		return "datetime";
	}
	
	@RequestMapping(value="goToDicList", method = RequestMethod.GET)
	public String goToDicList(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		request.setAttribute("allCodeNum", codeService.selectCountDicCode());
		return "dicList";
	}
	@RequestMapping(value="goToSysUser", method = RequestMethod.GET)
	public String goToSysUser(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		request.setAttribute("allSysUserNum", sysUserService.selectCountSysUser());
		return "sysUser";
	}
	
	@RequestMapping(value="goToChangePwd", method = RequestMethod.GET)
	public String goToChangePwd(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		return "password";
	}
	
	@RequestMapping(value="goToPersonInfo", method = RequestMethod.GET)
	public String goToPersonInfo(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		TSysUser sysUser = (TSysUser)request.getSession().getAttribute("myuser");
		VOPersonAtt person = personService.selectByUserId(sysUser.gettUserId());
		request.setAttribute("tperson", person);
		return "personInfo";
	}
	
	@RequestMapping(value="goToJump", method = RequestMethod.GET)
	public String goToJump(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		return "jump";
	}
	
	@RequestMapping(value="goToMainPage", method = RequestMethod.GET)
	public String goToMain(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		return "main";
	}
	
	@RequestMapping(value="goToEquipList", method = RequestMethod.GET)
	public String goToEquipList(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		request.setAttribute("allDeviceNum",deviceService.selectCountDevice());
		return "equiplist";
	}
	@RequestMapping(value = "goToLoginPage", method = RequestMethod.GET)
	public String toIndex() {
		return "mylogin";
	}
	
	@RequestMapping(value = "mylogout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "mylogin";
	}
	
	@RequestMapping(value="gotoRegister")
	public String gotoRegister(){
		return "myreg";
	}
	
	@RequestMapping(value="gotoSupport")
	public String gotoUserManager(HttpServletRequest request){
		request.setAttribute("allAgencyNum", agencyService.selectCountAgency());
		return "support";
	}
	
	@RequestMapping(value="gotokeshishebei")
	public String gotokeshishebei(){
		return "equipCharts";
	}
	@RequestMapping(value="gotodaijianceshebei")
	public String gotodaijianceshebei(){
		return "equipPreCharts";
	}
	
	
	
}
