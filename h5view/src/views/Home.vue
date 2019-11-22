<template>
  <div class="home">
    <div class="group-con" v-show="infoStatus.showType == 'group'">
      <div class="history">
        <p class="title">微信群聊天记录</p>
        <div class="chat-con">
            <div class="item">
              <img class="item-avatar" :src="groupInfo.items[0].avatar">
              <div class="right">
                <p class="item-name">{{groupInfo.items[0].nickname}}</p>
                <div class="item-content">
                  {{groupInfo.items[0].content}}
                </div>
              </div>
            </div>
            <p class="time">{{time}}</p>
            <div class="item" v-for="(item, index) in groupInfo.items" :key="index">
              <img class="item-avatar" :src="item.avatar">
              <div class="right"> 
                <p class="item-name">{{item.nickname}}</p>
                <div class="item-content">
                  {{item.content}}
                </div>
              </div>
            </div>
        </div>
      </div>
      <div class="qrcode-con">
        <img :src="groupInfo.qrcode" class="qrcode">
        <div> 
          <p class="color-y">维修扫码加群</p>
          <p>接受业主监督 公开透明交流</p>
        </div>
      </div>
    </div>
    <div class="card-con" v-show="infoStatus.showType == 'card'">
      <img src="./bg.png" class="bg">
      <p class="text-num">
        已送出{{cardInfo.num}}{{cardInfo.unit}}
      </p>
      <img :src="cardInfo.goods_img" class="goods-img">
      <img :src="cardInfo.mini_code" class="mini-code">
    </div>
    <div class="ft">
      <div class="ft-item" :class="{active:infoStatus.showType == 'group'}" @click="changetype('group')">
        门店微信群
      </div>
      <div class="ft-item" :class="{active:infoStatus.showType == 'card'}" @click="changetype('card')">
        会员送礼品
      </div>
    </div>
  </div>
</template>

<script>
import { apiCardInfo, apiGroupInfo } from "../http/api.js";

export default {
  name: "home",
  created() {
    // let taht = this;
    this.storeId = this.$route.query.storeId;
    this.initData();
    // setInterval(function(){
    //   taht.initData()
    // },2000)
  },
  data() {
    return {
      storeId: "",
      time:'上午9:40',
      infoStatus:{
        hasCardInfo:true,
        hasGroupInfo:true,
        showType:'group'
      },
      cardInfo:{

      },
      groupInfo:{
        items:[{avatar:'',content:'',nickname:''}],
        qrcode:''
      }
    };
  },
  methods: {
    initData() {
      apiCardInfo(this.storeId).then(e => {
        this.cardInfo = e.data
      });
      apiGroupInfo(this.storeId).then(e => {
        this.groupInfo = e.data
      });
    },
    changetype(type){
      this.infoStatus.showType =type
    }
  }
};
</script>
<style lang="scss" scoped>
.group-con{
  background-color: #fff;
  font-size: 0.16rem;
  .history{
    .title{
      color: #F36E20;
      text-align: center;
      padding: .17rem 0 .1rem 0;
      margin:  0 auto;
    }
    .chat-con{
      width: 3.3rem;
      padding:.14rem 0; 
      margin: 0 auto;
      max-height: 3.7rem;
      background-color: #EDEDED;
      overflow: scroll;
      border-radius: 0.1rem;
    }
    .time{
      font-size: .12rem;
      color: #999;
      padding-bottom: 0.15rem;
      text-align: center;
    }
    .item{
      padding: 0 .16rem;
      margin-bottom: .16rem;
      display: flex;
      .item-avatar{
        width: 0.4rem;
        height: 0.4rem;
        margin-right: 0.06rem;
        border-radius: 0.04rem;
        margin-top: 0.03rem;
      }
      .right{
        width: 2.6rem;
        position: relative;
      }
      .item-name{
        font-size: 0.12rem;
        color: #999;
        margin-bottom: 0.06rem;
      }
      .item-content{
        padding: 0.12rem;
        border-radius: 0.04rem;
        background-color: #fff;
      }
    }
  }
  .qrcode-con{
    margin: .16rem auto 0;
    width: 3.3rem;
    height: 0.9rem;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 0.1rem;
    background-color: #EDEDED;
    .qrcode{
      width: 0.6rem;
      height: 0.6rem;
      margin-right: 0.1rem;
    }
  }
}
.card-con{
  position: relative;
  height: 100vh;
  background-color: #1C1C1C;
  .bg{
    display: block;
    width: 3.3rem;
    height: 5.15rem;
    margin: 0 auto;
  }
  .text-num{
    position: absolute;
    top: 1.11rem;
    width: 100%;
    text-align: center;
    font-size: .16rem;
    color: #fff;
    line-height: 1;
  }
  .goods-img{
    position: absolute;
    width: 2.4rem;
    height: 2.4rem;
    border-radius: 0.1rem;
    top: 1.46rem;
    left: 50%;
    transform: translateX(-50%);
    right: 0;
  }
  .mini-code{
    width: 0.4rem;
    height: 0.4rem;
    position: absolute;
    top: 4.49rem;
     left: 0.3rem;
    right: 0;
  }
}

.ft{
  position: fixed;
  bottom: 0;
  width: 3.6rem;
  height: 0.45rem;
  display: flex;
  background-color: #F36E20;
  font-size: .16rem;
  border-top-left-radius: 0.1rem;
  border-top-right-radius: 0.1rem;
  .ft-item{
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    flex: 1;
    color: #fff;
    &::after{
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 0.24rem;
        border-top: 0.02rem solid #F36E20;
        
      }
    &.active{
      &::after{
        border-color: #fff
      }
    }
  }
}
.color-y{
  color: #F36E20
}
</style>
