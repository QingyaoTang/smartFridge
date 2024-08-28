package com.tang.appservice.service.impl;

import java.util.List;
import com.tang.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tang.appservice.mapper.FridgeInfoMapper;
import com.tang.appservice.domain.FridgeInfo;
import com.tang.appservice.service.IFridgeInfoService;

/**
 * 冰箱信息Service业务层处理
 *
 * @author ruoyi
 * @date 2024-07-02
 */
@Service
public class FridgeInfoServiceImpl implements IFridgeInfoService
{
    @Autowired
    private FridgeInfoMapper fridgeInfoMapper;

    /**
     * 查询冰箱信息
     *
     * @param fridgeId 冰箱信息主键
     * @return 冰箱信息
     */
    @Override
    public FridgeInfo selectFridgeInfoByFridgeId(Long fridgeId)
    {
        return fridgeInfoMapper.selectFridgeInfoByFridgeId(fridgeId);
    }

    /**
     * 查询冰箱信息列表
     *
     * @param fridgeInfo 冰箱信息
     * @return 冰箱信息
     */
    @Override
    public List<FridgeInfo> selectFridgeInfoList(FridgeInfo fridgeInfo)
    {
        return fridgeInfoMapper.selectFridgeInfoList(fridgeInfo);
    }

    /**
     * 新增冰箱信息
     *
     * @param fridgeInfo 冰箱信息
     * @return 结果
     */
    @Override
    public int insertFridgeInfo(FridgeInfo fridgeInfo)
    {
        fridgeInfo.setCreateTime(DateUtils.getNowDate());
        return fridgeInfoMapper.insertFridgeInfo(fridgeInfo);
    }

    /**
     * 修改冰箱信息
     *
     * @param fridgeInfo 冰箱信息
     * @return 结果
     */
    @Override
    public int updateFridgeInfo(FridgeInfo fridgeInfo)
    {
        fridgeInfo.setUpdateTime(DateUtils.getNowDate());
        return fridgeInfoMapper.updateFridgeInfo(fridgeInfo);
    }

    /**
     * 批量删除冰箱信息
     *
     * @param fridgeIds 需要删除的冰箱信息主键
     * @return 结果
     */
    @Override
    public int deleteFridgeInfoByFridgeIds(Long[] fridgeIds)
    {
        return fridgeInfoMapper.deleteFridgeInfoByFridgeIds(fridgeIds);
    }

    /**
     * 删除冰箱信息信息
     *
     * @param fridgeId 冰箱信息主键
     * @return 结果
     */
    @Override
    public int deleteFridgeInfoByFridgeId(Long fridgeId)
    {
        return fridgeInfoMapper.deleteFridgeInfoByFridgeId(fridgeId);
    }
}
