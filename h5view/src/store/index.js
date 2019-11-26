import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    storeInfo: localStorage.getItem("store") || ""
  },
  mutations: {},
  actions: {},
  modules: {}
});
