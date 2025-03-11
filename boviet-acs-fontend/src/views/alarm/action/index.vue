<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item :label="$t('lbl.action.actionName')" prop="actionName">
        <el-input v-model="queryParams.actionName" :placeholder="$t('plh.action.actionName')" clearable
          @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-row>
        <el-col align="center">
          <el-form-item>
            <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">{{ $t("btnSearch")
              }}</el-button>
            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">{{ $t("btnReset") }}</el-button>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
          v-hasPermi="['alarm:action:add']">{{ $t("btnAdd") }}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
          v-hasPermi="['alarm:action:edit']">{{ $t("btnEdit") }}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['alarm:action:remove']">{{ $t("btnRemove") }}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['alarm:action:export']">{{ $t("btnExport") }}</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="actionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column :label="$t('lbl.action.id')" align="center" prop="id" width="80" />
      <el-table-column :label="$t('lbl.action.actionName')" align="center" prop="actionName" />
      <el-table-column :label="$t('lbl.action.remark')" align="center" prop="remark" />
      <el-table-column :label="$t('operate')" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleRegister(scope.row)"
            v-hasPermi="['alarm:action:register']">{{ $t("btnRegister") }}</el-button>
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['alarm:action:edit']">{{ $t("btnEdit") }}</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)"
            v-hasPermi="['alarm:action:remove']">{{ $t("btnRemove") }}</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />

    <!-- 添加或修改Alarm Action对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="640px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px" label-position="top">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item :label="$t('lbl.action.actionName')" prop="actionName">
              <el-input v-model="form.actionName" :placeholder="$t('plh.action.actionName')" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.action.emailTemplate')" prop="emailTemplate">
              <el-select v-model="form.emailTemplate" clearable filterable style="width: 100%">
                <el-option v-for="item in options.filter(x => x.templateType == 'EMAIL')" :key="item.templateId"
                  :label="item.templateName" :value="item.templateId">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.action.dingtalkGroupTemplate')" prop="dingtalkGroupTemplate">
              <el-select v-model="form.dingtalkGroupTemplate" clearable filterable style="width: 100%">
                <el-option v-for="item in options.filter(x => x.templateType == 'DINGTALK_GROUP')"
                  :key="item.templateId" :label="item.templateName" :value="item.templateId">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.action.dingtalkPersonTemplate')" prop="dingtalkPersonTemplate">
              <el-select v-model="form.dingtalkPersonTemplate" clearable filterable style="width: 100%">
                <el-option v-for="item in options.filter(x => x.templateType == 'DINGTALK_PERSON')"
                  :key="item.templateId" :label="item.templateName" :value="item.templateId">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.action.itsmTemplate')" prop="itsmTemplate">
              <el-select v-model="form.itsmTemplate" clearable filterable style="width: 100%">
                <el-option v-for="item in options.filter(x => x.templateType == 'ITSM')" :key="item.templateId"
                  :label="item.templateName" :value="item.templateId">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.action.watchTemplate')" prop="watchTemplate">
              <el-select v-model="form.watchTemplate" clearable filterable style="width: 100%">
                <el-option v-for="item in options.filter(x => x.templateType == 'WATCHER')" :key="item.templateId"
                  :label="item.templateName" :value="item.templateId">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item :label="$t('lbl.action.remark')" prop="remark">
              <el-input v-model="form.remark" type="textarea" :placeholder="$t('plh.action.remark')" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">{{ $t("btnSubmit") }}</el-button>
        <el-button @click="cancel">{{ $t("btnCancel") }}</el-button>
      </div>
    </el-dialog>

    <!-- 配置规则对话框 -->
    <yaml-editor v-model="yamlContent" :visible.sync="showEditor" @confirm="submitTemplate" />

    <!-- Transfer dialog -->
    <el-dialog :title="title" :visible.sync="openRegister" width="900px" append-to-body>
      <el-tabs v-model="activeTabs">
        <el-tab-pane label="EMAIL" name="EMAIL">
          <el-transfer
            class="register-transfer"
            filterable
            v-model="emailSelected"
            :data="transferData"
            :titles="['Email', 'Selected']"
            :props="{key: 'userUUID', label: 'email' }"/>
        </el-tab-pane>
        
        <el-tab-pane label="钉钉组" name="DINGTALK_GROUP">
          <el-transfer
            class="register-transfer"
            filterable
            v-model="dingtalkGroupSelected" label
            :data="transferData"
            :titles="['钉钉组', 'Selected']"
            :props="{key: 'userUUID', label: 'email' }"/>
        </el-tab-pane>

        <el-tab-pane label="钉钉人" name="DINGTALK_PERSON">
          <el-transfer
            class="register-transfer"
            filterable
            v-model="dingtalkPersonSelected"
            :data="transferData"
            :titles="['Workcode', 'Selected']"
            :props="{key: 'userUUID', label: 'userName' }"/>
        </el-tab-pane>

        <el-tab-pane label="ITSM" name="ITSM">
          <el-transfer
            class="register-transfer"
            filterable
            v-model="itsmSelected"
            :data="transferData"
            :titles="['Workcode', 'Selected']"
            :props="{key: 'userUUID', label: 'userName' }"/>
        </el-tab-pane>

        <el-tab-pane label="WATCHER" name="WATCHER">
          <el-transfer
            class="register-transfer"
            filterable
            v-model="watcherSelected"
            :data="transferData"
            :titles="['Watch ID', 'Selected']"
            :props="{key: 'userUUID', label: 'userName' }"/>
        </el-tab-pane>
      </el-tabs>

      <div slot="footer" class="dialog-footer">
        <el-button @click="openRegister = false">{{ $t("btnCancel") }}</el-button>
        <el-button type="primary" @click="handleRegisterSubmit">{{ $t("btnSubmit") }}</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listAction, getAction, delAction, addAction, updateAction, updateRegister } from "@/api/alarm/action";
