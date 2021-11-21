import VXETable from '@majinju/vxe-table';
import XEUtils from "xe-utils";
import MyDownList from "components/MyDownList";
import MySelect from "components/MySelect";
import MySelectGrid from "../components/MySelectGrid";
import MySelectGrid1 from "@/views/sjdx1/MySelectGrid1";
import { dateFormat } from "@/utils/common"

/**
 * 基于 vxe-table 表格的适配插件
 */
export const VxeExtend = {
  install (vxetablecore) {
    const {renderer } = vxetablecore
    renderer.mixin({
      MySelect: {
        autofocus: 'input.my-input__inner',
        renderDefault (renderOpts, params) {
          const { data, property } = params
          const { props } = renderOpts
          return[
            <MySelect v-model={data[property]} {...props}/>
          ]
        },
        renderEdit (renderOpts, params) {
          const { data, property } = params
          const { props } = renderOpts
          return[
            <MySelect v-model={data[property]} {...props}/>
          ]
        },
        renderItemContent(renderOpts, params) {
          const { data, property } = params
          const { props } = renderOpts
          return[
            <MySelect v-model={data[property]} {...props}/>
          ]
        },
      },
      MyDownList: {
        autofocus: 'input.my-input__inner',
        renderDefault (renderOpts, params) {
          const { data, property } = params
          const { props } = renderOpts
          return[
            <MyDownList v-model={data[property]} {...props}/>
          ]
        },
        renderEdit (renderOpts, params) {
          const { data, property } = params
          const { props } = renderOpts
          return[
            <MyDownList v-model={data[property]} {...props}/>
          ]
        },
        renderItemContent(renderOpts, params) {
          const { data, property } = params
          const { props } = renderOpts
          return[
            <MyDownList v-model={data[property]} {...props}/>
          ]
        },
      },
      MyMarkDown: {
        autofocus: 'input.my-input__inner',
        renderDefault (renderOpts, params) {
          const { data, property } = params
          const { props } = renderOpts
          return[
            <v-md-editor v-model={data[property]} {...props}/>
          ]
        },
        renderItemContent(renderOpts, params) {
          const { data, property } = params
          const { props } = renderOpts
          return[
            <v-md-editor v-model={data[property]} {...props}/>
          ]
        },
      },
      MyJsonEditor: {
        autofocus: 'input.my-input__inner',
        renderDefault (renderOpts, params) {
          const { data, property } = params
          const { props } = renderOpts
          return[
            <v-md-editor v-model={data[property]} {...props}/>
          ]
        },
        renderItemContent(renderOpts, params) {
          const { data, property } = params
          const { props } = renderOpts
          return[
            <v-md-editor v-model={data[property]} {...props}/>
          ]
        },
      },
      MySelectGrid: {
        autofocus: 'input.my-input__inner',
        renderDefault (renderOpts, params) {
          const { data, property } = params
          const { props } = renderOpts
          return[
            <MySelectGrid v-model={data[property]} {...props}/>
          ]
        },
        renderItemContent(renderOpts, params) {
          const { data, property } = params
          const { props } = renderOpts
          return[
            <MySelectGrid v-model={data[property]} {...props}/>
          ]
        },
      },
      MySelectGrid1: {
        autofocus: 'input.my-input__inner',
        renderDefault (renderOpts, params) {
          const { data, property } = params
          const { props } = renderOpts
          return[
            <MySelectGrid1 v-model={data[property]} {...props}/>
          ]
        },
        renderItemContent(renderOpts, params) {
          const { data, property } = params
          const { props } = renderOpts
          return[
            <MySelectGrid1 v-model={data[property]} {...props}/>
          ]
        },
      }
    })
  }
}

/**
 * 时间日期格式转换---日期格式
 */
VXETable.formats.add('formatDate',({ cellValue },format)=>{
  return dateFormat(cellValue, format || 'YYYY-MM-DD HH:mm:ss')
})
/**
 * 格式金额，默认2位数
 */
VXETable.formats.add('myAmount', ({ cellValue }, digits = 2) => {
  return XEUtils.commafy(XEUtils.toNumber(cellValue), { digits })
})

/**
 * 下拉框字典转换
 */
VXETable.formats.add('formatterZd', ({ cellValue,row,column }) => {
  return row[column.property+'_mc'];
})


export default VxeExtend
