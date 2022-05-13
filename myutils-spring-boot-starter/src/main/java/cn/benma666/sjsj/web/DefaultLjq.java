/**
 * Project Name:myutils
 * Date:2018年12月16日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.web;

import cn.benma666.constants.UtilConst;
import cn.benma666.crypt.MD5Util;
import cn.benma666.domain.SysLogFwzr;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglFile;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.MyException;
import cn.benma666.exception.QxException;
import cn.benma666.exception.VerifyRuleException;
import cn.benma666.iframe.*;
import cn.benma666.myutils.*;
import cn.benma666.sjsj.myutils.Msg;
import cn.benma666.sjzt.Bdwj;
import cn.benma666.sjzt.Db;
import cn.benma666.sjzt.Ftp;
import com.alibaba.druid.DbType;
import com.alibaba.druid.util.Utils;
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.alibaba.excel.write.style.column.LongestMatchColumnWidthStyleStrategy;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.Feature;
import com.alibaba.fastjson.util.TypeUtils;
import org.apache.commons.collections.CollectionUtils;
import org.beetl.sql.core.DSTransactionManager;
import org.beetl.sql.core.SQLManager;
import org.beetl.sql.core.SqlId;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.util.*;

/**
 * 默认拦截器 <br/>
 * date: 2018年12月16日 <br/>
 *
 * @author jingma
 */
@Component("MyDefaultLjq")
@Scope("prototype")
public class DefaultLjq extends BasicObject implements LjqInterface {
    /**
     * 去重字段列表缓存后缀
     */
    public static final String QCZD_LIST = "_qczdList";
    /**
     * 字段信息缓存
     */
    protected static JSONObject fieldsCache = CacheFactory.use(KEY_FIELDS, CacheFactory.TYPE_MEMORY);

    /**
     * 该拦截器对应的数据对象，每个对象一个拦截器
     */
    protected SysSjglSjdx sjdx;
    /**
     * 被代理的拦截，若是从sb容器中取出的拦截器，拦截器中直接取this为非代理拦截器
     */
    protected LjqInterface dlLjq;
    /**
     * 获取处理类型
     *
     * @param myParams 参数对象
     * @return 处理类型
     */
    public static String getCllx(JSONObject myParams) {
        return myParams.getString($_SYS_CLLX);
    }

    @Override
    public JSONObject jcxx(JSONObject myParams) {
        if (StringUtil.isBlank(getCllx(myParams))) {
            throw new MyException(Msg.msg("interceptor.bxsscllx", LjqInterface.$_SYS_CLLX.substring(2)), myParams);
        }
        //获取权限key
        getToken(myParams);
        //获取用户信息
        SysQxYhxx user = getUser(myParams);
        myParams.put(KEY_USER, user);
        //获取字段信息
        getFields(myParams, user);
        //记录操作日志
        initCzrz(myParams, user);
        //权限鉴定
        auth(myParams, user);
        if (Conf.getVal("benma666.mrputobj", "save,update").contains(getCllx(myParams))) {
            //设置需要处理的对象
            putObj(myParams);
        }
        //验证规则
        yzgz(myParams);
        //转换规则
        zhgz(myParams);
        return myParams;
    }

    /**
     * 转换规则
     * @param myParams 相关参数
     */
    public void zhgz(JSONObject myParams) {
        JSONObject zhgz = myParams.getJSONObject(KEY_ZHGZ);
        if (zhgz==null) {
            //没有配置转换信息
            return;
        }
        //取出验证规则
        String cllx = getCllx(myParams);
        for (String key : zhgz.keySet()) {
            JSONObject gzObj = zhgz.getJSONObject(key);
            Object val = myParams.get("$." + key);
            Object newVal = TransRule.ruleTrans(val,myParams, gzObj, cllx);
            if((isBlank(val)&&isBlank(newVal))){
                //原始值为空，转换后也为空则跳过
                continue;
            }
            //转换数据
            myParams.set("$." + key,newVal);
        }
    }

    /**
     * 验证规则
     * @param myParams 相关参数
     */
    @Override
    public void yzgz(JSONObject myParams) {
        //取出验证规则
        JSONObject yzgz = myParams.getJSONObject(KEY_YZGZ);
        if (myParams.get(KEY_USER) == null||yzgz==null) {
            //没有用户信息默认为系统内部调用，不进行验证，或没有配置验证信息
            return;
        }
        String cllx = getCllx(myParams);
        for (String key : yzgz.keySet()) {
            JSONObject gzObj = yzgz.getJSONObject(key);
            try {
                VerifyRule.ruleVerify(myParams.get("$." + key),
                        myParams, gzObj, cllx);
            } catch (VerifyRuleException e) {
                throw new MyException(e.getMessage(), HttpStatus.PRECONDITION_FAILED.value(), key);
            }
        }
    }

    @Override
    public Result upload(JSONObject myParams,
                         MultipartFile[] files) throws Exception {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        List<Object> list = new ArrayList<>();
        for (MultipartFile file : files) {
            SysSjglFile fileObj = yobj.toJavaObject(SysSjglFile.class);
            Result r = upload(myParams, fileObj, file);
            if (!r.isStatus()) {
                return r;
            }
            list.add(r.getData());
        }
        return success("上传成功", list);
    }

    @Override
    public Result data(JSONObject myParams) {
        String cllx = getCllx(myParams);
        try{
            Method m = this.getClass().getMethod(cllx, JSONObject.class);
            if(m.getAnnotation(Transactional.class)!=null){
                //没管事务的其他参数
                DSTransactionManager.start();
                Result r;
                try {
                    r = (Result) m.invoke(getDlLjq(), myParams);
                    return swtj(r);
                }catch (Throwable e){
                    //回滚事务
                    swtj(failed("失败"));
                    throw e;
                }
            }else {
                return (Result) m.invoke(getDlLjq(),myParams);
            }
        }catch (NoSuchMethodException e){
            //没有找到该处理类型对应的方法，执行默认操作
            Object zxcz = myParams.get("$.sys.zxcz");
            if(zxcz==null||KEY_CLLX_GETDATA.equals(zxcz)){
                return getDlLjq().getdata(myParams);
            }else if(KEY_CLLX_PLCL.equals(zxcz)){
                return getDlLjq().plcl(myParams);
            }else if(KEY_CLLX_GETFILE.equals(zxcz)){
                return getDlLjq().getfile(myParams);
            }else{
                throw new MyException("暂不支持的执行操作："+zxcz);
            }
        } catch (InvocationTargetException | IllegalAccessException e) {
            if(e.getCause()!=null&&(e.getCause() instanceof MyException)){
                throw (MyException)e.getCause();
            }
            log.error(cllx+"方法执行失败",e);
            throw new MyException(cllx+"方法执行失败："+e.getCause().getMessage());
        }
    }

    /**
     * 只取对外有用的,系统基础信息
     * @return 系统基础信息
     */
    public Result xtjcxx(JSONObject myParams){
        JSONObject jcxx = new JSONObject();
        jcxx.put(KEY_USER, myParams.get(KEY_USER));
        JsonUtil.copy(jcxx, myParams, $_SYS_TOKEN);
        JsonUtil.copy(jcxx, myParams, $_SYS_CLIENT_IP);
        return success(msgCzcg(), jcxx);
    }
    /**
     * 只取对外有用的,对象基础信息
     * @return 对象基础信息
     */
    public Result dxjcxx(JSONObject myParams){
        //只取对外有用的，对象基础信息
        JSONObject jcxx = new JSONObject();
        jcxx.put(KEY_SJDX, myParams.get(KEY_SJDX));
        jcxx.put(KEY_FIELDS, myParams.get(KEY_FIELDS));
        jcxx.put(KEY_OBJ, myParams.get(KEY_OBJ));
        JsonUtil.copy(jcxx, myParams, "$.cllxkz");
        JsonUtil.copy(jcxx, myParams, "$.sys.sjdxkz");
        JsonUtil.copy(jcxx, myParams, "$.sys.fields");
        JsonUtil.copy(jcxx, myParams, $_SYS_AUTHCODE);
        return success(msgCzcg(), jcxx);
    }
    @Override
    public Result getdata(JSONObject myParams) {
        //创建个对象，用于在模板中可以设置一些数据作为结果传给前端
        JSONObject resultData = new JSONObject();
        myParams.set("sql.resultData", resultData);

        //先调用一次查询语句，获取默认查询条件
        getSql(myParams,KEY_CLLX_SELECT);
        String[] arr = getDlLjq().getSql(myParams);
        resultData.put("list", db(arr[0]).find(arr[1], myParams));
        return success("操作成功", resultData);
    }

