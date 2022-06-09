import { defineComponent, onMounted, reactive } from "vue";
import { onBeforeRouteUpdate, useRoute, useRouter } from "vue-router";
import "./HomeTabs.scss"
export default defineComponent({
    setup() {
        const myData = reactive({
            tags: {},
            currTag: ""
        })
        const route = useRoute();
        const router = useRouter();
        onMounted(() => {
            //页面初始化设置
            setTags(router.currentRoute.value);
        })
        /**
         * 监听页面路由变化
         */
        onBeforeRouteUpdate((to) => {
            setTags(to);
        });
        /**
         * 设置标签
         * @param route 当前路由
         */
        const setTags = (route: any) => {
            const currTag = route.query["sys.authCode"];
            if (!currTag) {
                return;
            }
            //判断当前路由是否已经存在
            let isExist = false;
            for (const i in myData.tags) {
                if (i === currTag) {
                    isExist = true;
                }
            }
            if (!isExist) {
                myData.tags[currTag] = route;
            }
            myData.currTag = currTag;
        };
        /**
         * tab点击事件
         * @param index tab项
         * @param event 事件对象
         */
        const tabClick = (index: any, event: any) => {
            router.push(myData.tags[index.props.name])
        }
        /**
         * 关闭标签
         * @param index 标签值
         */
        const removeTab = (index: any) => {
            for (const i in myData.tags) {
                if (i === index) {
                    delete myData.tags[i];
                }
            }
            if (Object.keys(myData.tags).length > 0) {
                myData.currTag = Object.keys(myData.tags)[0];
                router.push(myData.tags[myData.currTag]);
            } else {
                router.push("/home");
            }
        }
        // 关闭全部标签
        const closeAll = () => {
            myData.tags = []
            router.push("/home");
        };
        // 关闭其他标签
        const closeOther = () => {
            for (const i in myData.tags) {
                if (i !== myData.currTag) {
                    delete myData.tags[i];
                }
            }
        };
        /**
         * 末尾操作
         * @param command
         */
        const handleTags = (command: any) => {
            command === "other" ? closeOther() : closeAll();
        };
        return {
            myData,
            tabClick,
            removeTab,
            handleTags
        };
    },
    render() {
        return (
            <div>
                {Object.keys(this.myData.tags).length > 0 ? <div class="tags">
                    <el-tabs
                        v-model={this.myData.currTag}
                        type="card"
                        closable
                        onTab-click={this.tabClick}
                        onTab-remove={this.removeTab}
                    >
                        {Object.keys(this.myData.tags).map((item: any, index: number) => {
                            return (
                                <el-tab-pane
                                    key={this.myData.tags[item].query["sys.authCode"]}
                                    label={this.myData.tags[item].query.pathName}
                                    name={this.myData.tags[item].query["sys.authCode"]}
                                >
                                </el-tab-pane>
                            )
                        })}
                    </el-tabs>
                    <div class="tags-close-box">
                        <el-dropdown onCommand={this.handleTags}
                            v-slots={{
                                dropdown: () => {
                                    return (
                                        <el-dropdown-menu size="small">
                                            <el-dropdown-item command="other">关闭其他</el-dropdown-item>
                                            <el-dropdown-item command="all">关闭所有</el-dropdown-item>
                                        </el-dropdown-menu>
                                    );
                                },
                            }}>
                            <el-button size="mini" type="primary">
                                关闭选择
                                <i class="el-icon-arrow-down el-icon--right"></i>
                            </el-button>
                        </el-dropdown>
                    </div>
                </div> : null}
            </div>
        )

    }
})