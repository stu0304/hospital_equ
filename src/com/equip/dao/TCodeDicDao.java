package com.equip.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.equip.model.Page;
import com.equip.model.TDicCode;

public interface TCodeDicDao {
	int deleteByPrimaryKey(String tDicId);

    int insert(TDicCode record);

    int insertSelective(TDicCode record);

    TDicCode selectByPrimaryKey(String tDicId);
    
    List getDataByType(String dType);
   
    List selectDicAll( @Param("dicCodeName")String dicCodeName,@Param("codeType")String codeType,@Param("nextStartPage") int nextStartPage,@Param("v_pageSize") int v_pageSize);
    
    List selectDicType();

    int updateByPrimaryKeySelective(TDicCode record);

    int updateByPrimaryKey(TDicCode record);
    
    String selectCountDicCode();
}