    @Override
    public Result plcl(JSONObject myParams) {
        //先调用一次查询语句，获取默认查询条件
        getSql(myParams,KEY_CLLX_SELECT);
        String[] arr = getDlLjq().getSql(myParams);
        return success("操作成功", db(arr[0]).update(arr[1], myParams));
    }

    /**
     * 导出当前页数据
     */
    public Result dcdqysj(JSONObject myParams) {
        return dcsj(myParams);
    }
    @Override
    public Result dcsj(JSONObject myParams) {
        //导出数据
        myParams.set("$.page.totalRequired", Boolean.FALSE);
        PageInfo<JSONObject> page = (PageInfo<JSONObject>) getDlLjq().select(myParams).getData();
        String fileName = sjdx.getDxmc()+"-" + DateUtil.getGabDate() + ".xlsx";
        if (myParams.getString("$.sys.dcwjm") != null) {
            fileName = myParams.getString("$.sys.dcwjm");
        }
        try {
            String hiddenCol = myParams.getString("$.sys.hiddenCol") + ",列表选择";
            dcsjYcl(myParams,page.getList(),hiddenCol,KEY_CLLX_DCSJ);
            return resultExcelFile((List<List<String>>)myParams.get($_OTHEROBJ_DCSJYCL_HEADER),
                    (List<List<String>>)myParams.get($_OTHEROBJ_DCSJYCL_DATA), fileName);
        } catch (Exception e) {
            log.error("导出数据失败:" + myParams, e);
            throw new MyException("导出数据失败，请查看系统日志分析原因:" + e.getMessage());
        }
    }

    @Override
    public Result getfile(JSONObject myParams) {
        String[] arr;
        try {
            arr = getDlLjq().getSql(myParams);
            List<JSONObject> rl = db(arr[0]).find(arr[1], JSONObject.class, myParams);
            if (rl.size() == 0) {
                throw new MyException("未找到文件数据");
            }
            JSONObject fo = rl.get(0);
            SysSjglFile file = fo.toJavaObject(SysSjglFile.class);
            String sjxs = fo.getString("sjxs");
            byte[] byteArr = null;
            if ("bdwjjl".equals(sjxs)) {
                byteArr = Utils.readByteArray(new FileInputStream(fo.getString("data")));
            } else if ("blob".equals(sjxs)) {
                byteArr = fo.getBytes("data");
            }
            if(myParams.containsKey("$.sys.xzms")){
                file.setXzms(myParams.getIntValue("$.sys.xzms"));
            }
            return resultFile(byteArr, file);
        } catch (Exception e) {
            log.error("获取文件失败:" + myParams, e);
            throw new MyException("获取文件失败，请查看系统日志分析原因:" + e.getMessage());
        }
    }

    /**
     * 下载文件
     * @param myParams 相关参数
     * @return 处理结果
     */
    public Result download(JSONObject myParams) {
        JSONObject fileJcxx = LjqManager.jcxxByDxdm("SYS_SJGL_FILE");
        fileJcxx.set("$.page.totalRequired", Boolean.FALSE);
        JsonUtil.copy(fileJcxx,myParams,"$.yobj.id");
        JsonUtil.copy(fileJcxx,myParams,"$.sys.ids");
        PageInfo<JSONObject> page = (PageInfo<JSONObject>) LjqManager.select(fileJcxx).getData();
        if (page.getList().size() == 0) {
            throw new MyException("没有找到该文件");
        } else if (page.getList().size() > 1) {
            throw new MyException("不能找到唯一的文件记录");
        }
        SysSjglFile file = page.getList().get(0).toJavaObject(SysSjglFile.class);
        if(myParams.containsKey("$.sys.xzms")){
            file.setXzms(myParams.getIntValue("$.sys.xzms"));
        }
        return resultFile(file.getFileBytes(), file);
    }


    @Override
    public Result sjplsc(JSONObject myParams) {
        Result r;
        JSONArray files = myParams.getJSONArray("$.sys.files");
        if(files==null){
            throw new MyException("没有获取到文件，请确认文件正确上传");
        }
        try {
            int count = 0;
            for(int i=0;i<files.size(); i++){
                SysSjglFile file = files.getObject(i,SysSjglFile.class);
                SjdxExcelReader er = new SjdxExcelReader(sjdx,myParams, file);
                r = er.disposeExcel();
                if (!r.isStatus()) {
                    return r;
                }
                myParams.set("$.sys.editTableData",er.getResult());
                r = plbc(myParams);
                if(!r.isStatus()){
                    return r;
                }
                count+=er.getResult().size();
            }
            return success("成功上传数据量：" + count);
        } catch (Exception e) {
            log.error("文件处理失败：" + myParams + "->" + e.getMessage(), e);
            r = failed("文件处理失败：" + e.getMessage());
            return swtj(r);
        }
    }

    /**
     * 删除数据
     * @return 操作结果
     */
    public Result delete(JSONObject myParams) {
        return getDlLjq().plsc(myParams);
    }
    @Override
    public Result plsc(JSONObject myParams) {
        //先调用一次查询语句，获取默认查询条件
        getSql(myParams,KEY_CLLX_SELECT);
        boolean wlsc = myParams.getBoolean("$.sys.wlsc");
        Result r = success("");
        if (StringUtil.isNotBlank(sjdx.getYxxzd()) && wlsc) {
            //存在有效性字段，且允许物理删除
            r = wlscByYxx(myParams);
        }
        String[] arr = getSql(myParams,KEY_CLLX_PLSC);
        //后续继续进行逻辑删除操作
        int scs = db(arr[0]).update(arr[1], myParams);
        if (isBlank(sjdx.getYxxzd())||isBlank(r.getMsg())) {
            r.addMsg("处理记录数：" + scs);
        } else {
            r.addMsg("逻辑删除记录数：" + scs);
        }
        return r;
    }

    /**
     * @return 核查结果，正确：true，错误：false
     */
    public Result inspect(JSONObject myParams) {
        //不进行列表查询
        myParams.set("$.page.listRequired",false);
        Result r = getDlLjq().select(myParams);
        if(!r.isStatus()){
            return r;
        }
        return success("核查成功",((PageInfo<JSONObject>)r.getData()).getTotalRow()>0);
    }

    @Override
    public Result select(JSONObject myParams) {
        Result r;
        if (DbType.of(sjdx.getDxztlx()) != null) {
            //数据库场景
            r = selectDb(myParams);
        } else {
            switch (sjdx.getDxztlx()){
                case ZD_SJZTLX_KAFKA:
                    //kafka场景
                    r = selectKafka(myParams);
                    break;
                case ZD_SJZTLX_FTP:
                    r = selectFtp(myParams);
                    break;
                case ZD_SJZTLX_BDWJ:
                    //本地文件
                    r = selectBdwj(myParams);
                    break;
                default:
                    //后续支持文件等各类数据载体，暂未实现
                    throw new MyException("不支持的对象载体类型：" + sjdx.getDxztlx());
            }
        }
        return r;
    }

    @Override
    public Result insert(JSONObject myParams) throws MyException {
        myParams.set($_SYS_CLLX, KEY_CLLX_INSERT);
        return getDlLjq().save(myParams);
    }

    @Override
    public Result update(JSONObject myParams) throws MyException{
        myParams.set($_SYS_CLLX, KEY_CLLX_UPDATE);
        return getDlLjq().save(myParams);
    }

