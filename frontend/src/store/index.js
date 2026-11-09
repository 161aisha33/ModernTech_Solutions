import { createStore } from 'vuex'
import axios from 'axios'

export default createStore({
  state: {
    employeeInfo: []
  },
  getters: {
    employeeInfo: state => state.employeeInfo
  },
  mutations: {
    setEmployeeInfo(state, data) {
      state.employeeInfo = data
    }
  },
  actions: {
    async getEmployeeInfo({ commit }) {
      try {
        const response = await axios.get(`${process.env.VUE_APP_API_URL}/employee_information`);
        commit('setEmployeeInfo', response.data);
      } catch (error) {
        console.error(error);
      }
    },
  },
  modules: {
  }
})
