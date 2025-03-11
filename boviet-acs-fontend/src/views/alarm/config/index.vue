<template>
  <div class="app-container">
    <el-tabs v-model="activeTab" @tab-click="getList">
      <!-- Email Tab -->
      <el-tab-pane :label="$t('lbl.action.email')" name="EMAIL">
        <el-row :gutter="20">
          <el-col :span="12" :offset="0">
            <el-form :model="config" ref="emailConfig" :rules="rules" label-width="120px" :inline="false" size="normal">
              <el-form-item :label="$t('lbl.config.Username')">
                <el-input v-model="config.Username" :placeholder="$t('plh.config.Username')" />
              </el-form-item>
              <el-form-item :label="$t('lbl.config.Password')">
                <el-input v-model="config.Password" :placeholder="$t('plh.config.Password')" show-password/>
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
              <el-form-item>
                <el-button type="primary" @click="onSubmit">立即创建</el-button>
                <el-button>取消</el-button>
              </el-form-item>
            </el-form>
          </el-col>
        </el-row>
      </el-tab-pane>

      <!-- DingDing Tab -->
      <el-tab-pane :label="$t('lbl.action.dingding.group')" name="DINGDING_GROUP">
        <el-row :gutter="20">
          <el-col :span="12" :offset="0">
            <el-form :model="config" ref="dingdingConfig" :rules="rules" label-width="120px" :inline="false"
              size="normal">
              <el-form-item :label="$t('lbl.config.webhook')">
                <el-input v-model="config.webhook" :placeholder="$t('plh.config.webhook')" />
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="onSubmit">立即创建</el-button>
                <el-button>取消</el-button>
              </el-form-item>
            </el-form>
          </el-col>
        </el-row>
      </el-tab-pane>

      <el-tab-pane :label="$t('lbl.action.dingding.person')" name="DINGDING_PERSON">
        <el-row :gutter="20">
          <el-col :span="12" :offset="0">
            <el-form :model="config" ref="dingdingConfig" :rules="rules" label-width="120px" :inline="false"
              size="normal">
              <el-form-item :label="$t('lbl.config.webhook')">
                <el-input v-model="config.webhook" :placeholder="$t('plh.config.webhook')" />
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="onSubmit">立即创建</el-button>
                <el-button>取消</el-button>
              </el-form-item>
            </el-form>
          </el-col>
        </el-row>
      </el-tab-pane>

      <el-tab-pane :label="$t('lbl.action.itsm')" name="ITSM">
        <el-row :gutter="20">
          <el-col :span="12" :offset="0">
            <el-form :model="config" ref="dingdingConfig" :rules="rules" label-width="120px" :inline="false"
              size="normal">
              <el-form-item :label="$t('lbl.config.webhook')">
                <el-input v-model="config.webhook" :placeholder="$t('plh.config.webhook')" />
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="onSubmit">立即创建</el-button>
                <el-button>取消</el-button>
              </el-form-item>
            </el-form>
          </el-col>
        </el-row>
      </el-tab-pane>

      <el-tab-pane :label="$t('lbl.action.watcher')" name="WATCHER">
        <el-row :gutter="20">
          <el-col :span="12" :offset="0">
            <el-form :model="config" ref="dingdingConfig" :rules="rules" label-width="120px" :inline="false"
              size="normal">
              <el-form-item :label="$t('lbl.config.webhook')">
                <el-input v-model="config.webhook" :placeholder="$t('plh.config.webhook')" />
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="onSubmit">立即创建</el-button>
                <el-button>取消</el-button>
              </el-form-item>
            </el-form>
          </el-col>
        </el-row>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import { listConfig, getConfig, delConfig, addConfig, updateConfig } from "@/api/alarm/config";

export default {
  name: "Config",
  data() {
    return {
      // 遮罩层
      loading: true,
      // Active tab
      activeTab: 'EMAIL',
      // 表单数据
      config: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询Alarm Config列表 */
    getList() {
      this.loading = true;
      this.config = {};
      getConfig(this.activeTab).then(response => {
        const data = response.data;
        if (data != null && data.config != null) {
          this.config = JSON.parse(data.config);
        }
        this.loading = false;
      });
    },
    /** 提交按钮 */
    onSubmit() {
      const form = {
        configType: this.activeTab,
        configName: this.activeTab,
        config: JSON.stringify(this.config)
      }
      updateConfig(form).then(response => {
        this.$modal.msgSuccess(this.$t("editSuccessfully"));
        this.getList();
      });
    }
  }
};
</script>
