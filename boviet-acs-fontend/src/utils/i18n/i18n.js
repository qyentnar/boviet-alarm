import VueI18n from "vue-i18n";
import Vue from "vue";
import locale from "element-ui/lib/locale";
import enLocale from "element-ui/lib/locale/lang/en";
import zhLocale from "element-ui/lib/locale/lang/zh-CN";
import viLocale from "element-ui/lib/locale/lang/vi";
import Cookies from 'js-cookie'
import { getPageLang } from "@/api/system/lang";

Vue.use(VueI18n);

// Định nghĩa ngôn ngữ mặc định và mảng ngôn ngữ hợp lệ
let language = Cookies.get("language") || "zh-CN";
const languageArr = ["zh-CN", "en-US", "vi-VN"];
if (languageArr.indexOf(language) === -1) {
    language = "zh-CN";
}

// Khai báo i18n mà không cần gán giá trị cho messages ban đầu
const i18n = new VueI18n({
    locale: language,
    messages: {}
});

const data = {
    lang: language
}
// Lấy dữ liệu ngôn ngữ từ API và cập nhật i18n sau khi dữ liệu được nhận
getPageLang(data).then(res => {
    const lang = res.data;
    i18n.setLocaleMessage('en-US', Object.assign(enLocale, lang));
    i18n.setLocaleMessage('zh-CN', Object.assign(zhLocale, lang));
    i18n.setLocaleMessage('vi-VN', Object.assign(viLocale, lang));
}).catch(error => {
    console.error('Lỗi khi lấy dữ liệu ngôn ngữ từ API:', error);
});

// Thiết lập i18n cho Element UI
locale.i18n((key, value) => i18n.t(key, value));

export default i18n;
