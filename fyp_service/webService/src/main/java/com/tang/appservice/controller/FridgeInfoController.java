package com.tang.appservice.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.tang.appservice.domain.FridgeInfo;
import com.tang.appservice.service.IFridgeInfoService;
import com.tang.common.utils.poi.ExcelUtil;
import com.tang.common.core.page.TableDataInfo;

/**
 * 冰箱信息Controller
 *
 * @author ruoyi
 * @date 2024-07-02
 */
@RestController
@RequestMapping("/appservice/fridge_info")
public class FridgeInfoController extends BaseController
{
    @Autowired
    private IFridgeInfoService fridgeInfoService;

    /**
     * 查询冰箱信息列表
     */
    @GetMapping("/list")
    public TableDataInfo list(FridgeInfo fridgeInfo)
    {
        startPage();
        List<FridgeInfo> list = fridgeInfoService.selectFridgeInfoList(fridgeInfo);
        return getDataTable(list);
    }
    /**
     * 查询冰箱信息列表
     */
    @GetMapping("/applist")
    public AjaxResult appList(FridgeInfo fridgeInfo)
    {
        List<FridgeInfo> list = fridgeInfoService.selectFridgeInfoList(fridgeInfo);
        return success(list);
    }
    /**
     * 导出冰箱信息列表
     */
    @Log(title = "冰箱信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FridgeInfo fridgeInfo)
    {
        List<FridgeInfo> list = fridgeInfoService.selectFridgeInfoList(fridgeInfo);
        ExcelUtil<FridgeInfo> util = new ExcelUtil<FridgeInfo>(FridgeInfo.class);
        util.exportExcel(response, list, "冰箱信息数据");
    }

    /**
     * 获取冰箱信息详细信息
     */
    @GetMapping(value = "/{fridgeId}")
    public AjaxResult getInfo(@PathVariable("fridgeId") Long fridgeId)
    {
        return success(fridgeInfoService.selectFridgeInfoByFridgeId(fridgeId));
    }

    /**
     * 新增冰箱信息
     */
//    @Log(title = "冰箱信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FridgeInfo fridgeInfo)
    {
        return toAjax(fridgeInfoService.insertFridgeInfo(fridgeInfo));
    }

    /**
     * 修改冰箱信息
     */
//    @Log(title = "冰箱信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FridgeInfo fridgeInfo)
    {
        return toAjax(fridgeInfoService.updateFridgeInfo(fridgeInfo));
    }

    /**
     * 删除冰箱信息
     */
//    @Log(title = "冰箱信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{fridgeIds}")
    public AjaxResult remove(@PathVariable Long[] fridgeIds)
    {
        return toAjax(fridgeInfoService.deleteFridgeInfoByFridgeIds(fridgeIds));
    }
}
