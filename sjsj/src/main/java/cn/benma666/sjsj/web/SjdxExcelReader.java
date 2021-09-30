/**
 * Project Name:myutils
 * Date:2016年9月10日
 * Copyright (c) 2016, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.web;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.ExcelReadException;
import cn.benma666.exception.FieldRuleVerifyException;
import cn.benma666.iframe.FieldRuleVerify;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.StringUtil;
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;

import java.util.*;
import java.util.Map.Entry;

/**
 * 数据对象Excel处理工具 <br/>
 * date: 2016年9月10日 <br/>
 * @author jingma
 * @version 0.1
 */
public class SjdxExcelReader extends AnalysisEventListener<LinkedHashMap<Integer,String>> {
    /**
     * 日志
     */
    private final Logger log = LoggerFactory.getLogger(this.getClass());
    /**
     * 列的数量
     */
    protected int colCount = 0;
    /**
     * 开始行,0、1、2....
     */
    protected int startRow = 1;
    /**
     * 当前行
     */
    protected int currRow = 0;
    /**
     * 当成操作的用户，辅助数据校验
     */
    protected SysQxYhxx user;
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
     * 错误信息参数对象
     */
    private final JSONObject sjsccwParams;
    /**
     * 错误信息数据对象
     */
    private final SysSjglSjdx sjsccwSjdx;
    /**
     * 结果
     */
    protected JSONArray result = new JSONArray();
    /**
     * 字段对象列表
     */
    protected Map<String, JSONObject> fields;
    /**
     * 字段排除规则<字段代码，排除规则>
     */
    protected Map<String, JSONObject> pcgzMap = new HashMap<>();
    /**
     * 错误信息列表
     */
    protected List<JSONObject> errorList = new ArrayList<>();

