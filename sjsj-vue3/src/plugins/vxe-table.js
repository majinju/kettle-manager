
//专业表单、表格工具vxe-table
import VXETable from '@majinju/vxe-table';
import MyDownList from "components/MyDownList";
//vxe-table的饿了么扩展，支持饿了么的组件
import VXETablePluginElement from 'vxe-table-plugin-element'
import VxeExtend from "@/plugins/vxe-extend";
import i18n from "@/i18n";

/**
 * 表单全局配置
 */
export const options ={
  // 对组件内置的提示语进行国际化翻译
  i18n: (key, args) => i18n.global.t(key, args),
  // 可选，对参数中的列头、校验提示..等进行自动翻译（只对支持国际化的有效）
  translate (key, args) {
    // 例如，只翻译 "app." 开头的键值
    if (key && key.indexOf('app.') > -1) {
      return i18n.global.t(key, args)
    }
    return key
  },
  size: "mini",
  input:{
    clearable:true
  },
  select:{
    clearable:true,
    optionProps:{
      value:"dm",
      label:"mc"
    }
  },
  switch:{

  },
  button:{
  },
  textarea:{
    showWordCount:true,
    maxlength:5000,
    rows: 7,
    resize: "vertical",
    autosize:{ minRows: 7, maxRows: 10 }
  },
  form:{
    titleColon:true,
    titleWidth:"100",
    titleAlign:"right",
    titleOverflow: "tooltip"
  },
  toolbar:{
    export: false,
    custom: false
  },
  table:{
    border:true,
    resizable:true,
    autoResize: true,
    stripe:true,
    showOverflow: "tooltip",
    highlightHoverRow: true
  },
  pager:{
    pageSize:10,
    pageSizes: [10, 20, 50, 100, 500],
    layouts:['Sizes', 'PrevJump', 'PrevPage', 'Number', 'NextPage', 'NextJump', 'FullJump','PageCount', 'Total'],
    className:"my-pager"
  },
  modal:{
    width:"1000px",
    height:"600px",
    resize:true,
    showZoom:true
  }
}
//复用
options.input.size=options.size;
options.switch.size=options.size;
options.button.size=options.size;
options.toolbar.size=options.size;

VXETable.setup(options);
VXETable.setup({
});

VXETable.use(VXETablePluginElement);
VXETable.use(VxeExtend)

export default (app) => {
  app.use(VXETable);
  app.component(MyDownList);
}
