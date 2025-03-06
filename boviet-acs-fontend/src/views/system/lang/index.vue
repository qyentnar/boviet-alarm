<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="120px">
      <el-form-item :label="`${this.$i18n.t('lbl.lang.langType')}`" prop="langType">
        <el-select v-model="queryParams.langType" @change="onChangeType">
          <el-option
            v-for="item in typeOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value"/>
        </el-select>
      </el-form-item>
      <el-form-item :label="`${this.$i18n.t('lbl.lang.langKey')}`" prop="langKey" v-show="!isMenu">
        <el-input
          v-model="queryParams.langKey"
          :placeholder="`${this.$i18n.t('plh.lang.langKey')}`"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="`${this.$i18n.t('lbl.lang.langZh')}`" prop="langZh">
        <el-input
          v-model="queryParams.langZh"
          :placeholder="`${this.$i18n.t('plh.lang.langZh')}`"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="`${this.$i18n.t('lbl.lang.langEn')}`" prop="langEn">
        <el-input
          v-model="queryParams.langEn"
          :placeholder="`${this.$i18n.t('plh.lang.langEn')}`"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="`${this.$i18n.t('lbl.lang.langVi')}`" prop="langVi">
        <el-input
          v-model="queryParams.langVi"
          :placeholder="`${this.$i18n.t('plh.lang.langVi')}`"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="`${this.$i18n.t('lbl.lang.menuId')}`" prop="menuId">
        <el-input
          v-model="queryParams.menuId"
          :placeholder="`${this.$i18n.t('plh.lang.menuId')}`"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-row>
        <el-col align="center">
          <el-form-item>
            <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">{{this.$i18n.t("btnSearch")}}</el-button>
            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">{{this.$i18n.t("btnReset")}}</el-button>
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
          v-hasPermi="['system:lang:add']"
        >{{this.$i18n.t("btnAdd")}}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:lang:edit']"
        >{{this.$i18n.t("btnEdit")}}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:lang:remove']"
        >{{this.$i18n.t("btnRemove")}}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:lang:export']"
        >{{this.$i18n.t("btnExport")}}</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="langList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column :label="`${this.$i18n.t('lbl.lang.id')}`" align="center" prop="id" />
      <el-table-column :label="`${this.$i18n.t('lbl.lang.langKey')}`" align="center" prop="langKey" />
      <el-table-column :label="`${this.$i18n.t('lbl.lang.langType')}`" align="center" prop="langType" />
      <el-table-column :label="`${this.$i18n.t('lbl.lang.langZh')}`" align="center" prop="langZh" />
      <el-table-column :label="`${this.$i18n.t('lbl.lang.langEn')}`" align="center" prop="langEn" />
      <el-table-column :label="`${this.$i18n.t('lbl.lang.langVi')}`" align="center" prop="langVi" />
      <el-table-column :label="`${this.$i18n.t('lbl.lang.menuId')}`" align="center" prop="menuId" />
      <el-table-column :label="`${this.$i18n.t('lbl.lang.remark')}`" align="center" prop="remark" />
      <el-table-column :label="`${this.$i18n.t('operate')}`" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:lang:edit']"
          >{{$i18n.t("btnEdit")}}</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:lang:remove']"
          >{{$i18n.t("btnRemove")}}</el-button>
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

    <!-- 添加或修改系统语言对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="680px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item :label="`${this.$i18n.t('lbl.lang.langType')}`" prop="langType">
          <el-select v-model="form.langType" @change="onChangeType" :disabled="isEdit">
            <el-option
              v-for="item in typeOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"/>
          </el-select>
        </el-form-item>
        <el-form-item :label="`${this.$i18n.t('lbl.lang.langKey')}`" prop="langKey" v-show="!isMenu">
          <el-input v-model="form.langKey" :placeholder="`${this.$i18n.t('plh.lang.langKey')}`" />
        </el-form-item>
        <el-form-item :label="`${this.$i18n.t('lbl.lang.langZh')}`" prop="langZh">
          <el-input v-model="form.langZh" :placeholder="`${this.$i18n.t('plh.lang.langZh')}`" />
        </el-form-item>
        <el-form-item :label="`${this.$i18n.t('lbl.lang.langEn')}`" prop="langEn">
          <el-input v-model="form.langEn" :placeholder="`${this.$i18n.t('plh.lang.langEn')}`" />
        </el-form-item>
        <el-form-item :label="`${this.$i18n.t('lbl.lang.langVi')}`" prop="langVi">
          <el-input v-model="form.langVi" :placeholder="`${this.$i18n.t('plh.lang.langVi')}`" />
        </el-form-item>
        <el-form-item :label="`${this.$i18n.t('lbl.lang.menuId')}`" prop="menuId" v-show="isMenu">
          <el-select v-model="form.menuId" :placeholder="`${this.$i18n.t('plh.lang.menuId')}`">
            <el-option
              v-for="menu in menuList"
              :key="menu.menuId"
              :label="`${menu.menuId} :${menu.menuName}`"
              :value="menu.menuId"
              re
            />
          </el-select>
          <!-- <el-input v-model="form.menuId" :placeholder="`${this.$i18n.t('plh.lang.menuId')}`" /> -->
        </el-form-item>
        <el-form-item :label="`${this.$i18n.t('lbl.lang.remark')}`" prop="remark">
          <el-input v-model="form.remark" type="textarea" :placeholder="`${this.$i18n.t('plh.lang.remark')}`" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">{{this.$i18n.t("formSubmit")}}</el-button>
        <el-button @click="cancel">{{this.$i18n.t("formCancel")}}</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listLang, getLang, delLang, addLang, updateLang } from "@/api/system/lang";
