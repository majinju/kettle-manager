<template>
  <div>
    <el-select v-model="value1" multiple placeholder="Select">
    </el-select>
      <el-tag
        v-for="tag in params.tags"
        :key="tag.name"
        closable
        :type="tag.type"
      >
        {{tag.name}}
      </el-tag>
  </div>
</template>

<script>
import {reactive,defineComponent} from 'vue'
export default defineComponent({
  setup(){
    const params = reactive({
      tags: [
        { name: '标签一', type: '' },
        { name: '标签二', type: 'success' },
        { name: '标签三', type: 'info' },
        { name: '标签四', type: 'warning' },
        { name: '标签五', type: 'danger' }
      ]
    })
    return{
      params
    }
  }
})
</script>
