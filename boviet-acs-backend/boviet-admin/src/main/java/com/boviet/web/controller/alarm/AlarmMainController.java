package com.boviet.web.controller.alarm;

import java.util.List;
import java.util.stream.Collectors;

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

import com.boviet.common.annotation.Log;
import com.boviet.common.core.controller.BaseController;
import com.boviet.common.core.domain.AjaxResult;
import com.boviet.common.enums.BusinessType;
import com.boviet.alarm.domain.AlarmGroup;
import com.boviet.alarm.domain.AlarmMain;
import com.boviet.alarm.service.IAlarmMainService;
import com.boviet.common.utils.poi.ExcelUtil;
import com.boviet.common.core.page.TableDataInfo;

/**
 * Alarm MainController
 * 
 * @author boviet
 * @date 2025-02-25
 */
@RestController
@RequestMapping("/alarm/main")
public class AlarmMainController extends BaseController
{
    @Autowired
    private IAlarmMainService alarmMainService;

    /**
     * 查询Alarm Main列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:main:list')")
    @GetMapping("/list")
    public TableDataInfo list(AlarmMain alarmMain)
    {
        startPage();
        List<AlarmMain> list = alarmMainService.selectAlarmMainList(alarmMain);
        return getDataTable(list);
    }

    /**
     * 导出Alarm Main列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:main:export')")
    @Log(title = "Alarm Main", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AlarmMain alarmMain)
    {
        List<AlarmMain> list = alarmMainService.selectAlarmMainList(alarmMain);
        ExcelUtil<AlarmMain> util = new ExcelUtil<AlarmMain>(AlarmMain.class);
        util.exportExcel(response, list, "Alarm Main数据");
    }

    /**
     * 获取Alarm Main详细信息
     */
    @PreAuthorize("@ss.hasPermi('alarm:main:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        AjaxResult ajax = AjaxResult.success();
        AlarmMain alarmMain = alarmMainService.selectAlarmMainById(id);
        ajax.put("groupIds", alarmMain.getGroups().stream().map(AlarmGroup::getGroupId).collect(Collectors.toList()));
        ajax.put("data", alarmMain);
        return ajax;
    }

    /**
     * 新增Alarm Main
     */
    @PreAuthorize("@ss.hasPermi('alarm:main:add')")
    @Log(title = "Alarm Main", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AlarmMain alarmMain)
    {
        alarmMain.setCreateBy(getUsername());
        return toAjax(alarmMainService.insertAlarmMain(alarmMain));
    }

    /**
     * 修改Alarm Main
     */
    @PreAuthorize("@ss.hasPermi('alarm:main:edit')")
    @Log(title = "Alarm Main", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AlarmMain alarmMain)
    {
        alarmMain.setUpdateBy(getUsername());
        return toAjax(alarmMainService.updateAlarmMain(alarmMain));
    }

    @PreAuthorize("@ss.hasPermi('alarm:main:edit')")
    @Log(title = "Alarm Main", businessType = BusinessType.UPDATE)
    @PostMapping("/updateRules")
    public AjaxResult updateRules(@RequestBody AlarmMain alarmMain)
    {
        alarmMain.setUpdateBy(getUsername());
        return toAjax(alarmMainService.updateAlarmMainRules(alarmMain));
    }

    /**
     * 删除Alarm Main
     */
    @PreAuthorize("@ss.hasPermi('alarm:main:remove')")
    @Log(title = "Alarm Main", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(alarmMainService.deleteAlarmMainByIds(ids));
    }
}
