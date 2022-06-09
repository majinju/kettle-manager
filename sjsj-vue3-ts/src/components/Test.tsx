import { defineComponent } from "vue"

export default defineComponent({
    setup: async (props, context) => {
        const jsonData = `{"title":"测试json数据","children":[{"name":"子项名称", "desc":"子项说明" },{"name":"子项名称1", "desc":"子项说明1" }]}`
        return {
            jsonStr: jsonData
        }
    },
    render() {
        return (
            <div>
                <b-code-editor v-model={this.jsonStr} indent-unit={4} height="auto" />
            </div>
        )
    }

})