import axios from "./axios";
import { ElMessage } from "element-plus";
import watermark from "./utils/watermark";
import store from "./store";
import { defineComponent } from "vue";
import { RouterView } from 'vue-router';

export default defineComponent({
    name: "App",
    setup() {
        // 在页面加载时读取sessionStorage
        if (sessionStorage.getItem("store")) {
            (this as any).$store.replaceState(
                Object.assign(
                    {},
                    (this as any).$store.state,
                    JSON.parse(sessionStorage.getItem("store") as string)
                )
            );
            //设置水印
            const user = (this as any).$store.state.user;
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
                        (this as any).$store.commit("setSys", response.data.sys);
                        (this as any).$store.commit("setUser", response.data.user);
                        (this as any).$router.push("/home");
                    } else {
                        ElMessage.error(response.msg);
                    }
                });
        }
        // 在页面刷新时将store保存到sessionStorage里
        window.addEventListener("beforeunload", () => {
            sessionStorage.setItem("store", JSON.stringify((this as any).$store.state));
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