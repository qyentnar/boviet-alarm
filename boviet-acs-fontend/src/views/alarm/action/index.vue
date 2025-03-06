<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item :label="$t('lbl.action.actionName')" prop="actionName">
        <el-input
          v-model="queryParams.actionName"
          :placeholder="$t('plh.action.actionName')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('lbl.action.actionType')" prop="actionType">
        <el-input
          v-model="queryParams.actionType"
          :placeholder="$t('plh.action.actionType')"
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
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['alarm:action:add']"
        >{{$t("btnAdd")}}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['alarm:action:edit']"
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
          v-hasPermi="['alarm:action:remove']"
        >{{$t("btnRemove")}}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['alarm:action:export']"
        >{{$t("btnExport")}}</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="actionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column :label="$t('lbl.action.id')" align="center" prop="id" width="80" />
      <el-table-column :label="$t('lbl.action.actionName')" align="center" prop="actionName" />
      <el-table-column :label="$t('lbl.action.actionType')" align="center" prop="actionType" />
      <el-table-column :label="$t('lbl.action.config')" align="center" prop="config">
        <template slot-scope="scope" v-if="scope.row.config">
          <div class="content-wrapper">
            <el-link class="truncate-text" @click="handleOpenDetails(scope.row.config)">
              {{scope.row.config}}
            </el-link>
          </div>
        </template>
      </el-table-column>
      <el-table-column :label="$t('lbl.action.template')" align="center" prop="template">
        <template slot-scope="scope" v-if="scope.row.template">
          <div class="content-wrapper">
            <el-link class="truncate-text" @click="handleOpenDetails(scope.row.template)">
              {{scope.row.template}}
            </el-link>
          </div>
        </template>
      </el-table-column>
      <el-table-column :label="$t('lbl.action.remark')" align="center" prop="remark" />
      <el-table-column :label="$t('operate')" align="center" class-name="small-padding fixed-width" >
        <template slot-scope="scope">
          <el-button
              size="mini"
              type="text"
              icon="el-icon-s-operation"
              @click="handleConfigRules(scope.row)"
              v-hasPermi="['alarm:action:config']"
            >{{$t("Config")}}</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['alarm:action:edit']"
          >{{$t("btnEdit")}}</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['alarm:action:remove']"
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

    <!-- 添加或修改Alarm Action对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="640px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item :label="$t('lbl.action.actionType')">
          <el-select v-model="form.actionType" clearable filterable @change="handleSelectionChange">
            <el-option v-for="item in actionOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item :label="$t('lbl.action.actionName')" prop="actionName">
          <el-input v-model="form.actionName" :placeholder="$t('plh.action.actionName')" />
        </el-form-item>

        <!-- Email -->
        <template v-if="form.actionType == 'EMAIL'">
          <el-form-item :label="$t('lbl.config.Username')">
            <el-input v-model="config.Username" :placeholder="$t('plh.config.Username')" />
          </el-form-item>
          <el-form-item :label="$t('lbl.config.Password')">
            <el-input v-model="config.Password" :placeholder="$t('plh.config.Password')" />
          </el-form-item>
          <el-form-item :label="$t('lbl.config.smtpHost')">
            <el-input v-model="config.smtpHost" :placeholder="$t('plh.config.smtpHost')" />
          </el-form-item>
          <el-form-item :label="$t('lbl.config.smtpPort')">
            <el-input v-model="config.smtpPort" :placeholder="$t('plh.config.smtpPort')" />
          </el-form-item>
          <el-form-item :label="$t('lbl.config.smtpAuth')">
            <el-input v-model="config.smtpAuth" :placeholder="$t('plh.config.smtpAuth')" />
          </el-form-item>
          <el-form-item :label="$t('lbl.config.smtpSslEnable')">
            <el-input v-model="config.smtpSslEnable" :placeholder="$t('plh.config.smtpSslEnable')" />
          </el-form-item>
          <el-form-item :label="$t('lbl.config.sendTo')">
            <el-input v-model="config.sendTo" :placeholder="$t('plh.config.sendTo')" />
          </el-form-item>
        </template>

        <!-- DingDing -->
        <template v-else-if="form.actionType == 'DINGDING'">
          <el-form-item :label="$t('lbl.config.webhook')">
            <el-input v-model="config.webhook" :placeholder="$t('plh.config.webhook')" />
          </el-form-item>
        </template>

        <el-form-item :label="$t('lbl.action.remark')" prop="remark">
          <el-input v-model="form.remark" type="textarea" :placeholder="$t('plh.action.remark')" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">{{$t("Submit")}}</el-button>
        <el-button @click="cancel">{{$t("Cancel")}}</el-button>
      </div>
    </el-dialog>

    <el-drawer title="Viewer" :visible.sync="drawer">
      <el-link :underline="false" icon="el-icon-document-copy" v-clipboard:copy="JSON.stringify(jsonData)" v-clipboard:success="clipboardSuccess" style="float:right; margin-right: 10px;">复制</el-link>
      <vue-json-pretty :data="jsonData" showLineNumber style="margin: 10px;"/>
    </el-drawer>

    <el-dialog :title="title" :visible.sync="openConfig" width="640px" append-to-body>
      <yaml-editor v-model="yamlContent" :options="{ readOnly: false, lineNumbers: true }"/>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitTemplate">{{$t("Submit")}}</el-button>
        <el-button @click="() => { openConfig = false}">{{$t("Cancel")}}</el-button>
      </div>
    </el-dialog>

    <el-drawer title="Json Viewer" :visible.sync="drawer">
      <el-link :underline="false" icon="el-icon-document-copy" v-clipboard:copy="JSON.stringify(jsonData)" v-clipboard:success="clipboardSuccess" style="float:right; margin-right: 10px;">复制</el-link>
      <vue-json-pretty :data="jsonData" showLineNumber style="margin: 10px;"/>
    </el-drawer>
  </div>
