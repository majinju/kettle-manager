package cn.benma666.common.contorller;

import cn.benma666.common.iframe.BasicObject;
import cn.benma666.myutils.StringUtil;

public abstract class BasicController extends BasicObject {

    abstract public String getFModulePath();

    abstract public String getModulePath();

    public String getPath(String name) {
        String path = getModulePath() + "/" + name;
        if (StringUtil.isNotBlank(getFModulePath())) {
            path = getFModulePath() + "/" + path;
        }
        return path;
    }

    public String getPathList() {
        String path = getModulePath() + "/list";
        if (StringUtil.isNotBlank(getFModulePath())) {
            path = getFModulePath() + "/" + path;
        }
        return path;
    }
    public String getPathEdit() {
        String path = getModulePath() + "/edit";
        if (StringUtil.isNotBlank(getFModulePath())) {
            path = getFModulePath() + "/" + path;
        }
        return path;
    }

    public String getPathAdd() {
        String path = getModulePath() + "/add";
        if (StringUtil.isNotBlank(getFModulePath())) {
            path = getFModulePath() + "/" + path;
        }
        return path;
    }

    public String getPathUpdate() {
        String path = getModulePath() + "/update";
        if (StringUtil.isNotBlank(getFModulePath())) {
            path = getFModulePath() + "/" + path;
        }
        return path;
    }

}
