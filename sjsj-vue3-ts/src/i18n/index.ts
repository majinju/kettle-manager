
import { createI18n } from 'vue-i18n'
//vxe-table的国际化
import zhCN from '@majinju/vxe-table/lib/locale/lang/zh-CN'
import enUS from '@majinju/vxe-table/lib/locale/lang/en-US'
//自己的国际化
import myCN from '../assets/lang/zh_CN'
import myUS from '../assets/lang/en_US'

const messages = {
  zh_CN: {
    ...zhCN,
    ...myCN
  },
  en_US: {
    ...enUS,
    ...myUS
  }
}

const i18n = createI18n({
  locale: 'zh_CN',
  messages,
})

export default i18n
