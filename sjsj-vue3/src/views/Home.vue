<template>
  <div class="home-body">
    <el-container>
      <el-header class="home-heard">
        <div class="heard-title">
          <img class="title-img" src="~assets/img/title.png" alt="">
          <span class="title-span">{{myData.xtxx.mc}}</span>
        </div>
        <div class="title-dw">
          <span class="title-ssjg">所属机构></span>
          <span class="title-name">{{user.jgxx.jgmc}}</span>
        </div>
      </el-header>
      <el-container>
        <el-aside class="home-aside">
          <div class="user-info">
            <img class="user-img" :src="userImg" alt="">
            <div class="">
              <el-row>
                <el-col :span="19">
                  <p class="user-name">{{user.yhxm}}</p>
                </el-col>
                <el-col :span="5">
                  <span class="btn el-icon-switch-button" @click="logout"></span>
                </el-col>
              </el-row>
            </div>
          </div>
          <el-tree
            :data="myData.menuList"
            accordion
            :load="loadNode"
            lazy
            class="menu-item"
            node-key="dm"
            icon-class="el-icon-arrow-down"
            :props="myData.props"
            @node-click="selectMenu"
            highlight-current
          >
            <template #default="{ node, data }">
              <div class="worker-tree-node flex-box">
                <i class="el-icon-menu" v-if="node.level === 1"></i>
                {{ data.mc }}
              </div>
            </template>
          </el-tree>
        </el-aside>
        <el-container>
          <el-main>
            <div class="content-box">
              <home-tabs></home-tabs>
              <div class="content">
                <suspense>
                  <router-view v-slot="{ Component }">
                    <transition name="move" mode="out-in">
                      <keep-alive :exclude="Sjdx">
                        <component :is="Component" />
                      </keep-alive>
                    </transition>
                  </router-view>
                </suspense>
              </div>
            </div>
          </el-main>
        </el-container>
      </el-container>
    </el-container>
  </div>
</template>
<script>
import { defineComponent, reactive,computed } from 'vue'
import {useStore} from "vuex";
import {useRoute, useRouter} from "vue-router";
import { ElMessage ,ElMessageBox} from "element-plus";
import axios from "@/axios";
import HomeTabs from "./HomeTabs";
import {assignDeep,zdObj,isEmpty} from "@/utils/common";

