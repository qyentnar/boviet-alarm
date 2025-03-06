<template>
  <el-dropdown trigger="click" @command="handleSetLanguage">
    <div>
      <svg-icon class-name="language-icon" icon-class="language" />
    </div>
    <el-dropdown-menu slot="dropdown">
      <el-dropdown-item
        v-for="item of langOptions"
        :key="item.value"
        :disabled="language === item.value"
        :command="item.value"
      >
        {{ item.label }}
      </el-dropdown-item>
    </el-dropdown-menu>
  </el-dropdown>
</template>

<script>
import { updateLanguage } from "@/api/system/user";

export default {
  data() {
    return {
      langOptions: [
        { label: "中文", value: "zh-CN" },
        { label: "English", value: "en-US" },
        { label: "Tiếng Việt", value: "vi-VN" },
      ],
    };
  },
  computed: {
    language() {
      return this.$store.getters.language;
    },
  },
  methods: {
    handleSetLanguage(language) {
      this.$ELEMENT.language = language;
      this.$store.dispatch("app/setLanguage", language);
      this.$i18n.locale = language;
      const userId = this.$store.getters.id;
      updateLanguage(userId, language).then((res) => {
        this.refreshView();
        this.$message({
          message: "Switch Language Success",
          type: "success",
        });
      });
    },
    refreshView() {
      this.$store.dispatch("tagsView/delAllCachedViews", this.$route);
      const { fullPath } = this.$route;
      this.$nextTick(() => {
        location.reload();
      });
    },
  },
};
</script>
