package com.tang.appservice.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.tang.appservice.domain.FridgeInfo;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.tang.common.annotation.Log;
import com.tang.common.core.controller.BaseController;
import com.tang.common.core.domain.AjaxResult;
import com.tang.common.enums.BusinessType;
import com.tang.appservice.domain.FoodInfo;
import com.tang.appservice.service.IFoodInfoService;
import com.tang.common.utils.poi.ExcelUtil;
import com.tang.common.core.page.TableDataInfo;

/**
 * 食物信息Controller
 *
 * @author ruoyi
 * @date 2024-07-02
 */
@RestController
@RequestMapping("/appservice/food_info")
public class FoodInfoController extends BaseController
{
    @Autowired
    private IFoodInfoService foodInfoService;

    /**
     * 查询食物信息列表
     */
    @GetMapping("/list")
    public TableDataInfo list(FoodInfo foodInfo)
    {
        startPage();
        List<FoodInfo> list = foodInfoService.selectFoodInfoList(foodInfo);
        return getDataTable(list);
    }

    /**
     * 查询食物信息列表
     */
    @GetMapping("/applist")
    public AjaxResult appList(FoodInfo foodInfo)
    {
        List<FoodInfo> list = foodInfoService.selectFoodInfoList(foodInfo);
        return success(list);
    }
    /**
     * 导出食物信息列表
     */
//    @Log(title = "食物信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FoodInfo foodInfo)
    {
        List<FoodInfo> list = foodInfoService.selectFoodInfoList(foodInfo);
        ExcelUtil<FoodInfo> util = new ExcelUtil<FoodInfo>(FoodInfo.class);
        util.exportExcel(response, list, "食物信息数据");
    }

    /**
     * 获取食物信息详细信息
     */
    @GetMapping(value = "/{foodId}")
    public AjaxResult getInfo(@PathVariable("foodId") Long foodId)
    {
        return success(foodInfoService.selectFoodInfoByFoodId(foodId));
    }

    /**
     * 新增食物信息
     */
//    @Log(title = "食物信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FoodInfo foodInfo)
    {
        return toAjax(foodInfoService.insertFoodInfo(foodInfo));
    }

    /**
     * 修改食物信息
     */
//    @Log(title = "食物信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FoodInfo foodInfo)
    {
        return toAjax(foodInfoService.updateFoodInfo(foodInfo));
    }

    /**
     * 删除食物信息
     */
//    @Log(title = "食物信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{foodIds}")
    public AjaxResult remove(@PathVariable Long[] foodIds)
    {
        return toAjax(foodInfoService.deleteFoodInfoByFoodIds(foodIds));
    }
}
