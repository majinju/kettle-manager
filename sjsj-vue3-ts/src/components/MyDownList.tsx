import { defineComponent, onMounted, reactive, ref, watch } from 'vue'
import axios from "@/axios";
import { zdObj } from "@/utils/common"
import { assignDeep } from "../utils/common";
import './MydownList.scss';
export default defineComponent({
    name: 'MyDownList',
    inheritAttrs: false,
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
        /**
         * 表格配置集
         */
        gridOptions: {
            type: Object,
            default: {}
        },
        /**
         * 搜索参数，与默认参数合并
         */
        searchParams: {
            type: Object,
            default: {}
        }
    },
    emits: ["update:modelValue", "updateZdmc"],
    setup(props, context) {
        const myData = reactive({
            /**
             * 绑定输入框值
             */
            value: "",
            /**
             * 数据加载中
             */
            loading: false,
            /**
             * 列定义
             */
            tableColumn: [
                { type: 'seq', width: 50, title: '序号', align: 'center' },
                { field: 'dm', width: 180, title: '代码' },
                { field: 'mc', title: '名称' }
            ],
            /**
             * 表格数据
             */
            tableData: [],
            /**
             * 分页配置
             */
            tablePage: {
                pageSizes: [5, 10, 20, 50],
                total: 0,
                currentPage: 1,
                pageSize: 5,
                layouts: ['Sizes', 'PrevJump', 'PrevPage', 'NextPage', 'NextJump', 'FullJump', 'Total']
            },
            /**
             * 搜索参数-默认
             */
            searchParamsDefault: {
                yobj: {
                    zdlb: props.zdlb
                },
                page: {
                    pageSize: 5,
                    totalRequired: true
                },
                sys: {
                    authCode: "QTQX_ZDGL",
                    cllx: "zdSearch"
                }
            },
            searchParams: {
                sys: {
                    searchKey: ""
                },
                page: {
                    pageNumber: 0,
                    totalRequired: true,
                    pageSize: 5,
                }
            },
        });
        myData.searchParams = assignDeep({}, myData.searchParamsDefault, props.searchParams);
        const myDownList: any = ref({});
        const xInput: any = ref({});
        const searchList = (tsearchKey?: any) => {
            if (tsearchKey) {
                myData.searchParams.sys.searchKey = tsearchKey;
            }
            myData.loading = true
            myData.searchParams.page.pageNumber = myData.tablePage.currentPage
            axios.post(myData.searchParams, false).then(req => {
                myData.tableData = req.data.list
                myData.loading = false
                if (myData.searchParams.page.totalRequired) {
                    myData.tablePage.total = req.data.totalRow;
                }
            })
        }
        /**
         * 获取焦点事件
         */
        const focusEvent = () => {
            const $pulldown = myDownList.value
            const $input = xInput.value
            if (!$input.disabled && !$input.readonly) {
                $pulldown.showPanel()
                myData.searchParams.page.totalRequired = true
                searchList();
            }
        }
        /**
         * 用户释放键盘按键
         * @param value 值
         * @param $event
         */
        const keyupEvent = (value: any, $event: any) => {
            myData.tablePage.currentPage = 1
            myData.searchParams.page.totalRequired = true
            searchList(value?.value);
        }
        /**
         * 翻页操作
         * @param currentPage 当前页
         * @param pageSize 页大小
         */
        const pageChangeEvent = ({ currentPage, pageSize }: any) => {
            myData.tablePage.currentPage = currentPage
            myData.tablePage.pageSize = pageSize
            myData.searchParams.page.pageSize = pageSize
            myData.searchParams.page.totalRequired = false
            searchList();
        }
        /**
         * 失去焦点
         * @param event
         */
        const hidePanelClick = (event: any) => {
            //恢复输入框的值为用户当前选择的值的翻译结果
            modelValueWatch(props.modelValue, null);
            //清除搜索条件
            myData.searchParams.sys.searchKey = "";
            myData.tablePage.currentPage = 1;
        }
        /**
         * 在点击尾部图标时触发该事件
         */
        const clearClick = () => {
            context.emit('update:modelValue', "");
        }
        /**
         * 选中操作
         * @param row 选中的行
         */
        const cellClickEvent = ({ row }: any) => {
            //将选中的值返回给父组件
            context.emit('update:modelValue', row.dm);

            const $pulldown = myDownList.value
            $pulldown.hidePanel()
        }
        /**
         * 监听值变化的方法
         * @param newVal 新值
         * @param oldVal 旧值
         */
        const modelValueWatch = function (newVal: any, oldVal: any) {
            if (!newVal) {
                //如果新值为空
                myData.value = "";
                context.emit("updateZdmc", "")
                return
            }
            zdObj({ zdlb: props.zdlb, dm: newVal }).then((zd: any) => {
                myData.value = zd.mc;
                context.emit("updateZdmc", zd.mc)
            })
        }
        if (props.modelValue) {
            //如果初始传入了值，则主动调用值的监听方法
            modelValueWatch(props.modelValue, null);
        }
        /**
         * 初始执行
         */
        onMounted(() => {
        })
        /**
         * 监听传入的值的变化
         */
        watch(() => props.modelValue, modelValueWatch);
        /**
         * 监听搜索参数变化
         */
        watch(() => props.searchParams, (newVal) => {
            myData.searchParams = assignDeep(myData.searchParams, myData.searchParamsDefault, newVal);
        })

        /**
         * 返回值
         */
        return {
            myData,
            myDownList,
            xInput,
            focusEvent,
            keyupEvent,
            clearClick,
            cellClickEvent,
            pageChangeEvent,
            hidePanelClick,
        }
    },
    render() {
        return (
            <vxe-pulldown ref="myDownList" transfer style="width: 100%" onHide-panel={this.hidePanelClick}
                v-slots={{
                    default: () => {
                        return (
                            <vxe-input v-model={this.myData.value} suffix-icon="el-icon-search" ref={this.xInput}
                                onChange={this.keyupEvent} onFocus={this.focusEvent}
                                onClear={this.clearClick}>
                            </vxe-input>
                        )
                    },
                    dropdown: () => {
                        return (
                            <div class="my-dropdown">
                                <vxe-grid
                                    auto-resize
                                    height="auto"
                                    loading={this.myData.loading}
                                    pager-config={this.myData.tablePage}
                                    data={this.myData.tableData}
                                    columns={this.myData.tableColumn}
                                    onCell-click={this.cellClickEvent}
                                    onPage-change={this.pageChangeEvent}
                                    {...this.gridOptions}>
                                </vxe-grid>
                            </div>
                        )
                    }
                }
                }
            >
            </vxe-pulldown >
        )
    }
})