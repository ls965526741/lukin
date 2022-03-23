import App from './App'

import uView from 'uview-ui'
Vue.use(uView)

// 引入请求封装，将app参数传递到配置中
require('./utils/request.js')(app)

// #ifndef VUE3
import Vue from 'vue'
Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({ ...App })

app.$mount()
// #endif

// #ifdef VUE3
import { createSSRApp } from 'vue'
export function createApp() {
  const app = createSSRApp(App)
  return { app }
}
// #endif
