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
import { mapState, mapMutations} from "vuex";
export default {
  name: "login",
  created() {
    if (this.storeInfo.storeId) {
         this.$router.replace({ name: `home`,query: { storeId: this.storeInfo.storeId}});
    }
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
  computed: {
  ...mapState({
    storeInfo: state => state.storeInfo,
    }),
  },
  methods: {
    ...mapMutations([
      "changeStoreData",
    ]),
    login() {
      let that = this;
      if(!that.storeId){
         that.result.show = true;
         that.result.message = '门店序号不能为空';
         setTimeout(function(){
            that.result.show = false;
         },2000)
         return false
      }
      apiLogin(this.storeId).then(res => {
        that.result.show = true;
        that.result.message = res.message;
        setTimeout(function() {
          that.result.show = false;
          if (!res.status) {
            return false;
          }
          that.changeStoreData(res.data)
          that.$router.replace({ name: `home`,query: { storeId: res.data.storeId }});
        }, 2000);
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
  left: 50%;
  transform: translateX(-50%);
  font-size: .16rem;
  background-color: rgba($color: #000000, $alpha: .9);
  color: #fff;
  border-radius: 0.06rem;
}
</style>
