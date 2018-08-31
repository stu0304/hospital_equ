package test.IDao;

import test.domain.TPerson;

public interface TPersonMapper {
    int deleteByPrimaryKey(String tPresonId);

    int insert(TPerson record);

    int insertSelective(TPerson record);

    TPerson selectByPrimaryKey(String tPresonId);

    int updateByPrimaryKeySelective(TPerson record);

    int updateByPrimaryKey(TPerson record);
}