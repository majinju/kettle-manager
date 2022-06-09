import { defineComponent, reactive, ref, watch } from "vue";
import { zdList } from "@/utils/common";
export default defineComponent({
    name: "MyCheckbox",
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
            required: true,
        },
        disabled: {
            type: String,
        },
        readonly: {
            type: String,
        },
    },
    emits: ["update:modelValue"],
    setup: async (props, context) => {
        const myData = reactive({
            /**
             * 全选状态
             */
            qx: false,
            flag: false,
            /**
             * 复选框选项
             */
            options: [{ dm: "", mc: "" }],
            valve: [""],
            isdisabled: props.readonly || props.disabled,
        });
        const xInput = ref({});
        //加载字典
        await zdList(props.zdlb).then(function (data: any) {
            myData.options = data;
        });
        if (props.modelValue) {
            myData.valve = props.modelValue.split(",");
        } else {
            myData.valve = [];
        }
        myData.qx = myData.valve.length === myData.options.length;

        watch(
            () => props.zdlb,
            async (newZdlb) => {
                await zdList(props.zdlb).then(function (data: any) {
                    myData.options = data;
                });
            }
        );
        watch(
            () => props.disabled,
            (newValue) => {
                myData.isdisabled = props.readonly || newValue;
            }
        );
        watch(
            () => props.readonly,
            (newValue) => {
                myData.isdisabled = props.disabled || newValue;
            }
        );
        watch(
            () => props.modelValue,
            (newValue) => {
                if (newValue) {
                    myData.valve = newValue.split(",");
                } else {
                    myData.valve = [];
                }
                const qx = myData.valve.length === myData.options.length;
                if (myData.qx !== qx) {
                    myData.qx = qx;
                    myData.flag = true;
                }
            }
        );
        const updateVal = (newValue: any) => {
            context.emit("update:modelValue", newValue.join(","));
            myData.valve = newValue;
            const qx = myData.valve.length === myData.options.length;
            if (myData.qx !== qx) {
                myData.qx = qx;
                myData.flag = true;
            } else {
                myData.flag = false;
            }
        };
        watch(
            () => myData.qx,
            (newValue) => {
                if (myData.flag) {
                    myData.flag = false;
                    return;
                }
                myData.valve = [];
                if (newValue) {
                    for (let key in myData.options) {
                        myData.valve.push(myData.options[key].dm);
                    }
                }
                context.emit("update:modelValue", myData.valve.join(","));
            }
        );
        return {
            myData,
            xInput,
            updateVal,
        };
    },
    render() {
        return (
            (
                <div>
                    <vxe-checkbox
                        v-model={this.myData.qx}
                        content="全选"
                        disabled={this.myData.isdisabled}
                    ></vxe-checkbox>
                    <vxe-checkbox-group
                        ref="xInput"
                        disabled={this.myData.isdisabled}
                        model-value={this.myData.valve}
                        onUpdate:modelValue={this.updateVal}
                    >
                        {this.myData.options.map((zd: any, index: number) => {
                            return (
                                <vxe-checkbox
                                    key={index}
                                    label={zd.dm}
                                    content={zd.mc}
                                ></vxe-checkbox>
                            );
                        })}
                    </vxe-checkbox-group>
                </div>
            )
        )
    }
});