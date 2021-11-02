/**
 * Project Name:myutils
 * Date:2018年12月16日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.web;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysLogFwzr;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglFile;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.ExcelReadException;
import cn.benma666.exception.MyException;
import cn.benma666.exception.VerifyRuleException;
import cn.benma666.iframe.*;
import cn.benma666.myutils.*;
import cn.benma666.sjsj.myutils.Msg;
import cn.benma666.sjzt.Db;
import com.alibaba.druid.DbType;
import com.alibaba.druid.util.Utils;
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;
import com.alibaba.fastjson.util.TypeUtils;
import org.apache.commons.collections.CollectionUtils;
import org.beetl.sql.core.DSTransactionManager;
import org.beetl.sql.core.SQLManager;
import org.beetl.sql.core.SqlId;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.*;

/**
 * 默认拦截器 <br/>
 * date: 2018年12月16日 <br/>
 *
 * @author jingma
 */
public class DefaultLjq extends BasicObject implements LjqInterface {
    /**
     * 字段信息缓存
     */
    protected static JSONObject fieldsCache = CacheFactory.use("fields", CacheFactory.TYPE_MEMORY);

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
    public JSONObject jcxx(SysSjglSjdx sjdx, JSONObject myParams) {
        if (getCllx(myParams) == null) {
            throw new MyException(Msg.msg("interceptor.bxsscllx", LjqInterface.$_SYS_CLLX.substring(2)), myParams);
        }
        //获取用户信息
        SysQxYhxx user = UserManager.getUser(myParams);
        myParams.put(KEY_USER, user);
        //处理权限码
        clAuthCode(sjdx, myParams);
        //获取字段信息
        myParams.put(KEY_FIELDS, getFields(sjdx, myParams, user));
        //记录操作日志
        czrz(sjdx, myParams, user);
        //权限鉴定
        QxManager.auth(myParams, user);
        //设置需要处理的对象
        putObj(sjdx, myParams);
        //验证规则
        yzgz(sjdx, myParams);
        //TODO 转换规则

        return myParams;
    }

    /**
     * 验证规则
     *
     * @param sjdx     数据对象
     * @param myParams 相关参数
     */
    @Override
    public void yzgz(SysSjglSjdx sjdx, JSONObject myParams) {
        if (myParams.get(KEY_USER) == null) {
            //没有用户信息默认为系统内部调用，不进行验证
            return;
        }
        //取出验证规则
        JSONObject yzgz = myParams.getJSONObject(UtilConst.KEY_YZGZ);
        for (String key : yzgz.keySet()) {
            JSONObject gzObj = yzgz.getJSONObject(key);
            try {
                VerifyRule.ruleVerify(JSONPath.eval(myParams, "$." + key),
                        myParams, gzObj, getCllx(myParams));
            } catch (VerifyRuleException e) {
                throw new MyException(e.getMessage(), HttpStatus.PRECONDITION_FAILED.value(), key);
            }
        }
    }

    @Override
    public Result upload(SysSjglSjdx sjdx, JSONObject myParams,
                         MultipartFile[] files) throws Exception {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        List<SysSjglFile> list = new ArrayList<>();
        for (MultipartFile file : files) {
            SysSjglFile fileObj = yobj.clone().toJavaObject(SysSjglFile.class);
            Result r = upload(sjdx, myParams, fileObj, file);
            if (!r.isStatus()) {
                return r;
            }
            list.add(fileObj);
        }
        return success("上传成功", list);
    }

