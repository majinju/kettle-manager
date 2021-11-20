<template>
  <div class="body">
    <router-view />
  </div>
</template>

<script>

export default {
  name: 'App',
  components: {
  },
  data(){
    return{
    }
  },
  created() {
    // 在页面加载时读取sessionStorage
    if (sessionStorage.getItem('store')) {
      this.$store.replaceState(Object.assign({}, this.$store.state, JSON.parse(sessionStorage.getItem('store'))))
    }
    // 在页面刷新时将store保存到sessionStorage里
    window.addEventListener('beforeunload', () => {
      sessionStorage.setItem('store', JSON.stringify(this.$store.state))
    })
  },
  mounted() {
  },
  watch: {
  }
}
</script>

<style>
@import "./style/main.css";
.body{
  position: relative;
  width: 100%;
  height: 100vh;
  background-size: 100%;
  margin: 0;
  padding: 0;
}
</style>
