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
import com.boviet.alarm.domain.AlarmLog;
import com.boviet.alarm.service.IAlarmLogService;
import com.boviet.common.utils.poi.ExcelUtil;
import com.boviet.common.core.page.TableDataInfo;

/**
 * Alarm LogController
 * 
 * @author boviet
 * @date 2025-03-03
 */
@RestController
@RequestMapping("/alarm/log")
public class AlarmLogController extends BaseController
{
    @Autowired
    private IAlarmLogService alarmLogService;

    /**
     * 查询Alarm Log列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:log:list')")
    @GetMapping("/list")
    public TableDataInfo list(AlarmLog alarmLog)
    {
        startPage();
        List<AlarmLog> list = alarmLogService.selectAlarmLogList(alarmLog);
        return getDataTable(list);
    }

    /**
     * 导出Alarm Log列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:log:export')")
    @Log(title = "Alarm Log", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AlarmLog alarmLog)
    {
        List<AlarmLog> list = alarmLogService.selectAlarmLogList(alarmLog);
        ExcelUtil<AlarmLog> util = new ExcelUtil<AlarmLog>(AlarmLog.class);
        util.exportExcel(response, list, "Alarm Log数据");
    }

    /**
     * 获取Alarm Log详细信息
     */
    @PreAuthorize("@ss.hasPermi('alarm:log:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(alarmLogService.selectAlarmLogById(id));
    }

    /**
     * 新增Alarm Log
     */
    @PreAuthorize("@ss.hasPermi('alarm:log:add')")
    @Log(title = "Alarm Log", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AlarmLog alarmLog)
    {
        return toAjax(alarmLogService.insertAlarmLog(alarmLog));
    }

    /**
     * 修改Alarm Log
     */
    @PreAuthorize("@ss.hasPermi('alarm:log:edit')")
    @Log(title = "Alarm Log", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AlarmLog alarmLog)
    {
        return toAjax(alarmLogService.updateAlarmLog(alarmLog));
    }

    /**
     * 删除Alarm Log
     */
    @PreAuthorize("@ss.hasPermi('alarm:log:remove')")
    @Log(title = "Alarm Log", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(alarmLogService.deleteAlarmLogByIds(ids));
    }
}
