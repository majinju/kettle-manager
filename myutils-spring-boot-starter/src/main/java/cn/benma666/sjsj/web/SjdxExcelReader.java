/**
 * Project Name:myutils
 * Date:2016年9月10日
 * Copyright (c) 2016, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.web;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysLogSjsccw;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.ExcelReadException;
import cn.benma666.exception.VerifyRuleException;
import cn.benma666.iframe.Result;
import cn.benma666.iframe.VerifyRule;
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/**
 * 数据对象Excel处理工具 <br/>
 * date: 2016年9月10日 <br/>
 *
 * @author jingma
 * @version 0.1
 */
public class SjdxExcelReader extends AnalysisEventListener<LinkedHashMap<Integer, String>> {
    /**
     * 日志
     */
    protected final Logger log = LoggerFactory.getLogger(this.getClass());
    /**
     * 错误信息参数对象
     */
    private final JSONObject sjsccwParams;
    /**
     * 错误信息数据对象
     */
    private final SysSjglSjdx sjsccwSjdx;
    /**
     * 开始行,0、1、2....
     */
    protected int startRow = 1;
    /**
     * 当前行
     */
    protected int currRow = 0;
    /**
     * 文件数据对象
     */
    protected JSONObject fileObj;
    /**
     * 数据对象相关信息
     */
    protected JSONObject myParams;
    /**
     * 当前对应的数据对象
     */
    protected SysSjglSjdx sjdx;
    /**
     * 字段对象列表
     */
    protected Map<String, JSONObject> fields;
    /**
     * 错误信息列表
     */
    protected List<SysLogSjsccw> errorList = new ArrayList<>();
    /**
     * 结果
     */
    protected JSONArray result = new JSONArray();

    /**
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @param fileObj  对应的文件对象
     */
    public SjdxExcelReader(SysSjglSjdx sjdx, JSONObject myParams, JSONObject fileObj) {
        this.sjdx = sjdx;
        //克隆一个参数对象，避免被修改
        this.myParams = myParams.clone();
        this.fileObj = fileObj;
        //设置错误信息相关参数
        this.sjsccwParams = LjqManager.jcxxByDxdm("SYS_LOG_SJSCCW");
        this.sjsccwParams.put(LjqInterface.KEY_USER,myParams.get(LjqInterface.KEY_USER));
        this.sjsccwSjdx = (SysSjglSjdx) sjsccwParams.get(LjqInterface.KEY_SJDX);
        //设置为新增模式，后续会插入读取错误信息
        sjsccwParams.set(LjqInterface.$_SYS_CLLX, LjqInterface.KEY_CLLX_INSERT);

        //设置字段信息
        this.fields = new LinkedHashMap<>();
        Map<String, JSONObject> fieldMap = (Map<String, JSONObject>) myParams
                .get(LjqInterface.KEY_FIELDS);
        for (JSONObject f : fieldMap.values()) {
            //模板展示
            if (f.getBooleanValue("mbzs")) {
                fields.put(f.getString("zddm"), f);
            }
        }
    }

    /**
     * 处理Excel <br/>
     *
     * @return 处理结果
     * @author jingma
     */
    public Result disposeExcel() {
        Result r = Result.success("处理完成");
        //若是07版excel
        try {
            EasyExcel.read(fileObj.getString("sclj"), this).sheet()
                    .headRowNumber(startRow).doRead();
        } catch (ExcelReadException e) {
            return Result.failed(e.getMessage());
        } catch (Exception e) {
            log.info("文件处理失败，可能是文件损坏：" + fileObj.getString("sclj"), e);
            return Result.failed("文件处理失败，可能是文件损坏，请打开文件，重新保存后再尝试上传：" + e.getMessage());
        }
        if (getErrorList().size() > 0) {
            r = Result.failed("校验出了" + getErrorList().size() + "个错误，请按错误列表依次修改后再重新上传。");
            r.setCode(HttpStatus.PRECONDITION_FAILED.value());
        }
        return r;
    }

    /**
     * 读取表头信息
     *
     * @param headMap 表头数据
     * @param context 上下文
     */
    @Override
    public void invokeHeadMap(Map<Integer, String> headMap, AnalysisContext context) {
        log.debug("文件头信息：" + headMap);
        if (headMap.size() < fields.size()) {
            throw new ExcelReadException("上传文件的表头少了" + (fields.size() - headMap.size())
                    + "列,请重新下载数据模板，不要修改数据模板表头。");
        }
        int i = 0;
        for (Entry<String, JSONObject> e : fields.entrySet()) {
            if (!(e.getValue().getString("zdmc") + "[" + e.getValue().getString("zddm") + "]").equals(headMap.get(i))) {
                throw new ExcelReadException("第[" + (i + 1) + "]列必须是\""
                        + e.getValue().getString("zdmc") + "[" + e.getValue().getString("zddm") + "]"
                        + "\"当前实际是\"" + headMap.get(i) + "\"，请不要修改数据模板表头。");
            }
            i++;
        }
    }

    /**
     * 数据读取完成操作
     */
    @Override
    public void doAfterAllAnalysed(AnalysisContext context) {

    }

    /**
     * 处理具体每一行数据 <br/>
     *
     * @param rowMap 具体数据行
     * @author jingma
     */
    @Override
    public void invoke(LinkedHashMap<Integer, String> rowMap, AnalysisContext context)
            throws RuntimeException {
        //开始包装数据
        int idx = 0;
        JSONObject yobj = new JSONObject();
        for (Entry<String, JSONObject> e : fields.entrySet()) {
            yobj.put(e.getKey(), rowMap.get(idx));
            idx++;
        }
        //设置整行数据，后续验证可能用到
        myParams.put(UtilConst.KEY_YOBJ, yobj);
        idx = 0;
        for (Entry<String, JSONObject> e : fields.entrySet()) {
            String val = yobj.getString(e.getKey());
            try {
                JSONObject obj = myParams.getJSONObject("$.yzgz['yobj." + e.getKey()+"']");
                if(obj==null){
                    continue;
                }
                val = VerifyRule.ruleVerify(val, myParams,obj,LjqInterface.KEY_CLLX_INSERT);
            } catch (VerifyRuleException e1) {
                addError(idx, val, e.getValue().getString("zdmc"), e1.getMessage());
            }
            yobj.put(e.getKey(), val);
            idx++;
        }
        result.add(yobj);
    }

    public void addError(int idx, Object value, String name,
                         String cwxx) {
        SysLogSjsccw sysLogSjsccw = new SysLogSjsccw(fileObj.getString("id"),
                value + "", name, (currRow + 1) + "", sjdx.getId(), (idx + 1) + "", cwxx);
        errorList.add(sysLogSjsccw);
        //存入数据库
        sjsccwParams.put(LjqInterface.KEY_YOBJ, sysLogSjsccw);
        Result r = LjqManager.insert(sjsccwSjdx, sjsccwParams);
        if (!r.isStatus()) {
            log.error("写入错误日志失败：" + r.getMsg());
        }
    }

    /**
     * @param startRow the startRow to set：0,1...
     */
    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

    /**
     * @param fields the fields to set
     */
    public void setFields(Map<String, JSONObject> fields) {
        this.fields = fields;
    }

    /**
     * @return result
     */
    public JSONArray getResult() {
        return result;
    }

    /**
     * @return errorList
     */
    public List<SysLogSjsccw> getErrorList() {
        return errorList;
    }

}
