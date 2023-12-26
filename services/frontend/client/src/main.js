import './assets/main.css';

import { createApp } from 'vue';
import { createPinia } from 'pinia';

import App from './App.vue';

// Vuetify
import { createVuetify } from 'vuetify';
import 'vuetify/styles';
import * as components from 'vuetify/components';
import * as directives from 'vuetify/directives';

const app = createApp(App);

app.use(createPinia());

const vuetify = createVuetify({
  components,
  directives,
});

app.use(vuetify);

app.mount('#app');
