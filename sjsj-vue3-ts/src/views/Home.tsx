import { computed, defineComponent, reactive, ref, Suspense } from "vue";
import { useStore } from "vuex";
import { useRoute, useRouter } from "vue-router";
import { ElMessage, ElMessageBox } from "element-plus";
import axios from "@/axios";
import HomeTabs from "./HomeTabs";
import { assignDeep, zdObj, isEmpty } from "@/utils/common";
import "./Home.scss";
import titlePng from "@/assets/img/title.png";
import MenuItem from '@/components/MenuItem'
export default defineComponent({
    components: { HomeTabs, MenuItem },
    setup() {
        const myData = reactive({
            /**
             * 展示渲染
             */
            showMode: "",
            /**
             * 系统代码
             */
            xtdm: "",
            /**
             * 系统信息
             */
            xtxx: {
                mc: "",
            },
            /**
             * 菜单列表
             */
            menuList: [],
            props: {
                label: "mc",
                isLeaf: "leaf",
            },
        });
        const store = useStore();
        const router = useRouter();
        const route = useRoute();
        myData.xtdm = route.params.sys as string;
        myData.showMode = route.query.showMode as string;
        if (isEmpty(myData.xtdm)) {
            myData.xtdm = store.state.xtxx.dm
        }
        zdObj({ zdlb: "SYS_QX_QXXX", dm: myData.xtdm }).then((xtxx: any) => {
            myData.xtxx = xtxx
            store.commit("setXtxx", xtxx)
            document.title = xtxx.mc
        }).catch(err => {
        })
        /**
         * 获取菜单
         */
        const loadNode = async (node: any, resolve: any) => {
            if (node.data.parent > 0) {
                axios.post({
                    sjdx: {
                        dxdm: "SYS_QX_QTQX",
                    },
                    sys: {
                        cllx: "getTreeCN",
                    },
                    yobj: {
                        treeModel: "cds",
                        treeRoot: myData.xtdm,
                        fqx: node.data.dm ? node.data.dm : "",
                    }
                }).then((response: any) => {
                    if (response.status) {
                        response.data.list.map((x: any) => {
                            x.leaf = x.parent <= 0;
                        });
                        resolve(response.data.list);
                    } else {
                        (this as any).$message.error(response.msg);
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
        const getMenuList = function (dm: any, fqx?: any) {
            axios.post({
                sjdx: {
                    dxdm: "SYS_QX_QXXX"
                },
                sys: {
                    cllx: "cds"
                },
                yobj: {
                    treeModel: 'cds',
                    treeRoot: dm,
                    fqx: fqx ? fqx : ''
                }
            }, false).then(response => {
                if (response.status) {
                    setMenuList(fqx, response.data[0].children)
                }
            }).catch((e) => {
                console.log("获取菜单失败", e)
            })
        }
        /**
         * 设置菜单数据
         * @param fqx 父权限
         * @param list 菜单列表
         */
        const setMenuList = (fqx: any, list: any) => {
            if (!fqx) {
                myData.menuList = list
            } else {
                myData.menuList.forEach((item: any) => {
                    if (item.dm === fqx) {
                        item.children = list
                    }
                })
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
        const userImg: any = computed(() => {
            if (store.state.user.tx) {
                return axios.getBaseURL() + '?sjdx.dxdm=SYS_QX_QTQX&sys.cllx=download&yobj.id=' + store.state.user.tx
            }
        })

        const jgmcVNode = computed(() => {
            return (
                <span class="title-name">{user.value.jgxx.jgmc}</span>
            )
        })

        const userImgVNode = computed(() => {
            return (
                <img class="user-img" src={userImg.value} alt="" />
            )
        })

        const yhxmVNode = computed(() => {
            return (
                <p class="user-name">{user.value.yhxm}</p>
            )
        })
        /**
         * 用户退出操作
         */
        const logout = () => {
            ElMessageBox.confirm(
                '你确定要退出吗?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                axios.post({
                    sjdx: {
                        dxdm: 'SYS_QX_YHXX_MRDL'
                    },
                    sys: {
                        cllx: 'yhtc'
                    }
                }).then((req: any) => {
                    if (req.status) {
                        ElMessage.success(req.msg)
                        //将当前系统代码返回回去
                        router.push('/login/' + myData.xtdm)
                    } else {
                        ElMessage.warning(req.msg)
                    }
                })
            }).catch(() => { })
        }
        getMenuList(myData.xtdm)

        const isCollapse = ref(false)
        const handleOpen = (key: string, keyPath: string[]) => {
            console.log(key, keyPath)
        }
        const handleClose = (key: string, keyPath: string[]) => {
            console.log(key, keyPath)
        }

        const menuItemVNode = (item: any) => {
            if (!item.children) {
                return <el-menu-item index={item.dm}>
                    <span>{item.mc}</span>
                </el-menu-item>
            }
            return <el-submenu index={item.dm}>
                {item.children.map((child: any) => {
                    menuItemVNode(child)
                })}
            </el-submenu>
        }

        return {
            myData,
            user,
            jgmcVNode,
            userImgVNode,
            yhxmVNode,
            userImg,
            logout,
            loadNode,
            isCollapse,
            handleOpen,
            handleClose,
            menuItemVNode
        }
    },
    render() {
        return (
            <>
                {
                    this.myData.showMode === 'sjdx' ? (<Suspense>
                        <router-view v-slots={{
                            default: (scope: any) => <transition name="move" mode="out-in"> <keep-alive is={scope.Component} >{scope.Component}</keep-alive> </transition>,
                        }}
                        ></router-view>
                    </Suspense>) : <div class="home-body">
                        <el-container>
                            <el-header class="home-heard">
                                <div class="heard-title">
                                    <img class="title-img" src={titlePng} alt="" />
                                    <span class="title-span">{this.myData.xtxx.mc}</span>
                                </div>
                                <div class="title-dw">
                                    <span class="title-ssjg">所属机构{">"}</span>
                                    {this.jgmcVNode}
                                    {/* <span class="title-name">{this.user.value.jgxx.jgmc}</span> */}
                                </div>
                            </el-header>
                            <el-container>
                                <el-aside class="home-aside">
                                    <div class="user-info">
                                        {this.userImgVNode}
                                        {/* <img class="user-img" src={this.userImg.value} alt="" /> */}
                                        <div class="">
                                            <el-row>
                                                <el-col span={19}>
                                                    {this.yhxmVNode}
                                                </el-col>
                                                <el-col span={5}>
                                                    <span class="btn el-icon-switch-button" onClick={this.logout}></span>
                                                </el-col>
                                            </el-row>
                                        </div>
                                    </div>
                                    <el-menu
                                        class="el-menu-vertical-demo"
                                        collapse={this.isCollapse}
                                        onOpen={this.handleOpen}
                                        onClose={this.handleClose}>
                                        {this.myData.menuList.map((item: any, index: number) => {
                                            return <MenuItem item={item}></MenuItem>
                                        })}
                                    </el-menu>
                                </el-aside>
                                <el-container>
                                    <el-main>
                                        <div class="content-box">
                                            <HomeTabs></HomeTabs>
                                            <div class="content">
                                                <Suspense>
                                                    <router-view v-slots={{
                                                        default: (scope: any) => <transition name="move" mode="out-in"> <keep-alive is={scope.Component} >{scope.Component}</keep-alive> </transition>,
                                                    }}
                                                    ></router-view>
                                                </Suspense>
                                            </div>
                                        </div>
                                    </el-main>
                                </el-container>
                            </el-container>
                        </el-container>
                    </div >
                }
            </>


        )
    }
})