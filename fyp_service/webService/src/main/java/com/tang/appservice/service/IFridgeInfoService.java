package com.tang.appservice.service;

import java.util.List;
import com.tang.appservice.domain.FridgeInfo;

/**
 * 冰箱信息Service接口
 * 
 * @author ruoyi
 * @date 2024-07-02
 */
public interface IFridgeInfoService 
{
    /**
     * 查询冰箱信息
     * 
     * @param fridgeId 冰箱信息主键
     * @return 冰箱信息
     */
    public FridgeInfo selectFridgeInfoByFridgeId(Long fridgeId);

    /**
     * 查询冰箱信息列表
     * 
     * @param fridgeInfo 冰箱信息
     * @return 冰箱信息集合
     */
    public List<FridgeInfo> selectFridgeInfoList(FridgeInfo fridgeInfo);

    /**
     * 新增冰箱信息
     * 
     * @param fridgeInfo 冰箱信息
     * @return 结果
     */
    public int insertFridgeInfo(FridgeInfo fridgeInfo);

    /**
     * 修改冰箱信息
     * 
     * @param fridgeInfo 冰箱信息
     * @return 结果
     */
    public int updateFridgeInfo(FridgeInfo fridgeInfo);

    /**
     * 批量删除冰箱信息
     * 
     * @param fridgeIds 需要删除的冰箱信息主键集合
     * @return 结果
     */
    public int deleteFridgeInfoByFridgeIds(Long[] fridgeIds);

    /**
     * 删除冰箱信息信息
     * 
     * @param fridgeId 冰箱信息主键
     * @return 结果
     */
    public int deleteFridgeInfoByFridgeId(Long fridgeId);
}
