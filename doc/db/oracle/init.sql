CREATE TABLE kettle_kz_zycs (
    "PX" NUMBER DEFAULT 99999 ,
    "CJSJ" VARCHAR2(14) DEFAULT to_char(sysdate,'yyyymmddhh24miss'),
    "GXSJ" VARCHAR2(14) DEFAULT to_char(sysdate,'yyyymmddhh24miss'),
    "YXX" VARCHAR2(10) DEFAULT '1' ,
    "CJRXM" VARCHAR2(64),
    "CJRDM" VARCHAR2(32),
    "CJRDWMC" VARCHAR2(256),
    "CJRDWDM" VARCHAR2(32),
    "ID_JOB" NUMBER,
    "KEY" VARCHAR2(255),
    "VALUE" VARCHAR2(4000),
    "KZXX" VARCHAR2(4000),
    "ID" VARCHAR2(32) DEFAULT sys_guid()
);
comment on column kettle_kz_zycs."PX" is '排序;建议排序都按10、20、30的方式排序，方便修改穿插';
comment on column kettle_kz_zycs."CJSJ" is '创建时间;创建时间';
comment on column kettle_kz_zycs."GXSJ" is '更新时间;更新时间';
comment on column kettle_kz_zycs."YXX" is '有效性@SYS_COMMON_LJPD;与共享平台一致，所以这里没有采用中文简拼命名';
comment on column kettle_kz_zycs."CJRXM" is '创建人姓名;创建人姓名';
comment on column kettle_kz_zycs."CJRDM" is '创建人代码@SYS_COMMON_USER;创建人代码@SYS_COMMON_USER';
comment on column kettle_kz_zycs."CJRDWMC" is '创建人单位名称;创建人单位名称';
comment on column kettle_kz_zycs."CJRDWDM" is '创建人单位代码@SYS_COMMON_ORG;创建人单位代码@SYS_COMMON_ORG';
comment on column kettle_kz_zycs."ID_JOB" is '作业主键;作业主键';
comment on column kettle_kz_zycs."KEY" is '键;键';
comment on column kettle_kz_zycs."VALUE" is '值;值';
comment on column kettle_kz_zycs."KZXX" is '扩展信息;JSON格式';
comment on column kettle_kz_zycs."ID" is '主键;主键';
comment on table kettle_kz_zycs is 'kettle-扩展-作业参数';
alter table kettle_kz_zycs add constraint PK_kettle_kz_zycs primary key (id);

