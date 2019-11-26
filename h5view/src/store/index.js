import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    storeInfo: {
      storeId: localStorage.getItem("storeId") || "",
      storeName: localStorage.getItem("storeName") || ""
    }
  },
  mutations: {
    changeStoreData(state, val) {
      state.storeInfo.storeId = val.storeId;
      state.storeInfo.storeName = val.store_name;
      localStorage.storeId = val.storeId;
      localStorage.storeName = val.store_name;
    }
  },
  actions: {},
  modules: {}
});
