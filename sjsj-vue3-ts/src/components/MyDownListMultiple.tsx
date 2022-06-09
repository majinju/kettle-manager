import { defineComponent, reactive, ref, watch } from 'vue'
import { ElMessage } from 'element-plus'
import { zdObj } from "@/utils/common";
import axios from "../axios";
import './MyDownListMultiple.scss';
export default defineComponent({
    name: "MyDownListMultiple",
    inheritAttrs: false,
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
            type: String
        },
        readonly: {
            type: String
        }

        /**
         * 表格配置集
         */
    },
    emits: ["update:modelValue"],
    setup(props, context) {
        const myData = reactive({
            //用于保存名称供展示用
            valueTags: [] as any[],
            //用于向父组件返回选中的值，与modelSelects进行关联。
            values: [] as any[],
            //所有数据读保存在这里，并进行监听，数据改变的同时分别给上两个赋值
            modelSelects: [] as any[],
            isdisabled: props.readonly || props.disabled,
            /**
             * 输入框绑定值
             */
            value: '',
            /**
             * 搜索关键字
             */
            searchKey: '',
            /**
             * 数据加载中
             */
            loading: false,
            /**
             * 列定义
             */
            tableColumn: [
                { field: 'checkbox', type: "checkbox", width: 60, showHeaderOverflow: true },
                { type: "seq", width: 50, title: "序号", align: "center" },
                { field: "dm", width: 180, title: "代码" },
                { field: "mc", title: "名称" },
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
                layouts: [
                    "Sizes",
                    "PrevJump",
                    "PrevPage",
                    "NextPage",
                    "NextJump",
                    "FullJump",
                    "Total",
                ],
            },
            toolbarConfig: {
                slots: {
                    buttons: 'toolbar_buttons'
                }
            }
        });
        const xGrid: any = ref({})
        /**
         * 获取表格数据
         */
        const searchList = async function (tsearchKey?: any) {
            if (tsearchKey) {
                myData.searchKey = tsearchKey;
            }
            myData.loading = true;
            await axios.post({
                sjdx: {
                    dxdm: "SYS_SJGL_TYZD",
                },
                yobj: {
                    zdlb: props.zdlb,
                },
                page: {
                    totalRequired: true,
                    pageSize: myData.tablePage.pageSize,
                    pageNumber: myData.tablePage.currentPage,
                },
                sys: {
                    cllx: "zdSearch",
                    searchKey: myData.searchKey,
                },
            }).then((req: any) => {
                if (req.status) {
                    myData.tableData = req.data.list;
                    myData.tablePage.total = req.data.totalRow;
                    myData.loading = false;
                    //主要解决有默认值的时候
                    if (myData.modelSelects.length > 0) {
                        myData.modelSelects.map((x: any) => {
                            myData.tableData.map((k: any, index) => {
                                if (k.dm === x.dm) {
                                    //vxe官网有解释
                                    const $table = xGrid.value
                                    $table.setCheckboxRow([myData.tableData[index]], true)
                                }
                            })
                        })
                    }
                } else {
                    ElMessage.error(req.msg);
                }
            })
        }
        /**
         * select下拉框的焦点事件
         */
        const myDownListMultiple: any = ref({});
        const selectFocus = () => {
            //获取焦点清除数据
            myData.value = ""
            //打开自定义下拉框
            const $pulldown = myDownListMultiple.value
            $pulldown.showPanel()
            searchList();
        }
        /**
         * 表格下拉框的获取焦点事件
         */
        const focusEvent = () => {
            //打开自定义下拉框
            const $pulldown = myDownListMultiple.value
            $pulldown.showPanel()
            searchList();
        }
        /**
         * 点击移除选项
         */
        const removeTag = (val: any) => {
            myData.modelSelects.forEach((item: any, i) => {
                if (item.mc === val) {
                    myData.modelSelects.splice(i, 1)
                    //在数组的some方法中，如果return true，就会立即终止这个数组的后续循环
                }
            })
            //清除tag标签的时候同时也清除表格中默认选中的状态
            myData.tableData.map((k: any, index) => {
                if (k.mc === val) {
                    const $table = xGrid.value
                    $table.setCheckboxRow([myData.tableData[index]], false)
                }
            })
        }
        /**
         * 自定义提示信息：多选框的提示
         */
        const showTooltipMethod = ({ type, column }: any) => {
            if (column.property === 'checkbox') {
                if (type === 'header')
                    return "当前页"
            }
        }
        /**
         * 用户释放键盘按键,字典的搜索
         */
        const keyupEvent = (value: any) => {
            myData.tablePage.currentPage = 1;
            searchList(value?.value);
        }
        /**
         * 翻页操作
         * @param currentPage 当前页
         * @param pageSize 页大小
         */
        const pageChangeEvent = ({ currentPage, pageSize }: any) => {
            myData.tablePage.currentPage = currentPage;
            myData.tablePage.pageSize = pageSize;
            searchList();
        }
        /**
         * 失去焦点
         */
        const hidePanelClick = () => {
            //清除搜索条件
            myData.searchKey = "";
            myData.tablePage.currentPage = 1;
        }
        /**
         * 当用户点击查询框的清除按钮时触发，清除所有内容，表格显示所有数据
         */
        const clearClick = () => {
            myData.searchKey = ""
            searchList()
        }
        /**
         * 当手动选择全选时候触发该方法
         */
        const checkChangeAll = ({ checked }: any) => {
            const $table = xGrid.value
            let checkBoxArray = $table.getCheckboxRecords();
            if (checked) {
                //进行全选时将数据进行清空
                myData.modelSelects = []
                checkBoxArray.forEach((item: any) => {
                    //将全选的数据保存到数组
                    myData.modelSelects.push(item)
                })
            } else {
                //当点击全不选的时候触发
                myData.modelSelects = []
            }
        }
        /**
         * 手动勾选或区域范围选择触发
         */
        const checkChange = ({ row, checked }: any) => {
            //判断是不是第一次勾选
            if (myData.modelSelects.length > 0) {
                if (checked) {
                    myData.value = row.mc;
                    myData.modelSelects.push(row)
                } else {
                    //如果checked为false则清除相应的输入框数据
                    removeTag(row.mc)
                }
            } else {
                myData.value = row.mc;
                myData.modelSelects.push(row)
            }
        }
        /**
         * 监听值变化的方法
         * @param newVal 新值
         * @param oldVal 旧值
         */
        const modelValueWatch = (newVal: any, oldVal: any) => {
            myData.values = []
            myData.valueTags = []
            myData.modelSelects = []
            if (!newVal) {
                // this.$emit("input", ""); //手动删除后  清除父节点中的数据
                //如果新值为空
                myData.value = "";
                return;
            }
            let arr = newVal.split(",")
            for (let i = 0; i < arr.length; i++) {
                zdObj({ zdlb: props.zdlb, dm: arr[i] }).then((zd: any) => {
                    myData.modelSelects.push(zd)
                });
            }
        }
        if (props.modelValue) {
            //如果初始传入了值，则主动调用值的监听方法
            modelValueWatch(props.modelValue, null);
        }
        watch(() => props.disabled, (newValue) => {
            myData.isdisabled = props.readonly || newValue
        })
        watch(() => props.readonly, (newValue) => {
            myData.isdisabled = props.disabled || newValue
        })
        watch(() => myData.modelSelects, (newVal, oldVal) => {
            myData.values = []
            myData.valueTags = []
            myData.modelSelects.forEach((item: any, i) => {
                myData.values.push(item.dm)
                myData.valueTags.push(item.mc)
            })
            let permission = myData.values.join(",");
            context.emit("update:modelValue", permission);
        }, { deep: true })

        return {
            myData,
            searchList,
            xGrid,
            myDownListMultiple,
            selectFocus,
            focusEvent,
            removeTag,
            showTooltipMethod,
            keyupEvent,
            pageChangeEvent,
            hidePanelClick,
            clearClick,
            checkChangeAll,
            checkChange,
            modelValueWatch

        }
    },
    render() {
        return (
            <vxe-pulldown
                ref="myDownListMultiple"
                transfer
                style="width: 100%"
                onHide-panel="hidePanelClick"
                v-slots={{
                    default: () => {
                        return (
                            <el-select v-model={this.myData.valueTags} multiple placeholder="请选择"
                                disabled={this.myData.isdisabled}
                                size="mini"
                                onFocus={this.selectFocus}
                                style="width: 100%"
                                popper-class="popper-select"
                                popper-append-to-body={false}
                                onRemove-tag={this.removeTag}
                                no-data-text=" ">
                                {this.myData.values.map((item: any, index: number) => {
                                    return (
                                        <el-option
                                            key={item.id}
                                            label={item.mc}
                                            value={item.dm}>
                                        </el-option>
                                    );
                                })}
                            </el-select>
                        );
                    },
                    dropdown: () => {
                        return (
                            <div class="my-dropdown">
                                <vxe-grid
                                    auto-resize
                                    ref="xGrid"
                                    height="auto"
                                    loading={this.myData.loading}
                                    pager-config={this.myData.tablePage}
                                    data={this.myData.tableData}
                                    columns={this.myData.tableColumn}
                                    onPage-change={this.pageChangeEvent}
                                    toolbar-config={this.myData.toolbarConfig}
                                    checkbox-config={{ trigger: 'row', highlight: true, range: true, checkField: 'checked' }}
                                    tooltip-config={{ contentMethod: this.showTooltipMethod, enterable: true }}
                                    onCheckbox-range-change={this.checkChange}
                                    onCheckbox-change={this.checkChange}
                                    onCheckbox-all={this.checkChangeAll}
                                    v-slots={{
                                        toolbar_buttons: () => {
                                            return (
                                                <vxe-input
                                                    v-model={this.myData.value}
                                                    suffix-icon="fa fa-search"
                                                    onKeyup={this.keyupEvent}
                                                    onFocus={this.focusEvent}
                                                    onClear={this.clearClick}
                                                >
                                                </vxe-input>
                                            );
                                        },
                                    }}
                                >
                                </vxe-grid>
                            </div>
                        )
                    }
                }}>
            </vxe-pulldown>
        )
    }
});