    public SjdxExcelReader(SysSjglSjdx sjdx, JSONObject myParams, JSONObject fileObj, SysQxYhxx user) {
        this.sjdx=sjdx;
        this.myParams=myParams.clone();
        this.fileObj=fileObj;
        this.user=user;
        //设置错误信息相关参数
        this.sjsccwParams = LjqManager.jcxxByDxdm("SYS_LOG_SJSCCW",user);
        this.sjsccwSjdx = (SysSjglSjdx) sjsccwParams.get(LjqInterface.KEY_SJDX);
        //设置为新增模式，后续会插入读取错误信息
        JSONPath.set(sjsccwParams, LjqInterface.$_SYS_CLLX, LjqInterface.KEY_CLLX_INSERT);

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

    @Override
    public void invokeHeadMap(Map<Integer, String> headMap, AnalysisContext context) {
        log.debug("文件头信息：" + headMap);
        if (headMap.size() < fields.size()) {
            throw new ExcelReadException("上传文件的表头少了" + (fields.size() - headMap.size())
                    + "列,请重新下载数据模板，不要修改数据模板表头。");
        }
        if (getColCount() == 0) {
            setColCount(headMap.size());
        }
        int i = 0;
        for (Entry<String, JSONObject> e : fields.entrySet()) {
            if (!(e.getValue().getString("zdmc")+"["+e.getValue().getString("zddm")+"]").equals(headMap.get(i))) {
                throw new ExcelReadException("第[" + (i + 1) + "]列必须是["
                        + e.getValue().getString("zdmc") + "]当前实际是：" + headMap.get(i)
                        + "，请不要修改数据模板表头。");
            }
            i++;
        }
    }

    @Override
    public void invoke(LinkedHashMap<Integer,String> data, AnalysisContext context) {
        //判断是否为空行，直接跳过
        boolean kh = true;
        for (String val : data.values()) {
            if (!StringUtil.isBlank(val)) {
                kh = false;
            }
        }
        if (kh) {
            return;
        }
        //补全列数不够的，避免后面报数组越界
        for (int i = data.size(); i < colCount; i++) {
            data.put(i,"");
        }
        doRow(data);

    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext context) {

    }
    /**
     * 处理具体每一行数据 <br/>
     *
     * @param rowList 具体数据行
     * @author jingma
     */
    protected void doRow(LinkedHashMap<Integer,String> rowList) throws RuntimeException {
        //开始包装数据
        int idx = 0;
        JSONObject obj = new JSONObject();
        for (Entry<String, JSONObject> e : fields.entrySet()) {
            obj.put(e.getKey(), rowList.get(idx));
            idx++;
        }
        //设置整行数据，后续验证可能用到
        myParams.put(UtilConst.KEY_YOBJ,obj);
        idx = 0;
        for (Entry<String, JSONObject> e : fields.entrySet()) {
            obj.put(e.getKey(), ruleVerify(idx, rowList.get(idx), e.getValue(), e.getKey()));
            idx++;
        }
        result.add(obj);
    }

    /**
     * 规则校验 <br/>
     *
     * @param idx   第几列
     * @param value 值
     * @param field 字段对象
     * @param zddm  字段代码
     * @author jingma
     */
    public Object ruleVerify(int idx, String value, JSONObject field, String zddm) {
        try {
            value = FieldRuleVerify.ruleVerify(value, field, pcgzMap.get(zddm), myParams);
        } catch (FieldRuleVerifyException e) {
            addError(idx, value, field.getString("zdmc"), e.getMessage());
        }
        return value;
    }

    public void addError(int idx, String value, String name,
                         String cwxx) {
        JSONObject errorObj = new JSONObject();
        errorObj.put("sjh", currRow + 1);
        errorObj.put("sjl", idx + 1);
        errorObj.put("sjlm", name);
        errorObj.put("sjz", value);
        errorObj.put("cwxx", cwxx);
        errorObj.put("sjwj", fileObj.getString("id"));
        errorObj.put("sjdx", sjdx.getId());
        errorList.add(errorObj);
        //存入数据库
        sjsccwParams.put(LjqInterface.KEY_YOBJ, errorObj);
        Result r = LjqManager.insert(sjsccwSjdx, sjsccwParams);
        if (!r.isStatus()) {
            log.error("写入错误日志失败：" + r.getMsg());
        }
    }

    /**
     * @return colCount
     */
    public int getColCount() {
        return colCount;
    }

    /**
     * @param colCount the colCount to set
     */
    public void setColCount(int colCount) {
        this.colCount = colCount;
    }

    /**
     * @return startRow
     */
    public int getStartRow() {
        return startRow;
    }

    /**
     * @param startRow the startRow to set：0,1...
     */
    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

    /**
     * @return result
     */
    public JSONArray getResult() {
        return result;
    }

    /**
     * @param result the result to set
     */
    public void setResult(JSONArray result) {
        this.result = result;
    }

    /**
     * @return fields
     */
    public Map<String, JSONObject> getFields() {
        return fields;
    }

    /**
     * @param fields the fields to set
     */
    public void setFields(Map<String, JSONObject> fields) {
        this.fields = fields;
    }

    /**
     * @return user
     */
    public SysQxYhxx getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(SysQxYhxx user) {
        this.user = user;
    }

    public Map<String, JSONObject> getPcgzMap() {
        return pcgzMap;
    }

    public void setPcgzMap(Map<String, JSONObject> pcgzMap) {
        this.pcgzMap = pcgzMap;
    }

    /**
     * @return errorList
     */
    public List<JSONObject> getErrorList() {
        return errorList;
    }

    /**
     * @param errorList the errorList to set
     */
    public void setErrorList(List<JSONObject> errorList) {
        this.errorList = errorList;
    }

    /**
     * @return sjdx
     */
    public SysSjglSjdx getSjdx() {
        return sjdx;
    }

    /**
     * @param sjdx the sjdx to set
     */
    public void setSjdx(SysSjglSjdx sjdx) {
        this.sjdx = sjdx;
    }
}