</template>

<script>
import { listAction, getAction, delAction, addAction, updateAction } from "@/api/alarm/action";
import "codemirror/mode/yaml/yaml.js";
import 'codemirror/theme/monokai.css';
import 'codemirror/addon/lint/lint.css';
import 'codemirror/addon/lint/lint';
import 'codemirror/addon/lint/yaml-lint';
import jsyaml from 'js-yaml';

window.jsyaml = jsyaml;

export default {
  name: "Action",
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
      // Alarm Action表格数据
      actionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      drawer: false,
      openConfig: false,
      // 编辑或添加的数据
      jsonData: "",
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        actionId: null,
        actionName: null,
        config: null,
      },
      // 表单参数
      form: {},
      config: {},
      actionOptions: [
        { value: "EMAIL", label: "Email" },
        { value: "DINGDING", label: "钉钉" },
        { value: "ITSM", label: "Itsm" },
        { value: "WATCHER", label: "Watcher" }
      ],
      // 表单校验
      rules: {
      },
      yamlContent: "",
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询Alarm Action列表 */
    getList() {
      this.loading = true;
      listAction(this.queryParams).then(response => {
        this.actionList = response.rows;
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
        actionId: null,
        actionName: null,
        config: null,
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
      getAction(id).then(response => {
        this.form = response.data;
        this.config = JSON.parse(this.form.config);
        this.open = true;
        this.title = this.$t("titleEditForm");
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.config = JSON.stringify(this.config);
          if (this.form.id != null) {
            updateAction(this.form).then(response => {
              this.$modal.msgSuccess(this.$t("editSuccessfully"));
              this.open = false;
              this.getList();
            });
          } else {
            addAction(this.form).then(response => {
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
        return delAction(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess(this.$t("deletedSuccessfully"));
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('alarm/action/export', {
        ...this.queryParams
      }, `action_${new Date().getTime()}.xlsx`)
    },
    handleSelectionChange(val){
      this.config = {};
    },
    handleOpenDetails(text){
      this.drawer = true;
      try{
        this.jsonData =  JSON.parse(text);
      }
      catch(e){
        this.jsonData = text;
      }
    },
    handleConfigRules(row){
      this.reset();
      const id = row.id || this.ids
      getAction(id).then(response => {
          this.form = response.data;
          this.yamlContent = this.form.rules == null ? "" : this.form.rules;
          this.title = "Config Rules";
          this.openConfig = true;
      });
    },
    clipboardSuccess() {
      this.$modal.msgSuccess("复制成功");
    },
    submitTemplate(){
      this.form.template = this.yamlContent;
      updateAction(this.form).then(response => {
        this.$modal.msgSuccess(this.$t("editSuccessfully"));
        this.openConfig = false;
        this.getList();
      });
    }
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