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
import com.boviet.alarm.domain.AlarmAction;
import com.boviet.alarm.domain.AlarmGroup;
import com.boviet.alarm.domain.AlarmMain;
import com.boviet.alarm.service.IAlarmGroupService;
import com.boviet.common.utils.poi.ExcelUtil;
import com.boviet.common.core.page.TableDataInfo;

/**
 * Alarm GroupController
 * 
 * @author boviet
 * @date 2025-02-25
 */
@RestController
@RequestMapping("/alarm/group")
public class AlarmGroupController extends BaseController
{
    @Autowired
    private IAlarmGroupService alarmGroupService;

    /**
     * 查询Alarm Group列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:group:list')")
    @GetMapping("/list")
    public TableDataInfo list(AlarmGroup alarmGroup)
    {
        startPage();
        List<AlarmGroup> list = alarmGroupService.selectAlarmGroupList(alarmGroup);
        return getDataTable(list);
    }

    /**
     * 导出Alarm Group列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:group:export')")
    @Log(title = "Alarm Group", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AlarmGroup alarmGroup)
    {
        List<AlarmGroup> list = alarmGroupService.selectAlarmGroupList(alarmGroup);
        ExcelUtil<AlarmGroup> util = new ExcelUtil<AlarmGroup>(AlarmGroup.class);
        util.exportExcel(response, list, "Alarm Group数据");
    }

    /**
     * 获取Alarm Group详细信息
     */
    @PreAuthorize("@ss.hasPermi('alarm:group:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        AjaxResult ajax = AjaxResult.success();
        AlarmGroup alarmGroup = alarmGroupService.selectAlarmGroupById(id);
        ajax.put("actionIds", alarmGroup.getActions().stream().map(AlarmAction::getActionId).collect(Collectors.toList()));
        ajax.put("data", alarmGroup);
        return ajax;
    }

    /**
     * 新增Alarm Group
     */
    @PreAuthorize("@ss.hasPermi('alarm:group:add')")
    @Log(title = "Alarm Group", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AlarmGroup alarmGroup)
    {
        alarmGroup.setCreateBy(getUsername());
        return toAjax(alarmGroupService.insertAlarmGroup(alarmGroup));
    }

    /**
     * 修改Alarm Group
     */
    @PreAuthorize("@ss.hasPermi('alarm:group:edit')")
    @Log(title = "Alarm Group", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AlarmGroup alarmGroup)
    {
        alarmGroup.setUpdateBy(getUsername());
        return toAjax(alarmGroupService.updateAlarmGroup(alarmGroup));
    }

    /**
     * 删除Alarm Group
     */
    @PreAuthorize("@ss.hasPermi('alarm:group:remove')")
    @Log(title = "Alarm Group", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(alarmGroupService.deleteAlarmGroupByIds(ids));
    }
}
