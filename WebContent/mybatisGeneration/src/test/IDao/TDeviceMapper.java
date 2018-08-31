package test.IDao;

import test.domain.TDevice;

public interface TDeviceMapper {
    int deleteByPrimaryKey(String tEquipId);

    int insert(TDevice record);

    int insertSelective(TDevice record);

    TDevice selectByPrimaryKey(String tEquipId);

    int updateByPrimaryKeySelective(TDevice record);

    int updateByPrimaryKey(TDevice record);
}