import { getAlarmRegisterList } from "@/api/alarm/register";
import { getTemplateList } from "@/api/alarm/template";
import { getUserList } from "@/api/system/user";
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
      activeTabs: 'EMAIL',
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

      yamlContent: '',

      open: false,

      openRegister: false,
      emailSelected: [],
      dingtalkGroupSelected: [],
      dingtalkPersonSelected: [],
      itsmSelected: [],
      watcherSelected: [],
      transferData: [],
      showEditor: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        actionId: null,
        actionName: null,
      },
      options: [],
      // 表单参数
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        actionName: [
          { required: true, message: this.$t("req.action.actionName"), trigger: "blur" }
        ]
      },
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
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      getTemplateList().then(res => {
        this.options = res.data;
      })
      this.open = true;
      this.title = this.$t("titleAddForm");
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getAction(id).then(response => {
        this.form = response.data;
        const templates = response.data.templates;
        if (templates != null && templates != undefined) {
          templates.forEach(template => {
            if(template.templateType === "EMAIL"){
              this.form.emailTemplate = template.templateId;
            }else if(template.templateType === "DINGTALK_GROUP"){
              this.form.dingtalkGroupTemplate = template.templateId;
            }else if(template.templateType === "DINGTALK_PERSON"){
              this.form.dingtalkPersonTemplate = template.templateId;
            }else if(template.templateType === "ITSM"){
              this.form.itsmTemplate = template.templateId;
            }else if(template.templateType === "WATCHER"){
              this.form.watchTemplate = template.templateId;
            }
          });
        }
        getTemplateList().then(res => {
          this.options = res.data;
        })
        this.open = true;
        this.title = this.$t("titleEditForm");
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.templateIds = [
            this.form.emailTemplate,
            this.form.dingtalkGroupTemplate,
            this.form.dingtalkPersonTemplate,
            this.form.itsmTemplate,
            this.form.watchTemplate,
          ].filter(id => id != null);
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
      this.$modal.confirm(this.$t("confirmDetele") + ': ' + ids + ' ？').then(function () {
        return delAction(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess(this.$t("deletedSuccessfully"));
      }).catch(() => { });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('alarm/action/export', {
        ...this.queryParams
      }, `action_${new Date().getTime()}.xlsx`)
    },
    submitTemplate() {
      this.form.template = this.yamlContent;
      updateAction(this.form).then(response => {
        this.$modal.msgSuccess(this.$t("editSuccessfully"));
        this.openConfig = false;
        this.getList();
      });
    },
    handleRegister(row) {
      this.reset();
      const id = row.id || this.ids
      getAction(id).then(response => {
        this.form = response.data;
        const query = { actionId: this.form.actionId }
        getAlarmRegisterList(query).then(response => {
          const data = response.data;
          data.forEach(item => {
            if(item.registerType === "EMAIL"){
              this.emailSelected.push(item.register);
            }else if(item.registerType === "DINGTALK_GROUP"){
              this.dingtalkGroupSelected.push(item.register);
            }else if(item.registerType === "DINGTALK_PERSON"){
              this.dingtalkPersonSelected.push(item.register);
            }else if(item.registerType === "ITSM"){
              this.itsmSelected.push(item.register);
            }else if(item.registerType === "WATCHER"){
              this.watcherSelected.push(item.register);
            }
          })
          this.openRegister = true;
          this.title = this.$t("titleRegisterForm");
          getUserList().then(response => {
            this.transferData = response.data
          })
        })
      });
    },
    handleRegisterSubmit(){
      this.form.registers = [];

      this.emailSelected.forEach(item => {
        this.form.registers.push({
          registerType: 'EMAIL',
          register: item
        })
      })

      this.dingtalkGroupSelected.forEach(item => {
        this.form.registers.push({
          registerType: 'DINGTALK_GROUP',
          register: item
        })
      })

      this.dingtalkPersonSelected.forEach(item => {
        this.form.registers.push({
          registerType: 'DINGTALK_PERSON',
          register: item
        })
      })

      this.itsmSelected.forEach(item => {
        this.form.registers.push({
          registerType: 'ITSM',
          register: item
        })
      })

      this.watcherSelected.forEach(item => {
        this.form.registers.push({
          registerType: 'WATCHER',
          register: item
        })
      })

      console.log(this.form)
      updateRegister(this.form).then(response => {
        this.$modal.msgSuccess(this.$t("editSuccessfully"));
        this.openRegister = false;
      })
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

<style lang="scss">
.register-transfer {
  .el-transfer-panel {
    width: 330px;
  }
}
</style>