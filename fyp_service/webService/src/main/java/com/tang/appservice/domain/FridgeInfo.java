package com.tang.appservice.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.tang.common.annotation.Excel;
import com.tang.common.core.domain.BaseEntity;

/**
 * 冰箱信息对象 fridge_info
 *
 * @author ruoyi
 * @date 2024-07-02
 */
public class FridgeInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 冰箱ID */
    private Long fridgeId;

    /** 冰箱名称 */
    @Excel(name = "冰箱名称")
    private String fridgeName;

    public void setFridgeId(Long fridgeId)
    {
        this.fridgeId = fridgeId;
    }

    public Long getFridgeId()
    {
        return fridgeId;
    }
    public void setFridgeName(String fridgeName)
    {
        this.fridgeName = fridgeName;
    }

    public String getFridgeName()
    {
        return fridgeName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("fridgeId", getFridgeId())
            .append("fridgeName", getFridgeName())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
