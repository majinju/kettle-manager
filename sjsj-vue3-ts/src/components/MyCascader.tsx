import { defineComponent, reactive, ref, watch, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { zdTree } from "@/utils/common";
import './MyCascader.scss';
export default defineComponent({
    name: "MyCascader",
    inheritAttrs: true,
    props: {
        /**
         * 输入值
         */
        modelValue: {
            type: String,
        },
        /**
         * 字典类别
         */
        zdlb: {
            type: String,
            required: true
        },
        /**
         * 是否允许编辑
         */
        disabled: {
            type: String
        },
        readonly: {
            type: String
        },
        /**
         * 是否展示全路径，级联全路径名
         */
        levels: {
            type: Boolean,
            default: false,
        },
        /**
         * 控制级联选择器的大小
         */
        size: {
            type: String,
            default: "mini"
        }
    },
    emits: ["update:modelValue"],
    setup(props: any, context) {
        const mydata = reactive({
            isDisabled: props.readonly || props.disabled,
            options: [],
            value: props.model,
            refresh: new Date().getTime(),
            levels: props.levels,
            size: props.size
        })
        /**
         * 初始页面获取值，对有默认值的时候
         */
        zdTree(props.zdlb).then((res: any) => {
            mydata.options = res
        }).catch(err => {
            ElMessage.error("获取数据失败")
        })
        /**
         * 查询字典数
         */
        const getZdTree = (val: any) => {
            zdTree(val).then((res: any) => {
                mydata.options = res
            }).catch(err => {
                ElMessage.error("获取数据失败")
            })
        }
        /**
         * 当获取焦点的时候触发
         */
        const zdTreeFocus = () => {
            getZdTree(props.zdlb)
        }
        /**
         * 当值改变的时候触发，将值返回到父组件
         */
        const zdTreeChange = (val: any) => {
            context.emit("update:modelValue", val)
        }
        watch(mydata.options, (newVal) => {
            mydata.refresh = new Date().getTime()
        }, { immediate: true })
        /**
         * 级联选择器是否展示全路径名字属性值的改变
         */
        watch(() => props.levels, (newVal) => {
            mydata.levels = newVal
        }, { immediate: true })
        /**
         * 监听传递过来的默认值
         */
        watch(() => props.modelValue, (newValue) => {
            context.emit("update:modelValue", newValue)
            getZdTree(props.zdlb)
            mydata.value = newValue
        }, { immediate: true })
        return {
            mydata,
            getZdTree,
            zdTreeChange,
            zdTreeFocus,
        }
    },
    render() {
        return (

            <div>
                <el-cascader
                    options={this.mydata.options}
                    disabled={this.mydata.isDisabled}
                    props={{ value: 'dm', label: 'mc', checkStrictly: true, emitPath: false, }}
                    filterable
                    clearable
                    size={this.mydata.size}
                    show-all-levels={this.mydata.levels}
                    model-value={this.mydata.value}
                    onFocus={this.zdTreeFocus}
                    onChange={this.zdTreeChange}
                ></el-cascader>
            </div>
        )

    }
})