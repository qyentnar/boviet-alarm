package com.boviet.web.controller.system;

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
import com.boviet.common.core.domain.entity.SysLanguage;
import com.boviet.system.service.ISysLanguageService;
import com.boviet.common.utils.poi.ExcelUtil;
import com.boviet.common.core.page.TableDataInfo;

/**
 * 系统语言Controller
 * 
 * @author Qyentnar
 * @date 2024-04-19
 */
@RestController
@RequestMapping("/system/lang")
public class SysLanguageController extends BaseController
{
    @Autowired
    private ISysLanguageService sysLanguageService;

    /**
     * 查询系统语言列表
     */
    @PreAuthorize("@ss.hasPermi('system:lang:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysLanguage sysLanguage)
    {
        startPage();
        List<SysLanguage> list = sysLanguageService.selectSysLanguageList(sysLanguage);
        return getDataTable(list);
    }

    /**
     * 导出系统语言列表
     */
    @PreAuthorize("@ss.hasPermi('system:lang:export')")
    @Log(title = "系统语言", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysLanguage sysLanguage)
    {
        List<SysLanguage> list = sysLanguageService.selectSysLanguageList(sysLanguage);
        ExcelUtil<SysLanguage> util = new ExcelUtil<SysLanguage>(SysLanguage.class);
        util.exportExcel(response, list, "系统语言数据");
    }

    /**
     * 获取系统语言详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:lang:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysLanguageService.selectSysLanguageById(id));
    }

    /**
     * 获取系统语言详细信息
     */
    @GetMapping("/getPageLang")
    public AjaxResult getPageLang(String lang)
    {
        return success(sysLanguageService.selectPageLanuage(lang));
    }

    /**
     * 新增系统语言
     */
    @PreAuthorize("@ss.hasPermi('system:lang:add')")
    @Log(title = "系统语言", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysLanguage sysLanguage)
    {
        return toAjax(sysLanguageService.insertSysLanguage(sysLanguage));
    }

    /**
     * 修改系统语言
     */
    @PreAuthorize("@ss.hasPermi('system:lang:edit')")
    @Log(title = "系统语言", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysLanguage sysLanguage)
    {
        return toAjax(sysLanguageService.updateSysLanguage(sysLanguage));
    }

    /**
     * 删除系统语言
     */
    @PreAuthorize("@ss.hasPermi('system:lang:remove')")
    @Log(title = "系统语言", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysLanguageService.deleteSysLanguageByIds(ids));
    }
}
