package com.equip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.equip.model.TAttenchment;
import com.equip.model.TDevice;
@Service
public interface IUploadService {
	
	public boolean uploadFile(TAttenchment att);
	
	public boolean updateFile(TAttenchment att);
	
	public boolean deleteFile(TAttenchment att);
	
	public boolean checkFile(String tid);
	
	public String getAllAttJSON(String tid);
}