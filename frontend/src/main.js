import './assets/scss/main.scss';

import { createApp } from 'vue';
import App from './App.vue';
import router from './router';

const config = {
  production: {
    api: 'http://localhost:3000',
  },
};

createApp(App)
  .provide('api', config[import.meta.env.MODE || 'production'].api)
  .use(router)
  .mount('#app');