CREATE TABLE kettle_kz_zykz (
    PX NUMBER DEFAULT 99999 ,
    CJSJ VARCHAR2(14) DEFAULT to_char(sysdate,'yyyymmddhh24miss'),
    GXSJ VARCHAR2(14) DEFAULT to_char(sysdate,'yyyymmddhh24miss'),
    YXX VARCHAR2(10) DEFAULT '1' ,
    CJRXM VARCHAR2(64),
    CJRDM VARCHAR2(32),
    CJRDWMC VARCHAR2(256),
    CJRDWDM VARCHAR2(32),
    ID_JOB NUMBER,
    NAME VARCHAR2(255),
    YXZT VARCHAR2(100),
    ZHGXSJ VARCHAR2(14),
    ZDCQCS VARCHAR2(10),
    DDJD VARCHAR2(500),
    DSMS VARCHAR2(100),
    RZJB VARCHAR2(100),
    ZYLX VARCHAR2(32),
    GZLJ VARCHAR2(255),
    SHELL VARCHAR2(4000),
    SJZT VARCHAR2(32),
    SQL CLOB,
    JS CLOB,
    KMLM VARCHAR2(255),
    KMPZ CLOB,
    BZ VARCHAR2(4000),
    KZXX VARCHAR2(4000),
    ID VARCHAR2(32) DEFAULT sys_guid()
);
comment on column kettle_kz_zykz.PX is '排序;建议排序都按10、20、30的方式排序，方便修改穿插';
comment on column kettle_kz_zykz.CJSJ is '创建时间;创建时间';
comment on column kettle_kz_zykz.GXSJ is '更新时间;更新时间';
comment on column kettle_kz_zykz.YXX is '有效性@SYS_COMMON_LJPD;与共享平台一致，所以这里没有采用中文简拼命名';
comment on column kettle_kz_zykz.CJRXM is '创建人姓名;创建人姓名';
comment on column kettle_kz_zykz.CJRDM is '创建人代码@SYS_COMMON_USER;创建人代码@SYS_COMMON_USER';
comment on column kettle_kz_zykz.CJRDWMC is '创建人单位名称;创建人单位名称';
comment on column kettle_kz_zykz.CJRDWDM is '创建人单位代码@SYS_COMMON_ORG;创建人单位代码@SYS_COMMON_ORG';
comment on column kettle_kz_zykz.ID_JOB is '作业主键;作业主键';
comment on column kettle_kz_zykz.NAME is '作业名称;作业名称';
comment on column kettle_kz_zykz.YXZT is '运行状态;运行状态';
comment on column kettle_kz_zykz.ZHGXSJ is '最后更新时间;最后更新时间';
comment on column kettle_kz_zykz.ZDCQCS is '自动重启次数;自动重启次数';
comment on column kettle_kz_zykz.DDJD is '调度节点;运行在';
comment on column kettle_kz_zykz.DSMS is '定时;定时';
comment on column kettle_kz_zykz.RZJB is '日志级别;日志级别';
comment on column kettle_kz_zykz.ZYLX is '作业类型@OTHER_KETTLE_ZYLX;OTHER_KETTLE_ZYLX';
comment on column kettle_kz_zykz.GZLJ is '工作路径;工作路径';
comment on column kettle_kz_zykz.SHELL is 'shell脚本;shell脚本';
comment on column kettle_kz_zykz.SJZT is '数据载体;数据载体';
comment on column kettle_kz_zykz.SQL is 'sql脚本;sql脚本';
comment on column kettle_kz_zykz.JS is 'js脚本;js脚本';
comment on column kettle_kz_zykz.KMLM is 'KM类名;KM类名';
comment on column kettle_kz_zykz.KMPZ is 'KM配置;KM配置';
comment on column kettle_kz_zykz.BZ is '备注;备注';
comment on column kettle_kz_zykz.KZXX is '扩展信息;JSON格式';
comment on column kettle_kz_zykz.ID is '主键;主键';
comment on table kettle_kz_zykz is 'kettle-扩展-作业扩展';
alter table kettle_kz_zykz add constraint PK_kettle_kz_zykz primary key (id_job);

drop table kettle_kz_zyyj;
CREATE TABLE kettle_kz_zyyj (
    ID_JOB NUMBER,
    NAME VARCHAR2(200),
    RZWJ VARCHAR2(1000),
    XX VARCHAR2(4000),
    RZJB VARCHAR2(10),
    SFCW VARCHAR2(10),
    SZ VARCHAR2(100),
    RZTD VARCHAR2(100),
    DDJD VARCHAR2(255),
    CJSJ VARCHAR2(14) DEFAULT to_char(sysdate,'yyyymmddhh24miss'),
    ID VARCHAR2(32) DEFAULT sys_guid()
);
comment on column kettle_kz_zyyj.ID_JOB is '作业ID;作业ID';
comment on column kettle_kz_zyyj.NAME is '作业名称;作业名称';
comment on column kettle_kz_zyyj.RZWJ is '日志文件;日志文件';
comment on column kettle_kz_zyyj.XX is '预警日志;预警日志';
comment on column kettle_kz_zyyj.RZJB is '日志级别@KETTLE_LOG_LEVEL;日志级别';
comment on column kettle_kz_zyyj.SFCW is '是否错误@SYS_COMMON_LJPD;是否错误';
comment on column kettle_kz_zyyj.SZ is '宿主;宿主';
comment on column kettle_kz_zyyj.RZTD is '日志通道;日志通道';
comment on column kettle_kz_zyyj.DDJD is '调度节点@KETTLE_GLPT_ZYGL_DDJD';
comment on column kettle_kz_zyyj.CJSJ is '创建时间;创建时间';
comment on column kettle_kz_zyyj.ID is '主键;对象主键';
comment on table kettle_kz_zyyj is 'kettle-管理平台-作业预警';
alter table kettle_kz_zyyj add constraint PK_kettle_kz_zyyj primary key (id);

