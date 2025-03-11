<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item :label="$t('lbl.template.templateId')" prop="templateId">
        <el-input
          v-model="queryParams.templateId"
          :placeholder="$t('plh.template.templateId')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('lbl.template.templateName')" prop="templateName">
        <el-input
          v-model="queryParams.templateName"
          :placeholder="$t('plh.template.templateName')"
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
          v-hasPermi="['alarm:template:add']"
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
          v-hasPermi="['alarm:template:edit']"
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
          v-hasPermi="['alarm:template:remove']"
        >{{$t("btnRemove")}}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['alarm:template:export']"
        >{{$t("btnExport")}}</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="templateList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column :label="$t('lbl.template.id')" align="center" prop="id" />
      <el-table-column :label="$t('lbl.template.templateName')" align="center" prop="templateName" />
      <el-table-column :label="$t('lbl.template.templateType')" align="center" prop="templateType" />
      <el-table-column :label="$t('lbl.template.template')" align="center" prop="template">
        <template slot-scope="scope">
          <el-tag :type="scope.row.template != null && scope.row.template != '' ? 'success' : 'danger'" size="small"
            effect="dark">
            {{ scope.row.template != null && scope.row.template != '' ? 'Configured' : 'Not configured' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column :label="$t('lbl.template.remark')" align="center" prop="remark" />
      <el-table-column :label="$t('operate')" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['alarm:template:edit']"
          >{{$t("btnEdit")}}</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['alarm:template:remove']"
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

    <!-- 添加或修改Alarm Template对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="840px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px" label-position="top">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item :label="$t('lbl.template.templateName')" prop="templateName">
              <el-input v-model="form.templateName" :placeholder="$t('plh.template.templateName')" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.template.templateType')" prop="templateType">
              <el-select v-model="form.templateType" clearable filterable style="width: 100%;">
                <el-option v-for="item in options"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
              
            </el-form-item>
          </el-col>
          <!-- <el-col :span="24">
            <el-form-item :label="$t('lbl.template.remark')" prop="remark">
              <el-input v-model="form.remark" :placeholder="$t('plh.template.remark')" />
            </el-form-item>
          </el-col> -->
          <el-col :span="24">
            <el-form-item :label="$t('lbl.template.template')" prop="template">
              <yaml-editor v-model="form.template" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">{{$t("btnSubmit")}}</el-button>
        <el-button @click="cancel">{{$t("btnCancel")}}</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listTemplate, getTemplate, delTemplate, addTemplate, updateTemplate } from "@/api/alarm/template";
import YamlEditor from "./components/YamlEditor.vue";

export default {
  name: "Template",
  components: {
    YamlEditor
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
      // Alarm Template表格数据
      templateList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        templateId: null,
        templateName: null,
        template: null,
      },
      // 表单参数
      form: {},
      // Template类型选项
      options: [
        { value: 'EMAIL', label: 'Email' },
        { value: 'DINGTALK_GROUP', label: 'Dingtalk Group' },
        { value: 'DINGTALK_PERSON', label: 'Dingtalk Person' },
        { value: 'ITSM', label: 'ITSM' },
        { value: 'WATCHER', label: 'Watcher' }
      ],
      // 表单校验
      rules: {
        templateName: [
          { required: true, message: this.$t("req.template.templateName"), trigger: "blur" }
        ],
        template: [
          { required: true, message: this.$t("req.template.template"), trigger: "blur" }
        ],
        templateType: [
          { required: true, message: this.$t("req.template.templateType"), trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询Alarm Template列表 */
    getList() {
      this.loading = true;
      listTemplate(this.queryParams).then(response => {
        this.templateList = response.rows;
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
        templateId: null,
        templateName: null,
        templateType: null,
        template: '',
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
      getTemplate(id).then(response => {
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
            updateTemplate(this.form).then(response => {
              this.$modal.msgSuccess(this.$t("editSuccessfully"));
              this.open = false;
              this.getList();
            });
          } else {
            addTemplate(this.form).then(response => {
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
        return delTemplate(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess(this.$t("deletedSuccessfully"));
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('alarm/template/export', {
        ...this.queryParams
      }, `template_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
