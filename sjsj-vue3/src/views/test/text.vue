<template>
  <div>
    <vxe-form :data="mydata.formdata" prevent-submit>
      <vxe-form-item title="字典类别" field="zdlb" span="24">
        <MyDownListMultiple
          v-model="mydata.formdata.zdlb"
          zdlb="SYS_COMMON_SJZT"
          :disabled="true"
        ></MyDownListMultiple>
      </vxe-form-item>

      <vxe-form-item title="级联选择器" field="jlxz" span="24">
        <MyCascader
          v-model="mydata.formdata.jlxz"
          zdlb="SYS_COMMON_ORG"
        ></MyCascader>
      </vxe-form-item>

      <vxe-form-item title="父节点" field="upnode" span="8">
        <template v-slot>
          <el-cascader
            placeholder="请先选择字典类别"
            :options="mydata.options"
            :props="{
                  value: 'dm',
                  label: 'mc',
                  checkStrictly: true,
                  emitPath: false,
                }"
            filterable
            clearable
            size="small"
            :show-all-levels="false"
            v-model="mydata.formdata.upnode"
          ></el-cascader>
        </template>
      </vxe-form-item>
      <vxe-form-item>
        <vxe-button size="medium" content="中等尺寸" @click="btn"></vxe-button>
      </vxe-form-item>
    </vxe-form>
    <div>
      <my-tabs zdlb="SYS_QX_QTQX" cllx="getTreeCN" fqx="KFZFW_QXGL" hight="300px"></my-tabs>
    </div>
  </div>
</template>

<script>
import {defineComponent, reactive, onMounted, ref, nextTick,toRaw} from 'vue'
import MyDownListMultiple from "components/MyDownListMultiple";
import MyCascader from "components/MyCascader";
import {zdTree} from "@/utils/common";
import MyTabs from "components/MyTabs";
export default defineComponent ({
  name: "text",
  components:{MyDownListMultiple,MyCascader,MyTabs},
  setup(){
    const mydata= reactive({
      formdata:{upnode:'141B1AFC7E634176BDA7DB7F491A9004',jlxz:'46F8B8FF11984568989A93F0BF8D7FEC'},
      options:[],
      refresh:new Date().getTime(),
    })
    const btn = () =>{
      console.log('返货的多选按钮值')
      console.log(mydata.formdata.zdlb)
      console.log('级联选择器的值')
      console.log(mydata.formdata.jlxz)
    }
    zdTree("SYS_COMMON_ORG").then((res)=>{
      mydata.options=res
    })
    return{
      mydata,
      btn
    }
  }
})
</script>

<style scoped>

</style>
