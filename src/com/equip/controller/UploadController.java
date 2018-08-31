package com.equip.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.equip.model.Page;
import com.equip.model.TAgency;
import com.equip.model.TAttenchment;
import com.equip.service.IUploadService;
import com.equip.util.CommonUtil;
import com.equip.util.StringUtil;
import com.google.gson.Gson;
import com.sun.security.ntlm.Server;

@Controller
public class UploadController {

	@Resource
	private IUploadService uploadService;
	
	@RequestMapping(value = "/deleteOneAttJSON.do")
	@ResponseBody
	public void deleteOneAttJSON(TAttenchment attment,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter  pw = response.getWriter();
		pw.write(uploadService.deleteFile(attment)==true?"allok":"myfail");
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value = "/getAllAttSON.do")
	@ResponseBody
	public void getAllAttSON(TAttenchment att,HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter  pw = response.getWriter();
		pw.write(new Gson().toJson(uploadService.getAllAttJSON(att.gettId())));
		pw.flush();
		pw.close();
	}

	 @RequestMapping(value = "/myupload.do")  
	    public void upload(@RequestParam(value = "devicePicName", required = false) MultipartFile file, HttpServletRequest request,HttpServletResponse response) {  
	       
		  String deviceId = request.getParameter("deviceId");
		  String tAttid = request.getParameter("mytAttid");
		  String attType = request.getParameter("attType");
		 String savePath = request.getSession().getServletContext().getRealPath("uploadFile")+File.separator;  
		   String fileURL = request.getContextPath()+"/uploadFile"+File.separator;
		    String fileName = file.getOriginalFilename();  
	        File targetFile = new File(savePath, fileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }  
	        //保存  
	        try {  
	        	   file.transferTo(targetFile);  
	            TAttenchment att = new TAttenchment();
	            att.settAttname(fileName);
	            att.settAtturl(fileURL);
	            att.settType(attType);
	            att.settId(deviceId);
	        	
	            // 设备附件已经存在
	        	if(uploadService.checkFile(deviceId)){
	        		att.settAttid(tAttid);
	        		if(uploadService.updateFile(att))
	        		{
	        			 response.getWriter().write(new Gson().toJson(att));
	        		}else{
	   	            	 response.getWriter().write("myfail");
	   	            }
	        	}else{
	        		att.settAttid(UUID.randomUUID().toString());
	        		   if(uploadService.uploadFile(att))
	   	            {
	   	       		 response.getWriter().write(new Gson().toJson(att));
	   	            }else{
	   	            	 response.getWriter().write("myfail");
	   	            }
	        	}
	            response.setCharacterEncoding("UTF-8");
	         
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	        
	 }
	
	 @RequestMapping(value = "/myuploadFile.do")  
	 @ResponseBody
	    public void uploadFile(@RequestParam(value = "myFileName", required = false) MultipartFile file, HttpServletRequest request,HttpServletResponse response) throws IOException {  
	       
		   response.setCharacterEncoding("UTF-8");
		   String result = "";
		  String tid = request.getParameter("myObjectID");
		  String attType = request.getParameter("attType");
		  
		  String savePath = request.getSession().getServletContext().getRealPath("uploadFile")+File.separator;  
		   String fileURL = request.getContextPath()+"/uploadFile"+File.separator;
		   
		   String fileName = file.getOriginalFilename();  
	        File targetFile = new File(savePath, fileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }  
	     
	        //保存  
	        try {  
	        	
	        	   file.transferTo(targetFile);  
	            TAttenchment att = new TAttenchment();
	            att.settAttname(fileName);
	            att.settAtturl(fileURL);
	            att.settType(attType);
	            att.settId(tid);
	        	att.settAttid(UUID.randomUUID().toString());
	        		   if(uploadService.uploadFile(att))
	   	            {
	        			   response.getWriter().write("allok");
	   	            }else{
	   	             response.getWriter().write("myfail");
	   	            }
	         
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	  
	    }  
	 
	@RequestMapping(value="myFileLoad.do", method = RequestMethod.POST)
	public String  springUpload(@RequestParam("mypicfile") MultipartFile myfile,HttpServletRequest request) throws IllegalStateException, IOException
	{
		 long  startTime=System.currentTimeMillis();
		 //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
		CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
				request.getSession().getServletContext());
		//检查form中是否有enctype="multipart/form-data"
		if(multipartResolver.isMultipart(request))
		{
			//将request变成多部分request
			MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
		   //获取multiRequest 中所有的文件名
			Iterator iter=multiRequest.getFileNames();
			
			while(iter.hasNext())
			{
				//一次遍历所有文件
				MultipartFile file=multiRequest.getFile(iter.next().toString());
				if(file!=null)
				{
					System.out.println("------"+file.getOriginalFilename());
					String path="resource/att_doc/"+file.getOriginalFilename();
					//上传
					file.transferTo(new File(path));
				}
				
			}
		  
		}
		long  endTime=System.currentTimeMillis();
		System.out.println("方法三的运行时间："+String.valueOf(endTime-startTime)+"ms");
	return "/success";	
	}

	@RequestMapping(value = "/myDownLoadFile.do")
	@ResponseBody
	public void downLoadFile(TAttenchment att,HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
        	String realURL = request.getSession().getServletContext().getRealPath("uploadFile");
        	String saveDir = realURL+File.separator+att.gettAttname();
            // path是指欲下载的文件的路径。
            File file = new File(saveDir);
            // 取得文件名。
            String filename = file.getName();
        	if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0) {  
        	    filename = URLEncoder.encode(filename, "UTF-8");  
        	} else {  
        	    filename = new String(filename.getBytes("UTF-8"), "ISO8859-1");  
        	}  
            // 取得文件的后缀名。
            //String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();

            // 以流的形式下载文件。
            InputStream fis = new BufferedInputStream(new FileInputStream(saveDir));
            response.reset();
            response.setContentType("bin");
            response.addHeader("Content-Disposition", "attachment; filename=\""+filename+"\"");
            // 初始化字节数组
            byte[] buffer = new byte[fis.available()];
            
            int len;
            while ((len = fis.read(buffer)) > 0){
            	response.getOutputStream().write(buffer, 0, len);
            }
            		
            fis.close();
      
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    
	}

	public HttpServletResponse download(String path, HttpServletResponse response) {
        try {
            // path是指欲下载的文件的路径。
            File file = new File(path);
            // 取得文件名。
            String filename = file.getName();
            // 取得文件的后缀名。
            String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();

            // 以流的形式下载文件。
            InputStream fis = new BufferedInputStream(new FileInputStream(path));
            byte[] buffer = new byte[fis.available()];
            fis.read(buffer);
            fis.close();
            // 清空response
            response.reset();
            // 设置response的Header
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes()));
            response.addHeader("Content-Length", "" + file.length());
            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
            response.setContentType("application/octet-stream");
            toClient.write(buffer);
            toClient.flush();
            toClient.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return response;
    }


}
