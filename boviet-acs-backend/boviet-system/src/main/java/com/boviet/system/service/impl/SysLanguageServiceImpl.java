package com.boviet.system.service.impl;

import java.util.Dictionary;
import java.util.Hashtable;
import java.util.List;
import com.boviet.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.boviet.system.mapper.SysLanguageMapper;
import com.boviet.common.core.domain.entity.SysLanguage;
import com.boviet.system.service.ISysLanguageService;

/**
 * 系统语言Service业务层处理
 * 
 * @author Qyentnar
 * @date 2024-04-19
 */
@Service
public class SysLanguageServiceImpl implements ISysLanguageService 
{
    @Autowired
    private SysLanguageMapper sysLanguageMapper;

    /**
     * 查询系统语言
     * 
     * @param id 系统语言主键
     * @return 系统语言
     */
    @Override
    public SysLanguage selectSysLanguageById(Long id)
    {
        return sysLanguageMapper.selectSysLanguageById(id);
    }

    @Override
    public Dictionary<String, String> selectPageLanuage(String currentLanguage){
        List<SysLanguage> langList = sysLanguageMapper.selectPageLanuage();
        Dictionary<String, String> dict = new Hashtable<>();
        for (SysLanguage lang : langList) {
            if(currentLanguage.equalsIgnoreCase("vi-VN")){
                dict.put(lang.getLangKey(), lang.getLangVi());
            } else if (currentLanguage.equalsIgnoreCase("en-US")){
                dict.put(lang.getLangKey(), lang.getLangEn());
            }else{
                dict.put(lang.getLangKey(), lang.getLangZh());
            }
            
        }
        return dict;
    }

    /**
     * 查询系统语言列表
     * 
     * @param sysLanguage 系统语言
     * @return 系统语言
     */
    @Override
    public List<SysLanguage> selectSysLanguageList(SysLanguage sysLanguage)
    {
        return sysLanguageMapper.selectSysLanguageList(sysLanguage);
    }

    /**
     * 新增系统语言
     * 
     * @param sysLanguage 系统语言
     * @return 结果
     */
    @Override
    public int insertSysLanguage(SysLanguage sysLanguage)
    {
        sysLanguage.setCreateTime(DateUtils.getNowDate());
        return sysLanguageMapper.insertSysLanguage(sysLanguage);
    }

    /**
     * 修改系统语言
     * 
     * @param sysLanguage 系统语言
     * @return 结果
     */
    @Override
    public int updateSysLanguage(SysLanguage sysLanguage)
    {
        sysLanguage.setUpdateTime(DateUtils.getNowDate());
        return sysLanguageMapper.updateSysLanguage(sysLanguage);
    }

    /**
     * 批量删除系统语言
     * 
     * @param ids 需要删除的系统语言主键
     * @return 结果
     */
    @Override
    public int deleteSysLanguageByIds(Long[] ids)
    {
        return sysLanguageMapper.deleteSysLanguageByIds(ids);
    }

    /**
     * 删除系统语言信息
     * 
     * @param id 系统语言主键
     * @return 结果
     */
    @Override
    public int deleteSysLanguageById(Long id)
    {
        return sysLanguageMapper.deleteSysLanguageById(id);
    }
}
