<template>
    <div class="app-container">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="120px">
        <el-form-item :label="$t('lbl.main.systemName')" prop="systemName">
          <el-input
            v-model="queryParams.systemName"
            :placeholder="$t('plh.main.systemName')"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item :label="$t('lbl.main.module1')" prop="module1">
          <el-input
            v-model="queryParams.module1"
            :placeholder="$t('plh.main.module1')"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item :label="$t('lbl.main.module2')" prop="module2">
          <el-input
            v-model="queryParams.module2"
            :placeholder="$t('plh.main.module2')"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item :label="$t('lbl.main.module3')" prop="module3">
          <el-input
            v-model="queryParams.module3"
            :placeholder="$t('plh.main.module3')"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item :label="$t('lbl.main.module4')" prop="module4">
          <el-input
            v-model="queryParams.module4"
            :placeholder="$t('plh.main.module4')"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item :label="$t('lbl.main.groupId')" prop="groupId">
          <el-select v-model="queryParams.groupId" :placeholder="$t('plh.main.groupId')" clearable filterable>
            <el-option v-for="item in groupOptions"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
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
            v-hasPermi="['alarm:main:add']"
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
            v-hasPermi="['alarm:main:edit']"
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
            v-hasPermi="['alarm:main:remove']"
          >{{$t("btnRemove")}}</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExport"
            v-hasPermi="['alarm:main:export']"
          >{{$t("btnExport")}}</el-button>
        </el-col>
        <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
      </el-row>
  
      <el-table v-loading="loading" :data="mainList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column :label="$t('lbl.main.id')" align="center" prop="id" />
        <el-table-column :label="$t('lbl.main.alarmId')" align="center" prop="alarmId">
          <template slot-scope="scope">
            <div class="content-wrapper">
              <el-tooltip :content="scope.row.alarmId" placement="top" effect="dark">
                <el-link class="truncate-text" v-clipboard:copy="(scope.row.alarmId)" v-clipboard:success="onCopySuccess">
                  {{scope.row.alarmId}}
                </el-link>
              </el-tooltip>
            </div>
          </template>
        </el-table-column>
        <el-table-column :label="$t('lbl.main.systemName')" align="center" prop="systemName" />
        <el-table-column :label="$t('lbl.main.module1')" align="center" prop="module1" />
        <el-table-column :label="$t('lbl.main.module2')" align="center" prop="module2" />
        <el-table-column :label="$t('lbl.main.module3')" align="center" prop="module3" />
        <el-table-column :label="$t('lbl.main.module4')" align="center" prop="module4" />
        <el-table-column :label="$t('lbl.main.status')" align="center" prop="status">
          <template slot-scope="scope">
            <el-tag :type="scope.row.status == 1 ? 'primary' : 'danger'" size="small"  effect="light">
              {{ scope.row.status == 1 ? '正常' : '停用' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column :label="$t('lbl.main.rules')" align="center" prop="rules">
          <template slot-scope="scope">
            <el-tag :type="scope.row.rules != null && scope.row.rules != '' ? 'success' : 'danger'" size="small"  effect="dark">
              {{ scope.row.rules != null && scope.row.rules != '' ? 'configured' : 'not configured' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column :label="$t('lbl.main.groups')" align="center" prop="group">
          <template slot-scope="scope">
            <el-tag type="info" size="mini"  effect="dark" v-for="group in scope.row.groups" style="margin-right: 10px;">
              {{ group.groupName }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column :label="$t('lbl.main.remark')" align="center" prop="remark" />
        <el-table-column :label="$t('operate')" align="center" class-name="small-padding fixed-width" width="200" fixed="right">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-s-operation"
              @click="handleConfigRules(scope.row)"
              v-hasPermi="['alarm:main:config']"
            >{{$t("Config")}}</el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['alarm:main:edit']"
            >{{$t("btnEdit")}}</el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['alarm:main:remove']"
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
  
      <!-- 添加或修改Alarm Main对话框 -->
      <el-dialog :title="title" :visible.sync="open" width="640px" append-to-body>
        <el-form ref="form" :model="form" :rules="rules" label-width="120px">
          <el-form-item :label="$t('lbl.main.systemName')" prop="systemName">
            <el-input v-model="form.systemName" :placeholder="$t('plh.main.systemName')" />
          </el-form-item>
          <el-form-item :label="$t('lbl.main.module1')" prop="module1">
            <el-input v-model="form.module1" :placeholder="$t('plh.main.module1')" />
          </el-form-item>
          <el-form-item :label="$t('lbl.main.module2')" prop="module2">
            <el-input v-model="form.module2" :placeholder="$t('plh.main.module2')" />
          </el-form-item>
          <el-form-item :label="$t('lbl.main.module3')" prop="module3">
            <el-input v-model="form.module3" :placeholder="$t('plh.main.module3')" />
          </el-form-item>
          <el-form-item :label="$t('lbl.main.module4')" prop="module4">
            <el-input v-model="form.module4" :placeholder="$t('plh.main.module4')" />
          </el-form-item>
          <el-form-item :label="$t('lbl.main.groupId')" prop="groupIds">
            <el-select v-model="form.groupIds" :placeholder="$t('plh.main.groupId')" multiple clearable filterable style="width: 100%;">
                <el-option v-for="item in groupOptions"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                </el-option>
              </el-select>
          </el-form-item>
          <el-form-item :label="$t('lbl.main.remark')" prop="remark">
            <el-input v-model="form.remark" type="textarea" :placeholder="$t('plh.main.remark')" />
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button type="primary" @click="submitForm">{{$t("Submit")}}</el-button>
          <el-button @click="cancel">{{$t("Cancel")}}</el-button>
        </div>
      </el-dialog>

      <el-dialog :title="title" :visible.sync="openConfig" width="640px" append-to-body>
        <yaml-editor v-model="yamlContent" :options="{ readOnly: false, lineNumbers: true }"/>
        <div slot="footer" class="dialog-footer">
          <el-button type="primary" @click="submitConfigRules">{{$t("Submit")}}</el-button>
          <el-button @click="() => { openConfig = false}">{{$t("Cancel")}}</el-button>
        </div>
      </el-dialog>
    </div>
  </template>
  
  <script>
  import { listMain, getMain, delMain, addMain, updateMain, updateRules } from "@/api/alarm/main";
  import { listGroup } from "@/api/alarm/group";
  import "codemirror/mode/yaml/yaml.js";
  import 'codemirror/theme/monokai.css';
  import 'codemirror/addon/lint/lint.css';
  import 'codemirror/addon/lint/lint';
  import 'codemirror/addon/lint/yaml-lint';
  import jsyaml from 'js-yaml';
  
  window.jsyaml = jsyaml;

  export default {
    name: "Main",
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
        // Alarm Main表格数据
        mainList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        openConfig: false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          alarmId: null,
          systemName: null,
          module1: null,
          module2: null,
          module3: null,
          module4: null,
          status: null,
          groupId: null,
        },
        // 表单参数
        form: {},

        groupOptions: [],
        // 表单校验
        rules: {
          systemName: [
            { required: true, message: this.$t("req.main.systemName"), trigger: "blur" }
          ],
          groupIds: [
            { required: true, message: this.$t("req.main.groupId"), trigger: "blur" }
          ],
        },
        yamlContent: "",
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询Alarm Main列表 */
      getList() {
        this.loading = true;
        listMain(this.queryParams).then(response => {
          this.mainList = response.rows;
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
          systemName: null,
          module1: null,
          module2: null,
          module3: null,
          module4: null,
          status: null,
          groupId: null,
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
        listGroup().then(res => {
            this.groupOptions = res.rows.map(item => ({
              label: item.groupName,
              value: item.groupId
            }));
        });
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const id = row.id || this.ids
        getMain(id).then(response => {
            this.form = response.data;
            this.open = true;
            this.title = this.$t("titleEditForm");
            this.$set(this.form, "groupIds", response.groupIds);
            listGroup().then(res => {
                this.groupOptions = res.rows.map(item => ({
                    label: item.groupName,
                    value: item.groupId
                }));
            });
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.id != null) {
              updateMain(this.form).then(response => {
                this.$modal.msgSuccess(this.$t("editSuccessfully"));
                this.open = false;
                this.getList();
              });
            } else {
              addMain(this.form).then(response => {
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
          return delMain(ids);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess(this.$t("deletedSuccessfully"));
        }).catch(() => {});
      },
      /** 导出按钮操作 */
      handleExport() {
        this.download('alarm/main/export', {
          ...this.queryParams
        }, `main_${new Date().getTime()}.xlsx`)
      },
      handleConfigRules(row){
        this.reset();
        const id = row.id || this.ids
        getMain(id).then(response => {
            this.form = response.data;
            this.yamlContent = this.form.rules == null ? "" : this.form.rules;
            this.title = "Config Rules";
            this.openConfig = true;
        });
      },
      submitConfigRules(){
        this.form.rules = this.yamlContent;
        updateRules(this.form).then(response => {
          this.$modal.msgSuccess(this.$t("editSuccessfully"));
          this.openConfig = false;
          this.getList();
        });
      },
      onCopySuccess() {
        this.$message.success(this.$t("copySuccessfully"));
      }
    }
  };
</script>
<style lang="scss">
  .editor-container {
    margin-bottom: 15px;
  }

  .editor-container .CodeMirror {
    height: 400px;
    border: 1px solid #dcdfe6;
    border-radius: 4px;
  }

  .yaml-error {
    margin-top: 10px;
  }

  /* Customize lint markers */
  .CodeMirror-lint-marker-error {
    width: 16px;
    height: 16px;
  }

  .CodeMirror-lint-message-error {
    padding-left: 20px;
  }
  /* Optional: Add a toolbar */
  .editor-toolbar {
    margin-bottom: 10px;
  }

  /* Improve gutter appearance */
  .CodeMirror-gutters {
    border-right: 1px solid #dcdfe6;
    background-color: #f5f7fa;
  }

  /* Improve active line visibility */
  .CodeMirror-activeline-background {
    background: rgba(255, 255, 255, 0.1);
  }

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