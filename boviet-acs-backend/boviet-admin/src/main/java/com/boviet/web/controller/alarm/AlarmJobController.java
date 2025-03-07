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
import com.boviet.alarm.domain.AlarmJob;
import com.boviet.alarm.service.IAlarmJobService;
import com.boviet.common.utils.poi.ExcelUtil;
import com.boviet.common.core.page.TableDataInfo;

/**
 * Alarm JobController
 * 
 * @author boviet
 * @date 2025-03-04
 */
@RestController
@RequestMapping("/alarm/job")
public class AlarmJobController extends BaseController
{
    @Autowired
    private IAlarmJobService alarmJobService;

    /**
     * 查询Alarm Job列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:job:list')")
    @GetMapping("/list")
    public TableDataInfo list(AlarmJob alarmJob)
    {
        startPage();
        List<AlarmJob> list = alarmJobService.selectAlarmJobList(alarmJob);
        return getDataTable(list);
    }

    /**
     * 导出Alarm Job列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:job:export')")
    @Log(title = "Alarm Job", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AlarmJob alarmJob)
    {
        List<AlarmJob> list = alarmJobService.selectAlarmJobList(alarmJob);
        ExcelUtil<AlarmJob> util = new ExcelUtil<AlarmJob>(AlarmJob.class);
        util.exportExcel(response, list, "Alarm Job数据");
    }

    /**
     * 获取Alarm Job详细信息
     */
    @PreAuthorize("@ss.hasPermi('alarm:job:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(alarmJobService.selectAlarmJobById(id));
    }

    /**
     * 新增Alarm Job
     */
    @PreAuthorize("@ss.hasPermi('alarm:job:add')")
    @Log(title = "Alarm Job", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AlarmJob alarmJob)
    {
        return toAjax(alarmJobService.insertAlarmJob(alarmJob));
    }

    /**
     * 修改Alarm Job
     */
    @PreAuthorize("@ss.hasPermi('alarm:job:edit')")
    @Log(title = "Alarm Job", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AlarmJob alarmJob)
    {
        return toAjax(alarmJobService.updateAlarmJob(alarmJob));
    }

    /**
     * 删除Alarm Job
     */
    @PreAuthorize("@ss.hasPermi('alarm:job:remove')")
    @Log(title = "Alarm Job", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(alarmJobService.deleteAlarmJobByIds(ids));
    }
}
