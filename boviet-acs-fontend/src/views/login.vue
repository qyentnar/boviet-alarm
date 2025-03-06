<template>
  <div class="login">
    <el-form
      ref="loginForm"
      :model="loginForm"
      :rules="loginRules"
      class="login-form"
    >
      <h3 class="title">{{this.$i18n.t("loginTitle")}}</h3>
      <el-form-item prop="username">
        <el-input
          v-model="loginForm.username"
          type="text"
          auto-complete="off"
          :placeholder="`${this.$i18n.t('plh_account')}`"
        >
          <svg-icon
            slot="prefix"
            icon-class="user"
            class="el-input__icon input-icon"
          />
        </el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input
          v-model="loginForm.password"
          type="password"
          auto-complete="off"
          :placeholder="`${this.$i18n.t('plh_password')}`"
          @keyup.enter.native="handleLogin"
        >
          <svg-icon
            slot="prefix"
            icon-class="password"
            class="el-input__icon input-icon"
          />
        </el-input>
      </el-form-item>
      <el-form-item prop="code" v-if="captchaEnabled">
        <el-input
          v-model="loginForm.code"
          auto-complete="off"
          :placeholder="`${this.$i18n.t('login.input.validCode')}`"
          style="width: 63%"
          @keyup.enter.native="handleLogin"
        >
          <svg-icon
            slot="prefix"
            icon-class="validCode"
            class="el-input__icon input-icon"
          />
        </el-input>
        <div class="login-code">
          <img :src="codeUrl" @click="getCode" class="login-code-img" />
        </div>
      </el-form-item>
      <el-form-item>
        <el-row>
          <el-col :span="12" align="left">
            <el-checkbox v-model="loginForm.rememberMe">
              {{ this.$i18n.t("rememberMe") }}
            </el-checkbox>
          </el-col>
          <el-col :span="12" align="right">
            <el-select
              v-model="loginForm.language"
              placeholder="Select Language"
              size="small"
              style="width: 90%"
              @change = "handleChangeLanguage"
            >
              <el-option
                v-for="item in languageOptions"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              />
            </el-select>
          </el-col>
        </el-row>
      </el-form-item>
      <el-form-item style="width: 100%">
        <el-button
          :loading="loading"
          size="medium"
          type="primary"
          style="width: 100%"
          @click.native.prevent="handleLogin"
        >
          <span v-if="!loading">{{ this.$i18n.t("Login") }}</span>
          <span v-else>{{this.$i18n.t("Loging in...")}}</span>
        </el-button>
        <div style="float: right" v-if="register">
          <router-link class="link-type" :to="'/register'">
            立即注册
          </router-link>
        </div>
      </el-form-item>
    </el-form>
    <!--  底部  -->
    <div class="el-login-footer">
      <span>Copyright © 2024 Boviet Solar.</span>
    </div>
  </div>
</template>

<script>
import { getCodeImg } from "@/api/login";
import Cookies from "js-cookie";
import { encrypt, decrypt } from "@/utils/jsencrypt";
import LanguageSelect from "@/components/LanguageSelect";

