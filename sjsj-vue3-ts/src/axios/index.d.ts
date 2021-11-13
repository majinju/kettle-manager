declare const axios:{
    setToken(token:string):void;
    setBaseURL(baseURL:string):void;
    post(data:any):Promise<any>;
    upload(data:any):Promise<any>;
    download(data:any):Promise<any>;
}
export default axios;