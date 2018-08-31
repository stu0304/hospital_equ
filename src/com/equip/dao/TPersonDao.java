package com.equip.dao;

import org.springframework.stereotype.Repository;

import com.equip.model.TPerson;
import com.equip.model.VOPersonAtt;
@Repository
public interface TPersonDao {
    int deleteByPrimaryKey(String tId);

    int insert(TPerson record);

    int insertSelective(TPerson record);

    TPerson selectByPrimaryKey(String tId);
    
    VOPersonAtt selectByUserId(String userId);

    int updateByPrimaryKeySelective(TPerson record);

    int updateByPrimaryKey(TPerson record);
}