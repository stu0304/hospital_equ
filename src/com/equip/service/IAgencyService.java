package com.equip.service;

import java.util.List;

import com.equip.model.Page;
import com.equip.model.TAgency;

public interface IAgencyService {
	String selectCountAgency();
	
	List selectAllAgency(TAgency agency,Page pager);
	
    int deleteByPrimaryKey(String tAgencyId);

    int insert(TAgency record);

    int insertSelective(TAgency record);

    TAgency selectByPrimaryKey(String tAgencyId);

    int updateByPrimaryKeySelective(TAgency record);

    int updateByPrimaryKey(TAgency record);
}