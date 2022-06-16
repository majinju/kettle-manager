import axios from "./axios";
import { ElMessage } from "element-plus";
import watermark from "./utils/watermark";
import store from "./store";
import router from './router';
import { defineComponent } from "vue";
import { RouterView } from 'vue-router';

export default defineComponent({
    name: "App",
    setup() {
        // 在页面加载时读取sessionStorage
        if (sessionStorage.getItem("store")) {
            store.replaceState(
                Object.assign(
                    {},
                    store.state,
                    JSON.parse(sessionStorage.getItem("store") as string)
                )
            );
            //设置水印
            const user: any = store.state.user;
            watermark.set(user.yhxm + "," + user.yhdm);
        } else {
            axios
                .post({
                    sys: {
                        authCode: "QTQX",
                        cllx: "xtjcxx",
                    },
                })
                .then((response: any) => {
                    if (response.status) {
                        store.commit("setSys", response.data.sys);
                        store.commit("setUser", response.data.user);
                        router.push("/home");
                    } else {
                        ElMessage.error(response.msg);
                    }
                });
        }
        // 在页面刷新时将store保存到sessionStorage里
        window.addEventListener("beforeunload", () => {
            sessionStorage.setItem("store", JSON.stringify(store.state));
        });
        const renderDom = () => {
            return (
                <div class="body">
                    <RouterView />
                </div>
            )
        }
        return renderDom
    }
})