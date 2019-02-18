
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

// window.Vue = require('vue');
import Vue from 'vue';
import ElemetUI from 'element-ui';
import VueRouter from 'vue-router';
import lang from 'element-ui/lib/locale/lang/en'
import locale from 'element-ui/lib/locale'
import './css/index.css';
locale.use(lang)
Vue.use(ElemetUI);
Vue.use(VueRouter);

import OBase from './components/OBase.vue';
import Home from './components/Home.vue';
import UserGet from './components/users/GetUser.vue';
import CreateTarget from './components/target/Create.vue';

const routes = [
    { path: '/home', component: Home },
    { path: '/users', component: UserGet },
    { path: '/target/create', component: CreateTarget }
]

const router = new VueRouter({
    routes
})
/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

// Vue.component('example-component', require('./components/ExampleComponent.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    router,
    render: h => h(OBase)
});
