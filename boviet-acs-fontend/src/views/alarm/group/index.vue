<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item :label="$t('lbl.group.groupName')" prop="groupName">
        <el-input
          v-model="queryParams.groupName"
          :placeholder="$t('plh.group.groupName')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('lbl.group.node1')" prop="node1">
        <el-input
          v-model="queryParams.node1"
          :placeholder="$t('plh.group.node1')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('lbl.group.node2')" prop="node2">
        <el-input
          v-model="queryParams.node2"
          :placeholder="$t('plh.group.node2')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('lbl.group.node3')" prop="node3">
        <el-input
          v-model="queryParams.node3"
          :placeholder="$t('plh.group.node3')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('lbl.group.node4')" prop="node4">
        <el-input
          v-model="queryParams.node4"
          :placeholder="$t('plh.group.node4')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('lbl.group.node5')" prop="node5">
        <el-input
          v-model="queryParams.node5"
          :placeholder="$t('plh.group.node5')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('lbl.group.node6')" prop="node6">
        <el-input
          v-model="queryParams.node6"
          :placeholder="$t('plh.group.node6')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('lbl.group.node7')" prop="node7">
        <el-input
          v-model="queryParams.node7"
          :placeholder="$t('plh.group.node7')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('lbl.group.node8')" prop="node8">
        <el-input
          v-model="queryParams.node8"
          :placeholder="$t('plh.group.node8')"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item :label="$t('lbl.group.node9')" prop="node9">
        <el-input
          v-model="queryParams.node9"
          :placeholder="$t('plh.group.node9')"
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
          v-hasPermi="['alarm:group:add']"
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
          v-hasPermi="['alarm:group:edit']"
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
          v-hasPermi="['alarm:group:remove']"
        >{{$t("btnRemove")}}</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['alarm:group:export']"
        >{{$t("btnExport")}}</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="groupList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column :label="$t('lbl.group.groupName')" align="center" prop="groupName" />
      <el-table-column :label="$t('lbl.group.node1')" align="center" prop="node1" />
      <el-table-column :label="$t('lbl.group.node2')" align="center" prop="node2" />
      <el-table-column :label="$t('lbl.group.node3')" align="center" prop="node3" />
      <el-table-column :label="$t('lbl.group.node4')" align="center" prop="node4" />
      <el-table-column :label="$t('lbl.group.node5')" align="center" prop="node5" />
      <el-table-column :label="$t('lbl.group.node6')" align="center" prop="node6" />
      <el-table-column :label="$t('lbl.group.node7')" align="center" prop="node7" />
      <el-table-column :label="$t('lbl.group.node8')" align="center" prop="node8" />
      <el-table-column :label="$t('lbl.group.node9')" align="center" prop="node9" />
      <el-table-column :label="$t('lbl.main.actions')" align="center" prop="action">
        <template slot-scope="scope">
          <el-tag type="info" size="mini"  effect="dark" v-for="action in scope.row.actions" style="margin-right: 10px;">
            {{ action.actionName }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column :label="$t('lbl.group.remark')" align="center" prop="remark" />
      <el-table-column :label="$t('operate')" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['alarm:group:edit']"
          >{{$t("btnEdit")}}</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['alarm:group:remove']"
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

    <!-- 添加或修改Alarm Group对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="960px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item :label="$t('lbl.group.groupName')" prop="groupName">
              <el-input v-model="form.groupName" :placeholder="$t('plh.group.groupName')" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.group.node1')" prop="node1">
              <el-input v-model="form.node1" :placeholder="$t('plh.group.node1')" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.group.node2')" prop="node2">
              <el-input v-model="form.node2" :placeholder="$t('plh.group.node2')" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.group.node3')" prop="node3">
              <el-input v-model="form.node3" :placeholder="$t('plh.group.node3')" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.group.node4')" prop="node4">
              <el-input v-model="form.node4" :placeholder="$t('plh.group.node4')" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.group.node5')" prop="node5">
              <el-input v-model="form.node5" :placeholder="$t('plh.group.node5')" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.group.node6')" prop="node6">
              <el-input v-model="form.node6" :placeholder="$t('plh.group.node6')" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.group.node7')" prop="node7">
              <el-input v-model="form.node7" :placeholder="$t('plh.group.node7')" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.group.node8')" prop="node8">
              <el-input v-model="form.node8" :placeholder="$t('plh.group.node8')" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.group.node9')" prop="node9">
              <el-input v-model="form.node9" :placeholder="$t('plh.group.node9')" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.group.actionId')" prop="actionIds">
              <el-select v-model="form.actionIds" :placeholder="$t('plh.group.actionId')" multiple clearable filterable style="width: 100%;">
                <el-option v-for="item in actionOptions"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item :label="$t('lbl.group.remark')" prop="remark">
              <el-input v-model="form.remark" type="textarea" :placeholder="$t('plh.group.remark')" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">{{$t("Submit")}}</el-button>
        <el-button @click="cancel">{{$t("Cancel")}}</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listGroup, getGroup, delGroup, addGroup, updateGroup } from "@/api/alarm/group";
import { listAction } from "@/api/alarm/action";

export default {
  name: "Group",
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
      // Alarm Group表格数据
      groupList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        groupId: null,
        groupName: null,
        node1: null,
        node2: null,
        node3: null,
        node4: null,
        node5: null,
        node6: null,
        node7: null,
        node8: null,
        node9: null,
      },
      // 表单参数
      form: {},

      actionOptions: [],
      // 表单校验
      rules: {
        groupName: [
          { required: true, message: this.$t("req.group.groupName"), trigger: "blur" }
        ],
        actionIds: [
          { required: true, message: this.$t("req.group.actionIds"), trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询Alarm Group列表 */
    getList() {
      this.loading = true;
      listGroup(this.queryParams).then(response => {
        this.groupList = response.rows;
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
        groupId: null,
        groupName: null,
        node1: null,
        node2: null,
        node3: null,
        node4: null,
        node5: null,
        node6: null,
        node7: null,
        node8: null,
        node9: null,
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
      listAction().then(response => {
        this.actionOptions = response.rows.map(item => ({
          label: item.actionName,
          value: item.actionId
        }));
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getGroup(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = this.$t("titleEditForm");
        this.$set(this.form, "actionIds", response.actionIds);
        listAction().then(response => {
          this.actionOptions = response.rows.map(item => ({
            label: item.actionName,
            value: item.actionId
          }));
        });
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateGroup(this.form).then(response => {
              this.$modal.msgSuccess(this.$t("editSuccessfully"));
              this.open = false;
              this.getList();
            });
          } else {
            addGroup(this.form).then(response => {
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
        return delGroup(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess(this.$t("deletedSuccessfully"));
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('alarm/group/export', {
        ...this.queryParams
      }, `group_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
