package com.boviet.alarm.domain;

import java.util.List;

import com.boviet.common.annotation.Excel;
import com.boviet.common.core.domain.BaseEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Alarm Group对象 alarm_group
 * 
 * @author boviet
 * @date 2025-02-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class AlarmGroup extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** Group ID */
    @Excel(name = "Group ID")
    private String groupId;

    /** Group Name */
    @Excel(name = "Group Name")
    private String groupName;

    /** Node 1 */
    @Excel(name = "Node 1")
    private String node1;

    /** Node 2 */
    @Excel(name = "Node 2")
    private String node2;

    /** Node 3 */
    @Excel(name = "Node 3")
    private String node3;

    /** Node 4 */
    @Excel(name = "Node 4")
    private String node4;

    /** Node 5 */
    @Excel(name = "Node 5")
    private String node5;

    /** Node 6 */
    @Excel(name = "Node 6")
    private String node6;

    /** Node 7 */
    @Excel(name = "Node 7")
    private String node7;

    /** Node 8 */
    @Excel(name = "Node 8")
    private String node8;

    /** Node 9 */
    @Excel(name = "Node 9")
    private String node9;

    private List<AlarmAction> actions;

    private String[] actionIds;
}
