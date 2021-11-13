<template>
  <div class="body">
    <router-view />
  </div>
</template>

<script>
import {mapGetters} from 'vuex';

export default {
  name: 'App',
  data(){
    return{
    }
  },
  components: {
  },
  mounted() {
    // this.$router.push("/home");
  },
  watch: {
  },
  computed:{
    ...mapGetters
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
