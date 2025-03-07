package com.boviet.attendance.service.impl;

import java.io.IOException;
import java.util.List;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.boviet.attendance.domain.LastMonthReport;
import com.boviet.attendance.mapper.LastMonthReportMapper;
import com.boviet.attendance.service.IAttendanceNotificationService;
import com.boviet.common.annotation.DataSource;
import com.boviet.common.enums.DataSourceType;
import com.boviet.common.utils.DateUtils;
import com.boviet.common.utils.StringUtils;
import com.boviet.common.utils.http.HttpUtils;

@Service
@DataSource(value = DataSourceType.MYSQL)
public class AttendanceNotificationImpl implements IAttendanceNotificationService {
    @Autowired
    private LastMonthReportMapper lastMonthReportMapper;

    private String getAccessToken() throws IOException {
        String url = "http://10.60.4.136:9208/gettoken";

        JSONObject params = new JSONObject();
        params.put("appkey", "ding12vgw2jftnusmtff");
        params.put("appsecret", "J-GTvKG_hZbTUKhnd1CvaMrffHZ4pKzYRRmm7J1aIimJd1GFUusM48it7H8XfgBJ");

        JSONObject headers = new JSONObject();
        headers.put("Accept-Encoding", "");
        String response = HttpUtils.sendGet(url, params, headers);
        JSONObject result = JSON.parseObject(response);
        String accessToken = result.getString("access_token");
        if(StringUtils.isNull(accessToken)) throw new RuntimeException("请求access_token失败");
        return accessToken;
    }

    private String getdingidbycode(String workcode) {
        String url = "http://10.60.4.136:9208/outApi/getdingidbycode";

        JSONObject body = new JSONObject();
        body.put("workcode", workcode);

        JSONObject headers = new JSONObject();
        headers.put("Accept-Encoding", "");
        headers.put("operationcode", "com.boway.esb.dingding.dingding.getdingidbycode.getdingidbycode");
        headers.put("Content-Type", "application/json");
        String response = HttpUtils.sendPost(url, headers, body);
        Object result = JSON.parse(response);
        if(result instanceof JSONArray){
            JSONArray resultArray = (JSONArray)result;
            return resultArray.getJSONObject(0).getString("DINGID");
        }else {
            JSONObject resultObject = (JSONObject)result;
            throw new RuntimeException(resultObject.getString("errorMsg"));
        }
    }

    public List<LastMonthReport> getLastMonthReport(LastMonthReport lastMonthReport) {
        return lastMonthReportMapper.selectLastMonthReport(lastMonthReport);
    }