export default {
  name: "Login",
  components: {
    LanguageSelect,
  },
  data() {
    return {
      codeUrl: "",
      loginForm: {
        username: "admin",
        password: "admin123",
        rememberMe: false,
        code: "",
        uuid: "",
        language: Cookies.get("language") || "zh-CN",
      },
      loginRules: {
        username: [
          { required: true, trigger: "blur", message: "请输入您的账号" },
        ],
        password: [
          { required: true, trigger: "blur", message: "请输入您的密码" },
        ],
        code: [{ required: true, trigger: "change", message: "请输入验证码" }],
      },
      loading: false,
      // 验证码开关
      captchaEnabled: false,
      // 注册开关
      register: false,
      redirect: undefined,
      languageOptions: [
        { value: "zh-CN", label: "中文" },
        { value: "en-US", label: "English" },
        { value: "vi-VN", label: "Tiếng Việt" },
      ],
      chooseLanguage: "zh-CN",
    };
  },
  watch: {
    $route: {
      handler: function (route) {
        this.redirect = route.query && route.query.redirect;
      },
      immediate: true,
    },
  },
  created() {
    this.getCode();
    this.getCookie();
  },
  methods: {
    getCode() {
      getCodeImg().then((res) => {
        this.captchaEnabled =
          res.captchaEnabled === undefined ? true : res.captchaEnabled;
        if (this.captchaEnabled) {
          this.codeUrl = "data:image/gif;base64," + res.img;
          this.loginForm.uuid = res.uuid;
        }
      });
    },
    getCookie() {
      const username = Cookies.get("username");
      const password = Cookies.get("password");
      const rememberMe = Cookies.get("rememberMe");
      const language = Cookies.get("language");
      this.loginForm = {
        username: username === undefined ? this.loginForm.username : username,
        password: password === undefined ? this.loginForm.password : decrypt(password),
        rememberMe: rememberMe === undefined ? false : Boolean(rememberMe),
        language: language === undefined ? "zh-CN" : this.loginForm.language
      };
    },
    handleLogin() {
      this.$refs.loginForm.validate((valid) => {
        if (valid) {
          this.loading = true;
          if (this.loginForm.rememberMe) {
            Cookies.set("username", this.loginForm.username, { expires: 30 });
            Cookies.set("password", encrypt(this.loginForm.password), {
              expires: 30,
            });
            Cookies.set("rememberMe", this.loginForm.rememberMe, {
              expires: 30,
            });

            Cookies.set("language", this.loginForm.language, {
              expires: 30,
            });
          } else {
            Cookies.remove("username");
            Cookies.remove("password");
            Cookies.remove("rememberMe");
            Cookies.remove("language");
          }

          this.$store
            .dispatch("Login", this.loginForm)
            .then(() => {
              this.$router.push({ path: this.redirect || "/" }).catch(() => {});
            })
            .catch(() => {
              this.loading = false;
              if (this.captchaEnabled) {
                this.getCode();
              }
            });
        }
      });
    },
    handleChangeLanguage(languageKey) {
      this.chooseLanguage = languageKey;
      Cookies.set("language", this.chooseLanguage, { expires: 30 });
      this.setWebLanguage();
    },
    setWebLanguage() {
      let language = Cookies.get("language");
      if (language != null && language != "" && language != undefined) {
        this.chooseLanguage = language;
      } else {
        let systemLanguage = (
          navigator.language || navigator.userLanguage
        ).substring(0, 2);
        if (
          systemLanguage != null &&
          systemLanguage != "" &&
          systemLanguage != undefined
        ) {
          this.getCode = systemLanguage;
        }
      }
      if (this.chooseLanguage == "en" || this.chooseLanguage == "en-US") {
        this.chooseLanguage = "en-US";
      } else if (
        this.chooseLanguage == "zh" ||
        this.chooseLanguage == "zh-CN"
      ) {
        this.chooseLanguage = "zh-CN";
      } else {
        this.chooseLanguage = "vi-VN";
      }

      var time = new Date().getTime();
      let timeNumber = time + 3 * 365 * 24 * 60 * 60;
      Cookies.set("language", this.chooseLanguage, { expires: timeNumber });

      localStorage.setItem("language", this.chooseLanguage);
      this.$i18n.locale = this.chooseLanguage;
      document.title = this.$i18n.t("login.title");
      location.reload();
    },
  },
};
</script>

<style rel="stylesheet/scss" lang="scss">
.login {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  //background-image: url("../assets/images/login-background.jpg");
  background-size: cover;
  background-color: #f0f2f5;
}
.title {
  margin: 0px auto 30px auto;
  text-align: center;
  color: #707070;
}

.login-form {
  border-radius: 6px;
  background: #ffffff;
  width: 400px;
  padding: 25px 25px 25px 25px;
  box-shadow: -5px 15px 25px gray;
  .el-input {
    height: 38px;
    input {
      height: 38px;
    }
  }
  .input-icon {
    height: 39px;
    width: 14px;
    margin-left: 2px;
  }
}
.login-tip {
  font-size: 13px;
  text-align: center;
  color: #bfbfbf;
}
.login-code {
  width: 33%;
  height: 38px;
  float: right;
  img {
    cursor: pointer;
    vertical-align: middle;
  }
}
.el-login-footer {
  height: 40px;
  line-height: 40px;
  position: fixed;
  bottom: 0;
  width: 100%;
  text-align: center;
  color: #fff;
  font-family: Arial;
  font-size: 12px;
  letter-spacing: 1px;
}
.login-code-img {
  height: 38px;
}
</style>
