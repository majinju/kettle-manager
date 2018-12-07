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
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.PageInfo;
import cn.benma666.myutils.StringUtil;
import cn.benma666.web.BasicController;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.stuxuhai.jpinyin.PinyinFormat;
import com.github.stuxuhai.jpinyin.PinyinHelper;

@Controller
@RequestMapping(value = "/common/dict")
public class DictController extends BasicController {
    @Autowired
    private DictService dictService;

    @RequestMapping(value = "/zdList.do")
    public void zdList(SysZdTyzd t, HttpServletResponse response) {
        String result = JSON.toJSONString(
                DictManager.zdList(t.getMap().get("zdlb").toString()), true);
        sendJson(response, result);
    }

    @RequestMapping(value = "/zdSearch.do")
    public void zdSearch(PageInfo<JSONObject> page, SysZdTyzd t,
            HttpServletResponse response) {
        Object searchValue = t.getMap().get("searchValue");
        String otherParam = (String) t.getMap().get("otherParam");
        String zdlb = t.getMap().get("zdlb").toString();
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

    @RequestMapping(value = "/clearDict.do")
    public void clearDict(HttpServletResponse response) {
        DictManager.clearDict();
        JsonResult result = new JsonResult(true, "清除缓存成功!");
        sendJson(response, result);
    }

    /**
     * @Title: list
     * @Description: 进入字典查询列表页
     * @param t
     * @param model
     * @return String
     */
    @RequestMapping(value = "/list.do", method = RequestMethod.GET)
    public String list(SysZdTyzd t, PageInfo<SysZdTyzd> page) {
        return getPathList();
    }

    /**
     * @param response 
     * @Title: queryList
     * @Description:列表页分页查询
     */
    @RequestMapping(value = "/queryList.do", method = RequestMethod.POST)
    public void queryList(SysZdTyzd t,
            PageInfo<JSONObject> page, HttpServletResponse response) {
        try {
            page = dictService.queryPage(t, page);
        } catch (Exception e) {
            log.error("字典列表请求出错", e);
            page = new PageInfo<JSONObject>();
        }
        sendPage(response, page);
    }
    /**
    * @Title: delete
    * @Description: Ajax删除
    * @param t
     * @param response 
    */
    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public void delete(SysZdTyzd t, HttpServletResponse response) {
        JsonResult result;
        try {
            sqlManager.updateTemplateById(t);
            result = new JsonResult(true, "恭喜您，删除成功!");
        } catch (Exception ex) {
            log.error("删除系统配置时出错", ex);
            result = new JsonResult(false, "网络错误！");
        }
        sendJson(response, result);
    }
    
    /**
    * @Title: batchDelete
    * @Description: Ajax批量删除
    * @param ids
    * @param response 
    * @return JsonResult
    */
    @RequestMapping(value = "/batchDelete.do", method = RequestMethod.POST)
    public void batchDelete(String ids, HttpServletResponse response) {
        JsonResult result;
        try {
            SysZdTyzd t = new SysZdTyzd();
            t.getMap().put("ids", ids);
            dictService.batchDelete(t);
            result = new JsonResult(true, "恭喜您，删除成功!");
        }catch (Exception ex) {
            log.error("批量删除系统配置时出错", ex);
            result = new JsonResult(false, "网络错误！");
        }
        sendJson(response, result);
    }
    
    /**
    * @Title: add
    * @Description: 进入添加页面
    * @param request
    * @param model
    * @return String
    */
    @RequestMapping(value = "/add.do", method = RequestMethod.GET)
    public String add(HttpServletRequest request) {
        return getPathAdd();
    }
    
    /**
    * @Title: add
    * @Description: Ajax保存添加数据
    * @param t
     * @param response 
    * @return JsonResult
    */
    @RequestMapping(value = "/add.do", method = RequestMethod.POST)
    public void add(SysZdTyzd t, HttpServletResponse response) {
        JsonResult result;
        try {
            if(!StringUtil.isBlank(t.getMc())){
                //设置名称简拼
                t.setJp(PinyinHelper.getShortPinyin(t.getMc()).toUpperCase());
                //设置名称全拼
                t.setQp(PinyinHelper.convertToPinyinString(t.getMc(), "",PinyinFormat.WITHOUT_TONE).toUpperCase());
            }
            sqlManager.insertTemplate(t);
            DictManager.clearDict(t.getZdlb());
            result = new JsonResult(true, "添加成功!");
        } catch (Exception ex) {
            log.error("添加系统配置时出错", ex);
            result = new JsonResult(false, "添加系统配置时出错！");
        }
        sendJson(response, result);
    }
    
    /**
    * @Title: update
    * @Description: Ajax保存修改信息
    * @param t
     * @param response 
    * @return JsonResult
    */
    @RequestMapping(value = "/update.do", method = RequestMethod.POST)
    public void update(SysZdTyzd t, HttpServletResponse response) {
        JsonResult result;
        try {
            sqlManager.updateTemplateById(t);
            DictManager.clearDict(t.getZdlb());
            result = new JsonResult(true, "恭喜您，更新成功!");
        } catch (Exception ex) {
            log.error("更新系统配置时出错", ex);
            result = new JsonResult(false, "添加系统配置时出错！");
        }
        sendJson(response, result);
    }
    
    /**
    * @Title: update
    * @Description: 进入修改页面
    * @param id
    * @param model
    * @return String
    */
    @RequestMapping(value = "/update.do", method = RequestMethod.GET)
    public String update(String id,HttpServletResponse response,Model model) {
        SysZdTyzd t = new SysZdTyzd(id);                  
        model.addAttribute("t", sqlManager.single(SysZdTyzd.class, t.getId()));
        return getPathUpdate();
    }
    
    /**
    * @Title: details
    * @Description: 进入详情页面
    * @param id
    * @param model
    * @return String
    */
    @RequestMapping("/details.do")
    public String details(String id,Model model) {
        SysZdTyzd t = new SysZdTyzd(id);                  
        model.addAttribute("t", sqlManager.single(SysZdTyzd.class, t.getId()));
        return getPath("details");
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
