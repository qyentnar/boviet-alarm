package com.boviet.common.core.domain.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.boviet.common.annotation.Excel;
import com.boviet.common.core.domain.BaseEntity;

/**
 * 系统语言对象 sys_language
 * 
 * @author Qyentnar
 * @date 2024-04-19
 */
public class SysLanguage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** Key word */
    @Excel(name = "Key word")
    private String langKey;

    /** Type */
    @Excel(name = "Type")
    private String langType;

    /** 中文 */
    @Excel(name = "中文")
    private String langZh;

    /** English */
    @Excel(name = "English")
    private String langEn;

    /** Tiếng Việt */
    @Excel(name = "Tiếng Việt")
    private String langVi;

    /** Menu ID */
    @Excel(name = "Menu ID")
    private Long menuId;

    private SysMenu sysMenu;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setLangKey(String langKey) 
    {
        this.langKey = langKey;
    }

    public String getLangKey() 
    {
        return langKey;
    }
    public void setLangType(String langType) 
    {
        this.langType = langType;
    }

    public String getLangType() 
    {
        return langType;
    }
    public void setLangZh(String langZh) 
    {
        this.langZh = langZh;
    }

    public String getLangZh() 
    {
        return langZh;
    }
    public void setLangEn(String langEn) 
    {
        this.langEn = langEn;
    }

    public String getLangEn() 
    {
        return langEn;
    }
    public void setLangVi(String langVi) 
    {
        this.langVi = langVi;
    }

    public String getLangVi() 
    {
        return langVi;
    }
    public void setMenuId(Long menuId) 
    {
        this.menuId = menuId;
    }

    public Long getMenuId() 
    {
        return menuId;
    }

    public SysMenu getSysMenu() {
        return sysMenu;
    }

    public void setSysMenu(SysMenu sysMenu) {
        this.sysMenu = sysMenu;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("langKey", getLangKey())
            .append("langType", getLangType())
            .append("langZh", getLangZh())
            .append("langEn", getLangEn())
            .append("langVi", getLangVi())
            .append("menuId", getMenuId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
