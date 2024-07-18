package cn.benma666.sjsj.demo;

import cn.benma666.dict.Cllx;
import cn.benma666.dict.Zdlb;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglBhsc;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.MyException;
import cn.benma666.iframe.*;
import cn.benma666.sjsj.myutils.Msg;
import cn.benma666.sjsj.web.DefaultLjq;
import cn.benma666.sjsj.web.LjqManager;
import cn.benma666.sjzt.Db;
import cn.benma666.sjzt.MyLambdaQuery;
import cn.benma666.sjzt.SjsjField;
import com.alibaba.fastjson.JSONObject;
import org.beetl.sql.core.SqlId;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

/**
 * 演示拦截器。<br/>
 * 拦截器需要在数据对象的“拦截器”中配置该类的完整类路径才会在对应的数据对象上生效，数据对象不配做拦截器时会采用默认拦截器。<br/>
 * 禁止直接在java中拼接sql
 */
@Service("XxxxLjq")
//多例
@Scope("prototype")
public class XxxxLjq extends DefaultLjq{
    @Value("${spring.application.name}")
    private String appname;
    AutoId ai1 = AutoId.use("test","select 9 from dual");
    AutoId ai2 = AutoId.use(new SysSjglBhsc("JCGA_JCYG_YGBH"));
    /**
     * 方法名称与前端传入的处理类型一致，参数固定为本方法这两个参数，处理类型可以自定义，方法名与之一致即可
     * @param myParams 相关参数，具体信息请看参数说明
     * @return 处理结果
     */
    public Result getTreeCN(MyParams myParams){
        //获取字典中配置的sql语句，sql[]中，sql[0]为数据载体，sql[1]为待执行的sql语句
        String[] sql = LjqManager.getSql(myParams);
        return success("获取用户菜单成功",db(sql[0]).find(sql[1],myParams));
    }

    @Override
    @Transactional
    public Result select(MyParams myParams) {
        slog.info("静态日志记录类{}，在静态方法中调用{}",",你好",",你好");
        log.error("常规日志记录{},{}",1,2,new MyException("xxxx"));
        log.info("前端数据获取样例："+ myParams.yobj());
        log.info("配置获取样例："+Conf.getVal("spring.application.name"));
        log.info("配置获取样例："+appname);
        log.info("编号1：{}",ai1.next());
        log.info("编号2：{}",ai2.next());
//        Result r = LjqManager.streamSelect("select * from sys_log_fwzr t", 10, new HdInterface() {
//            @Override
//            public Result run(List<JSONObject> list, boolean hdjs) {
//                log.info("回调记录："+list.size());
//                return success("回调成功："+list.size());
//            }
//        }, 600000, "sjsj");
//        log.info("流式查询结果："+r);
//        MyParams dzdParams = LjqManager.jcxxByDxdm("SYS_SJGL_TYZD_DEMO",myParams.user());
//        List<JSONObject> list = new ArrayList<>();
//        JSONObject o = new JSONObject();
//        o.put("dm","xxx");
//        o.put("zdlb","xxx");
//        o.put("mc",new StringReader("xxxxxxxxxxxx1111"));
//        list.add(o);
//        dzdParams.sys().setEditTableData(list);
//        dzdParams.sys().setCllx(Cllx.plbc.name());
//        LjqManager.data(dzdParams);

        //向客户端发送websocket消息
//        XtxxWebSocket.sendMsg(new SysPtglXtxx("测试"),getUser(myParams));
        log.info("xxl："+db("xxl_job").find("select count(1) from xxl_job_info t where t.trigger_status=?",1));
        myParams.sys().setEditTableData(getDb().find(SqlId.of("demo","findDemo"),myParams));
        log.info("获取前端传入的编辑列表，且转为实体类："+myParams.getJSONArray($_SYS_EDITTABLEDATA).toJavaList(SysSjglSjdx.class));
        log.info("字典获取样例："+ DictManager.zdMcByDm(Zdlb.SYS_QX_APP.name(),Conf.getAppdm()));
        log.info("字典名称反向获取代码（可用于验证前端传入的名称是否在字典范围内）："+ DictManager.zdDmByMoreMc(Zdlb.SYS_COMMON_LJPD.name(),"是、否"));
//        log.info("采用文件sql模板执行sql更新："+db().update(SqlId.of("demo","updateDemo"),myParams));
//        log.info("采用文件sql模板执行sql更新："+db("default").update(SqlId.of("demo","updateDemo"),myParams));
        log.info("采用文件sql模板执行sql查询："+ getDb().find(SqlId.of("demo","findDemo"),myParams));
        log.info("切换数据样例"+db("default").find(
                SqlId.of("demo","findSysDate"), Db.buildMap()));
        log.info("后端获取用户信息样例："+myParams.getObject(KEY_USER, SysQxYhxx.class).getYhxm());
        PageInfo<JSONObject> page = myParams.page();
        page.setList(getDb().find(SqlId.of("demo","findDemo"),myParams));
        log.info("分页对象"+page.getList(JSONObject.class));
        //直接用查询语句调用分页方法即可，底层支持对各类数据库进行分页查询
        page = getDb().queryPage(page, SqlId.of("demo","findDemo"), myParams);
        log.info("分页查询结果："+page);
        //获取其他对象的基础信息进行方法调用
        MyParams sjdxParams = LjqManager.jcxxByDxdm("SYS_SJGL_SJDX",myParams.user());
        //设置查询条件，类似前端查询传参
        sjdxParams.yobj().set(SjsjField.dxdm.name(),"SYS_SJGL_SJDX");
        //调用方式1：常用方法在LjqManager中提供了对应方法，可以直接调用。
        LjqManager.select(sjdxParams);
        //调用方式2：设置处理类型，通过data方法调用，一些在LjqManager中没有设置的方法需要采用此方法调用。
        //切记，调用其他数据对象的方法时一定要通过LjqManager去调用，不能直接调用父类的方法。
        sjdxParams.sys().setCllx(Cllx.select.name());
        Result r = LjqManager.data(sjdxParams);
        //获取数据
        log.info("调用其他对象的方法查询数据："+r.getPageList(SysSjglSjdx.class));
        /////////直接采用beetlsql///////////
        //sqlManager()当前数据对象的默认数据源，与db类似采用sqlManager("xxxx")进行切换数据源
        MyLambdaQuery<SysSjglSjdx> query = getDb().lambdaQuery(SysSjglSjdx.class);
        //查询数据，该方式参考官方文档“使用Query”章节
        log.info("使用Query方式操作数据库："+query.andEq(SysSjglSjdx::getId,"xxxxx").select());
//        throw new MyException("xxx");
        SysSjglSjdx dx = SysSjglSjdx.builder().id("912769435779405698B51852FB4277DB").dxms("xx").build();
        query.updateSelective(dx);
        dx = SysSjglSjdx.builder().id("912769435779405698B51852FB4277DB").dxms("").build();
        query.updateSelective(dx);
        return super.select(myParams);
    }

