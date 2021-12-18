package cn.benma666.sjsj.ljq;

import cn.benma666.domain.SysSjglTyzd;
import cn.benma666.exception.MyException;
import cn.benma666.iframe.Conf;
import cn.benma666.iframe.DictManager;
import cn.benma666.iframe.PageInfo;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.myutils.Msg;
import cn.benma666.sjsj.web.DefaultLjq;
import cn.benma666.sjzt.Db;
import com.alibaba.fastjson.JSONObject;
import org.beetl.sql.core.SqlId;

/**
 * 演示拦截器。<br/>
 * 拦截器需要在数据对象的“拦截器”中配置该类的完整类路径才会在对应的数据对象上生效，数据对象不配做拦截器时会采用默认拦截器。
 */
public class DemoLjq extends DefaultLjq{
    /**
     * 测试演示功能
     * @param myParams 相关参数
     * @return 演示结果
     */
    public Result test(JSONObject myParams) {
        slog.info("静态日志记录类，在静态方法中调用");
        log.info("常规日志记录");
        log.info("前端数据获取样例："+ myParams.getString($_SYS_CLLX));
        log.info("配置获取样例："+Conf.getVal("spring.application.name"));
        log.info("字典获取样例："+ DictManager.zdMcByDm(ZD_SYS_QX_APP,Conf.getVal("benma666.app.dm")));
        log.info("采用文件sql模板执行sql查询："+db().find(SqlId.of("demo","findSjdx"),myParams));
        log.info("采用文件sql模板执行sql更新："+db().update(SqlId.of("demo","updateSjzd"),myParams));
        log.info("切换数据样例",db("kettle_default").find(
                SqlId.of("demo","findSysDate"), Db.buildMap()));
        log.info("后端获取用户信息样例", myParams.get(KEY_USER));
        PageInfo<JSONObject> page = myParams.getObject(KEY_PAGE,PageInfo.class);
        log.info("分页对象"+page);
        //直接用查询语句调用分页方法即可，底层支持对各类数据库进行分页查询
        page = db().queryPage(page, "select * from #{sjdx.jtdx}", myParams);
        log.info("分页查询结果："+page);
        return success("java开发各种常见代码演示");
    }
    /**
     * 方法名称与前端传入的处理类型一致，参数固定为本方法这两个参数，处理类型可以自定义，方法名与之一致即可
     * @param myParams 相关参数，具体信息请看参数说明
     * @return 处理结果
     */
    public Result getTreeCN(JSONObject myParams){
        //获取字典中配置的sql语句，sql[]中，sql[0]为数据载体，sql[1]为待执行的sql语句
        String[] sql = getSql(myParams);
        return success("获取用户菜单成功",db(sql[0]).find(sql[1],myParams));
    }

    @Override
    public Result select(JSONObject myParams) {
        return super.select(myParams);
    }

    @Override
    public Result insert(JSONObject myParams) {
        Result r = super.insert(myParams);
        DictManager.clearDict(myParams.getString("$.yobj.zdlb"));
        return r;
    }

    @Override
    public Result update(JSONObject myParams) throws MyException {
        Result r = super.update(myParams);
        DictManager.clearDict(myParams.getString("$.obj.zdlb"));
        return r;
    }

    /**
     * 清清除字典缓存
     * @return 处理结果
     */
    public Result qchc(JSONObject myParams) {
        DictManager.clearDict();
        return success("清除缓存成功");
    }
    /**
     * 获取字典列表
     */
    public Result zdlist(JSONObject myParams) {
        if(myParams.getBoolean("$.sys.dataCache")){
            //使用缓存
            return success(msgCzcg(),DictManager.zdMapByCache(myParams.getObject(KEY_YOBJ, SysSjglTyzd.class)));
        }else{
            //不使用缓存
            return success(msgCzcg(),DictManager.zdMap(myParams.getObject(KEY_YOBJ, SysSjglTyzd.class)));
        }
    }
    /**
     * 获取字典项对象
     */
    public Result zdObj(JSONObject myParams) {
        if(myParams.getBoolean("$.sys.dataCache")){
            //使用缓存
            return success(msgCzcg(),DictManager.zdObjByDmByCache(myParams.getObject(KEY_YOBJ, SysSjglTyzd.class)));
        }else{
            //不使用缓存
            return success(msgCzcg(),DictManager.zdObj(myParams.getObject(KEY_YOBJ, SysSjglTyzd.class)));
        }
    }
    /**
     * 字典搜索
     */
    public Result zdSearch(JSONObject myParams) {
        SysSjglTyzd zd = myParams.getObject(KEY_YOBJ, SysSjglTyzd.class);
        zd.setSearchKey(myParams.getString("$.sys.searchKey"));
        return success(msgCzcg(),DictManager.zdSearch(myParams.getObject(KEY_PAGE, PageInfo.class),zd));
    }

    public Result gjh(JSONObject myParams){
        return success("国际化样例："+ Msg.msg("demo.czcg"));
    }
}