-- drop table kettle_kz_log;
CREATE TABLE kettle_kz_log (

                               "ID" VARCHAR2(32),
                               "ID_JOB" NUMBER,
                               "NAME" VARCHAR2(200),
                               "DDJD" VARCHAR2(255),
                               "KSSJ" VARCHAR2(14),
                               "JSSJ" VARCHAR2(14),
                               "YXJG" VARCHAR2(200),
                               "RZWJ" VARCHAR2(1000),
                               "CJRDM" VARCHAR2(32),
                               "CJRDWDM" VARCHAR2(32),
                               "CJRDWMC" VARCHAR2(256),
                               "CJRXM" VARCHAR2(64),
                               "CJSJ" VARCHAR2(14) DEFAULT to_char(sysdate,'yyyymmddhh24miss') ,
                               "GXSJ" VARCHAR2(14) DEFAULT to_char(sysdate,'yyyymmddhh24miss') ,
                               "KZXX" VARCHAR2(4000) DEFAULT '{}' ,
                               "PX" NUMBER DEFAULT 99999 ,
                               "YXX" VARCHAR2(8) DEFAULT '1'
);
comment on column kettle_kz_log."ID" is '对象主键;对象主键';
comment on column kettle_kz_log."ID_JOB" is '作业ID;作业ID';
comment on column kettle_kz_log."NAME" is '作业名称;作业名称';
comment on column kettle_kz_log."DDJD" is '调度节点@KETTLE_GLPT_ZYGL_DDJD;KETTLE_GLPT_ZYGL_DDJD';
comment on column kettle_kz_log."KSSJ" is '开始时间;开始时间';
comment on column kettle_kz_log."JSSJ" is '结束时间;结束时间';
comment on column kettle_kz_log."YXJG" is '运行结果@KETTLE_RUN_STATUS;运行结果';
comment on column kettle_kz_log."RZWJ" is '日志文件;日志文件';
comment on column kettle_kz_log."CJRDM" is '创建人代码@SYS_COMMON_USER;SYS_COMMON_USER';
comment on column kettle_kz_log."CJRDWDM" is '创建人单位代码@SYS_COMMON_ORG;SYS_COMMON_ORG';
comment on column kettle_kz_log."CJRDWMC" is '创建人单位名称;创建人单位名称;';
comment on column kettle_kz_log."CJRXM" is '创建人姓名;创建人姓名;';
comment on column kettle_kz_log."CJSJ" is '创建时间;创建时间;';
comment on column kettle_kz_log."GXSJ" is '更新时间;更新时间;';
comment on column kettle_kz_log."KZXX" is '扩展信息;JSON格式';
comment on column kettle_kz_log."PX" is '排序;排序;';
comment on column kettle_kz_log."YXX" is '有效性@SYS_COMMON_LJPD;SYS_COMMON_LJPD';
comment on table kettle_kz_log is 'kettle-管理平台-基础日志';
alter table kettle_kz_log add constraint PK_kettle_kz_log primary key (id);

CREATE OR REPLACE  VIEW v_job AS SELECT
      j.ID_JOB AS ID_JOB,
      j.ID_DIRECTORY AS ID_DIRECTORY,
      j.NAME AS NAME,
      j.DESCRIPTION AS DESCRIPTION,
      j.EXTENDED_DESCRIPTION AS EXTENDED_DESCRIPTION,
      j.JOB_VERSION AS JOB_VERSION,
      j.JOB_STATUS AS JOB_STATUS,
      j.ID_DATABASE_LOG AS ID_DATABASE_LOG,
      j.TABLE_NAME_LOG AS TABLE_NAME_LOG,
      j.CREATED_USER AS CREATED_USER,
      j.CREATED_DATE AS CREATED_DATE,
      j.MODIFIED_USER AS MODIFIED_USER,
      j.MODIFIED_DATE AS MODIFIED_DATE,
      j.USE_BATCH_ID AS USE_BATCH_ID,
      j.PASS_BATCH_ID AS PASS_BATCH_ID,
      j.USE_LOGFIELD AS USE_LOGFIELD,
      j.SHARED_FILE AS SHARED_FILE,
      k.gxsj AS gxsj,
      k.yxx AS yxx,
      k.px AS px,
      k.kzxx AS kzxx,
      k.cjrxm AS cjrxm,
      k.cjrdm AS cjrdm,
      k.cjrdwmc AS cjrdwmc,
      k.cjrdwdm AS cjrdwdm,
      k.id AS id,
      k.yxzt AS yxzt,
      k.zhgxsj AS zhgxsj,
      k.zdcqcs AS zdcqcs,
      k.ddjd AS ddjd,
      k.dsms AS dsms,
      k.rzjb AS rzjb,
      nvl( k.zylx, 'cgzy' ) AS zylx,
      k.gzlj AS gzlj,
      k.shell AS shell,
      k.sjzt AS sjzt,
      k.sql AS sql,
      k.js AS js,
      k.kmlm AS kmlm,
      k.kmpz AS kmpz,
      k.bz AS bz
  FROM
      (
       r_job j
          LEFT JOIN kettle_kz_zykz k ON ((
              j.ID_JOB = k.id_job
          )));

