<template>
  <div id="app">
    <div class="nav-title">
      <p class="title">{{storeInfo.storeName || '登录'}}</p>
      <div @click="changeOutcontent(true)" class="btn" :class="{active:storeInfo.storeId == '' }">登出</div>
    </div>
    <div class="out-con" v-show="isShowOutCon">
      <div class="prompt-con">
        <div class="content">确认退出登录?</div>
        <div class="ft">
          <span class="ft-item" @click="changeOutcontent(false)">取消</span>
          <span @click="loginOut" class="ft-item color-y">确定</span>
        </div>
      </div>
    </div>
    <router-view class="h5-con"/>
  </div>
</template>
<script>
import { mapState, mapMutations } from "vuex";
export default {
  data() {
    return {
      isShowOutCon:false
    };
  },
  computed: {
    ...mapState({
      storeInfo: state => state.storeInfo
    })
  },
  methods: {
    ...mapMutations(["changeStoreData"]),
    loginOut() {
      this.changeStoreData({ storeId: "", store_name: "" });
      this.changeOutcontent(false)
      this.$router.replace({ name: `login` });
    },
    changeOutcontent(status){
      this.isShowOutCon =  status
    }
  }
};
</script>

<style lang="scss">
* {
  box-sizing: border-box;
  margin: 0;
}
.color-y {
  color: #f36e20;
}
#app {
  background-color: #1c1c1c;
  overflow: hidden;
}
.h5-con {
  border-top-left-radius: 0.18rem;
  border-top-right-radius: 0.18rem;
  overflow: hidden;
  background-color: #fff;
  height: calc(100vh - 0.45rem);
  margin-top: 0.45rem;
}
.nav-title {
  height: 0.45rem;
  padding-top: 0.05rem;
  width: 100%;
  position: fixed;
  top: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  background-color: #1c1c1c;
  .title {
    font-weight: 700;
    font-size: 0.18rem;
  }
  .btn {
    position: absolute;
    right: 0.05rem;
    font-size: 0.14rem;
    padding: 0.12rem 0.1rem;
    line-height: 1;
    &.active {
      display: none;
    }
  }
}
.out-con {
  position: fixed;
  width: 100vw;
  height: 100vh;
  z-index: 10;
  background-color: rgba($color: #000000, $alpha: 0.6);
  display: flex;
  align-items: center;
  justify-content: center;
  .prompt-con {
    width: 2.8rem;
    height: 1.65rem;
    font-size: 0.18rem;
    background-color: #fff;
    .content {
      line-height: 1.15rem;
      text-align: center;
      font-weight: 700;
      border-bottom: 1px solid #D2D3D5;
    }
    .ft {
      display: flex;
      width: 100%;
      height: 0.5rem;
      .ft-item{
        flex: 1;
        line-height: 0.5rem;
        text-align: center;
        &:first-child{
          border-right: 1px solid #D2D3D5;
        }
      }
    }
  }
}
</style>
