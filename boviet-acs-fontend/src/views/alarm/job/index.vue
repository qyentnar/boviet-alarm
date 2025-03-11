<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item :label="$t('lbl.job.alarmId')" prop="alarmId">
        <el-input
          v-model="queryParams.alarmId"
          :placeholder="$t('plh.job.alarmId')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('lbl.job.severity')" prop="severity">
        <el-input
          v-model="queryParams.severity"
          :placeholder="$t('plh.job.severity')"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['alarm:job:edit']"
        >{{$t("btnEdit")}}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['alarm:job:remove']"
        >{{$t("btnRemove")}}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['alarm:job:export']"
        >{{$t("btnExport")}}</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="jobList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column :label="$t('lbl.job.id')" align="center" prop="id" width="80"/>
      <el-table-column :label="$t('lbl.job.alarmId')" align="center" prop="alarmId" width="300">
        <template slot-scope="scope">
          <div class="content-wrapper">
            <el-tooltip :content="scope.row.alarmId">
              <span class="truncate-text">{{ scope.row.alarmId }}</span>
            </el-tooltip>
          </div>
        </template>
      </el-table-column>
      <el-table-column :label="$t('lbl.job.groupId')" align="center" prop="groupId" width="300">
        <template slot-scope="scope">
          <div class="content-wrapper">
            <el-tooltip :content="scope.row.groupId">
              <span class="truncate-text">{{ scope.row.groupId }}</span>
            </el-tooltip>
          </div>
        </template>
      </el-table-column>
      <el-table-column :label="$t('lbl.job.message')" align="center" prop="message">
        <template slot-scope="scope">
          <div class="content-wrapper">
            <el-link class="truncate-text" @click="handleOpenDetails(scope.row.message)">
              {{scope.row.message}}
            </el-link>
          </div>
        </template>
      </el-table-column>
      <el-table-column :label="$t('lbl.job.status')" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :value="scope.row.status" :options="dict.type.alarm_job_status" />
        </template>
      </el-table-column>
      <el-table-column :label="$t('lbl.job.severity')" align="center" prop="severity">
        <template slot-scope="scope">
          <dict-tag :value="scope.row.severity" :options="dict.type.alarm_job_severity" />
        </template>
      </el-table-column>
      <el-table-column :label="$t('lbl.job.remark')" align="center" prop="remark">
        <template slot-scope="scope">
          <div class="content-wrapper">
            <el-tooltip :content="scope.row.remark">
              <span class="truncate-text">{{ scope.row.remark }}</span>
            </el-tooltip>
          </div>
        </template>
      </el-table-column>
      <el-table-column :label="$t('lbl.job.createTime')" align="center" prop="createTime" width="160"/>
      <el-table-column :label="$t('operate')" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['alarm:job:edit']"
          >{{$t("btnEdit")}}</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['alarm:job:remove']"
          >{{$t("btnRemove")}}</el-button>
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

    <!-- 添加或修改Alarm Job对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="640px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item :label="$t('lbl.job.alarmId')" prop="alarmId">
          <el-input v-model="form.alarmId" :placeholder="$t('plh.job.alarmId')" />
        </el-form-item>
        <el-form-item :label="$t('lbl.job.severity')" prop="severity">
          <el-input v-model="form.severity" :placeholder="$t('plh.job.severity')" />
        </el-form-item>
        <el-form-item :label="$t('lbl.job.remark')" prop="remark">
          <el-input v-model="form.remark" type="textarea" :placeholder="$t('plh.job.remark')" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">{{$t("Submit")}}</el-button>
        <el-button @click="cancel">{{$t("Cancel")}}</el-button>
      </div>
    </el-dialog>

    <!-- <el-drawer title="Json Viewer" :visible.sync="drawer">
      <el-link :underline="false" icon="el-icon-document-copy" v-clipboard:copy="JSON.stringify(jsonData)" v-clipboard:success="clipboardSuccess" style="float:right; margin-right: 10px;">复制</el-link>
      <vue-json-pretty :data="jsonData" showLineNumber style="margin: 10px;"/>
    </el-drawer> -->
    <yaml-viewer
      v-model="jsonData"
      :visible.sync="drawer"
      title="View YAML"
      direction="rtl"
      width="50%"
      fileName="config.yaml"
    />
  </div>
</template>

<script>
import { listJob, getJob, delJob, addJob, updateJob } from "@/api/alarm/job";
import YamlViewer from '@/components/YamlViewer'

export default {
  name: "Job",
  dicts: ['alarm_job_status','alarm_job_severity'],
  components: {
    YamlViewer
  },
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
      // Alarm Job表格数据
      jobList: [],
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
        alarmId: null,
        message: null,
        status: null,
        severity: null,
      },
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
    /** 查询Alarm Job列表 */
    getList() {
      this.loading = true;
      listJob(this.queryParams).then(response => {
        this.jobList = response.rows;
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
        alarmId: null,
        message: null,
        status: null,
        severity: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
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
      getJob(id).then(response => {
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
            updateJob(this.form).then(response => {
              this.$modal.msgSuccess(this.$t("editSuccessfully"));
              this.open = false;
              this.getList();
            });
          } else {
            addJob(this.form).then(response => {
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
        return delJob(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess(this.$t("deletedSuccessfully"));
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('alarm/job/export', {
        ...this.queryParams
      }, `job_${new Date().getTime()}.xlsx`)
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