    @Override
    public Result data(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = getCllx(myParams);
        try{
            Method m = this.getClass().getMethod(cllx, SysSjglSjdx.class, JSONObject.class);
            return (Result) m.invoke(this,sjdx,myParams);
        }catch (NoSuchMethodException e){
            //没有找到该处理类型对应的方法，执行默认操作
            Object zxcz = JSONPath.eval(myParams,"$.sys.zxcz");
            if(zxcz==null||KEY_CLLX_GETDATA.equals(zxcz)){
                return getdata(sjdx, myParams);
            }else if(KEY_CLLX_PLCL.equals(zxcz)){
                return plcl(sjdx, myParams);
            }else if(KEY_CLLX_GETFILE.equals(zxcz)){
                return getfile(sjdx, myParams);
            }else{
                return failed("暂不支持的执行操作："+zxcz);
            }
        } catch (InvocationTargetException | IllegalAccessException e) {
            if(e.getCause()!=null&&(e.getCause() instanceof MyException)){
                throw (MyException)e.getCause();
            }
            log.error(cllx+"方法执行失败",e);
            return failed(cllx+"方法执行失败："+e.getCause().getMessage());
        }
    }

    /**
     * 只取对外有用的,系统基础信息
     * @return 系统基础信息
     */
    public Result xtjcxx(SysSjglSjdx sjdx, JSONObject myParams){
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
    public Result dxjcxx(SysSjglSjdx sjdx, JSONObject myParams){
        //只取对外有用的，对象基础信息
        JSONObject jcxx = new JSONObject();
        jcxx.put(KEY_SJDX, myParams.get(KEY_SJDX));
        jcxx.put(KEY_FIELDS, myParams.get(KEY_FIELDS));
        jcxx.put(KEY_OBJ, myParams.get(KEY_OBJ));
        JsonUtil.copy(jcxx, myParams, "$.sys.cllxkz");
        JsonUtil.copy(jcxx, myParams, "$.sys.sjdxkz");
        JsonUtil.copy(jcxx, myParams, "$.sys.fields");
        return success(msgCzcg(), jcxx);
    }
    @Override
    public Result getdata(SysSjglSjdx sjdx, JSONObject myParams) {
        //创建个对象，用于在模板中可以设置一些数据作为结果传给前端
        JSONObject resultData = new JSONObject();
        myParams.put("resultData", resultData);

        String[] arr = getSql(sjdx, myParams);
        resultData.put("list", db(arr[0]).find(arr[1], myParams));
        return success("操作成功", resultData);
    }

    @Override
    public Result plcl(SysSjglSjdx sjdx, JSONObject myParams) {
        String[] arr = getSql(sjdx, myParams,KEY_CLLX_PLCL);
        return success("操作成功", db(arr[0]).update(arr[1], myParams));
    }

    /**
     * 导出当前页数据
     */
    public Result dcdqysj(SysSjglSjdx sjdx, JSONObject myParams) {
        return dcsj(sjdx,myParams);
    }
    @Override
    public Result dcsj(SysSjglSjdx sjdx, JSONObject myParams) {
        //导出数据
        myParams.set("$.page.totalRequired", Boolean.FALSE);
        PageInfo<JSONObject> page = (PageInfo<JSONObject>) select(sjdx, myParams).getData();
        String fileName = sjdx.getDxmc();
        if (myParams.getString("$.sys.dcwjm") != null) {
            fileName = myParams.getString("$.sys.dcwjm");
        }
        fileName += "-" + DateUtil.getGabDate() + ".xlsx";
        try {
            String hiddenCol = JSONPath.eval(myParams, "$.sys.hiddenCol") + ",列表选择";
            Set<String> hiddenColSet = new HashSet<>();
            CollectionUtils.addAll(hiddenColSet, hiddenCol.split(","));
            Map<String, JSONObject> fields = (Map<String, JSONObject>) myParams.get(KEY_FIELDS);

            List<String> showCol = new ArrayList<>();
            List<List<String>> header = new ArrayList<>();
            List<String> rows;
            for (Map.Entry<String, JSONObject> f : fields.entrySet()) {
                if (f.getValue().getBoolean("xqzs")
                        && !hiddenColSet.contains(f.getValue().getString("zdmc"))
                        && !f.getValue().getString("kjlx").equals("password")) {
                    rows = new ArrayList<>();
                    //详情展示且前端没有要求不导出且控件类型不是密码的字段才导出
                    rows.add(f.getValue().getString("zdmc"));
                    header.add(rows);
                    showCol.add(f.getKey());
                }
            }

            List<List<String>> data = new ArrayList<>();
            for (JSONObject r2 : page.getList()) {
                rows = new ArrayList<>();
                data.add(rows);
                for (String f : showCol) {
                    String kjlx = fields.get(f).getString("kjlx");
                    String val = r2.getString(f);
                    if (ZD_SJDX_KJLX_DICT.equals(kjlx) || ZD_SJDX_KJLX_CHECKBOX.equals(kjlx)) {
                        rows.add(DictManager.zdMcByMoreDm(fields.get(f).getString("zdzdlb"), r2.getString(f)));
                    } else if (ZD_SJDX_KJLX_TIME.equals(kjlx)) {
                        String v = DateUtil.doFormatDate(val, DateUtil.DATE_FORMATTER_L);
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
            return resultExcelFile(header, data, fileName);
        } catch (Exception e) {
            log.error("导出数据失败:" + myParams, e);
            return failed("导出数据失败，请查看系统日志分析原因:" + e.getMessage());
        }
    }

    @Override
    public Result getfile(SysSjglSjdx sjdx, JSONObject myParams) {
        String[] arr;
        try {
            arr = getSql(sjdx, myParams);
            List<JSONObject> rl = db(arr[0]).find(arr[1], JSONObject.class, myParams);
            if (rl.size() == 0) {
                return failed("未找到文件数据");
            }
            JSONObject fo = rl.get(0);
            SysSjglFile file1 = new SysSjglFile();
            file1.setWjlx(fo.getString("wjlx"));
            file1.setWjm(fo.getString("wjm"));
            file1.setXzms(fo.getBooleanValue("xzms"));
            String sjxs = fo.getString("sjxs");
            byte[] byteArr = null;
            if ("bdwjjl".equals(sjxs)) {
                byteArr = FileUtil.getBytes(fo.getString("data"));
            } else if ("blob".equals(sjxs)) {
                byteArr = fo.getBytes("data");
            }
            return resultFile(byteArr, file1);
        } catch (Exception e) {
            log.error("获取文件失败:" + myParams, e);
            return failed("获取文件失败，请查看系统日志分析原因:" + e.getMessage());
        }
    }

    /**
     * 下载文件
     * @param sjdx 数据对象
     * @param myParams 相关参数
     * @return 处理结果
     */
    public Result download(SysSjglSjdx sjdx, JSONObject myParams) {
        JSONObject fileJcxx = LjqManager.jcxxByDxdm("SYS_SJGL_FILE");
        fileJcxx.put(KEY_YOBJ,myParams.get(KEY_YOBJ));
        fileJcxx.set("$.page.totalRequired",Boolean.FALSE);
        PageInfo<JSONObject> page = (PageInfo<JSONObject>) LjqManager.select(fileJcxx.getObject(KEY_SJDX, SysSjglSjdx.class),
                fileJcxx).getData();
        if(page.getList().size()==0){
            return failed("没有找到该文件");
        }else if(page.getList().size()>1){
            return failed("不能找到唯一的文件记录");
        }
        SysSjglFile fileObj = page.getList().get(0).toJavaObject(SysSjglFile.class);
        JSONObject sjzt = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT, fileObj.getSjzt());
        byte[] byteArr;
        if (DbType.of(sjzt.getString("lx")) != null) {
            byteArr = db(sjzt.getString("dm")).findFirst(fileObj.getSclj()).getBytes("wj");
        } else {
            switch (sjzt.getString("lx")) {
                case "bdwj":
                    //数据载体为本地文件时
                    try {
                        byteArr = Utils.readByteArray(new FileInputStream(fileObj.getSclj()));
                    } catch (IOException e) {
                        return failed("文件没有找到："+fileObj.getSclj());
                    }
                    break;
                case "ftp":
                    //数据载体为ftp
                    //ftp也需要一个类似Db的工具类
                    throw new MyException("暂不支持的数据载体类型：" + sjzt.getString("lx"));

                default:
                    throw new MyException("暂不支持的数据载体类型：" + sjzt.getString("lx"));
            }
        }
        return resultFile(byteArr, fileObj);
    }
    @Override
    public Result sjplsc(SysSjglSjdx sjdx, JSONObject myParams) {
        Result r;
        JSONObject file = myParams.getJSONObject("file");
        SjdxExcelReader er = new SjdxExcelReader(sjdx, myParams, file);
        try {
            r = er.disposeExcel();
            if (!r.isStatus()) {
                return r;
            }
            r = plSave(sjdx, myParams, er.getResult());
            if (!r.isStatus()) {
                return r;
            }
            return success("成功上传数据量：" + er.getResult().size(), r.getData());
        } catch (ExcelReadException e) {
            try {
                DSTransactionManager.rollback();
            } catch (SQLException e1) {
                log.debug("事务回滚失败", e1);
            }
            return failed(e.getMessage());
        } catch (Exception e) {
            try {
                DSTransactionManager.rollback();
            } catch (SQLException e1) {
                log.debug("事务回滚失败", e1);
            }
            log.error("文件处理失败：" + myParams + "->" + e.getMessage(), e);
            return failed("文件处理失败：" + e.getMessage());
        }
    }

    /**
     * 删除数据
     * @return 操作结果
     */
    public Result delete(SysSjglSjdx sjdx, JSONObject myParams) {
        return plcl(sjdx,myParams);
    }
    @Override
    public Result plsc(SysSjglSjdx sjdx, JSONObject myParams) {
        Object wlsc = JSONPath.eval(myParams, "$.sys.wlsc");
        Result r = success("");
        if (StringUtil.isNotBlank(sjdx.getYxxzd()) && TypeUtils.castToBoolean(wlsc)) {
            //存在有效性字段，且允许物理删除
            r = wlscByYxx(sjdx, myParams);
        }
        String[] arr = getSql(sjdx, myParams);
        //后续继续进行逻辑删除操作
        int scs = db(arr[0]).update(arr[1], myParams);
        if (StringUtil.isBlank(sjdx.getYxxzd())) {
            r.addMsg("处理记录数：" + scs);
        } else {
            r.addMsg("逻辑删除记录数：" + scs);
        }
        return r;
    }

    @Override
    public Result select(SysSjglSjdx sjdx, JSONObject myParams) {
        //获取分页对象
        PageInfo<JSONObject> page = myParams.getObject(KEY_PAGE,PageInfo.class);
        if (StringUtil.isBlank(page.getOrderBy())) {
            //请求没有设置排序时，采用默认排序
            page.setOrderBy(sjdx.getMrpx());
        }
        //获取sql
        String[] arr = getSql(sjdx, myParams, KEY_CLLX_SELECT);
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
        for(JSONObject row : page.getList()){
            for(String zddm:fields.keySet()){
                String kjlx = fields.getString("$."+zddm+".kjlx");
                //对结果进行字典翻译
                if(ZD_SJDX_KJLX_DICT.equals(kjlx)){
                    row.put(zddm+"_mc",DictManager.zdMcByDm(fields.getString("$."+zddm+".zdzdlb"),row.getString(zddm)));
                }else if(ZD_SJDX_KJLX_CHECKBOX.equals(kjlx)){
                    row.put(zddm+"_mc",DictManager.zdMcByDm(DICT_SYS_COMMON_LJPD,row.getString(zddm)));
                }
            }
        }
        return success(msgCzcg(),page);
    }

    @Override
    public Result insert(SysSjglSjdx sjdx, JSONObject myParams) throws MyException {
        JSONPath.set(myParams, $_SYS_CLLX, KEY_CLLX_INSERT);
        return save(sjdx, myParams);
    }

    @Override
    public Result update(SysSjglSjdx sjdx, JSONObject myParams) throws MyException {
        JSONPath.set(myParams, $_SYS_CLLX, KEY_CLLX_UPDATE);
        return save(sjdx, myParams);
    }

    /**
     * 保存数据
     * @return 操作结果
     */
    public Result save(SysSjglSjdx sjdx, JSONObject myParams) {
        Result r;
        if (DbType.of(sjdx.getDxztlx()) != null) {
            //数据库场景
            r = saveDb(sjdx, myParams);
        } else {
            //后续支持文件等各类数据载体，暂未实现
            throw new MyException("不支持的对象载体类型：" + sjdx.getDxztlx());
        }
        if (r.isStatus()) {
            //保存成功，返回主键信息
            r.setData(JSONPath.eval(myParams, "$.yobj." + sjdx.getZjzd()));
        }
        return r;
    }

    @Override
    public String[] getSql(SysSjglSjdx sjdx, JSONObject myParams) {
        Object cllx = JSONPath.eval(myParams, $_SYS_CLLX);
        return getSql(sjdx, myParams, cllx.toString());
    }

    @Override
    public String[] getSql(SysSjglSjdx sjdx, JSONObject myParams, String cllx) {
        //设置from
        JSONPath.set(myParams, "$.sql.from", (StringUtil.isBlank(
                sjdx.getDxgs()) ? "" : sjdx.getDxgs() + ".") + sjdx.getJtdx());
        //先获取该处理类型对应的数据库的默认sql
        String key= "DEFAULT." + cllx + "." + sjdx.getDxztlx();
        String sqlTmpl = Conf.getVal(key);
        if (StringUtil.isBlank(sqlTmpl)) {
            //最基础默认sql-所有数据库通用
            key = "DEFAULT." + cllx;
            sqlTmpl = Conf.getVal(key);
        }
        String sql = null;
        if(StringUtil.isNotBlank(sqlTmpl)){
            //先生成默认SQL
            sql = TmplUtil.buildStrSql(sqlTmpl, myParams).trim();
            if (sql.startsWith("error:")) {
                //用于在模板处理中，直接返回信息到前端
                throw new MyException(sql.substring("error:".length()), sjdx);
            } else {
                JSONPath.set(myParams, "$.sql.defaultSql", sql);
            }
        }
        //获取该对象的专有sql
        key= sjdx.getDxdm() + "." + cllx + "." + sjdx.getDxztlx();
        sqlTmpl = Conf.getVal(key);
        if (StringUtil.isBlank(sqlTmpl)) {
            //最基础默认sql-所有数据库通用
            key = sjdx.getDxdm() + "." + cllx;
            sqlTmpl = Conf.getVal(key);
        }
        if (StringUtil.isNotBlank(sqlTmpl)) {
            sql = TmplUtil.buildStrSql(sqlTmpl, myParams).trim();
            if (sql.startsWith("error:")) {
                throw new MyException(sql.substring("error:".length()), sjdx);
            }
            JSONPath.set(myParams, "$.sql.defaultSql", sql);
        }else if(sql==null){
            //默认模板都不存在哎
            throw new MyException(Msg.msg("ljq.default.mypzgsql", cllx), sjdx);
        }
        return Db.parseDictExp(sql, sjdx.getDxzt());
    }

    /**
     * 导出模板
     *
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 处理结果
     */
    public Result dcmb(SysSjglSjdx sjdx, JSONObject myParams) {
        //导出数据
        String fileName = sjdx.getDxmc();
        if (JSONPath.eval(myParams, "$.sys.dcwjm") != null) {
            fileName = JSONPath.eval(myParams, "$.sys.dcwjm").toString();
        }
        fileName += "-数据上传模板-" + DateUtil.getGabDate() + ".xlsx";
        try {
            Map<String, JSONObject> fields = (Map<String, JSONObject>) myParams.get(KEY_FIELDS);
            List<List<String>> header = new ArrayList<>();
            List<String> h;
            List<List<String>> data = new ArrayList<>();
            List<String> r = new ArrayList<>();
            data.add(r);
            for (Map.Entry<String, JSONObject> f : fields.entrySet()) {
                if (f.getValue().getBoolean("mbzs")) {
                    h = new ArrayList<>();
                    h.add(f.getValue().getString("zdmc") + "[" + f.getValue().getString("zddm") + "]");
                    header.add(h);
                    r.add(VerifyRule.rulejx(f.getValue(), (JSONObject) JSONPath.eval(f.getValue(), "$.kzxx.yzgz")));
                }
            }
            return resultExcelFile(header, data, fileName);
        } catch (Exception e) {
            log.error("导出数据失败:" + myParams, e);
            return failed("导出数据失败，请查看系统日志分析原因:" + e.getMessage());
        }
    }

    /**
     * 对象数据插入-数据库 <br/>
     *
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    protected Result saveDb(SysSjglSjdx sjdx, JSONObject myParams) {
        String[] arr = getSql(sjdx, myParams);
        return success(msgCzcg(), db(arr[0]).update(arr[1], myParams));
    }

    protected Result plSave(SysSjglSjdx sjdx, JSONObject myParams, JSONArray list1) throws SQLException {
        JSONObject[] list = list1.toArray(new JSONObject[0]);
        //获取事务提交量
        int swtjl = TypeUtils.castToInt(JSONPath.eval(myParams,"$.sys.swtjl"));
        //开启事务
        DSTransactionManager.start();

        List<Object> ro1 = new ArrayList<>();
        int i = 0;
        Result r;
        for (JSONObject j : list) {
            myParams.put(KEY_YOBJ, j);
            r = insert(sjdx, myParams);
            if (!r.isStatus()) {
                DSTransactionManager.rollback();
                r.addMsg("第" + (i + 1) + "行");
                return r;
            } else {
                ro1.add(r.getData());
                i++;
                if (i % swtjl == 0) {
                    //达到设置的事务提交量，提交事务并开启新事务。
                    DSTransactionManager.commit();
                    DSTransactionManager.start();
                }
            }
        }
        //入库完成提交事务。
        DSTransactionManager.commit();
        return success("入库成功", ro1);
    }

    /**
     * 基于有效性的物理删除 <br/>
     *
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    protected Result wlscByYxx(SysSjglSjdx sjdx, JSONObject myParams) {
        //有有效性字段
        String[] arr = getSql(sjdx, myParams, "wl" + getCllx(myParams));
        //先执行物理删除，将本次删除中，已经为无效的进行物理删除
        int scs = db(arr[0]).update(arr[1], myParams);
        return success("物理删除数：" + scs);
    }

    /**
     * 处理权限码
     *
     * @param sjdx     数据对象
     * @param myParams 相关参数
     */
    protected void clAuthCode(SysSjglSjdx sjdx, JSONObject myParams) {
        if (JSONPath.eval(myParams, $_SYS_AUTHCODE) == null) {
            //前端没有传入使用的权限码时
            Object authCode;
            //先取对象中的默认权限码
            if (sjdx.getMap().containsKey(KEY_AUTH_CODE)) {
                authCode = sjdx.get(KEY_AUTH_CODE);
            } else {
                //对象也没有缓存权限码时，从数据库中查询并缓存到对象中
                authCode = db().queryStr(SqlId.of("sjsj", "findAuthCode"), myParams);
                sjdx.set(KEY_AUTH_CODE, authCode);
            }
            JSONPath.set(myParams, $_SYS_AUTHCODE, authCode);
        }
    }

    /**
     * 设置obj <br/>
     *
     * @param sjdx     数据对象
     * @param myParams 参数
     * @author jingma
     */
    protected void putObj(SysSjglSjdx sjdx, JSONObject myParams) {
        JSONPath.set(myParams, "$.sys.yzdjl", Boolean.FALSE);
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        if (yobj == null) {
            return;
        }
        myParams.put(KEY_OBJ, yobj.clone());
        if (KEY_CLLX_SELECT.equals(getCllx(myParams))) {
            return;
        }
        if (StringUtil.isNotBlank(sjdx.getZjzd())
                && !StringUtil.isBlank(yobj.getString(sjdx.getZjzd()))) {
            //设置了主键字段，且前端传入了主键，查询模板中只要前端传入了主键，则只以主键进行查询，不管其他条件
            JSONPath.set(myParams, "$.page.totalRequired", Boolean.FALSE);
            PageInfo<JSONObject> page = (PageInfo<JSONObject>) select(sjdx, myParams).getData();
            if (page.getList().size() == 1) {
                //标记能找到要修改的对象，没找到可能是不存在，也可能是没有权限，避免修改无权限记录
                JSONPath.set(myParams, "$.sys.yzdjl", Boolean.TRUE);
                myParams.put(KEY_OBJ, page.getList().get(0));
            }
        }
    }

    /**
     * 获取数据字段 <br/>
     *
     * @return 字段信息
     * @author jingma
     */
    protected Map<String, JSONObject> getFields(SysSjglSjdx sjdx, JSONObject myParams, SysQxYhxx user) {
        //基于对象和用户等级缓存对象字段
        String cacheKey = sjdx.getId();
        if (user != null) {
            cacheKey = sjdx.getId() + user.getYhdj();
        }
        Map<String, JSONObject> fields;
        Object obj = fieldsCache.get(cacheKey);
        if (obj != null && !TypeUtils.castToBoolean(JSONPath.eval(myParams, "$.sys.clearCache"))) {
            //没有缓存且没有要求清除缓存
            fields = (Map<String, JSONObject>) obj;
        }else{
            String[] r = getSql(sjdx, myParams, "getFields");
            fields = db(r[0]).findMap("zddm", r[1], myParams);
            //设置缓存
            fieldsCache.put(cacheKey, fields);
            VerifyRule.yzgzInit(fields, myParams);
            //TODO 应该还需要初始化转换规则
        }
        fields.forEach((key,value)->{
            //将整个字段的验证规则设置到系统验证规则中
            JSONPath.set(myParams, "$.yzgz['yobj." + key + "']",
                    JSONPath.eval(value,"$.kzxx.yzgz"));
        });
        return fields;
    }

    /**
     * 操作日志记录 <br/>
     *
     * @param sjdx     数据对象
     * @param myParams 参数
     * @param user     用户
     * @author jingma
     */
    protected void czrz(SysSjglSjdx sjdx, JSONObject myParams, SysQxYhxx user) {
        if (TypeUtils.castToBoolean(JSONPath.eval(myParams,$_SYS_NBDY))) {
            //没有用户信息时不记录日志，为系统内部调用
            return;
        }
        SysLogFwzr czrz = new SysLogFwzr();
        myParams.put(KEY_CZRZ, czrz);
        czrz.setId(StringUtil.getUUIDUpperStr());
        czrz.setCjsj(DateUtil.getGabDate());
        czrz.setSjdx(sjdx.getId());
        czrz.setCzip(JSONPath.eval(myParams, $_SYS_CLIENT_IP).toString());
        czrz.setUrl(JSONPath.eval(myParams, $_SYS_AUTHCODE) + "_" + JSONPath.eval(myParams, $_SYS_CLLX));
        czrz.setToken(user.getToken());
        //要进行修改，这里进行一个克隆操作
        JSONObject yobj = myParams.getJSONObject(LjqInterface.KEY_YOBJ).clone();
        Map<String, JSONObject> fields = (Map<String, JSONObject>) myParams.get(KEY_FIELDS);
        Map<String, JSONObject> xtqtzd = getXtqtzd();
        if (StringUtil.isNotBlank(sjdx.getZjzd()) && StringUtil.isNotBlank(yobj.getString(sjdx.getZjzd()))) {
            //设置了主键
            czrz.setSjjl(yobj.remove(sjdx.getZjzd()).toString());
        }
        czrz.setCzlx(JSONPath.eval(myParams, $_SYS_CLLX) + "");
        JSONObject csObj = new JSONObject();
        for (Map.Entry<String, Object> e : yobj.entrySet()) {
            String val = e.getValue() + "";
            String zdmc = e.getKey();
            JSONObject f = fields.get(zdmc);
            if (StringUtil.isBlank(val)) {
                continue;
            }
            if (f == null) {
                //获取系统其他字段信息
                f = xtqtzd.get(zdmc);
            }
            if (f != null) {
                zdmc = f.getString("zdmc");
                String kjlx = f.getString("kjlx");
                if (ZD_SJDX_KJLX_DICT.equals(kjlx) || ZD_SJDX_KJLX_CHECKBOX.equals(kjlx)) {
                    val = DictManager.zdMcByMoreDm(f.getString("zdzdlb"), val);
                } else if (ZD_SJDX_KJLX_TIME.equals(kjlx) && !val.contains(";")) {
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
                csObj.put(zdmc, val.substring(0, 300) + "[超长截取]");
            } else {
                csObj.put(zdmc, val);
            }
        }
        czrz.setXgcs(csObj.toJSONString());
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
    protected Result upload(SysSjglSjdx sjdx, JSONObject myParams, SysSjglFile fileObj, MultipartFile file) throws Exception {
        String wjm = file.getOriginalFilename();
        fileObj.setWjm(wjm);
        //文件类型
        fileObj.setWjlx(wjm.substring(wjm.lastIndexOf('.') + 1).toLowerCase());
        fileObj.setWjdx(BigDecimal.valueOf(file.getSize()));
        byte[] byteArr = file.getBytes();
        //去重码ywdm+wjlb+MD5
        fileObj.setQcm(fileObj.getYwdm() + fileObj.getWjlb() + FileUtil.getFileMD5(byteArr));
        fileObj.setYxx(UtilConst.WHETHER_TRUE);
        JSONObject fileJcxx = LjqManager.jcxxByDxdm("SYS_SJGL_FILE");
        fileJcxx.put(KEY_USER, myParams.get(KEY_USER));
        fileJcxx.put(KEY_YOBJ, fileObj);
        fileJcxx.set("$.page.totalRequired",Boolean.FALSE);
        //如果表中存在此去重码则把这个文件删除
        List<JSONObject> list = ((PageInfo<JSONObject>)LjqManager.select(fileJcxx.getObject(KEY_SJDX,
                SysSjglSjdx.class),fileJcxx).getData()).getList();
        if (list.size()>0) {
            JSONObject f = list.get(0);
            log.info(f.getString("id") + "文件已经存在");
            return success("该文件已经存在", f);
        }
        if (StringUtil.isBlank(fileObj.getSjzt())) {
            fileObj.setSjzt(Conf.getVal("wjsc.mrsjzt"));
        }
        if(StringUtil.isBlank(fileObj.getYwdm())){
            fileObj.setYwdm("dxsjsc");
        }
        if(StringUtil.isBlank(fileObj.getWjlb())){
            fileObj.setWjlb(sjdx.getDxdm());
        }
        JSONObject sjzt = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT, fileObj.getSjzt());
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
                case "bdwj":
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
                case "ftp":
                    //数据载体为ftp
                    //ftp也需要一个类似Db的工具类
                    throw new MyException("暂不支持的数据载体类型：" + sjzt.getString("lx"));

                default:
                    throw new MyException("暂不支持的数据载体类型：" + sjzt.getString("lx"));
            }
        }
        //保存文件信息
        fileObj.setId(StringUtil.getUUIDUpperStr());
        LjqManager.insert((SysSjglSjdx) fileJcxx.get(KEY_SJDX), fileJcxx);
        slog.debug(fileObj + "文件上传成功");
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
        EasyExcel.write(os).head(header).autoTrim(true).excelType(ExcelTypeEnum.XLSX)
                .sheet("Sheet1").doWrite(data);
        SysSjglFile file1 = new SysSjglFile();
        file1.setWjlx("xlsx");
        file1.setWjm(fileName);
        file1.setXzms(true);
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
     * @param sjdx 数据对象
     * @return 指定的数据库操作对象
     */
    protected static Db db(SysSjglSjdx sjdx){
        return Db.use(sjdx.getDxzt());
    }
    /**
     * 获取指定SqlManager <br/>
     * @author jingma
     * @param sjdx 数据对象
     * @return 指定SqlManager
     */
    protected static SQLManager sqlManager(SysSjglSjdx sjdx){
        return Db.useSqlManager(sjdx.getDxzt());
    }
}