    @Override
    public Result insert(MyParams myParams) {
        Result r = super.insert(myParams);
        DictManager.clearDict(myParams.getString("$.yobj.zdlb"));
        return r;
    }

    @Override
    public Result update(MyParams myParams) throws MyException {
        Result r = super.update(myParams);
        DictManager.clearDict(myParams.getString("$.obj.zdlb"));
        return r;
    }

    /**
     * 清清除字典缓存
     * @return 处理结果
     */
    public Result qchc(MyParams myParams) {
        DictManager.clearDict();
        return success("清除缓存成功");
    }
    /**
     * 获取字典列表
     */
    public Result zdList(MyParams myParams) {
        if(myParams.sys().getDataCache()){
            //使用缓存
            return success(msgCzcg(),DictManager.zdMap(myParams));
        }else{
            //不使用缓存
            return success(msgCzcg(),DictManager.zdMapNoCache(myParams));
        }
    }
    /**
     * 获取字典树
     */
    public Result zdTree(MyParams myParams) {
        if(myParams.sys().getDataCache()){
            //使用缓存
            return success(msgCzcg(),DictManager.zdTree(myParams));
        }else{
            //不使用缓存
            return success(msgCzcg(),DictManager.zdTreeNoCache(myParams));
        }
    }
    /**
     * 获取字典项对象
     */
    public Result zdObj(MyParams myParams) {
        if(myParams.sys().getDataCache()){
            //使用缓存
            return success(msgCzcg(),DictManager.zdObj(myParams));
        }else{
            //不使用缓存
            return success(msgCzcg(),DictManager.zdObjNoCache(myParams));
        }
    }
    /**
     * 字典搜索
     */
    public Result zdSearch(MyParams myParams) {
        return success(msgCzcg(),DictManager.zdSearch(myParams));
    }

    public Result gjh(MyParams myParams){
        return success("国际化样例："+ Msg.msg("demo.czcg"));
    }
}
