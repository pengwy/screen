<template>
  <div class="login">
    <p class="login-text">请输入门店序号 进入门店</p>
    <input type="number" class="login-input" v-model="storeId">
    <div class="login-btn" @click="login">登录</div>
    <div class="prompt" v-show="result.show">{{result.message}}</div>
  </div>
</template>
<script>
import {apiLogin } from "../http/api.js";

export default {
  name: "login",
  created() {

  },
  data() {
    return {
      storeId: "",
      result: {
        show: false,
        message: "请求成功"
      }
    };
  },
  methods: {
    login() {
      let that = this;
      apiLogin(this.storeId).then(res => {
        that.result.show = true;
        that.result.message = res.message;
        document.location = `https://www.youtube.com/?store=${this.storeId}`
        // Toaster.postMessage("JS调用了Flutter");
        // setTimeout(function() {
        //   that.result.show = false;
        //   if (!res.status) {
        //     return false;
        //   }
        //   that.$router.replace({ name: `home`,query: { storeId: res.data.storeId }});
        // }, 2000);
      });
    }
  }
};
</script>
<style lang="scss">
.login {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  padding-top: 1.17rem;
}
.login .login-text {
  margin-bottom: 0.2rem;
  font-size: 0.16rem;
  font-weight: bold;
  color: #1C1C1C;
}
.login .login-input {
  width: 3.3rem;
  height: 0.45rem;
  margin-bottom: 0.15rem;
  padding-left: .1rem;
  background-color: #EDEDED;
  border-radius: 0.05rem;
  outline: none;
  font-size: 0.16rem;
  border: none;
}
.login .login-btn {
  width: 3.3rem;
  height: 0.45rem;
  margin-bottom: 0.02rem;
  line-height: 0.45rem;
  text-align: center;
  font-size: 0.14rem;
  color: #fff;
  background-color: #F36E20;
  border-radius: 0.05rem;
}
.prompt{
  position: fixed;
  width: 2.1rem;
  height: 0.8rem;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
  top: 2.1rem;
  font-size: .16rem;
  background-color: rgba($color: #000000, $alpha: .9);
  color: #fff;
  border-radius: 0.06rem;
}
</style>
