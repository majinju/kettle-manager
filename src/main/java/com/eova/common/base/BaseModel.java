package com.eova.common.base;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map.Entry;

import cn.benma666.constants.UtilConst;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.eova.common.utils.xx;
import com.eova.common.utils.data.CloneUtil;
import com.eova.config.EovaConst;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbKit;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

@SuppressWarnings("rawtypes")
public class BaseModel<M extends Model> extends Model<M> {

	private static final long serialVersionUID = 1702469565872353932L;

	@Override
	public List<M> findByCache(String cacheName, Object key, String sql) {
		// Base数据缓存30Min
		// if (sql.contains("from base_")) {
		// cacheName = BaseCache.BASE;
		// }
		// Ehcache cache 对象是引用传递，所以特此克隆对象，保证使用cache安全
		try {
			return CloneUtil.clone(super.findByCache(cacheName, key, sql));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public List<M> findByCache(String cacheName, Object key, String sql, Object... paras) {
		try {
			return CloneUtil.clone(super.findByCache(cacheName, key, sql, paras));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 查询当前Model所有数据
	 * 
	 * @return
	 */
	public List<M> queryAll() {
		return super.find("select * from " + this.getClass().getSimpleName().toLowerCase());
	}

    /**
    * 查询列表 <br/>
    * @author jingma
    * @param key
    * @param value
    * @return
    */
    public List<M> query(String key,Object value) {
        return queryWhere(key+"=?",value);
    }
    /**
    * 查询第一个对象<br/>
    * @author jingma
    * @param key
    * @param value
    * @return
    */
    public M queryFast(String key,Object value) {
        return queryWhereFast(key+"=?",value);
    }
    /**
    * 查询第一个对象<br/>
    * @author jingma
    * @param where 查询条件：a=? and b=?
    * @param value
    * @return
    */
    public M queryWhereFast(String where,Object... value) {
        List<M> list = queryWhere(where,value);
        if(list.size()>0){
            return list.get(0);
        }
        return null;
    }
    /**
    * 查询列表 <br/>
    * 默认会添加条件：is_disable='0'
    * @author jingma
    * @param key
    * @param value
    * @return
    */
    public List<M> queryNotDisable(String key,Object value) {
        return queryNotDisableWhere(key+"=?",value);
    }
    /**
    * 查询第一个对象<br/>
    * 默认会添加条件：is_disable='0'
    * @author jingma
    * @param key
    * @param value
    * @return
    */
    public M queryNotDisableFast(String key,Object value) {
        return queryNotDisableWhereFast(key+"=?",value);
    }
    /**
    * 查询第一个对象<br/>
    * 默认会添加条件：is_disable='0'
    * @author jingma
    * @param where 查询条件：a=? and b=?
    * @param value
    * @return
    */
    public M queryNotDisableWhereFast(String where,Object... value) {
        List<M> list = queryNotDisableWhere(where,value);
        if(list.size()>0){
            return list.get(0);
        }
        return null;
    }
    /**
    * 查询没有禁用的列表 <br/>
    * 默认会添加条件：is_disable='0'
    * @author jingma
    * @param where 查询条件：a=? and b=?
    * @param value
    * @return
    */
    public List<M> queryNotDisableWhere(String where,Object... value) {
        List<Object> params = new ArrayList<Object>(Arrays.asList(value));
        params.add(0, UtilConst.WHETHER_FALSE);
        return queryWhere("is_disable=? and ("+where+")",params.toArray());
    }
    /**
    * 查询列表 <br/>
    * @author jingma
    * @param where 查询条件：a=? and b=?
    * @param value
    * @return
    */
    public List<M> queryWhere(String where,Object... value) {
        return super.find("select * from " 
                + TableMapping.me().getTable(getClass()).getName()
                +" t where "+where,value);
    }

	/**
	 * 查询当前Model所有数据并Cache
	 * 
	 * @return
	 */
	public List<M> queryAllByCache() {
		String sql = "select * from " + this.getClass().getSimpleName().toLowerCase();
		return findByCache(BaseCache.SER, sql, sql);
	}

	/**
	 * 根据主键获取对象(cache 3 min)
	 * 
	 * @param id 主键
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public M getByCache(Object id) {
		String key = this.getClass().getSimpleName() + "_" + id;
		// get by cache
		M me = (M) BaseCache.getSer(key);
		if (me == null) {
			// get by db
			me = super.findById(id);
			if (me != null) {
				// add to service cache
				BaseCache.putSer(key, me);
			}
		}
		try {
			return CloneUtil.clone(me);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 查询自动缓存
	 * 
	 * @param sql
	 * @return
	 */
	public List<M> queryByCache(String sql) {
		// 查询SQL作为Key值
		return findByCache(BaseCache.SER, sql, sql);
	}

	/**
	 * 查询自动缓存
	 * 
	 * @param sql
	 * @param paras
	 * @return
	 */
	public List<M> queryByCache(String sql, Object... paras) {
		// sql_xx_xx_xx
		String key = sql;
		for (Object obj : paras) {
			key += "_" + obj.toString();
		}
		return findByCache(BaseCache.SER, key, sql, paras);
	}

	/**
	 * 缓存查询第一项
	 * 
	 * @param sql
	 * @return
	 */
	public M queryFisrtByCache(String sql) {
		List<M> list = queryByCache(sql);
		if (xx.isEmpty(list)) {
			return null;
		}
		return list.get(0);
	}

	/**
	 * 缓存查询第一项
	 * 
	 * @param sql
	 * @param paras
	 * @return
	 */
	public M queryFisrtByCache(String sql, Object... paras) {
		List<M> list = queryByCache(sql, paras);
		if (xx.isEmpty(list)) {
			return null;
		}
		return list.get(0);
	}

	/**
	 * 缓存分页查询
	 * 
	 * @param pageNumber 页码
	 * @param pageSize 数量
	 * @param select 查询前缀
	 * @param sqlExceptSelect 查询条件
	 * @return
	 */
	public Page<M> pagerByCache(int pageNumber, int pageSize, String select, String sqlExceptSelect) {
		String key = select + sqlExceptSelect + "_" + pageNumber + "_" + pageSize;
		try {
			return CloneUtil.clone(super.paginateByCache(BaseCache.SER, key, pageNumber, pageSize, select, sqlExceptSelect));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 缓存分页查询
	 * 
	 * @param pageNumber 页码
	 * @param pageSize 数量
	 * @param select 查询前缀
	 * @param sqlExceptSelect 查询条件
	 * @param paras SQL参数
	 * @return
	 */
	public Page<M> pagerByCache(int pageNumber, int pageSize, String select, String sqlExceptSelect, Object... paras) {
		String key = select + sqlExceptSelect + "_" + pageNumber + "_" + pageSize;
		for (Object obj : paras) {
			key += "_" + obj.toString();
		}
		try {
			return CloneUtil.clone(super.paginateByCache(BaseCache.SER, key, pageNumber, pageSize, select, sqlExceptSelect, paras));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 是否存在
	 * 
	 * @param sql
	 * @param paras
	 * @return
	 */
	public boolean isExist(String sql, Object... paras) {
		String configName = DbKit.getConfig(this.getClass()).getName();
		Long count = Db.use(configName).queryNumber(sql, paras).longValue();
		if (count != 0) {
			return true;
		}
		return false;
	}

	/**
	 * 保存
	 */
	@Override
	public boolean save() {
		return save(this);
	}
    /**
     * 保存
     */
    public boolean save(BaseModel<?> obj) {
        String pk = null;
        if (xx.isOracle()) {
            Table table = TableMapping.me().getTable(getClass());
            pk = table.getPrimaryKey()[0];
            // 序列默认值
            if (obj.get(pk) == null) {
                obj.set(pk, EovaConst.SEQ_ + table.getName() + ".nextval");
            }
        }
        boolean isSave = super.save();
//        if (xx.isOracle()) {
//            // 新增成功后 主键 BigDecimal->Integer
//            obj.set(pk, Integer.valueOf(obj.get(pk).toString()));
//        }
        return isSave;
    }
    /**
     * 保存
     */
    public boolean save(Record obj) {
        this.put(obj);
        return save(this);
    }
    /**
    * 设置JSON对象 <br/>
    * @author jingma
    * @param json
    */
    public void set(JSONObject json){
        for(Entry<String, Object> entry:json.entrySet()){
            this.put(entry.getKey(), entry.getValue());
        }
    }
    /**
    * 转换为JSON对象 <br/>
    * @author jingma
    * @return
    */
    public JSONObject toJSONObject(){
        return JSON.parseObject(this.toJson());
    }
}