    /**
     * 保存数据
     * @return 操作结果
     */
    public Result save(JSONObject myParams) {
        Result res = success("新增成功");
        if(KEY_CLLX_UPDATE.equals(myParams.getString($_SYS_CLLX))){
            //更新
            if(!myParams.getBoolean($_SYS_YZDJL)){
                throw new MyException("没有找到要更新的记录");
            }
            //根据处理类型设置消息
            res.setMsg("更新成功");
        }else if(!KEY_CLLX_INSERT.equals(myParams.getString($_SYS_CLLX))){
            //非插入更新,自动判断是插入还是更新
            if(myParams.getBoolean($_SYS_YZDJL)){
                myParams.set($_SYS_CLLX, KEY_CLLX_UPDATE);
            }else{
                myParams.set($_SYS_CLLX, KEY_CLLX_INSERT);
            }
        }
        if(!myParams.getBoolean($_SYS_NBDY)){
            //内部调用不做校验
            yzgz(myParams);
        }
        Result r;
        if (DbType.of(sjdx.getDxztlx()) != null) {
            //数据库场景
            r = saveDb(myParams);
        } else {
            switch (sjdx.getDxztlx()){
                case ZD_SJZTLX_KAFKA:
                    //kafka场景
                    r = saveKafka(myParams);
                    break;
                case ZD_SJZTLX_FTP:
                    r = saveFtp(myParams);
                    break;
                case ZD_SJZTLX_BDWJ:
                    //本地文件
                    r = saveBdwj(myParams);
                    break;
                default:
                    //后续支持文件等各类数据载体，暂未实现
                    throw new MyException("不支持的对象载体类型：" + sjdx.getDxztlx());
            }
        }
        if(!r.isStatus()){
            return r;
        }
        JSONObject data = new JSONObject();
        //保存成功，返回主键信息
        data.put(sjdx.getZjzd(),myParams.get("$.yobj." + sjdx.getZjzd()));
        //返回处理类型，针对自动判断处理类型时，告知前端时进行了插入还是更新
        data.put(KEY_CLLX,myParams.getString($_SYS_CLLX));
        res.setData(data);
        return res;
    }

    /**
     * 批量保存
     * @param myParams 相关参数
     * @return 操作结果
     */
    @Transactional
    public Result plbc(JSONObject myParams){
        JSONArray editTableData = myParams.getJSONArray("$.sys.editTableData");
        JSONObject[] list = null;
        if(editTableData!=null){
            list = editTableData.toJavaList(JSONObject.class).toArray(new JSONObject[]{});
        }
        Result r;
        if (DbType.of(sjdx.getDxztlx()) != null) {
            //数据库场景
            if(list==null){
                throw new MyException("没有提供批量保存的数据");
            }
            r = plbcDb(myParams,list);
        } else {
            switch (sjdx.getDxztlx()){
                case ZD_SJZTLX_KAFKA:
                    //kafka场景
                    r = plbcKafka(myParams,list);
                    break;
                case ZD_SJZTLX_FTP:
                    r = plbcFtp(myParams,list);
                    break;
                case ZD_SJZTLX_BDWJ:
                    //本地文件
                    r = plbcBdwj(myParams,list);
                    break;
                default:
                    //后续支持文件等各类数据载体，暂未实现
                    throw new MyException("不支持的对象载体类型：" + sjdx.getDxztlx());
            }
        }
        if(!r.isStatus()){
            //异常场景抛出异常，便于事务回滚
            throw new MyException(r.getMsg(),r.getData());
        }
        return r;
    }

    @Override
    public String[] getSql(JSONObject myParams) {
        String cllx = myParams.getString($_SYS_CLLX);
        return getSql(myParams, cllx);
    }

    @Override
    public String[] getSql(JSONObject myParams, String cllx) {
        //设置from
        myParams.set("$.sql.from", (StringUtil.isBlank(
                sjdx.getDxgs()) ? "" : sjdx.getDxgs() + ".") + sjdx.getJtdx());
        //先获取该处理类型对应的数据库的默认sql
        Db.getZdSqlTmpl(myParams,"DEFAULT."+cllx,sjdx.getDxztlx());
        //获取该对象的专有sql
        String sql = Db.getZdSqlTmpl(myParams,sjdx.getDxdm() + "." + cllx,sjdx.getDxztlx());
        if(isBlank(sql)){
            //模板都不存在哎
            throw new MyException(Msg.msg("ljq.default.mypzgsql", cllx), sjdx);
        }
        return Db.parseDictExp(sql, sjdx.getDxzt());
    }

    /**
     * 导出模板
     * @param myParams 相关参数
     * @return 处理结果
     */
    public Result dcmb(JSONObject myParams) {
        //导出数据
        String fileName = sjdx.getDxmc()+"-数据上传模板-" + DateUtil.getGabDate() + ".xlsx";
        if (myParams.get("$.sys.dcwjm") != null) {
            fileName = myParams.getString("$.sys.dcwjm");
        }
        try {
            Map<String, JSONObject> fields = (Map<String, JSONObject>) myParams.get(KEY_FIELDS);
            List<List<String>> header = new ArrayList<>();
            List<String> h;
            List<List<String>> data = new ArrayList<>();
            List<String> r = new ArrayList<>();
            data.add(r);
            for (Map.Entry<String, JSONObject> f : fields.entrySet()) {
                if (valByDef(f.getValue().getBoolean("mbzs"),false)) {
                    h = new ArrayList<>();
                    h.add(f.getValue().getString("zdmc") + "[" + f.getValue().getString("zddm") + "]");
                    header.add(h);
                    r.add(VerifyRule.rulejx(f.getValue(), f.getValue().getJSONObject("$.kzxx.yzgz").getJSONObject(KEY_CLLX_INSERT)));
                }
            }
            return resultExcelFile(header, data, fileName);
        } catch (Exception e) {
            log.error("导出数据失败", e);
            throw new MyException("导出数据失败，请查看系统日志分析原因:" + e.getMessage());
        }
    }

    /**
     * 获取权限id
     * @param myParams 参数对象
     */
    protected void getToken(JSONObject myParams) {
        if (StringUtil.isNotBlank(myParams.getString(LjqInterface.$_SYS_TOKEN))) {
            return;
        }
        HttpServletRequest req = myParams.getObject(LjqInterface.$_OTHEROBJ_REQUEST, HttpServletRequest.class);
        if(req==null){
            return;
        }
        //先取header中
        String token = req.getHeader(UserManager.TOKEN);
        if(StringUtil.isBlank(token)){
            Cookie[] cookies = req.getCookies();
            if(cookies!=null){
                for(Cookie cookie:cookies) {
                    //获取新GAW可信代理的认证key
                    if("acsgToken".equals(cookie.getName())) {
                        token = cookie.getValue();
                        break;
                    }
                }
            }
        }
        if (StringUtil.isBlank(token)) {
            //再取常规浏览器会话id
            token = req.getSession().getId();
        }
        //常规参数中没有设置权限认证key
        myParams.set(LjqInterface.$_SYS_TOKEN, token);
    }

    /**
     * 获取用户信息
     * @param myParams 参数对象
     * @return 用户信息
     */
    @Nullable
    protected SysQxYhxx getUser(JSONObject myParams) {
        return UserManager.getUser(myParams);
    }

    /**
     * 权限过滤 <br/>
     * @param myParams 参数集
     * @param user 用户对象
     * @throws QxException 没有权限将抛出异常
     * @author jingma
     */
    protected void auth(JSONObject myParams,SysQxYhxx user) throws QxException {
        //处理类型
        String cllx = myParams.getString(LjqInterface.$_SYS_CLLX);
        //权限码
        String authCode = myParams.getString(LjqInterface.$_SYS_AUTHCODE);
        //用户
        if (myParams.getBoolean($_SYS_NBDY)) {
            //内部调用，则默认通过，此类都是系统内部调用
            return;
        }else if ((authCode == null)&&!UserManager.LSYH.equals(user.getYhdm())
                && Conf.getVal("benma666.xtqx.mrtgqx","dxjcxx,select").contains(cllx)) {
            //没有配置权限,且不是临时用户，且在允许权限范围内则默认通过
            //就是说没有配置权限的对象只有登陆用户可以访问，这样至少可以识别出是哪个人
            return;
        }else if (user.getQxMap().containsKey(authCode + "_" + cllx)) {
            //对象权限判断
            return;
        }
        QxException e = new QxException("没有操作权限");
        e.setData(authCode + "_" + cllx);
        throw e;
    }

