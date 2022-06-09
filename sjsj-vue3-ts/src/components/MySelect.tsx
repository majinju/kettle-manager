import { defineComponent, reactive, ref, watch } from 'vue'
import { zdList } from "@/utils/common"
export default defineComponent({
    name: 'MySelect',
    inheritAttrs: true,
    props: {
        /**
         * 输入值
         */
        modelValue: {
            type: String
        },
        /**
         * 字典类别
         */
        zdlb: {
            type: String,
            required: true
        },
        disabled: {
            type: String
        },
        readonly: {
            type: String
        }
    },
    emits: ["update:modelValue"],
    setup: async (props, context) => {
        const myData = reactive({
            options: {},
            valve: props.modelValue,
            isdisabled: props.readonly || props.disabled
        });
        const xInput = ref({});
        //加载字典
        await zdList(props.zdlb).then(function (data: any) {
            myData.options = data;
        });
        watch(() => props.zdlb, async (newZdlb) => {
            await zdList(props.zdlb).then(function (data: any) {
                myData.options = data;
            })
        })
        watch(() => props.disabled, (newValue) => {
            myData.isdisabled = props.readonly || newValue
        })
        watch(() => props.readonly, (newValue) => {
            myData.isdisabled = props.disabled || newValue
        })
        watch(() => props.modelValue, (newValue) => {
            myData.valve = newValue
        })
        const updateVal = (newValue: any) => {
            context.emit("update:modelValue", newValue)
            myData.valve = newValue
        }

        /**
         * 返回值
         */
        return {
            myData,
            xInput,
            updateVal
        }
    },
    render() {
        return (
            <>
                <vxe-select ref="xInput" options={this.myData.options} disabled={this.myData.isdisabled}
                    model-value={this.myData.valve} onUpdate:modelValue={this.updateVal} option-props={{ value: "dm", label: "mc" }}>
                </vxe-select>
            </>
        )
    }
})