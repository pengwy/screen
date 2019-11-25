<template>
  <div id="app">
    <router-view class="h5-con"/>
  </div>
</template>

<style lang="scss">
*{
  box-sizing: border-box;
  margin: 0;
}
#app{
  background-color: #1C1C1C;
}
.h5-con{
    border-top-left-radius: .18rem;
    border-top-right-radius: .18rem;
    overflow: hidden;
    background-color: #fff;
}
</style>