    /**
     * 保存数据-数据库 <br/>
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    protected Result saveDb(JSONObject myParams) {
        String[] arr = getSql(myParams);
        return success(msgCzcg(), db(arr[0]).update(arr[1], myParams));
    }
    /**
     * 保存数据-本地文件
     */
    protected Result saveBdwj(JSONObject myParams) {
        return plbcBdwj(myParams,new JSONObject[]{myParams.getJSONObject(KEY_YOBJ)});
    }
    /**
     * 保存数据-FTP
     */
    protected Result saveFtp(JSONObject myParams) {
        return plbcFtp(myParams,new JSONObject[]{myParams.getJSONObject(KEY_YOBJ)});
    }
    /**
     * 保存数据-kafka
     */
    protected Result saveKafka(JSONObject myParams) {
        return plbcKafka(myParams,new JSONObject[]{myParams.getJSONObject(KEY_YOBJ)});
    }

    /**
     * 批量保存数据到本地文件，不考虑内容，原样保存
     */
    protected Result plbcBdwj(JSONObject myParams, JSONObject[] list) {
        if(list!=null){
            dcsjYcl(myParams,Arrays.asList(list), "", KEY_CLLX_INSERT);
        }
        return Bdwj.use(sjdx.getDxzt()).plbc(sjdx,myParams);
    }

    /**
     * 批量保存数据到ftp上，不考虑内容，原样保存
     */
    protected Result plbcFtp(JSONObject myParams, JSONObject[] list) {
        if(list!=null){
            dcsjYcl(myParams,Arrays.asList(list), "", KEY_CLLX_INSERT);
        }
        return Ftp.use(sjdx.getDxzt()).plbc(sjdx,myParams);
    }

    /**
     * 批量保存数据到kafka上，不考虑内容，原样保存
     */
    protected Result plbcKafka(JSONObject myParams, JSONObject[] list) {
        throw new MyException("不支持的对象载体类型：" + sjdx.getDxztlx());
    }

    protected Result plbcDb(JSONObject myParams, JSONObject[] list) {
        //获取事务提交量
        int swtjl = myParams.getIntValue("$.sys.swtjl");

        List<Object> ro1 = new ArrayList<>();
        //总共多少条记录
        int count = 0;
        //插入多少记录
        int insert = 0;
        //更新多少记录
        int update = 0;
        Result r;
        for (JSONObject j : list) {
            //取消原来的处理类型，由保存方法自动判断
            myParams.set($_SYS_CLLX,"");
            myParams.put(KEY_YOBJ, j);
            //根据输入参数进行重复查询
            putObj(myParams);
            r = save(myParams);
            if (!r.isStatus()) {
                r.addMsg("第" + (count + 1) + "行");
                return r;
            } else {
                JSONObject data = (JSONObject)r.getData();
                if(KEY_CLLX_INSERT.equals(data.getString(KEY_CLLX))){
                    insert++;
                }else{
                    update++;
                }
                ro1.add(data);
                count++;
                if (count % swtjl == 0) {
                    log.info(sjdx.getDxdm()+"已入数据："+count);
                }
            }
        }
        return success("共计"+count+"条记录，其中新增："+insert+"条，更新"+update+"条", ro1);
    }

    @NotNull
    protected Result selectDb(JSONObject myParams) {
        //获取分页对象
        PageInfo<JSONObject> page = myParams.getObject(KEY_PAGE,PageInfo.class);
        if (StringUtil.isBlank(page.getOrderBy())) {
            //请求没有设置排序时，采用默认排序
            page.setOrderBy(sjdx.getMrpx());
        }
        //获取sql
        String[] arr = getSql(myParams, KEY_CLLX_SELECT);
        String sql;
        if (StringUtil.isNotBlank(sjdx.getSqlmb())) {
            //对象上设置了查询sql模板
            sql = TmplUtil.buildStrSql(sjdx.getSqlmb(), myParams).trim();
            if (sql.startsWith("error:")) {
                throw new MyException(sql.substring("error:".length()));
            }
            arr = Db.parseDictExp(sql, arr[0]);
        }
        //分页查询
        page = db(arr[0]).queryPage(page, arr[1], myParams);
        JSONObject fields = myParams.getJSONObject(KEY_FIELDS);
        //树形结构时，将是否有子节点的标志转为boolean形
        String hasChild = myParams.getString("$.cllxkz['select'].tree.hasChild");
        String checkField = myParams.getString("$.cllxkz['select'].checkboxConfig.checkFieldOld");
        for(JSONObject row : page.getList()){
            for(String zddm:fields.keySet()){
                if(StringUtil.isBlank(row.getString(zddm))){
                    //字段值为空时跳过
                    continue;
                }
                String kjlx = fields.getString("$."+zddm+".kjlx");
                //对结果进行字典翻译，字典或者级联控件
                if (ZD_SJDX_KJLX_DICT.equals(kjlx) || "ElCascader".equals(kjlx)
                        || "$radio".equals(kjlx)|| "$checkbox".equals(kjlx)) {
                    row.put(zddm+"_mc",DictManager.zdMcByMoreDm(fields.getString("$."+zddm+".zdzdlb"),row.getString(zddm)));
                    //字典对象一起返回前端，为便于前端获取附加信息
//                    row.put(zddm+"_zdobj",DictManager.zdObjByMoreDm(fields.getString("$."+zddm+".zdzdlb"),row.getString(zddm)));
                }else if(ZD_SJDX_KJLX_CHECKBOX.equals(kjlx)){
                    row.put(zddm+"_mc",DictManager.zdMcByDm(DICT_SYS_COMMON_LJPD,row.getString(zddm)));
                }
            }
            if(hasChild!=null){
                row.put(hasChild,row.getBoolean(hasChild));
            }
            if(checkField!=null){
                row.put(checkField+"_boolean",row.getBoolean(checkField));
            }
        }
        return success(msgCzcg(),page);
    }
    /**
     * 查询数据-本地文件
     */
    protected Result selectBdwj(JSONObject myParams) {
        throw new MyException("不支持的对象载体类型：" + sjdx.getDxztlx());
    }
    /**
     * 查询数据-FTP
     */
    protected Result selectFtp(JSONObject myParams) {
        throw new MyException("不支持的对象载体类型：" + sjdx.getDxztlx());
    }
    /**
     * 查询数据-kafka
     */
    protected Result selectKafka(JSONObject myParams) {
        throw new MyException("不支持的对象载体类型：" + sjdx.getDxztlx());
    }