CREATE OR REPLACE VIEW v_zhyy AS SELECT
   j.ID_JOB AS id_job,
   j.NAME AS name,
   j.DESCRIPTION AS description,
   je.ID_JOBENTRY AS id_jobentry,
   je.NAME AS je_name,
   ja.VALUE_STR AS zhmc,
   jad.zhlj AS zhlj
FROM
   (((
       r_job j
           JOIN r_jobentry je ON ((
               j.ID_JOB = je.ID_JOB
           )))
       JOIN r_jobentry_attribute ja ON ((
               ja.ID_JOBENTRY = je.ID_JOBENTRY
           )))
       JOIN (
       SELECT
           je.ID_JOBENTRY AS id_jobentry,
           ja.CODE AS code,
           ja.VALUE_STR AS zhlj
       FROM
           ((
                r_job j
                    JOIN r_jobentry je ON ((
                        j.ID_JOB = je.ID_JOB
                    )))
               JOIN r_jobentry_attribute ja ON ((
                   ja.ID_JOBENTRY = je.ID_JOBENTRY
               )))
       WHERE
           ((
                    je.ID_JOBENTRY_TYPE = (
                    SELECT
                        jt.ID_JOBENTRY_TYPE
                    FROM
                        r_jobentry_type jt
                    WHERE
                        ( jt.CODE = 'TRANS' )))
               AND ( ja.CODE = 'dir_path' ))) jad ON ((
           jad.id_jobentry = je.ID_JOBENTRY
       )))
WHERE
   ((
            je.ID_JOBENTRY_TYPE = (
            SELECT
                jt.ID_JOBENTRY_TYPE
            FROM
                r_jobentry_type jt
            WHERE
                ( jt.CODE = 'TRANS' )))
       AND ( ja.CODE = 'name' ));

CREATE OR REPLACE VIEW v_zycs AS SELECT
      ja.ID_JOB AS id_job,
      ja.ID_JOB_ATTRIBUTE AS id,
      to_char(ja.VALUE_STR) AS key,
      to_char(ja1.VALUE_STR) AS name,
      to_char(ja2.VALUE_STR) AS PARAM_DEFAULT,
      p.value AS value,
      p.gxsj AS gxsj,
      p.yxx AS yxx
  FROM
      (
       (
           (
               (
                   r_job_attribute ja
                       JOIN r_job_attribute ja1 ON (
                       (
                               ( ja1.ID_JOB = ja.ID_JOB )
                               AND ( ja1.NR = ja.NR )
                               AND ( ja1.CODE = 'PARAM_DESC' )
                           )
                       )
                   )
                   JOIN r_job_attribute ja2 ON (
                   (
                           ( ja2.ID_JOB = ja.ID_JOB )
                           AND ( ja2.NR = ja.NR )
                           AND ( ja2.CODE = 'PARAM_DEFAULT' )
                       )
                   )
               )
               JOIN r_job j ON ( ( j.ID_JOB = ja.ID_JOB ) )
           )
          LEFT JOIN kettle_kz_zycs p ON ( ( ( p.id_job = ja.ID_JOB ) AND ( to_char(ja.VALUE_STR) = p.key ) ) )
          )
  WHERE
      ( ja.CODE = 'PARAM_KEY' )
  ORDER BY
      ja.NR;
