package com.tang.appservice.service.impl;

import java.util.List;
import com.tang.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tang.appservice.mapper.FoodInfoMapper;
import com.tang.appservice.domain.FoodInfo;
import com.tang.appservice.service.IFoodInfoService;

/**
 * 食物信息Service业务层处理
 *
 * @author ruoyi
 * @date 2024-07-02
 */
@Service
public class FoodInfoServiceImpl implements IFoodInfoService
{
    @Autowired
    private FoodInfoMapper foodInfoMapper;

    /**
     * 查询食物信息
     *
     * @param foodId 食物信息主键
     * @return 食物信息
     */
    @Override
    public FoodInfo selectFoodInfoByFoodId(Long foodId)
    {
        return foodInfoMapper.selectFoodInfoByFoodId(foodId);
    }

    /**
     * 查询食物信息列表
     *
     * @param foodInfo 食物信息
     * @return 食物信息
     */
    @Override
    public List<FoodInfo> selectFoodInfoList(FoodInfo foodInfo)
    {
        return foodInfoMapper.selectFoodInfoList(foodInfo);
    }

    /**
     * 新增食物信息
     *
     * @param foodInfo 食物信息
     * @return 结果
     */
    @Override
    public int insertFoodInfo(FoodInfo foodInfo)
    {
        foodInfo.setCreateTime(DateUtils.getNowDate());
        return foodInfoMapper.insertFoodInfo(foodInfo);
    }

    /**
     * 修改食物信息
     *
     * @param foodInfo 食物信息
     * @return 结果
     */
    @Override
    public int updateFoodInfo(FoodInfo foodInfo)
    {
        foodInfo.setUpdateTime(DateUtils.getNowDate());
        if (foodInfo.getIsUsed()!= null && foodInfo.getIsUsed() == 1){
            foodInfo.setOpenTime(DateUtils.getNowDate());
        }
        return foodInfoMapper.updateFoodInfo(foodInfo);
    }

    /**
     * 批量删除食物信息
     *
     * @param foodIds 需要删除的食物信息主键
     * @return 结果
     */
    @Override
    public int deleteFoodInfoByFoodIds(Long[] foodIds)
    {
        return foodInfoMapper.deleteFoodInfoByFoodIds(foodIds);
    }

    /**
     * 删除食物信息信息
     *
     * @param foodId 食物信息主键
     * @return 结果
     */
    @Override
    public int deleteFoodInfoByFoodId(Long foodId)
    {
        return foodInfoMapper.deleteFoodInfoByFoodId(foodId);
    }
}