    /**
     * 导出数据预处理,处理结果在系统参数myParams中。<br/>
     * 表头：$_OTHEROBJ_DCSJYCL_HEADER、数据：$_OTHEROBJ_DCSJYCL_DATA
     * @param myParams 系统参数
     * @param list 要导出的数据
     * @param hiddenCol 不展示的列字段名称
     * @param cllx 处理类型
     */
    protected void dcsjYcl(JSONObject myParams, List<JSONObject> list, String hiddenCol, String cllx){
        Set<String> hiddenColSet = new HashSet<>();
        CollectionUtils.addAll(hiddenColSet, hiddenCol.split(","));
        Map<String, JSONObject> fields = (Map<String, JSONObject>) myParams.get(KEY_FIELDS);

        List<String> showCol = new ArrayList<>();
        List<List<String>> header = new ArrayList<>();
        List<String> rows;
        for (Map.Entry<String, JSONObject> f : fields.entrySet()) {
            String kjlx = f.getValue().getString("kjlx");
            if (valByDef(f.getValue().getBoolean("$.kzxx.cllxkz."+cllx+".show"),false)
                    && !hiddenColSet.contains(f.getValue().getString("zdmc"))
                    && !kjlx.equals("password")
                    && !kjlx.equals("$buttons")) {
                rows = new ArrayList<>();
                //详情展示且前端没有要求不导出且控件类型不是密码的字段才导出
                rows.add(f.getValue().getString("zdmc"));
                header.add(rows);
                showCol.add(f.getKey());
            }
        }

        List<List<String>> data = new ArrayList<>();
        for (JSONObject r2 : list) {
            rows = new ArrayList<>();
            data.add(rows);
            for (String f : showCol) {
                JSONObject field = fields.get(f);
                String kjlx = field.getString("kjlx");
                String val = r2.getString(f);
                if (ZD_SJDX_KJLX_DICT.equals(kjlx) || ZD_SJDX_KJLX_CHECKBOX.equals(kjlx)
                        || "ElCascader".equals(kjlx)|| "$radio".equals(kjlx)|| "$checkbox".equals(kjlx)) {
                    rows.add(DictManager.zdMcByMoreDm(fields.get(f).getString("zdzdlb"), r2.getString(f)));
                } else if (ZD_SJDX_KJLX_TIME.equals(kjlx)) {
                    //这个格式可定制
                    String fmt = valByDef(field.getString("$.kzxx.kjkz.zsgs"),DateUtil.DATE_FORMATTER_L);
                    String v = DateUtil.doFormatDate(val, fmt);
                    if (StringUtil.isBlank(v)) {
                        v = val;
                    }
                    rows.add(v);
                } else {
                    //EXCEL限制单个大小
                    if (StringUtil.isNotBlank(val)) {
                        val = val.length() > 32767 ? val.substring(0, 32767) : val;
                    }
                    rows.add(val);
                }
            }
        }
        myParams.set($_OTHEROBJ_DCSJYCL_HEADER,header);
        myParams.set($_OTHEROBJ_DCSJYCL_DATA,data);
    }

    /**
     * 基于有效性的物理删除 <br/>
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    protected Result wlscByYxx(JSONObject myParams) {
        //有有效性字段
        String[] arr = getSql(myParams, "wl" + KEY_CLLX_PLSC);
        //先执行物理删除，将本次删除中，已经为无效的进行物理删除
        int scs = db(arr[0]).update(arr[1], myParams);
        return success("物理删除数：" + scs);
    }

    /**
     * 设置obj <br/>
     * @param myParams 参数
     * @author jingma
     */
    protected void putObj(JSONObject myParams) {
        myParams.set($_SYS_YZDJL, Boolean.FALSE);
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        if(yobj==null){
            return;
        }
        List<JSONObject> qcList = (List<JSONObject>) fieldsCache.get(sjdx.getId()+ QCZD_LIST);
        JSONObject qcObj = new JSONObject();
        if(qcList.size()==1){
            //一个去重字段
            JSONObject f = qcList.get(0);
            if (f!=null&&StringUtil.isNotBlank(yobj.getString(f.getString(FIELD_ZDDM)))) {
                //该去重字段不为空
                qcObj.put(f.getString(FIELD_ZDDM),yobj.getString(f.getString(FIELD_ZDDM)));
            }
        }else if(StringUtil.isNotBlank(sjdx.getQczd())){
            //多个去重字段，且设置了去重字段
            StringBuilder key = new StringBuilder();
            for(JSONObject f : qcList){
                //将去重字段的值拼接
                key.append(yobj.getString(f.getString(FIELD_ZDDM))).append("_");
            }
            //对去重字段进行md5编码
            qcObj.put(sjdx.getQczd(), MD5Util.encode(key.toString()));
            //对原对象进行去重字段值补充，便于后续入库
            yobj.put(sjdx.getQczd(), MD5Util.encode(key.toString()));
        }else{
            throw new MyException("配置了具体的多个去重字段，但没有在数据对象中配置存储去重字段md5值的“去重字段”");
        }
        if (qcObj.size()>0) {
            //存在去重字段
            //不进行总量查询
            myParams.set("$.page.totalRequired", Boolean.FALSE);
            //设置根据去重字段查询数据的条件
            myParams.put(KEY_YOBJ,qcObj);
            Result r;
            try{
                r = select(myParams);
                if(r.isStatus()){
                    PageInfo<JSONObject> page = r.getData(PageInfo.class);
                    if (page.getList().size() == 1) {
                        //标记能找到要修改的对象，没找到可能是不存在，也可能是没有权限，避免修改无权限记录
                        myParams.set($_SYS_YZDJL, Boolean.TRUE);
                        myParams.put(KEY_OBJ, page.getList().get(0));
                        //把查询出来的主键设置到原输入参数中，便于配置了去重字段的场景基于主键进行更新
                        if(StringUtil.isBlank(yobj.getString(sjdx.getZjzd()))){
                            yobj.put(sjdx.getZjzd(),page.getList().get(0).getString(sjdx.getZjzd()));
                        }
                    }
                }
            }catch (MyException e){
                log.trace("根据去重信息读取数据失败",e);
            }
            //还原原来的输入参数
            myParams.put(KEY_YOBJ,yobj);
        }
    }

    /**
     * 获取数据字段 <br/>
     *
     * @author jingma
     */
    protected void getFields(JSONObject myParams, SysQxYhxx user) {
        //基于对象和用户等级缓存对象字段
        String cacheKey = sjdx.getId();
        if (user != null) {
            cacheKey = sjdx.getId() + user.getYhdj();
        }
        Map<String, JSONObject> fields;
        Object obj = fieldsCache.get(cacheKey);
        if (obj != null && !myParams.getBoolean("$.sys.clearCache")) {
            //没有缓存且没有要求清除缓存
            fields = (Map<String, JSONObject>) obj;
        }else{
            String[] r = getSql(myParams, "getFields");
            fields = db(r[0]).findMap("zddm", r[1], myParams);
            fieldsInit(fields, myParams);
            if(myParams.containsKey(KEY_FIELDS)){
                //如果系统配置的有默认字段则合并,具体字段配置优先
                JSONObject sfields = myParams.getJSONObject(KEY_FIELDS);
                JsonUtil.mergeJSONObject(sfields,fields);
                //根据排序字段进行排序
                List<Object> list = new ArrayList<>(sfields.values());
                list.sort(Comparator.comparingInt(o -> ((JSONObject) o).getIntValue("px")));
                fields = new LinkedHashMap<>();
                for(Object o: list){
                    JSONObject f = (JSONObject) o;
                    fields.put(f.getString("zddm"), f);
                }
            }
            List<JSONObject> qcList = new ArrayList<>();
            for(JSONObject f: fields.values()){
                if(StringUtil.isNotBlank(f.getString("qcbh"))){
                    //去重字段
                    qcList.add(f);
                }
            }
            if(qcList.size()>0){
                //对去重字段按去重编号排序
                qcList.sort(Comparator.comparingInt(o -> o.getIntValue("qcbh")));
            }else{
                //当没有配置去重字段时，直接采用主键作为去重字段
                qcList.add(fields.get(sjdx.getZjzd()));
            }
            //设置缓存
            fieldsCache.put(cacheKey, fields);
            fieldsCache.put(sjdx.getId()+ QCZD_LIST, qcList);
        }
        fields.forEach((zddm,field)->{
            //将整个字段的验证规则设置到系统验证规则中，因为内部会对规则数据进行修改
            JSONObject gz = field.getJSONObject("$.kzxx.yzgz");
            if(gz != null){
                myParams.set("$.yzgz['yobj." + zddm + "']",gz.clone());
            }
            gz = field.getJSONObject("$.kzxx.zhgz");
            if(gz != null){
                myParams.set("$.zhgz['yobj." + zddm + "']",gz.clone());
            }
        });
        myParams.put(KEY_FIELDS, fields);
    }

    /**
     * 根据字段配置进行验证规则、转换规则、处理类型等初始化 <br/>
     * @param fields   字段列表
     * @param myParams 相关参数
     * @author jingma
     */
    protected void fieldsInit(Map<String, JSONObject> fields, JSONObject myParams) {
        for (JSONObject field : fields.values()) {
            JSONObject kzxx = JSON.parseObject(field.getString(FIELD_KZXX),Feature.OrderedField);
            //顺便将字段扩展信息对象化
            field.put(UtilConst.FIELD_KZXX, kzxx);
            //初始化验证规则
            fieldYzgzInit(field, kzxx,myParams);
            //初始化转换规则
            fieldZhgzInit(field, kzxx,myParams);
            //处理类型扩展
            fieldCllxInit(field, kzxx);
        }
    }

