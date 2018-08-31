package com.equip.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.equip.model.TAgency;

public interface TAgencyDao {
	
	String selectCountAgency();
	
	List selectAllAgency(@Param("tAgencyName")String tAgencyName,@Param("nextStartPage") int nextStartPage,@Param("v_pageSize") int v_pageSize);
	
    int deleteByPrimaryKey(String tAgencyId);

    int insert(TAgency record);

    int insertSelective(TAgency record);

    TAgency selectByPrimaryKey(String tAgencyId);

    int updateByPrimaryKeySelective(TAgency record);

    int updateByPrimaryKey(TAgency record);
}