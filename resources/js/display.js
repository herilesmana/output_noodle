
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

// window.Vue = require('vue');
import Vue from 'vue';
import ElemetUI from 'element-ui';
import lang from 'element-ui/lib/locale/lang/en'
import locale from 'element-ui/lib/locale'
import './css/index.css';
locale.use(lang)
Vue.use(ElemetUI);

import Display from './components/display/index.vue';

const app = new Vue({
    el: '#app',
    render: h => h(Display)
});
