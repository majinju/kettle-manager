package cn.benma666.common.contorller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.benma666.common.domain.SysZdTyzd;
import cn.benma666.common.service.DictService;
import cn.benma666.iframe.DictManager;
import cn.benma666.myutils.PageInfo;
import cn.benma666.myutils.StringUtil;
import cn.benma666.web.BasicController;
import cn.benma666.web.WebUtil;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
* 字典管理 <br/>
* 路径以后调整
* date: 2018年12月8日 <br/>
* @author jingma
* @version 
*/
@Controller
@RequestMapping(value = "/common/dict")
public class DictController extends BasicController {
    @Autowired
    private DictService dictService;

    /**
    * 获取字典列表 <br/>
    * @author jingma
    * @param t
    * @param response
    */
    @RequestMapping(value = "/zdList.do")
    public void zdList(SysZdTyzd t, HttpServletResponse response) {
        String result = JSON.toJSONString(
                DictManager.zdList(t.get("zdlb").toString()), true);
        sendJson(response, result);
    }

    /**
    * 字典搜索 <br/>
    * @author jingma
    * @param page
    * @param t
    * @param response
    */
    @RequestMapping(value = "/zdSearch.do")
    public void zdSearch(PageInfo<JSONObject> page, SysZdTyzd t,
            HttpServletResponse response) {
        Object searchValue = t.get("searchValue");
        String otherParam = (String) t.get("otherParam");
        String zdlb = t.get("zdlb").toString();
        PageInfo<JSONObject> result;
        if (searchValue != null
                && StringUtil.isNotBlank(searchValue.toString())) {
            List<JSONObject> list = new ArrayList<JSONObject>();
            if (searchValue.toString().contains(",")) {
                for (String dm : searchValue.toString().split(",")) {
                    JSONObject json = new JSONObject();
                    json.put("dm", dm);
                    if (StringUtil.isNotBlank(otherParam)) {
                        json.put("mc",
                                DictManager.zdMcByDm(zdlb, dm, otherParam));
                    } else {
                        json.put("mc", DictManager.zdMcByDm(zdlb, dm));
                    }
                    list.add(json);
                }
            } else {
                JSONObject json = new JSONObject();
                json.put("dm", searchValue);
                if (StringUtil.isNotBlank(otherParam)) {
                    json.put("mc", DictManager.zdMcByDm(zdlb,
                            searchValue.toString(), otherParam));
                } else {
                    json.put("mc",
                            DictManager.zdMcByDm(zdlb, searchValue.toString()));
                }
                list.add(json);
            }
            page.setList(list);
            result = page;
        } else {
            result = DictManager.zdSearch(page,
                    (JSONObject) JSONObject.toJSON(t));
        }
        sendPage(response, result);
    }

    /**
    * 清理缓存 <br/>
    * @author jingma
    * @param response
    */
    @RequestMapping(value = "/clearDict.do")
    public void clearDict(HttpServletResponse response) {
        DictManager.clearDict();
        sendJson(response, success("清除缓存成功!"));
    }

    @RequestMapping(value = "/list.do", method = RequestMethod.GET)
    public String list(SysZdTyzd t, PageInfo<SysZdTyzd> page) {
        return getPathList();
    }
    @RequestMapping(value = "/queryList.do", method = RequestMethod.POST)
    public void queryList(SysZdTyzd t,
            PageInfo<JSONObject> page, HttpServletResponse response) {
        try {
            page = dictService.queryPage(t, page);
            sendPage(response, page);
        } catch (Exception e) {
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
        }
    }
    
    @RequestMapping(value = "/add.do", method = RequestMethod.GET)
    public String add(HttpServletRequest request) {
        return getPathAdd();
    }
    @RequestMapping(value = "/add.do", method = RequestMethod.POST)
    public void add(SysZdTyzd t, HttpServletResponse response) {
        try {
            sendJson(response, dictService.txSave(t));
        } catch (Exception e) {
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
        }
    }
    
    @RequestMapping(value = "/update.do", method = RequestMethod.GET)
    public String update(String id,HttpServletResponse response,Model model) {
        SysZdTyzd t = new SysZdTyzd(id);                  
        model.addAttribute("t", sqlManager.single(SysZdTyzd.class, t.getId()));
        return getPathUpdate();
    }
    @RequestMapping(value = "/update.do", method = RequestMethod.POST)
    public void update(SysZdTyzd t, HttpServletResponse response) {
        try {
            sendJson(response, dictService.txSave(t));
        } catch (Exception e) {
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
        }
    }
    
    @RequestMapping("/details.do")
    public String details(String id,Model model) {
        SysZdTyzd t = new SysZdTyzd(id);                  
        model.addAttribute("t", sqlManager.single(SysZdTyzd.class, t.getId()));
        return getPath("details");
    }

    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public void delete(SysZdTyzd t, HttpServletResponse response) {
        try {
            sqlManager.updateTemplateById(t);
            sendJson(response, success("恭喜您，删除成功!"));
        } catch (Exception e) {
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
        }
    }
    @RequestMapping(value = "/batchDelete.do", method = RequestMethod.POST)
    public void batchDelete(String ids, HttpServletResponse response) {
        try {
            SysZdTyzd t = new SysZdTyzd();
            t.getMap().put("ids", ids);
            sendJson(response, dictService.txBatchDelete(t));
        } catch (Exception e) {
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
        }
    }

    /**
     * 
     * @see cn.benma666.common.contorller.BasicController#getFModulePath()
     */
    @Override
    public String getFModulePath() {
        return "common";
    }

    /**
     * 
     * @see cn.benma666.common.contorller.BasicController#getModulePath()
     */
    @Override
    public String getModulePath() {
        return "dict";
    }

}
