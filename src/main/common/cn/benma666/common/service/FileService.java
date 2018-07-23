package cn.benma666.common.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.benma666.common.domain.TSysFileRecord;
import cn.benma666.common.iframe.AConfig;
import cn.benma666.common.iframe.BasicObject;
import cn.benma666.common.util.StringUtil;
import cn.benma666.myutils.FileUtil;

/**
 * 文件相关服务
 */
@Service
public class FileService extends BasicObject{
	
	/**
	 * 文件上传路径
	 */
	public static final String SYS_SCLJ = "sys.sclj";
	/**
	 * 上传类别
	 */
	public static final String SYS_SCLB = "sys.sclb";
	
	/**
	 * 上传类别_LOCAL
	 */
	public static final String SCLB_LOCAL = "LOCAL";
	
	/**
	 * 上传类别_FASTDFS
	 */
	public static final String SCLB_FASTDFS = "FASTDFS";
	
	/**
	 * 不删除（有效数据标识）
	 */
	public static final String ISDEL_NO= "0";
	/**
	 * 删除（无效数据标识）
	 */
	public static final String ISDEL_YES= "1";
	
	/**
	 * 上传文件
	 * @param t
	 * @param file
	 * @return
	 * @throws IOException
	 */
	public TSysFileRecord uploadFiles(TSysFileRecord t,MultipartFile file){
		//文件名称
		String fileName = file.getOriginalFilename();
		//文件类型
		String fileType = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();
		//文件上传路径
		String sclb = AConfig.getVal(SYS_SCLB);
		//上传后文件的路径以及文件的名称
		String filePath = AConfig.getVal(SYS_SCLJ) + t.getYwdm() +"/"+ StringUtil.getTimeFileName() + "." + fileType;
//		byte[] bt;
//		try {
//			bt = file.getBytes();
//		} catch (Exception e) {
//			LogHelper.getLogger().error("上传文件出错", e);
//			return null;
//		}
		File files = new File(filePath);
		FileUtil.saveFileToDisk(files, file);
		//去重码ywdm+wjlb+MD5
		String qcm= t.getYwdm()+t.getWjlb()+FileUtil.getFileMD5(files);
		
		//将文件信息存入数据库		
		TSysFileRecord obj = new TSysFileRecord(t.getYwdm(),fileName,qcm,sclb,filePath,fileType,t.getWjlb());

		//如果表中存在此去重码则把这个文件删除
//		if(this.tSysFileRecordDao.selectEntity(obj)!=null){
//			files.delete();
//			return this.tSysFileRecordDao.selectEntity(obj);
//		}else{
//			if(SCLB_FASTDFS.equals(sclb)){			
//				try {
//					//删除本地临时文件
//					files.delete();
//					//上传文件fastdfs返回文件路径
//					filePath = fastdfsPool.saveFile(bt,fileType);
//					obj.setSclj(filePath);					
//				} catch (Exception e) {
//					LogHelper.getLogger().error("上传文件出错", e);
//					return null;
//				}			
//			}
//			if(StringUtils.isBlank(filePath)){
//				return null;
//			}
//			//保存文件信息
//			this.tSysFileRecordDao.insertEntity(obj);		
//		}
		return obj;		
	}
	
	/**
	 * 查询文件
	 * @param t
	 * @return
	 */
	public TSysFileRecord selectTSysFileRecord(TSysFileRecord t) {
		if(StringUtils.isBlank(t.getId())){
			return null;
		}
//		return this.tSysFileRecordDao.selectEntity(t);
		return null;
	}
	
	/**
	 * 获取文件对象
	 * @param t
	 * @return
	 */
	public List<TSysFileRecord> getFile(String ywdx) {
		if(StringUtils.isBlank(ywdx)){
			return null;
		}
		TSysFileRecord record = new TSysFileRecord();
		record.getMap().put("ywdx", ywdx);
//		return this.tSysFileRecordDao.selectEntityList(record);
        return null;
	}
	
}
