<template>
  <div class="page-main" style="background-color: #ffffff">
    <el-tabs v-model="activeName" type="card" @tab-click="handleClick" style="padding: 2px">
      <el-tab-pane v-for="(item,index) in myData.menuList" :label="item.mc" :name="item" >
        <div v-if="!myData.iframeUrl">
        <router-view/>
        </div>
        <!--走ifram -->
        <div v-else>
          <iframe :src="myData.iframeUrl" id="mobsf"  hight='auto'
                  width='100%'
                  :height="myData.ifarmHight"
                  frameborder='0'
                  scrolling='auto'>
          </iframe>
        </div>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import {defineComponent,reactive,ref,watch,onMounted} from  'vue'
import {ElMessage} from 'element-plus'
import {assignDeep} from "@/utils/common";
import { useRouter,useRoute } from "vue-router";
import axios from "@/axios"
export default defineComponent({
  name: "MyTabs",
  props:{
    treeRoot:{
      type:String,
      default:"KFZFW"
    },
    /**
     *父权限
     */
    fqx:{
      type:String,
      default:"KFZFW_QXGL"
    },
    /**
     * 对象代码
     */
    zdlb:{
      type:String,
    },
    /**
     * 处理类型
     */
    cllx:{
      type:String,
    },
    /**
     * 自定义iframe的高度，不给默认高度为400px
     */
    hight:{
      type:String,
      default:"400px"
    }
  },
  setup(props,context)
  {
    const myData=reactive({
      menuList:[],
      iframeUrl:'',
      ifarmHight:props.hight
    })
    const router = useRouter();
    const activeName = ref('first')
    const handleClick = (tab, event) =>{
      //后续可根据需要添加各种打开形式
      let data =tab.props.name
      if(data.dzlx==="04"){
        switch (data.dkfs) {
          //如果03为走ifram
          case "03":
            break
          case "01":
            //进入之前必须清除数据.走vue组件
            myData.iframeUrl=""
            const query = {
              "sys.authCode": data.dm,
              pathName: data.name
            }
            router.push({path:'/home/test/sjdxs/?'+data.dm,query:assignDeep(query,JSON.parse(data.kzxx).cdkz)})
            break
          case "02":
            break
          default:
            ElMessage.error("暂不支持的地址类型："+data.dzlx);
        }
      }else if(data.dzlx==="02"){
        //这个是走ifram
        switch(data.dkfs){
          case "03":
            router.push('/home/test')
            setTimeout(()=>{
              myData.iframeUrl=data.dz
            },1000)
            break
        }
      }
    }
    /**
     * 根据父组件传递过来的数据获取对应的数据，展示在tab上
     */
    const getMenuList= (val) =>{
      axios.post({
        sjdx:{
          dxdm:props.zdlb,
        },
        sys:{
          cllx:props.cllx
        },
        yobj:{
          treeModel:"cds",
          treeRoot:props.treeRoot,
          fqx:props.fqx
        }
      }).then((req)=>{
        if(req.status){
          myData.menuList=req.data.list
        }else {
          ElMessage.error(req.msg)
        }
      })
    }
    /**
     * 监听传递过来的对象代码是否发生改变
     */
    watch(()=>props.zdlb,(newVal)=>{
      getMenuList(newVal)
    },{immediate:true})
    return{
      myData,
      handleClick,
      activeName,
      getMenuList
    }
  }

})
</script>

<style scoped>

</style>
