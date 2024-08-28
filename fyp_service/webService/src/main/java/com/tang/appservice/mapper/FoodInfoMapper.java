package com.tang.appservice.mapper;

import java.util.List;
import com.tang.appservice.domain.FoodInfo;

/**
 * 食物信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-07-02
 */
public interface FoodInfoMapper 
{
    /**
     * 查询食物信息
     * 
     * @param foodId 食物信息主键
     * @return 食物信息
     */
    public FoodInfo selectFoodInfoByFoodId(Long foodId);

    /**
     * 查询食物信息列表
     * 
     * @param foodInfo 食物信息
     * @return 食物信息集合
     */
    public List<FoodInfo> selectFoodInfoList(FoodInfo foodInfo);

    /**
     * 新增食物信息
     * 
     * @param foodInfo 食物信息
     * @return 结果
     */
    public int insertFoodInfo(FoodInfo foodInfo);

    /**
     * 修改食物信息
     * 
     * @param foodInfo 食物信息
     * @return 结果
     */
    public int updateFoodInfo(FoodInfo foodInfo);

    /**
     * 删除食物信息
     * 
     * @param foodId 食物信息主键
     * @return 结果
     */
    public int deleteFoodInfoByFoodId(Long foodId);

    /**
     * 批量删除食物信息
     * 
     * @param foodIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFoodInfoByFoodIds(Long[] foodIds);
}
