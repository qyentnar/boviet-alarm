package com.boviet.attendance.mapper;

import java.util.List;

import com.boviet.attendance.domain.LastMonthReport;

public interface LastMonthReportMapper {
    public List<LastMonthReport> selectLastMonthReport(LastMonthReport lastMonthReport);
}
