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
import com.boviet.alarm.domain.AlarmRegister;
import com.boviet.alarm.domain.AlarmTemplate;
import com.boviet.alarm.service.IAlarmRegisterService;
import com.boviet.common.utils.poi.ExcelUtil;
import com.boviet.common.core.page.TableDataInfo;

/**
 * Alarm RegisterController
 * 
 * @author boviet
 * @date 2025-03-10
 */
@RestController
@RequestMapping("/alarm/register")
public class AlarmRegisterController extends BaseController
{
    @Autowired
    private IAlarmRegisterService alarmRegisterService;

    /**
     * 查询Alarm Register列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:register:list')")
    @GetMapping("/list")
    public TableDataInfo list(AlarmRegister alarmRegister)
    {
        startPage();
        List<AlarmRegister> list = alarmRegisterService.selectAlarmRegisterList(alarmRegister);
        return getDataTable(list);
    }

    /**
     * 导出Alarm Register列表
     */
    @PreAuthorize("@ss.hasPermi('alarm:register:export')")
    @Log(title = "Alarm Register", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AlarmRegister alarmRegister)
    {
        List<AlarmRegister> list = alarmRegisterService.selectAlarmRegisterList(alarmRegister);
        ExcelUtil<AlarmRegister> util = new ExcelUtil<AlarmRegister>(AlarmRegister.class);
        util.exportExcel(response, list, "Alarm Register数据");
    }

    /**
     * 获取Alarm Register详细信息
     */
    @PreAuthorize("@ss.hasPermi('alarm:register:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(alarmRegisterService.selectAlarmRegisterById(id));
    }

    /**
     * 获取Alarm Template详细信息
     */
    @PreAuthorize("@ss.hasPermi('alarm:register:query')")
    @GetMapping("/getAlarmRegisterList")
    public AjaxResult getAlarmRegisterList(AlarmRegister alarmRegister)
    {
        return success(alarmRegisterService.selectAlarmRegisterList(alarmRegister));
    }
    /**
     * 新增Alarm Register
     */
    @PreAuthorize("@ss.hasPermi('alarm:register:add')")
    @Log(title = "Alarm Register", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AlarmRegister alarmRegister)
    {
        return toAjax(alarmRegisterService.insertAlarmRegister(alarmRegister));
    }

    /**
     * 修改Alarm Register
     */
    @PreAuthorize("@ss.hasPermi('alarm:register:edit')")
    @Log(title = "Alarm Register", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AlarmRegister alarmRegister)
    {
        return toAjax(alarmRegisterService.updateAlarmRegister(alarmRegister));
    }

    /**
     * 删除Alarm Register
     */
    @PreAuthorize("@ss.hasPermi('alarm:register:remove')")
    @Log(title = "Alarm Register", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(alarmRegisterService.deleteAlarmRegisterByIds(ids));
    }
}
