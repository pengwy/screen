<template>
    <div class="login">
      <p class="login-text">请输入门店序号进入门第</p>
      <input type="text" class="login-input" v-model="storeId">
      <div class="login-btn" @click="login">登录</div>
      <p class="login-pron">门店序号请询问智慧门店服务人员</p>
    </div>
</template>
<script>
import { apiCardInfo, apiGroupInfo, apiLogin } from "../http/api.js";

export default {
  name: "login",
  created() {
    apiCardInfo(12).then(e => {
      console.log(e);
    });
    apiGroupInfo(12).then(e => {
      console.log(e);
    });
  },
  data(){
    return {
      storeId:''
    }
  },
  methods:{
    login(){
      apiLogin(this.storeId).then(res =>{
        if(res.status){
          alert(res.data.storeId)
        }
      })
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
}
.login .login-text {
  margin-bottom: 0.2rem;
  font-size: 0.16rem;
  font-weight: bold;
}
.login .login-input {
  width: 80%;
  height: 0.5rem;
  margin-bottom: 0.2rem;
  border: 1px solid #ececec;
  outline: none;
  font-size: 0.16rem;
}
.login .login-btn {
  width: 80%;
  height: 0.4rem;
  margin-bottom: 0.02rem;
  line-height: 0.4rem;
  text-align: center;
  font-size: 0.14rem;
  color: #fff;
  background-color: blue;
  border-radius: 0.04rem;
}
.login .login-pron {
  font-size: 0.14rem;
}
</style>