import { listMenuId } from "@/api/system/menu";

export default {
  name: "Lang",
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
      isMenu: false,
      isEdit: false,
      // 总条数
      total: 0,
      // 系统语言表格数据
      langList: [],
      menuList: [],
      typeOptions: [
        { label: "Page", value: "Page"},
        { label: "Menu", value: "Menu"},
      ],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        langKey: null,
        langType: "Page",
        langZh: null,
        langEn: null,
        langVi: null,
        menuId: null,
      },
      // 表单参数
      form: {
        langType: "Page",
      },
      // 表单校验
      rules: {
        langType: [{ required: true, message: this.$i18n.t('req.lang.langType'), trigger: "blur" } ],
        langZh: [{ required: true, message: this.$i18n.t('req.lang.langZh'), trigger: "blur" } ],
        langEn: [{ required: true, message: this.$i18n.t('req.lang.langEn'), trigger: "blur" } ],
        langVi: [{ required: true, message: this.$i18n.t('req.lang.langVi'), trigger: "blur" } ],
        menuId: [{ required: false, message: this.$i18n.t('req.lang.menuId'), trigger: "blur" } ],
      }
    };
  },
  created() {
    this.getList();
    this.getMenuList();
  },
  methods: {
    /** 查询系统语言列表 */
    getList() {
      this.loading = true;
      listLang(this.queryParams).then(response => {
        this.langList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
      
    },
    getMenuList(){
      this.loading = true;
      listMenuId().then(response => {
        this.menuList = response.data;
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
        langKey: null,
        langType: "Page",
        langZh: null,
        langEn: null,
        langVi: null,
        menuId: null,
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
      this.isEdit = false;
      this.title = `${this.$i18n.t('titleAddForm')}`;
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getLang(id).then(response => {
        this.form = response.data;
        this.onChangeType();
        this.open = true;
        this.isEdit = true;
        this.title = `${this.$i18n.t('titleEditForm')}`;
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateLang(this.form).then(response => {
              this.$modal.msgSuccess(`${this.$i18n.t('editSuccessfully')}`);
              this.open = false;
              this.getList();
            });
          } else {
            addLang(this.form).then(response => {
              this.$modal.msgSuccess(`${this.$i18n.t('addSuccessfully')}`);
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
      this.$modal.confirm(`${this.$i18n.t('confirmDetele')}` + ': ' + ids + ' ？').then(function() {
        return delLang(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess(`${this.$i18n.t('deletedSuccessfully')}`);
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/lang/export', {
        ...this.queryParams
      }, `lang_${new Date().getTime()}.xlsx`)
    },
    onChangeType() {
      if(this.form.langType == "Menu"){
        this.isMenu = true;
        this.rules.menuId = [{required: true, message: this.$i18n.t('req.lang.menuId'), trigger: "blur"}];
      }else{
        this.isMenu = false;
        this.rules.menuId = [{required: false, message: this.$i18n.t('req.lang.menuId'), trigger: "blur"}];
      }
    }
  }
};
</script>
