package com.boviet.attendance.domain;
import com.boviet.common.core.domain.BaseEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class LastMonthReport extends BaseEntity{
    private String jobNum;
    private String qijianRange;
    private Double totalWrate100Day;
    private Double totalWrate130Day;
    private Double totalWrate150;
    private Double totalWrate215;
    private Double totalWrate200;
    private Double totalWrate280;
    private Double totalWrate300;
    private Double totalWrate410;
    private Double totalKgCs;
    private Double totalChidaoCs;
    private Double totalWdkCs;
    private Double totalNianjiaDay;
    private Double totalTiaoxiuDay;
    private Double totalBingshijiaDay;
    private Double totalJihuaChuqin;
    private Double totalJjiariDay;
    private Double totalShijiDay;
    private Double totalAttendanceDay;
    private Double totalTanqinDay;
    private Double totalDaysInVietnam;
    private Double totalPaidDays;
    private Double totalJingqiDay;
    private Double totalChangxiuDay;
    private Double totalHunjiaDay;
    private Double totalSangjiaDay;
    private Double totalBurujiaDay;
    private Double totalChanjiaDay;
    private Double totalPeichanjiaDay;
    private Double totalGongshangjiaDay;
    private String emplId;
    private String name;
    private String nationality;
    private String emplStatusCn;
    private String company;
    private String deptId;
}
