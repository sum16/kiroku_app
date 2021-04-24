import Vue from 'vue/dist/vue.esm'
import App from '../support_process_record.vue'

document.addEventListener('DOMContentLoaded', () => {

  new Vue({
    el: '#app',
    data() {
      return {
        message: 'Hello Vue!',
        message2: 'Hoge'
      }
    },
    mounted() {
      this.setMsg();
    },
    methods: {
      setMsg: function () {
        this.message = 'Set Message';
      },
      // ここから追記する
      changeMsg: function () { // 説明 2.13
        this.message = 'Changed Message'
      },
      // ここまで追記する
    }
  })
})




