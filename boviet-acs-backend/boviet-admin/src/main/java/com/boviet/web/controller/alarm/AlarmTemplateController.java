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
import com.boviet.alarm.domain.AlarmTemplate;
import com.boviet.alarm.service.IAlarmTemplateService;
import com.boviet.common.utils.poi.ExcelUtil;
import com.boviet.common.core.page.TableDataInfo;

/**
 * Alarm TemplateController
 * 
 * @author boviet
 * @date 2025-03-08
 */
@RestController
@RequestMapping("/alarm/template")
public class AlarmTemplateController extends BaseController
{
    @Autowired
    private IAlarmTemplateService alarmTemplateService;

    /**
     * 查询Alarm Template列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:template:list')")
    @GetMapping("/list")
    public TableDataInfo list(AlarmTemplate alarmTemplate)
    {
        startPage();
        List<AlarmTemplate> list = alarmTemplateService.selectAlarmTemplateList(alarmTemplate);
        return getDataTable(list);
    }

    /**
     * 导出Alarm Template列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:template:export')")
    @Log(title = "Alarm Template", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AlarmTemplate alarmTemplate)
    {
        List<AlarmTemplate> list = alarmTemplateService.selectAlarmTemplateList(alarmTemplate);
        ExcelUtil<AlarmTemplate> util = new ExcelUtil<AlarmTemplate>(AlarmTemplate.class);
        util.exportExcel(response, list, "Alarm Template数据");
    }

    /**
     * 获取Alarm Template详细信息
     */
    @PreAuthorize("@ss.hasPermi('alarm:template:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(alarmTemplateService.selectAlarmTemplateById(id));
    }

    /**
     * 获取Alarm Template详细信息
     */
    @PreAuthorize("@ss.hasPermi('alarm:template:query')")
    @GetMapping(value = "/getTemplateList")
    public AjaxResult getTemplateList(AlarmTemplate alarmTemplate)
    {
        return success(alarmTemplateService.selectAlarmTemplateList(alarmTemplate));
    }

    /**
     * 新增Alarm Template
     */
    @PreAuthorize("@ss.hasPermi('alarm:template:add')")
    @Log(title = "Alarm Template", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AlarmTemplate alarmTemplate)
    {
        alarmTemplate.setCreateBy(getUsername());
        return toAjax(alarmTemplateService.insertAlarmTemplate(alarmTemplate));
    }

    /**
     * 修改Alarm Template
     */
    @PreAuthorize("@ss.hasPermi('alarm:template:edit')")
    @Log(title = "Alarm Template", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AlarmTemplate alarmTemplate)
    {
        alarmTemplate.setUpdateBy(getUsername());
        return toAjax(alarmTemplateService.updateAlarmTemplate(alarmTemplate));
    }

    /**
     * 删除Alarm Template
     */
    @PreAuthorize("@ss.hasPermi('alarm:template:remove')")
    @Log(title = "Alarm Template", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(alarmTemplateService.deleteAlarmTemplateByIds(ids));
    }
}
