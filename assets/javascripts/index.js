import Turbolinks from "turbolinks"
import '../stylesheets/main.scss';
import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue/dist/vue.esm.js';
import './events/flash-delete-button.js';
import NewUserForm from './components/users/NewUserForm.vue';
import SignIn from './components/logins/SignIn.vue';

Turbolinks.start()
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  new Vue({
    el: "#app",
    components: {
      'new-user-form': NewUserForm,
      'sign-in': SignIn,
    }
  });
});
