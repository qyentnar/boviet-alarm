package com.boviet.web.controller.alarm;

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
import com.boviet.common.annotation.Log;
import com.boviet.common.core.controller.BaseController;
import com.boviet.common.core.domain.AjaxResult;
import com.boviet.common.enums.BusinessType;
import com.boviet.alarm.domain.AlarmAction;
import com.boviet.alarm.service.IAlarmActionService;
import com.boviet.common.utils.poi.ExcelUtil;

import com.boviet.common.core.page.TableDataInfo;

/**
 * Alarm ActionController
 * 
 * @author boviet
 * @date 2025-02-25
 */
@RestController
@RequestMapping("/alarm/action")
public class AlarmActionController extends BaseController
{
    @Autowired
    private IAlarmActionService alarmActionService;

    /**
     * 查询Alarm Action列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:action:list')")
    @GetMapping("/list")
    public TableDataInfo list(AlarmAction alarmAction)
    {
        startPage();
        List<AlarmAction> list = alarmActionService.selectAlarmActionList(alarmAction);
        return getDataTable(list);
    }

    /**
     * 导出Alarm Action列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:action:export')")
    @Log(title = "Alarm Action", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AlarmAction alarmAction)
    {
        List<AlarmAction> list = alarmActionService.selectAlarmActionList(alarmAction);
        ExcelUtil<AlarmAction> util = new ExcelUtil<AlarmAction>(AlarmAction.class);
        util.exportExcel(response, list, "Alarm Action数据");
    }

    /**
     * 获取Alarm Action详细信息
     */
    @PreAuthorize("@ss.hasPermi('alarm:action:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(alarmActionService.selectAlarmActionById(id));
    }

    /**
     * 新增Alarm Action
     */
    @PreAuthorize("@ss.hasPermi('alarm:action:add')")
    @Log(title = "Alarm Action", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AlarmAction alarmAction)
    {
        alarmAction.setCreateBy(getUsername());
        return toAjax(alarmActionService.insertAlarmAction(alarmAction));
    }

    /**
     * 修改Alarm Action
     */
    @PreAuthorize("@ss.hasPermi('alarm:action:edit')")
    @Log(title = "Alarm Action", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AlarmAction alarmAction)
    {
        alarmAction.setUpdateBy(getUsername());
        return toAjax(alarmActionService.updateAlarmAction(alarmAction));
    }

    /**
     * 删除Alarm Action
     */
    @PreAuthorize("@ss.hasPermi('alarm:action:remove')")
    @Log(title = "Alarm Action", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(alarmActionService.deleteAlarmActionByIds(ids));
    }

    @PreAuthorize("@ss.hasPermi('alarm:action:edit')")
    @Log(title = "Alarm Action", businessType = BusinessType.UPDATE)
    @PostMapping("/updateRegister")
    public AjaxResult updateRegister(@RequestBody AlarmAction alarmAction){
        return AjaxResult.success(alarmActionService.updateAlarmRegister(alarmAction));
    }

}
