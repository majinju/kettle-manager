import router from '@/router'
import { assignDeep } from '@/utils/common'
import { ElMessage } from 'element-plus'
import { defineComponent } from 'vue'

const SidebarItem = defineComponent({
    name: 'SidebarItem',
    props: {
        item: {
            type: Object,
            required: true
        },
    },
    emits: ["itemClick"],
    setup(props, { emit }) {
        /**
         * 点击某个菜单时
         * @param data 菜单项
         */
        const selectMenu = (data: any) => {
            console.log(data)
            if (data.parent === 0) {
                switch (data.dzlx) {
                    case "01":
                    // router.push({path:'/home/'+data.dm, query:{
                    //     "sys.authCode":data.dm,
                    //     pathName:data.name
                    //   }})
                    // break
                    case "02":
                    case "03":
                    case "04":
                        const query = {
                            "sys.authCode": data.dm,
                            pathName: data.name
                        }
                        router.push({ path: '/home/sjdx', query: assignDeep(query, JSON.parse(data.kzxx).cdkz) })
                        break
                    default:
                        ElMessage.error("暂不支持的地址类型：" + data.dzlx);
                }
            }
        }
        return () => {
            const handleRoute = () => {
                const { item } = props

                // 最后一层的情况，渲染菜单项
                if (!item.children) {
                    return <el-menu-item onClick={() => selectMenu(item)} index={item.dm}>
                        <span>{item.mc}</span>
                    </el-menu-item>
                }
                const slots = {
                    title: () => {
                        return <div>
                            <span>{item.mc ? item.mc : '未定义菜单名称'}</span>
                        </div>
                    }
                }

                // 有children属性，递归
                return <el-submenu onClick={() => selectMenu(item)} index={item.dm} v-slots={slots}>
                    {item.children.map((child: any) => {
                        return <SidebarItem item={child} key={child.dm}></SidebarItem>
                    })}
                </el-submenu>
            }
            return <div>{handleRoute()}</div>
        }
    }
})

export default SidebarItem