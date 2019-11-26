<template>
  <div id="app">
    <div class="nav-title">
      <p class="title">{{storeInfo.storeName || '登录'}}</p>
      <div @click="loginOut" class="btn" :class="{active:storeInfo.storeId == '' }">
        登出
      </div>
    </div>
    <router-view class="h5-con"/>
  </div>
</template>
<script>
import { mapState, mapMutations} from "vuex";
export default {
   computed: {
  ...mapState({
      storeInfo: state => state.storeInfo,
    }),
  },
  methods:{
    ...mapMutations([
      "changeStoreData",
    ]),
    loginOut(){
      this.changeStoreData({storeId:'',store_name:''})
      this.$router.replace({ name: `login` });
    }
  }
}
</script>

<style lang="scss">
*{
  box-sizing: border-box;
  margin: 0;
}
#app{
  background-color: #1C1C1C;
  overflow: hidden;
}
.h5-con{
    border-top-left-radius: .18rem;
    border-top-right-radius: .18rem;
    overflow: hidden;
    background-color: #fff;
    height: calc(100vh - .45rem);
    margin-top: .45rem;
}
.nav-title{
  height: .45rem;
  width: 100%;
  position: fixed;
  top: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  background-color: #1C1C1C;
  .title{
    font-weight: 700;
    font-size: .18rem;
  }
  .btn{
    position: absolute;
    right: .05rem;
    font-size: .14rem;
    padding: .12rem .1rem;
    line-height: 1;
    &.active{
      display: none;
    }
  }
}
</style>
