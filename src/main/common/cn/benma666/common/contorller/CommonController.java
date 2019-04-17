package cn.benma666.common.contorller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.benma666.common.service.CommonService;
import cn.benma666.domain.SysSjglTyzd;
import cn.benma666.iframe.DictManager;
import cn.benma666.myutils.PageInfo;
import cn.benma666.myutils.StringUtil;
import cn.benma666.web.BasicController;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
* 通用 <br/>
* date: 2018年12月3日 <br/>
* @author jingma
* @version 
*/
@Controller
@RequestMapping(value="/common")
public class CommonController extends BasicController {
    @Autowired
    private CommonService commonService;

    /**
    * 获取字典列表 <br/>
    * @author jingma
    * @param obj
    * @param response
    */
    @RequestMapping(value = "/zdList.do")
    public void zdList(SysSjglTyzd obj, HttpServletResponse response) {
        JSONObject map = DictManager.zdMapByCache(obj.getZdlb());
        if(map==null){
            sendJson(response, error("该字典类别不支持获取列表"));
        }else{
            String result = JSON.toJSONString(success("获取成功",map), obj.isJsongsh());
            sendJson(response, result);
        }
    }

    /**
    * 获取字典项 <br/>
    * @author jingma
    * @param obj
    * @param response
    */
    @RequestMapping(value = "/zdObjByDm.do")
    public void zdObjByDm(SysSjglTyzd obj, HttpServletResponse response) {
        JSONObject result = DictManager.zdObjByDmByCache(obj.getZdlb(), obj.getDm());
        if(result==null){
            sendJson(response, error("该字典项不存在"));
        }else{
            sendJson(response, success("获取成功",result));
        }
    }

    /**
    * 字典搜索 <br/>
    * @author jingma
    * @param page
    * @param zd
    * @param response
    */
    @RequestMapping(value = "/zdSearch.do")
    public void zdSearch(PageInfo<JSONObject> page, SysSjglTyzd zd,
            HttpServletResponse response) {
        String searchValue = zd.getSearchValue();
        PageInfo<JSONObject> result;
        if (StringUtil.isNotBlank(searchValue)) {
            //此时为翻译
            List<JSONObject> list = new ArrayList<JSONObject>();
            for (String dm : searchValue.split(",")) {
                zd.setDm(dm);
                list.add(DictManager.zdObjByDm(zd));
            }
            page.setList(list);
            result = page;
        } else {
            result = DictManager.zdSearch(page,zd);
        }
        sendPage(response, result);
    }
    
    @Override
    public String getFModulePath() {
        return "";
    }
    @Override
    public String getModulePath() {
        return "common";
    }

}
