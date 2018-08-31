package test.IDao;

import test.domain.TEuipLog;

public interface TEuipLogMapper {
    int deleteByPrimaryKey(String tLogId);

    int insert(TEuipLog record);

    int insertSelective(TEuipLog record);

    TEuipLog selectByPrimaryKey(String tLogId);

    int updateByPrimaryKeySelective(TEuipLog record);

    int updateByPrimaryKey(TEuipLog record);
}