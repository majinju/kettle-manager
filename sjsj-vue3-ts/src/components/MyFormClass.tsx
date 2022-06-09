export default class MyFormClass {
    public VNode: JSX.Element | null;
    public xForm: any;
    public myData: any;
    constructor(VNode: any, xForm: any, myData: any) {
        this.VNode = VNode === null ? <vxe-form ref={xForm} key={myData.timestamp} data={myData.formData} rules={myData.formRule}
            items={myData.formItems}></vxe-form> : null;
        this.xForm = xForm;
        this.myData = myData;
    }
    getVNode(): JSX.Element | null { return this.VNode; }
    setVNode(VNode: JSX.Element): void {
        this.VNode = VNode
    }
}