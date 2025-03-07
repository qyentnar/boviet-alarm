package com.boviet.system.service;

import java.util.Dictionary;
import java.util.List;

import com.alibaba.fastjson2.JSON;
import com.boviet.common.core.domain.entity.SysLanguage;

/**
 * 系统语言Service接口
 * 
 * @author Qyentnar
 * @date 2024-04-19
 */
public interface ISysLanguageService 
{
    /**
     * 查询系统语言
     * 
     * @param id 系统语言主键
     * @return 系统语言
     */
    public SysLanguage selectSysLanguageById(Long id);


    public Dictionary<String, String> selectPageLanuage(String language);
    /**
     * 查询系统语言列表
     * 
     * @param sysLanguage 系统语言
     * @return 系统语言集合
     */
    public List<SysLanguage> selectSysLanguageList(SysLanguage sysLanguage);

    /**
     * 新增系统语言
     * 
     * @param sysLanguage 系统语言
     * @return 结果
     */
    public int insertSysLanguage(SysLanguage sysLanguage);

    /**
     * 修改系统语言
     * 
     * @param sysLanguage 系统语言
     * @return 结果
     */
    public int updateSysLanguage(SysLanguage sysLanguage);

    /**
     * 批量删除系统语言
     * 
     * @param ids 需要删除的系统语言主键集合
     * @return 结果
     */
    public int deleteSysLanguageByIds(Long[] ids);

    /**
     * 删除系统语言信息
     * 
     * @param id 系统语言主键
     * @return 结果
     */
    public int deleteSysLanguageById(Long id);
}
