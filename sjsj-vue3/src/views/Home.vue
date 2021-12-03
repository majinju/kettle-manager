<template>
  <div class="home-body">
    <el-container>
      <el-header class="home-heard">
        <div class="heard-title">
          <img class="title-img" src="~assets/img/title.png" alt="">
          <span class="title-span">{{myData.title}}</span>
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
          <ul>
            <li
              class="menu-item"
              :class="myData.activeMenu === item.id ? 'active' : ''"
              v-for="item in myData.menuList"
              :key="item.id"
            >
              <div class="menu-item-title" @click="selectMenu(item)">
                <i class="el-icon-menu"></i>
                {{ item.mc }}
                <i v-if="myData.activeMenu !== item.id" class="el-icon-arrow-down"></i>
                <i v-else class="el-icon-arrow-up"></i>
              </div>
              <ul
                class="menu-item-child"
                v-show="item.children && myData.activeMenu === item.id"
              >
                <li
                  class="child-item"
                  @click="selectMenuChild(child)"
                  :class="myData.activeId === child.id ? 'active' : ''"
                  v-for="child in item.children"
                  :key="child.id"
                >
                  <div class="child-item-title">{{ child.mc }}</div>
                </li>
              </ul>
            </li>
          </ul>
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
import { onMounted,defineComponent, reactive,computed } from 'vue'
import {useStore} from "vuex";
import {useRouter} from "vue-router";
import { ElMessage ,ElMessageBox} from "element-plus";
import axios from "@/axios";
import HomeTabs from "./HomeTabs";
import {assignDeep} from "@/utils/common";

export default defineComponent({
  components:{HomeTabs},
  setup () {
    const myData = reactive({
      title:"数据世界2",
      menuList:[],
      activeMenu:'',
      activeId:'',
    });
    onMounted (() =>{
      getMenuList('KFZFW')
    })
    const store = useStore();
    const router = useRouter();
    /**
     * 加载菜单
     * @param dm 菜单根节点
     * @param fqx 菜单父节点
     */
    const getMenuList = (dm,fqx) =>{
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
      }).then(response => {
        if (response.status) {
          response.data.list.forEach((item) => {
            if (item.parent) {
              item.children = []
            }
          })
          setMenuList(fqx, response.data.list)
        }
      }).catch((e)=>{
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
      if(myData.activeMenu === data.id){
        //点击当前展开的菜单则关闭展开的菜单
        myData.activeMenu = ''
        return
      }
      myData.activeMenu =data.id
      if (!data.children.length) {
        //加载子菜单
        getMenuList("KFZFW", data.dm);
      }
    }
    /**
     * 点击某个具体菜单项
     * @param data 菜单数据
     */
    const selectMenuChild = (data) =>{
      if(myData.activeId === data.id) {
        //后续这里改为重新加载页面
        return
      }
      myData.activeId = data.id
      switch (data.dzlx) {
        case "01":
          router.push({path:'/home/'+data.dm, query:{
              "sys.authCode":data.dm,
              pathName:data.name
            }})
          break
        case "03":
        case "04":
          const query = {
            "sys.authCode":data.dm,
            pathName:data.name
          }
          router.push({path:'/home/sjdx',query:assignDeep(query,JSON.parse(data.kzxx).cdkz)})
          break
        default:
          ElMessage.error("暂不支持的地址类型："+data.dzlx);
      }
    }
    /**
     * 用户信息
     * @type {ComputedRef<{yhdm: string, yhxm: string}>}
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
            router.push('/login')
          } else {
            ElMessage.warning(req.msg)
          }
        })
      }).catch(() =>{})
    }
    return {
      myData,
      user,
      userImg,
      selectMenu,
      selectMenuChild,
      logout
    }
  }
})
</script>
<style scoped lang="scss">
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

