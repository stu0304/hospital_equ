package com.equip.service;

import java.util.List;


import com.equip.model.Page;
import com.equip.model.TDicCode;

public interface IDicCodeService {
    boolean deleteByPrimaryKey(String tDicId);

    boolean insert(TDicCode record);

    boolean insertSelective(TDicCode record);

    TDicCode selectByPrimaryKey(String tDicId);
    
    List selectDicAll(TDicCode record,Page pager);

    boolean updateByPrimaryKeySelective(TDicCode record);

    boolean updateByPrimaryKey(TDicCode record);
    
    String getDataByType(String dType);
    
   String selectDicType();
   
   String selectCountDicCode();
}