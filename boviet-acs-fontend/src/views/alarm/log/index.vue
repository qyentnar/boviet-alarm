<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="120px">
      <el-form-item :label="$t('lbl.log.logType')" prop="logType">
        <el-select v-model="queryParams.logType" :placeholder="$t('plh.log.logType')">
          <el-option v-for="item in logTypeOptions" :key="item.value" :label="item.label" :value="item.value"></el-option>
        </el-select>
      </el-form-item>
      
      <el-form-item :label="$t('lbl.log.alarmId')" prop="alarmId">
        <el-input
          v-model="queryParams.alarmId"
          :placeholder="$t('plh.log.alarmId')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('lbl.log.systemName')" prop="systemName">
        <el-input
          v-model="queryParams.systemName"
          :placeholder="$t('plh.log.systemName')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('lbl.log.responseData')" prop="responseData">
        <el-input
          v-model="queryParams.responseData"
          :placeholder="$t('plh.log.responseData')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('lbl.log.timeOut')" prop="timeOut">
        <el-input
          v-model="queryParams.timeOut"
          :placeholder="$t('plh.log.timeOut')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('lbl.log.requestTime')" prop="requestTime">
        <el-date-picker clearable
          v-model="queryParams.requestTime"
          type="date"
          value-format="yyyy-MM-dd"
          :placeholder="$t('plh.log.requestTime')">
        </el-date-picker>
      </el-form-item>
      <el-row>
        <el-col align="center">
          <el-form-item>
            <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">{{$t("btnSearch")}}</el-button>
            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">{{$t("btnReset")}}</el-button>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['alarm:log:export']"
        >{{$t("btnExport")}}</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="logList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column :label="$t('lbl.log.id')" align="center" prop="id" />
      <el-table-column :label="$t('lbl.log.logType')" align="center" prop="logType" width="180"/>
      <el-table-column :label="$t('lbl.log.alarmId')" align="center" prop="alarmId" width="180">
        <template slot-scope="scope">
          <div class="content-wrapper">
            <el-tooltip :content="scope.row.alarmId">
              <span class="truncate-text">{{ scope.row.alarmId }}</span>
            </el-tooltip>
          </div>
        </template>
      </el-table-column>
      <el-table-column :label="$t('lbl.log.systemName')" align="center" prop="systemName" width="180"/>
      <el-table-column :label="$t('lbl.log.requestData')" align="center" prop="requestData" width="240">
        <template slot-scope="scope">
          <div class="content-wrapper">
            <el-link class="truncate-text" @click="handleOpenDetails(scope.row.requestData)">
              {{scope.row.requestData}}
            </el-link>
          </div>
        </template>
      </el-table-column>
      <el-table-column :label="$t('lbl.log.responseData')" align="center" prop="responseData" width="240">
        <template slot-scope="scope">
          <div class="content-wrapper">
            <el-link class="truncate-text" @click="handleOpenDetails(scope.row.responseData)">
              {{scope.row.responseData}}
            </el-link>
          </div>
        </template>
      </el-table-column>
      <el-table-column :label="$t('lbl.log.status')" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.alarm_log_status" :value="scope.row.status" size="mini"/>
        </template>
      </el-table-column>
      <el-table-column :label="$t('lbl.log.timeOut')" align="center" prop="timeOut" width="120" />
      <el-table-column :label="$t('lbl.log.requestTime')" align="center" prop="requestTime" width="180" />
      <el-table-column :label="$t('lbl.log.responseTime')" align="center" prop="responseTime" width="180" />
      <el-table-column :label="$t('lbl.log.remark')" align="center" prop="remark" width="180">
        <template slot-scope="scope">
          <div class="content-wrapper">
            <el-tooltip :content="scope.row.remark">
              <span class="truncate-text">{{ scope.row.remark }}</span>
            </el-tooltip>
          </div>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改Alarm Log对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="640px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item :label="$t('lbl.log.alarmId')" prop="alarmId">
          <el-input v-model="form.alarmId" :placeholder="$t('plh.log.alarmId')" />
        </el-form-item>
        <el-form-item :label="$t('lbl.log.systemName')" prop="systemName">
          <el-input v-model="form.systemName" :placeholder="$t('plh.log.systemName')" />
        </el-form-item>
        <el-form-item :label="$t('lbl.log.responseData')" prop="responseData">
          <el-input v-model="form.responseData" :placeholder="$t('plh.log.responseData')" />
        </el-form-item>
        <el-form-item :label="$t('lbl.log.timeOut')" prop="timeOut">
          <el-input v-model="form.timeOut" :placeholder="$t('plh.log.timeOut')" />
        </el-form-item>
        <el-form-item :label="$t('lbl.log.requestTime')" prop="requestTime">
          <el-date-picker clearable
            v-model="form.requestTime"
            type="date"
            value-format="yyyy-MM-dd"
            :placeholder="$t('plh.log.requestTime')">
          </el-date-picker>
        </el-form-item>
        <el-form-item :label="$t('lbl.log.remark')" prop="remark">
          <el-input v-model="form.remark" type="textarea" :placeholder="$t('plh.log.remark')" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">{{$t("btnSubmit")}}</el-button>
        <el-button @click="cancel">{{$t("btnCancel")}}</el-button>
      </div>
    </el-dialog>

    <el-drawer title="Json Viewer" :visible.sync="drawer">
      <el-link :underline="false" icon="el-icon-document-copy" v-clipboard:copy="JSON.stringify(jsonData)" v-clipboard:success="clipboardSuccess" style="float:right; margin-right: 10px;">复制</el-link>
      <vue-json-pretty :data="jsonData" showLineNumber style="margin: 10px;"/>
    </el-drawer>
  </div>