    /**
     * 字段处理类型初始化，设置各处理类型是否展示、默认值等
     * @param field 字段
     * @param kzxx 扩展信息
     */
    protected void fieldCllxInit(JSONObject field, JSONObject kzxx) {
        JSONObject cllxkz = kzxx.getJSONObject("cllxkz");
        if(cllxkz==null){
            cllxkz = new JSONObject();
            kzxx.put("cllxkz",cllxkz);
        }

        //insert：新增页面
        JSONObject lxkz = getKjkzByCllx(field);
        lxkz.put("show",field.getBoolean("xzzs"));
        lxkz.put("readonly",false);
        lxkz.put("default",field.get("xzmrz"));
        mergeConfigByCllx(cllxkz, lxkz, KEY_CLLX_INSERT);

        //update：编辑
        lxkz = getKjkzByCllx(field);
        lxkz.put("show",field.getBoolean("bjzs"));
        lxkz.put("readonly",false);
        mergeConfigByCllx(cllxkz, lxkz, KEY_CLLX_UPDATE);

        //dxjcxx：对象基础信息，对应详情页面
        lxkz = getKjkzByCllx(field);
        lxkz.put("show",field.getBoolean("xqzs"));
        mergeConfigByCllx(cllxkz, lxkz, KEY_CLLX_DXJCXX);

        //导出字段配置，默认与详情字段一致
        lxkz = getKjkzByCllx(field);
        lxkz.put("show",field.getBoolean("xqzs"));
        mergeConfigByCllx(cllxkz, lxkz, KEY_CLLX_DCSJ);

        //dcmb：导出模板
        lxkz = getKjkzByCllx(field);
        lxkz.put("show",field.getBoolean("mbzs"));
        mergeConfigByCllx(cllxkz, lxkz, KEY_CLLX_DCMB);

        //select：查询页面对应的表单
        lxkz = getKjkzByCllx(field);
        mergeConfigByCllx(cllxkz, lxkz, KEY_CLLX_SELECT);

        //other

    }

    /**
     * 根据处理类型配置控件扩展
     * @param field 字段信息
     * @return 通用扩展
     */
    protected JSONObject getKjkzByCllx(JSONObject field) {
        JSONObject lxkz = new JSONObject();
        lxkz.put("zdkd",field.getIntValue("zdkd"));
        //默认不禁用
        lxkz.put("disabled",!valByDef(field.getBoolean("yxbj"),true));
        //默认只读
        lxkz.put("readonly",true);
        //默认都不展示，只有查询列表控件主动设置为展示
        lxkz.put("show",false);
        return lxkz;
    }

    /**
     * 合并配置-基于处理类型
     * @param pzjh 配置集合
     * @param lxkz 处理类型扩展
     * @param cllx 处理类型
     */
    protected void mergeConfigByCllx(JSONObject pzjh, JSONObject lxkz, String cllx) {
        if (pzjh.containsKey(cllx)) {
            //用户配置了，用户配置的与系统默认的进行合并，用户配置的优先
            JsonUtil.mergeJSONObjects(lxkz, pzjh.getJSONObject(cllx));
        }
        pzjh.put(cllx, lxkz);
    }

    /**
     * 字段转换规则初始化，转换的实现前端就不实现了，后台统一转换
     * @param field 字段
     * @param kzxx 扩展信息
     */
    protected void fieldZhgzInit(JSONObject field, JSONObject kzxx,JSONObject myParams) {
        //默认转换规则
        JSONObject zhgz = new JSONObject();
        //清空前后空格
        zhgz.put("qdqhkg",new JSONObject());

        JSONObject kzhgz = kzxx.getJSONObject(UtilConst.KEY_ZHGZ);
        if(kzhgz == null){
            kzhgz = new JSONObject();
        }
        mergeConfigByCllx(kzhgz,zhgz,KEY_CLLX_SELECT);
        mergeConfigByCllx(kzhgz,zhgz,KEY_CLLX_UPDATE);
        //开始处理新增规则
        zhgz = new JSONObject();
        //设置默认继承更新的规则
        zhgz.put("extends", new String[]{KEY_CLLX_UPDATE});
        //设置最新地新增验证验证规则
        kzhgz.put(KEY_CLLX_INSERT, zhgz);
        //处理验证规则中的继承，后续验证更方便
        for(String cllx:kzhgz.keySet()){
            mergeRule(myParams,kzhgz,cllx);
        }
        kzxx.put(UtilConst.KEY_ZHGZ,kzhgz);
    }
    /**
     * 字段验证规则初始化
     * @param field 字段
     * @param kzxx 扩展信息
     * @param myParams 相关参数
     */
    protected void fieldYzgzInit(JSONObject field, JSONObject kzxx,JSONObject myParams) {
        //默认验证规则
        JSONObject yzgz = new JSONObject();
        //根据字段库中的长度设置长度规则。
        JSONObject gz = new JSONObject();
        gz.put("max", valByDef(field.getInteger("zdcd"), Integer.MAX_VALUE));
        gz.put("min", 0);
        yzgz.put("length", gz);
        //必填规则
        if (valByDef(field.getBoolean("bjbt"),false)) {
            yzgz.put("notNull", new JSONObject());
        }
        //设置信息描述，作为提示的主体
        yzgz.put("xxms", field.getString("zdmc"));

        //根据控件类型生成规则
        if (UtilConst.ZD_SJDX_KJLX_DICT.equals(field.getString("kjlx"))
            ||"ElCascader".equals(field.getString("kjlx"))) {
            gz = new JSONObject();
            gz.put(VerifyRule.VALUE, field.getString("zdzdlb"));
            boolean zszdx = !TypeUtils.castToBoolean(field.getString("zdfy"));
            //字典分页，说明字典量较大，不直接展示字典项
            gz.put("zszdx", zszdx);
            boolean zddx = TypeUtils.castToBoolean(field.getString("zddx"));
            //字典分页，说明字典量较大，不直接展示字典项
            gz.put("zddx", zddx);
            yzgz.put("zd", gz);
        } else if (UtilConst.ZD_SJDX_KJLX_CHECKBOX.equals(field.getString("kjlx"))) {
            gz = new JSONObject();
            gz.put(VerifyRule.VALUE, field.getString("zdzdlb"));
            yzgz.put("zd", gz);
        } else if (UtilConst.ZD_SJDX_KJLX_NUMBER.equals(field.getString("kjlx"))) {
            yzgz.put("number", new JSONObject());
        } else if (UtilConst.ZD_SJDX_KJLX_TIME.equals(field.getString("kjlx"))) {
            gz = new JSONObject();
            //设置默认值，特殊情况可在字段扩展信息中自主扩展
            gz.put(VerifyRule.VALUE, DateUtil.DATE_FORMATTER14);
            yzgz.put("date", gz);
        }

        //根据字段业务类型设置规则
        if ("01".equals(field.getString("zdywlb"))) {
            yzgz.put("sfzh", new JSONObject());
        } else if ("03".equals(field.getString("zdywlb"))) {
            //手机号
            gz = new JSONObject();
            gz.put(VerifyRule.VALUE, "^([0-9]{11}|,)*$");
            gz.put(VerifyRule.TS, "只能填写11位手机号，多个电话用英文逗号");
            yzgz.put("zzbds", gz);
        } else if ("04".equals(field.getString("zdywlb"))) {
            //邮箱
            yzgz.put("email", new JSONObject());
        }

        //根据字段类型设置规则
        if ("NUMBER".equals(field.getString("zdlx"))) {
            yzgz.put("number", new JSONObject());
        }
        JSONObject kyzgz = kzxx.getJSONObject(UtilConst.KEY_YZGZ);
        if(kyzgz == null){
            kyzgz = new JSONObject();
        }
        //验证规则，新增可以通过继承更新验证规则使用该规则
        mergeConfigByCllx(kyzgz, yzgz, KEY_CLLX_UPDATE);

        //开始处理新增验证规则
        yzgz = new JSONObject();
        //设置默认继承更新的验证规则
        yzgz.put("extends", new String[]{KEY_CLLX_UPDATE});
        mergeConfigByCllx(kyzgz, yzgz, KEY_CLLX_INSERT);
        //处理验证规则中的继承，后续验证更方便
        for(String cllx:kyzgz.keySet()){
            mergeRule(myParams,kyzgz,cllx);
        }
        kzxx.put(UtilConst.KEY_YZGZ,kyzgz);
    }
    /**
     * 合并验证规则
     * @param myParams 系统参数
     * @param rootRule 所有规则
     * @param cllx 处理类型
     */
    protected void mergeRule(JSONObject myParams, JSONObject rootRule, String cllx){
        JSONObject yzgz = rootRule.getJSONObject(cllx);
        if(yzgz==null){
            //该处理类型没有设置验证规则
            return;
        }
        Object et = yzgz.remove("extends");
        if (et != null) {
            //合并继承的规则
            JSONObject newObj = new JSONObject(true);
            for (String eCllx : (String[]) et) {
                JsonUtil.mergeJSONObject(newObj, rootRule.getJSONObject(eCllx));
            }
            JsonUtil.mergeJSONObject(newObj,yzgz);
            rootRule.put(cllx,newObj);
        }
    }

