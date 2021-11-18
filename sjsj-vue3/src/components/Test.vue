<template>
  <div>
    <b-code-editor v-model="jsonStr" :indent-unit="4" height="auto"/>
  </div>
</template>
<script>
const jsonData = `{"title":"测试json数据","children":[{"name":"子项名称", "desc":"子项说明" },{"name":"子项名称1", "desc":"子项说明1" }]}`

export default {
  data() {
    return {
      jsonStr: jsonData
    }
  }
}
</script>