</template>

<script>
import { listLog, getLog, delLog, addLog, updateLog } from "@/api/alarm/log";

export default {
  name: "Log",
  dicts: ['alarm_log_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: false,
      // 总条数
      total: 0,
      // Alarm Log表格数据
      logList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,

      drawer: false,
      jsonData: '',
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        logType: 'OUTGOING',
        alarmId: null,
        systemName: null,
        requestData: null,
        responseData: null,
        status: null,
        timeOut: null,
        requestTime: null,
      },
      logTypeOptions: [
        { label: 'INCOMING', value: 'INCOMING' },
        { label: 'OUTGOING', value: 'OUTGOING' },
      ],
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询Alarm Log列表 */
    getList() {
      this.loading = true;
      listLog(this.queryParams).then(response => {
        this.logList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        logType: null,
        alarmId: null,
        systemName: null,
        requestData: null,
        responseData: null,
        status: null,
        timeOut: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        requestTime: null,
        remark: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = this.$t("titleAddForm");
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getLog(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = this.$t("titleEditForm");
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateLog(this.form).then(response => {
              this.$modal.msgSuccess(this.$t("editSuccessfully"));
              this.open = false;
              this.getList();
            });
          } else {
            addLog(this.form).then(response => {
              this.$modal.msgSuccess(this.$t("addSuccessfully"));
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm(this.$t("confirmDetele") + ': ' + ids + ' ？').then(function() {
        return delLog(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess(this.$t("deletedSuccessfully"));
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('alarm/log/export', {
        ...this.queryParams
      }, `log_${new Date().getTime()}.xlsx`)
    },
    handleOpenDetails(text){
      try{
        this.drawer = true;
        this.jsonData = JSON.parse(text);
      }
      catch(e){
        this.jsonData = text;
      }
    },
    clipboardSuccess() {
      this.$modal.msgSuccess("复制成功");
    },
  }
};
</script>
<style lang="scss" scoped>
.content-wrapper {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
}

.truncate-text {
  max-width: 150px;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  display: inline-block;
}
</style>