    @Override
    public JSONObject submitAttendanceData(String lastMonth, String workcode) throws IOException {
        String accessToken = this.getAccessToken();
        //lastMonth = DateUtils.parseDateToStr("yyyy_DD", DateUtils.truncate(DateUtils.addMonths(DateUtils.getNowDate(), -1), Calendar.MONTH));
        LastMonthReport report = new LastMonthReport();
        if(StringUtils.isNull(lastMonth)) throw new RuntimeException("Last Month is null");
        report.setQijianRange(lastMonth);
        report.setJobNum(workcode);
        List<LastMonthReport> datas = this.getLastMonthReport(report);
        JSONObject result = new JSONObject();
        for (LastMonthReport data : datas) {
            String dingId = getdingidbycode(data.getJobNum());
            //String dingId = "0133466023611963616326";
            String url = "http://10.60.4.136:9208/v1.0/yida/forms/instances";

            JSONObject commonField = new JSONObject();
            commonField.put("systemToken", "RX866471DGXQ5N2GASIJX9QRXVMZ1F25TFG4MB0L");
            commonField.put("userId", "204354225740333531");
            commonField.put("appType", "APP_JYOKEPJ2QQNIM167DVHE");

            JSONObject params = new JSONObject();

            if ("CN".contains(data.getNationality())) {
                commonField.put("formUuid", "FORM-8B53AB2437A240A6A70D4600E8AD5BE5E3A9");
                params.put("textField_m4gfu1p9", data.getQijianRange());
                params.put("textField_m4gfu1pc", data.getJobNum());
                params.put("textField_m4gfu1pa", data.getName());
                params.put("employeeField_m4gfu1pd", dingId);
                params.put("textField_m4gfu1pe", data.getTotalJihuaChuqin());
                params.put("textField_m4gfu1pf", data.getTotalAttendanceDay());
                params.put("textField_m4gfu1pg", data.getTotalShijiDay());
                params.put("textField_m4gfu1q2", data.getTotalDaysInVietnam());
                params.put("textField_m4gfu1ph", data.getTotalWrate130Day());
                params.put("textField_m4gfu1ps", data.getTotalWrate150());
                params.put("textField_m4gfu1pt", data.getTotalWrate200());
                params.put("textField_m4gfu1pu", data.getTotalWrate300());
                params.put("textField_m4gfu1pm", data.getTotalHunjiaDay());
                params.put("textField_m4gfu1pn", data.getTotalSangjiaDay());
                params.put("textField_m4gfu1pp", data.getTotalChanjiaDay());
                params.put("textField_m4gfu1pq", data.getTotalPeichanjiaDay());
                params.put("textField_m4gfu1pr", data.getTotalBurujiaDay());
                params.put("textField_m4gfu1pk", data.getTotalBingshijiaDay());
                params.put("textField_m4gfu1po", data.getTotalGongshangjiaDay());
                params.put("textField_m4gfu1pj", data.getTotalBingshijiaDay());
                params.put("textField_m4gfu1pv", data.getTotalKgCs());
                params.put("textField_m4gfu1px", data.getTotalChidaoCs());
                params.put("textField_m4gfu1pz", data.getTotalWdkCs());
                params.put("textField_m742ekw2", data.getTotalTiaoxiuDay());
                params.put("textField_m5x96cwp", data.getCompany());
            } else if ("VN".contains(data.getNationality())) {
                commonField.put("formUuid", "FORM-524A69801B914522B629D6B9CF102BF918YD");
                params.put("textField_m4gfu1p9", data.getQijianRange());
                params.put("textField_m4gfu1pc", data.getJobNum());
                params.put("textField_m4gfu1pa", data.getName());
                params.put("employeeField_m4gfu1pd", dingId);
                params.put("textField_m4gfu1pf", data.getTotalAttendanceDay());
                params.put("textField_m4gfu1pe", data.getTotalJihuaChuqin());
                params.put("textField_m4gfu1pg", data.getTotalShijiDay());
                params.put("textField_m4gfu1pp", data.getTotalTiaoxiuDay());
                params.put("textField_m4gggi48", data.getTotalChangxiuDay());
                params.put("textField_m4gggi4a", data.getTotalJingqiDay());
                params.put("textField_m4gfu1px", data.getTotalNianjiaDay());
                params.put("textField_m4gfu1pz", data.getTotalJjiariDay());
                params.put("textField_m4gfu1pn", data.getTotalPaidDays());
                params.put("textField_m4gfu1q2", data.getTotalWrate100Day());
                params.put("textField_m4gfu1pm", data.getTotalWrate130Day());
                params.put("textField_m4gfu1pr", data.getTotalWrate150());
                params.put("textField_m4gfu1pj", data.getTotalWrate215());
                params.put("textField_m4gfu1pk", data.getTotalWrate200());
                params.put("textField_m4gfu1po", data.getTotalWrate280());
                params.put("textField_m4gfu1ph", data.getTotalWrate300());
                params.put("textField_m4gfu1ps", data.getTotalWrate410());
                params.put("textField_m4gfu1pq", data.getTotalBingshijiaDay());
                params.put("textField_m4gfu1pt", data.getTotalKgCs());
                params.put("textField_m4gfu1pu", data.getTotalChidaoCs());
                params.put("textField_m4gfu1pv", data.getTotalWdkCs());
                params.put("textField_m5x9772v", data.getCompany());
            } else {
                throw new RuntimeException("不支持的国籍类型");
            }

            JSONObject headers = new JSONObject();
            headers.put("Accept-Encoding", "");
            headers.put("operationcode", "com.boway.esb.dingding.dingding.yidaforms.instances");
            headers.put("Content-Type", "application/json");
            headers.put("x-acs-dingtalk-access-token", accessToken);

            JSONObject body = new JSONObject();
            body.putAll(commonField);
            body.put("formDataJson", JSONObject.toJSONString(params));
            String response = HttpUtils.sendPost(url, headers, body);
            result.put(data.getJobNum(), JSONObject.parseObject(response).getString("result"));
        }
        return result;
    }
}