    /**
     * 初始化操作日志记录 <br/>
     * @param myParams 参数
     * @param user     用户
     * @author jingma
     */
    protected void initCzrz(JSONObject myParams, SysQxYhxx user) {
        if (myParams.getBoolean($_SYS_NBDY)) {
            //为系统内部调用
            return;
        }
        SysLogFwzr czrz = new SysLogFwzr();
        myParams.put(KEY_CZRZ, czrz);
        czrz.setId(StringUtil.getUUIDUpperStr());
        czrz.setCjsj(DateUtil.getGabDate());
        czrz.setSjdx(sjdx.getId());
        czrz.setCzip(myParams.getString($_SYS_CLIENT_IP));
        czrz.setUrl(myParams.getString($_SYS_AUTHCODE) + "_" + myParams.getString($_SYS_CLLX));
        czrz.setToken(user.getToken());
        //要进行修改，这里进行一个克隆操作
        JSONObject yobj = myParams.getJSONObject(LjqInterface.KEY_YOBJ).clone();
        Map<String, JSONObject> fields = (Map<String, JSONObject>) myParams.get(KEY_FIELDS);
        Map<String, JSONObject> xtqtzd = getXtqtzd();
        if (StringUtil.isNotBlank(sjdx.getZjzd()) && StringUtil.isNotBlank(yobj.getString(sjdx.getZjzd()))) {
            //设置了主键
            czrz.setSjjl(yobj.remove(sjdx.getZjzd()).toString());
        }
        czrz.setCzlx(myParams.getString($_SYS_CLLX));
        JSONObject csObj = new JSONObject();
        for (Map.Entry<String, Object> e : yobj.entrySet()) {
            if (StringUtil.isBlank(e.getValue())) {
                continue;
            }
            String key = e.getKey();
            String val = yobj.getString(key);
            JSONObject f = fields.get(key);
            if (f == null) {
                //获取系统其他字段信息
                f = xtqtzd.get(key);
            }
            if (f != null) {
                key = f.getString("zdmc");
                String kjlx = f.getString("kjlx");
                if (ZD_SJDX_KJLX_DICT.equals(kjlx) || ZD_SJDX_KJLX_CHECKBOX.equals(kjlx)|| "ElCascader".equals(kjlx)
                        || "$radio".equals(kjlx)|| "$checkbox".equals(kjlx)) {
                    val = DictManager.zdMcByMoreDm(f.getString("zdzdlb"), val);
                } else if (ZD_SJDX_KJLX_TIME.equals(kjlx) && !val.startsWith("[")) {
                    //排除时间范围的场景
                    val = DateUtil.doFormatDate(DateUtil.parseDate(val), DateUtil.DATE_FORMATTER_L);
                    if (val == null) {
                        val = e.getValue().toString();
                    }
                } else if (ZD_SJDX_KJLX_PASSWORD.equals(kjlx)) {
                    val = "日志不记录密码";
                }
            }
            if (val.length() > 300) {
                log.info("操作参数超长：" + csObj + "->>" + val);
                csObj.put(key, val.substring(0, 300) + "[超长截取]");
            } else {
                csObj.put(key, val);
            }
        }
        czrz.setXgcs(JSON.toJSONString(csObj,false));
    }

    /**
     * 写操作日志
     * @param myParams 相关参数
     * @param r 待返回前端的操作结果
     */
    protected void writeCzrz(JSONObject myParams, Result r) {
        SysLogFwzr czrz = myParams.getObject(LjqInterface.KEY_CZRZ, SysLogFwzr.class);
        if(czrz!=null){
            //记录日志
            String fhnr = r.toString();
            if(fhnr.getBytes(StandardCharsets.UTF_8).length<4000){
                czrz.setFhnr(fhnr);
            }else{
                JSONObject fhnrObj = JSON.parseObject(fhnr);
                //返回内容较大，不记录内容
                fhnrObj.remove("data");
                if(r.getMsg().getBytes(StandardCharsets.UTF_8).length>2000){
                    fhnrObj.put("msg", r.getMsg().substring(0,500));
                }
                czrz.setFhnr(fhnrObj.toString());
            }
            //设置请求耗时
            long kssj = myParams.getLong("$.sys.qqkssj");
            czrz.setQqhs(BigDecimal.valueOf(System.currentTimeMillis()-kssj));
            JSONObject rzJcxx = LjqManager.jcxxByDxdm("SYS_LOG_FWZR");
            rzJcxx.put(KEY_YOBJ,czrz);
            rzJcxx.put(KEY_USER, myParams.get(KEY_USER));
            LjqManager.insert(rzJcxx);
        }
    }

