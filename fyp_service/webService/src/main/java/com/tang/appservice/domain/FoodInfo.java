package com.tang.appservice.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.tang.common.annotation.Excel;
import com.tang.common.core.domain.BaseEntity;

/**
 * 食物信息对象 food_info
 *
 * @author ruoyi
 * @date 2024-07-02
 */
public class FoodInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 食物ID */
    private Long foodId;

    /** 食物名称 */
    @Excel(name = "食物名称")
    private String foodName;

    /** 保质期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "保质期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date qualityTime;

    /** 所属者名称 */
    @Excel(name = "所属者名称")
    private String ownerName;

    /** 是否打开 */
    @Excel(name = "是否打开")
    private Long isUsed;

    /** 打开时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "打开时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date openTime;

    /** 冰箱ID */
    @Excel(name = "冰箱ID")
    private Long fridgeId;

    public void setFoodId(Long foodId)
    {
        this.foodId = foodId;
    }

    public Long getFoodId()
    {
        return foodId;
    }
    public void setFoodName(String foodName)
    {
        this.foodName = foodName;
    }

    public String getFoodName()
    {
        return foodName;
    }
    public void setQualityTime(Date qualityTime)
    {
        this.qualityTime = qualityTime;
    }

    public Date getQualityTime()
    {
        return qualityTime;
    }
    public void setOwnerName(String ownerName)
    {
        this.ownerName = ownerName;
    }

    public String getOwnerName()
    {
        return ownerName;
    }
    public void setIsUsed(Long isUsed)
    {
        this.isUsed = isUsed;
    }

    public Long getIsUsed()
    {
        return isUsed;
    }
    public void setOpenTime(Date openTime)
    {
        this.openTime = openTime;
    }

    public Date getOpenTime()
    {
        return openTime;
    }
    public void setFridgeId(Long fridgeId)
    {
        this.fridgeId = fridgeId;
    }

    public Long getFridgeId()
    {
        return fridgeId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("foodId", getFoodId())
            .append("foodName", getFoodName())
            .append("qualityTime", getQualityTime())
            .append("ownerName", getOwnerName())
            .append("isUsed", getIsUsed())
            .append("openTime", getOpenTime())
            .append("fridgeId", getFridgeId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
