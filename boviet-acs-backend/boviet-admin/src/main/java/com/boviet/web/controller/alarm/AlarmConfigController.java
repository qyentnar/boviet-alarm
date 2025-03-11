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
import com.boviet.alarm.domain.AlarmConfig;
import com.boviet.alarm.service.IAlarmConfigService;
import com.boviet.common.utils.poi.ExcelUtil;
import com.boviet.common.core.page.TableDataInfo;

/**
 * Alarm ConfigController
 * 
 * @author boviet
 * @date 2025-03-08
 */
@RestController
@RequestMapping("/alarm/config")
public class AlarmConfigController extends BaseController
{
    @Autowired
    private IAlarmConfigService alarmConfigService;

    /**
     * 查询Alarm Config列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:config:list')")
    @GetMapping("/list")
    public TableDataInfo list(AlarmConfig alarmConfig)
    {
        startPage();
        List<AlarmConfig> list = alarmConfigService.selectAlarmConfigList(alarmConfig);
        return getDataTable(list);
    }

    /**
     * 导出Alarm Config列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:config:export')")
    @Log(title = "Alarm Config", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AlarmConfig alarmConfig)
    {
        List<AlarmConfig> list = alarmConfigService.selectAlarmConfigList(alarmConfig);
        ExcelUtil<AlarmConfig> util = new ExcelUtil<AlarmConfig>(AlarmConfig.class);
        util.exportExcel(response, list, "Alarm Config数据");
    }

    /**
     * 获取Alarm Config详细信息
     */
    @PreAuthorize("@ss.hasPermi('alarm:config:query')")
    @GetMapping(value = "/{configType}")
    public AjaxResult getInfo(@PathVariable("configType") String configType)
    {
        return success(alarmConfigService.selectAlarmConfigByConfigType(configType));
    }

    /**
     * 新增Alarm Config
     */
    @PreAuthorize("@ss.hasPermi('alarm:config:add')")
    @Log(title = "Alarm Config", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AlarmConfig alarmConfig)
    {
        return toAjax(alarmConfigService.insertAlarmConfig(alarmConfig));
    }

    /**
     * 修改Alarm Config
     */
    @PreAuthorize("@ss.hasPermi('alarm:config:edit')")
    @Log(title = "Alarm Config", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AlarmConfig alarmConfig)
    {
        alarmConfig.setCreateBy(getUsername());
        return toAjax(alarmConfigService.updateAlarmConfig(alarmConfig));
    }

    /**
     * 删除Alarm Config
     */
    @PreAuthorize("@ss.hasPermi('alarm:config:remove')")
    @Log(title = "Alarm Config", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(alarmConfigService.deleteAlarmConfigByIds(ids));
    }
}