    /**
     * 获取系统其他字段 <br/>
     *
     * @return 系统其他字段
     * @author jingma
     */
    protected Map<String, JSONObject> getXtqtzd() {
        JSONObject xtqtzdParams = LjqManager.jcxxByDxdm("SYS_COMMON_XTQTZD");
        return (Map<String, JSONObject>) xtqtzdParams.get(KEY_FIELDS);
    }
    protected Result upload(JSONObject myParams, SysSjglFile fileObj, MultipartFile file) throws Exception {
        byte[] byteArr = file.getBytes();
        //去重码ywdm+wjlb+MD5
        fileObj.setQcm(fileObj.getYwdm() + fileObj.getWjlb() + FileUtil.getFileMD5(byteArr));
        fileObj.setYxx(UtilConst.WHETHER_TRUE);
        JSONObject fileJcxx = LjqManager.jcxxByDxdm("SYS_SJGL_FILE");
        fileJcxx.put(KEY_USER, myParams.get(KEY_USER));
        fileJcxx.put(KEY_YOBJ, JSON.parseObject(fileObj.toString()));
        fileJcxx.set("$.page.totalRequired",Boolean.FALSE);
        //如果表中存在此去重码则把这个文件删除
        List<JSONObject> list = ((PageInfo<JSONObject>)LjqManager.select(fileJcxx).getData()).getList();
        if (list.size()>0) {
            JSONObject f = list.get(0);
            log.info(f.getString("id") + "文件已经存在");
            return success("该文件已经存在", f);
        }
        String wjm = file.getOriginalFilename();
        fileObj.setWjm(wjm);
        //文件类型
        fileObj.setWjlx(wjm.substring(wjm.lastIndexOf('.') + 1).toLowerCase());
        fileObj.setWjdx(BigDecimal.valueOf(file.getSize()));
        if (StringUtil.isBlank(fileObj.getSjzt())) {
            fileObj.setSjzt(Conf.getVal("wjsc.mrsjzt"));
        }
        if(StringUtil.isBlank(fileObj.getYwdm())){
            fileObj.setYwdm("dxsjsc");
        }
        if(StringUtil.isBlank(fileObj.getWjlb())){
            fileObj.setWjlb(sjdx.getDxdm());
        }
        JSONObject sjzt = DictManager.zdObjByDm(LjqInterface.ZD_SYS_COMMON_SJZT, fileObj.getSjzt());
        if (DbType.of(sjzt.getString("lx")) != null) {
            //数据载体为oracle
            String id = StringUtil.getUUIDUpperStr();
            try {
                db(sjzt.getString("dm")).update(SqlId.of("sjsj", "insertBlob"),
                        Db.buildMap(id, byteArr));
                fileObj.setSclj("select nr wj from sys_sjgl_blob where id='" + id + "'");
            } catch (Exception e) {
                throw new MyException("文件入数据库失败", e);
            }
        } else {
            switch (sjzt.getString("lx")) {
                case ZD_SJZTLX_BDWJ:
                    //数据载体为本地文件时
                    //文件上传路径:上传后文件的路径以及文件的名称
                    String currDate = DateUtil.getGabDate();
                    //按日期分文件夹
                    String sclj = sjzt.getString("ljc");
                    if (!UtilConst.WHETHER_FALSE.equals(fileObj.get("arqfwjj"))) {
                        //指定设置要求不按日期分文件夹
                        sclj += currDate.substring(0, 8) + UtilConst.FXG;
                    }
                    sclj += fileObj.getYwdm() + UtilConst.FXG
                            + fileObj.getWjlb() + UtilConst.FXG
                            + wjm.substring(0, wjm.lastIndexOf('.'));
                    if (!UtilConst.WHETHER_FALSE.equals(fileObj.get("arqfwjj"))) {
                        //指定设置要求不按日期分文件夹
                        sclj += "_" + currDate.substring(8);
                    } else {
                        sclj += "_" + currDate;
                    }
                    sclj += "." + fileObj.getWjlx();
                    fileObj.setSclj(sclj);
                    File localFile = new File(sclj);
                    if (!localFile.getParentFile().exists()) {
                        localFile.getParentFile().mkdirs();
                    }
                    FileOutputStream out = new FileOutputStream(localFile);
                    out.write(byteArr);
                    out.close();
                    break;
                case ZD_SJZTLX_FTP:
                    //数据载体为ftp
                    //ftp也需要一个类似Db的工具类
                    throw new MyException("暂不支持的数据载体类型：" + sjzt.getString("lx"));

                default:
                    throw new MyException("暂不支持的数据载体类型：" + sjzt.getString("lx"));
            }
        }
        //保存文件信息
        fileObj.setId(StringUtil.getUUIDUpperStr());
        fileJcxx.put(KEY_YOBJ, JSON.parseObject(fileObj.toString()));
        LjqManager.insert(fileJcxx);
        log.debug(fileObj + "文件上传成功");
        return success("文件上传成功", fileObj);
    }

    /**
     * @param header   表头
     * @param data     数据
     * @param fileName 文件名
     * @return 输出为excle的结果
     */
    protected Result resultExcelFile(List<List<String>> header, List<List<String>> data, String fileName) {
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        //
        LongestMatchColumnWidthStyleStrategy lmcw = new LongestMatchColumnWidthStyleStrategy();
        EasyExcel.write(os).head(header).autoTrim(true).excelType(ExcelTypeEnum.XLSX)
                //自动列宽，不合适可以自己重写
                .registerWriteHandler(lmcw)
                .sheet("Sheet1")
                .doWrite(data);
        SysSjglFile file1 = new SysSjglFile();
        file1.setWjlx("xlsx");
        file1.setWjm(fileName);
        return resultFile(os.toByteArray(), file1);
    }

    /**
     * @param byteArr 字节流
     * @param file    文件描述
     * @return 输出为文件的结果
     */
    protected Result resultFile(byte[] byteArr, SysSjglFile file) {
        JSONObject r3 = new JSONObject();
        r3.put(KEY_FILE_BYTES, byteArr);
        r3.put(KEY_FILE_OBJ, file);
        Result r = success(msgCzcg(), r3);
        r.setDateType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
        return r;
    }

    /**
     * 结果发送到前端
     * @param response 返回对象
     * @param myParams 相关参数
     * @param r 结果
     */
    @Override
    public void sendResult(HttpServletResponse response, JSONObject myParams, Result r){
        if(!ZD_SJDX_ZDYWLB_XNZD.equals(sjdx.getId())){
            //非虚拟对象时才记录日志
            writeCzrz(myParams, r);
        }
        //根据返回类型向前端推送数据
        if (HttpStatus.FOUND.value()==r.getCode()) {//重定向
            response.setStatus(r.getCode());
            try{
                response.sendRedirect(r.getData()+"");
            }catch (Exception e){
                log.error("重定向失败："+r,e);
                WebUtil.sendJson(response, failed("重定向失败："+r));
            }
        } else if (MediaType.APPLICATION_OCTET_STREAM_VALUE.equals(r.getDateType())) {
            //文件下载场景
            JSONObject data = (JSONObject) r.getData();
            SysSjglFile file = data.getObject(KEY_FILE_OBJ,SysSjglFile.class);
            byte[] bytes;
            if(data.containsKey(KEY_FILE_BYTES)){
                //提供的是二进制数据
                bytes = data.getBytes(KEY_FILE_BYTES);
            }else if(data.containsKey(KEY_FILE_BASE64)){
                //提供的是base64数据
                bytes = Base64.getDecoder().decode(data.getString(KEY_FILE_BASE64));
            }else{
                throw new MyException("没获取到要下载的数据");
            }
            //base64
            String base64;
            switch (file.getXzms()){
                case KEY_XZMS_AWJLXXZ:
                case KEY_XZMS_EJZ:
                    WebUtil.sendBytes(response, bytes, file);
                    break;
                case KEY_XZMS_BASE64:
                    base64 = Base64.getEncoder().encodeToString(bytes);
                    WebUtil.sendText(response,base64);
                    break;
                case KEY_XZMS_BASE64OBJ:
                    //转为base64后作为data以json对象返回
                    base64 = Base64.getEncoder().encodeToString(bytes);
                    data.remove(KEY_FILE_BYTES);
                    data.put(KEY_FILE_BASE64,base64);
                    //修改下载模式为按文件类型下载，便于后续再次进入时直接进行下载，针对代理下载文件场景
                    file.setXzms(KEY_XZMS_AWJLXXZ);
                    WebUtil.sendJson(response,r);
                    break;
                default:
                    throw new MyException("不支持的下载模式："+file.getXzms());
            }
        } else {
            //默认JSON
            response.setStatus(r.getCode());
            WebUtil.sendJson(response, r.toString());
        }
    }

    /**
     * @see LjqInterface#init()
     */
    @Override
    public void init() {
        log.debug("拦截器初始化：" + this.getClass().getSimpleName());
    }

    /**
     * @see LjqInterface#end()
     */
    @Override
    public void end() {
        log.debug("拦截器结束：" + this.getClass().getSimpleName());
    }

    /**
     * 获取指定数据库操作对象 <br/>
     * @author jingma
     * @return 指定的数据库操作对象
     */
    protected Db db(){
        return Db.use(sjdx.getDxzt());
    }
    /**
     * 获取指定SqlManager <br/>
     * @author jingma
     * @return 指定SqlManager
     */
    protected SQLManager sqlManager(){
        return Db.useSqlManager(sjdx.getDxzt());
    }

    @Override
    public SysSjglSjdx getSjdx() {
        return sjdx;
    }

    @Override
    public void setSjdx(SysSjglSjdx sjdx) {
        this.sjdx = sjdx;
    }

    @Override
    public LjqInterface getDlLjq() {
        if(dlLjq==null){
            //若代理拦截器为空则返回自己
            return this;
        }
        return dlLjq;
    }

    @Override
    public void setDlLjq(LjqInterface dlLjq) {
        this.dlLjq = dlLjq;
    }
}
