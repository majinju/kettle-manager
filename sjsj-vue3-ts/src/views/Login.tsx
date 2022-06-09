import { defineComponent, reactive } from "vue";
import axios from "../axios";
import { ElMessage } from "element-plus";
import { useStore } from "vuex";
import { useRouter, useRoute } from "vue-router";
import { zdObj, isEmpty } from "../utils/common";
import "./login.scss"

export default defineComponent({
    setup() {
        const myData = reactive({
            xtdm: {},
            xtxx: {
                mc: "",
            },
            loading: false,
            formData: {
                yhdm: "",
                yhmm: "",
                //获取用户详细信息，不传默认只返回基础信息
                model: "details"
            },
            formItems: [
                {
                    field: "yhdm",
                    title: "用户名",
                    span: 24,
                    itemRender: {
                        name: "ElInput",
                        props: {
                            placeholder: "请输入用户名",
                            clearable: true,
                            "prefix-icon": "el-icon-user",
                        },
                    },
                },
                {
                    field: "yhmm",
                    title: "密码",
                    span: 24,
                    itemRender: {
                        name: "ElInput",
                        props: {
                            placeholder: "请输入密码",
                            type: "password",
                            clearable: true,
                            "show-password": true,
                            "prefix-icon": "el-icon-key",
                        },
                    },
                },
                {
                    align: "center",
                    span: 24,
                    itemRender: {
                        name: "$buttons",
                        children: [
                            { props: { type: "button", content: "忘记密码" } },
                            { props: { type: "submit", content: "登陆", status: "primary" } },
                        ],
                    },
                },
            ],
            formRule: {
                yhdm: [{ required: true, message: "请输入用户名" }],
                yhmm: [{ required: true, message: "请输入密码" }],
            },
        });
        const store = useStore();
        const router = useRouter();
        const route = useRoute();
        myData.xtdm = route.params.sys;
        if (isEmpty(myData.xtdm)) {
            myData.xtdm = store.state.xtxx.dm;
        }
        zdObj({ zdlb: "SYS_QX_QXXX", dm: myData.xtdm })
            .then((xtxx: any) => {
                myData.xtxx = xtxx;
                store.commit("setXtxx", xtxx);
                document.title = xtxx.mc;
            })
            .catch((err) => { });
        const submitEvent = function () {
            axios
                .post({
                    sjdx: {
                        dxdm: "SYS_QX_YHXX_MRDL",
                    },
                    sys: {
                        cllx: "yhdl",
                    },
                    yobj: myData.formData,
                })
                .then((response: any) => {
                    if (response.status) {
                        store.commit("setSys", response.data.sys);
                        store.commit("setUser", response.data.user);
                        ElMessage.success("登陆成功");
                        router.push("/home/" + myData.xtdm);
                    } else {
                        ElMessage.error(response.msg);
                    }
                });
        };
        const renderDom = () => {
            return (
                <div class="login">
                    <el-container>
                        <el-main>
                            <div class="content1">
                                <div class="xtbt">{myData.xtxx.mc}</div>
                                <vxe-form
                                    data={myData.formData}
                                    items={myData.formItems}
                                    rules={myData.formRule}
                                    loading={myData.loading}
                                    onSubmit={submitEvent}
                                >
                                </vxe-form>
                            </div>
                        </el-main>
                        <el-footer> @2021 </el-footer>
                    </el-container>
                </div >)
        }
        return renderDom
    },
})