export default defineComponent({
  components:{HomeTabs},
  setup () {
    const myData = reactive({
      /**
       * 系统代码
       */
      xtdm:"",
      /**
       * 系统信息
       */
      xtxx:{},
      /**
       * 菜单列表
       */
      menuList:[],
      props: {
        label: "mc",
        isLeaf: "leaf",
      },
    });
    const store = useStore();
    const router = useRouter();
    const route = useRoute();
    myData.xtdm = route.params.sys;
    if(isEmpty(myData.xtdm)){
      myData.xtdm = store.state.xtxx.dm
    }
    zdObj({zdlb:"SYS_QX_QXXX",dm:myData.xtdm}).then((xtxx)=>{
      myData.xtxx=xtxx
      store.commit("setXtxx",xtxx)
      document.title=xtxx.mc
    }).catch(err=>{
    })
    /**
     * 获取菜单
     */
    const loadNode =async function (node,resolve){
      if (node.data.parent > 0) {
        axios.post({
          sjdx: {
            dxdm: "SYS_QX_QTQX",
          },
          sys: {
            cllx: "getTreeCN",
          },
          yobj:{
            treeModel: "cds",
            treeRoot: myData.xtdm,
            fqx: node.data.dm ? node.data.dm : "",
          }
        }).then((response) => {
          if (response.status) {
            response.data.list.map((x) => {
              x.leaf = x.parent <= 0;
            });
            resolve(response.data.list);
          } else {
            this.$message.error(response.msg);
          }
        });
      } else {
        resolve([]);
      }
    }
    /**
     * 加载菜单
     * @param dm 菜单根节点
     * @param fqx 菜单父节点
     */
    const getMenuList = function(dm,fqx){
       axios.post({
        sjdx:{
          dxdm:"SYS_QX_QTQX"
        },
        sys:{
          cllx:"getTreeCN"
        },
        yobj:{
          treeModel: 'cds',
          treeRoot: dm,
          fqx: fqx?fqx:''
        }
      },false).then(response => {
        if (response.status) {
          response.data.list.forEach((item) => {
            if (item.parent) {
              item.children = []
            }
          })
          setMenuList(fqx, response.data.list)
        }
      }).catch((e)=>{
        console.log("获取菜单失败",e)
      })
    }
    /**
     * 设置菜单数据
     * @param fqx 父权限
     * @param list 菜单列表
     */
    const setMenuList = (fqx,list) =>{
      if(!fqx){
        myData.menuList = list
      }else {
        myData.menuList.forEach((item) =>{
          if(item.dm===fqx) {
            item.children = list
          }
        })
      }
    }
    /**
     * 点击某个菜单时
     * @param data 菜单项
     */
    const selectMenu = (data) =>{
      if (data.parent === 0) {
        if(data.dzlx==="04"){
          switch (data.dzlx) {
            case "03":
            case "04":
              const query = {
                "sys.authCode":data.dm,
                pathName:data.name
              }
              router.push({path:'/home/sjdx',query:assignDeep(query,JSON.parse(data.kzxx).cdkz)})
              break
            case "01":
            // router.push({path:'/home/'+data.dm, query:{
            //     "sys.authCode":data.dm,
            //     pathName:data.name
            //   }})
            // break
            case "02":
            default:
              ElMessage.error("暂不支持的地址类型："+data.dzlx);
          }
        }
      }
    }
    /**
     * 用户信息
     * @type {ComputedRef<{}>}
     */
    const user = computed(() => {
      return store.state.user;
    })
    /**
     * 用户头像
     * @type {ComputedRef<unknown>}
     */
    const userImg = computed(() =>{
      if(store.state.user.tx){
        return axios.getBaseURL()+'?sjdx.dxdm=SYS_QX_QTQX&sys.cllx=download&yobj.id='+store.state.user.tx
      }
    })

    /**
     * 用户退出操作
     */
    const logout = () =>{
      ElMessageBox.confirm(
        '你确定要退出吗?','提示',{
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() =>{
        axios.post({
          sjdx:{
            dxdm:'SYS_QX_YHXX_MRDL'
          },
          sys:{
            cllx:'yhtc'
          }
        }).then(req=>{
          if (req.status) {
            ElMessage.success(req.msg)
            //将当前系统代码返回回去
            router.push('/login/'+myData.xtdm)
          } else {
            ElMessage.warning(req.msg)
          }
        })
      }).catch(() =>{})
    }
    getMenuList(myData.xtdm)
    return {
      myData,
      user,
      userImg,
      selectMenu,
      logout,
      loadNode,
    }
  }
})
</script>
<style scoped lang="scss">
::v-deep(.el-tree-node__expand-icon) {
  color: rgb(39, 138, 236);
  font-size: 20px;
  position: absolute;
  right: 15px;
}
::v-deep(.el-tree-node) {
  border-bottom: 1px solid #ddd;
}

::v-deep(.el-tree-node__content) {
  flex-direction: row-reverse;
  height: 40px;
  line-height: 40px;
  padding-left: 55px;
  padding-right: 20px;
  font-size: 17px;
  &:hover {
    color: #ffffff;
    background: linear-gradient(to right, #8dbceb, #1b7ee5);
    .el-tree-node__expand-icon {
      color: #ffffff;
    }
    .is-leaf {
      display: none;
    }
  }
}

::v-deep(.el-tree-node__expand-icon) {
  &.expanded {
    transform: rotate(180deg);
  }
}
.worker-tree-node {
  flex: 1;
  overflow: hidden;
  padding-left: 10px;
  & > * {
    margin: 0 5px;
  }
}
::v-deep(.el-tree-node__loading-icon ){
  position: absolute;
  right: 0px;
}
::v-deep(.el-tree-node__expand-icon.is-leaf) {
  color: rgba(0, 0, 0, 0);
  cursor: default;
}
::v-deep(.is-current) {
  .el-tree-node__expand-icon {
  }
}
::v-deep(.el-tree-node__children .worker-tree-node) {
  font-size: 14px;
  padding-left: 25px;
  .expanded {
    color: #fff;
  }
}
::v-deep(.el-tree--highlight-current
.el-tree-node.is-current)
> .el-tree-node__content {
  color: #ffffff;
  background: linear-gradient(to right, #428dd8, #d2e0ee);
}


.home-body{
  width: 100%;
  height: 100%;
  position: absolute;
  background-color: #ffffff;
  .home-heard{
    position: relative;
    height: 58px;
    width: 100%;
    padding: 0;
    background: #ffffff;
    font-family: arial,sans-serif,宋体;
    .heard-title{
      position: absolute;
      .title-img{
        position: absolute;
        margin: 0;
        height: 58px;
      }
      .title-span{
        position: fixed;
        font-size: 25px;
        color: #ffffff;
        left: 7%;
        z-index: 1;
        top:12px;
        font-weight: bolder;
      }
    }
    .title-dw{
      position: relative;
      float: right;
      font-size: 12px;
      color: #2d3d5a;
      top: 20px;
      .title-ssjg {
        margin-right: 10px;
      }
      .title-name{
        margin-right: 16px;
      }
    }
  }
  .home-aside{
    position: fixed;
    display:block;
    height: 100%;
    //overflow-y: scroll;
    background: #ffffff;
    width: 210px;
    .user-info{
      padding: 20px;
      display: flex;
      align-items: center;
      border-bottom: 1px solid #dddddd;
      .user-img{
        height: 50px;
        width: 50px;
        border-radius:100%;
        border: 1px solid #eeeeee;

      }
    }
  }
  .content-box{
    position: absolute;
    left: 210px;
    right: 0;
    top: 58px;
    bottom: 0;
    padding-bottom: 30px;
    -webkit-transition: left .3s ease-in-out;
    transition: left .3s ease-in-out;
    background: #f0f0f0;
    .content{
      width: auto;
      height: 100%;
      padding: 10px;
      overflow-y: scroll;
      box-sizing: border-box;
    }
  }
  .arrow-icon{
    position: relative;
    margin-left: 30px;
    font-size: 18px;
  }
}
.btn{
  margin-left: 17px;
  color: red;
  cursor: pointer;
  margin-top: 10px;
}
.user-name{
  font-size: 10px;
  color: #2d8cf0;
  margin-left: 5px;
  margin-top: 10px;
}
ul {
  list-style-type: none;   /* 去掉每个 ul 和 li 前面的圆点 */
}
.menu-item{
  color: rgb(39, 138, 236);
  border-bottom: 1px solid #dddddd;
  cursor: pointer;
  &.active{
    .menu-item-title{
      color: #ffffff;
      background: linear-gradient(to right,#8dbceb,#409EFF);
    }
  }
  .menu-item-title{
    height: 40px;
    line-height: 40px;
    padding-left: 55px;
    padding-right: 20px;
    position: relative;
    .el-icon-menu{
      position: absolute;
      left: 20px;
      font-size: 20px;
      top: 50%;
      transform: translateY(-50%);
    }
    &:hover{
      color: #ffffff;
      background: linear-gradient(to right,#8dbceb,#1b7ee5);
    }
  }
  .menu-item-child{
  }
  .child-item{
    padding-left: 60px;
    height: 35px;
    line-height: 35px;
    font-size: 14px;
    &:hover{
      color: #ffffff;
      background: linear-gradient(to right,#77b0e8,#8dbceb);
    }
    &.active{
      color: #ffffff;
      background: linear-gradient(to right,#428dd8,#d2e0ee);
    }
  }
}
</style>

