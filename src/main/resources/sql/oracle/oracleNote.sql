

--jinjuma@yeah.net 数据库脚本纪要

-- 远程导出数据：exp system/manager@ORCL file=e:\orcl.dmp owner=(orcl,teacher,dyz,chub,hwp)
-- 远程导入数据：imp system/manager@ORCL  file=e:\orcl.dmp tables=(table1,table2)  full=y log=D:/oracelImp.log commit buffer=512000000 ignore=y

--如果是远程访问的话 建议可以对这几张表在远程做一个视图（可以是查询结果集的视图），然后这边只要查询这个视图，应该会快点，注意远程视图是用不到索引的

--oracle启动监听器：lsnrctl start

--NLS_LANG=AMERICAN_AMERICA_AL32UTF8
--NLS_LANG=AMERICAN_AMERICA.ZHS16GBK
--强制索引：/*+ index(a index_name) */

--创建临时表，每次使用完会自动清空
create global temporary table TEMP_T_WFRYMP_ZPSJ_COUNT
(
  SFZJHM VARCHAR2(100),
  LX     VARCHAR2(6),
  COUNT  NUMBER
)
on commit preserve rows;
--查询插入
insert into test1(aa)  select sysdate from dual
--nowait若是对应数据被锁则直接报错，不等待解锁
select * from t_wfrymp_zpsj_count for update nowait
--执行存储过程
call PROC_FAPG_TJ()
--创建视图
create or replace view V_hzc_rk_zd_zjmc as
select * from t_hzc_rk_zd_zjmc
--查询数据所在系统时间
select sysdate from dual;

--查询下一条seq的值
select SCHEDULE_ID.NEXTVAL from dual;

--加一个小时 20141111121111
select to_char(to_date('20141111111111', 'yyyyMMddhh24miss') + (1/24),'yyyyMMddhh24miss') from dual

--nvl
select nvl(1+2,2) from dual;

--将系统时间转换为字符串
select to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') 系统时间 from dual;

--日期字符串转换为date型
select to_date('2013-11-06','YYYY-MM-DD') from dual;

--字符串搜索
select instr('11112313','11123',1) from dual;

--截取字符串
select substr('fdsf',2) from dual;

--删除数据
delete from ma_t_user where name='马';

--查询数据
select * from ma_t_user t where name='马' and pass='jing' ;

--插入数据
insert into ma_t_user(id,name, pass) values (to_char(sysdate,'MI_SS'),'马', 'jing');

--更新数据
update ma_t_user set name = 'xiao', pass = 'ma' where id = '00_26';

--转义字符
select * from temp_dba_views t
where t.text like '%\_2011%' escape '\'
and t.text not like '%\_2012%' escape '\'

--编辑数据
select t.*, t.rowid  from ma_t_user t;

--删除表
drop table ma_t_user

--清空表，无法恢复，速度快
truncate table test4;

--授权其他用户访问自己所有表
GRANT SELECT any table TO hbga_web;
  
--查询表的列信息
select t1.owner,
       t1.table_name,
       t1.column_name as zdm,
       t1.COMMENTS    as zdsm,
       t2.DATA_TYPE   as ZDLX,
       t2.DATA_LENGTH
  from all_col_comments t1
  left join all_tab_cols t2
    on t2.column_name = t1.column_name
   and t2.TABLE_NAME = t1.table_name
   and t2.owner = t1.owner
 where t1.owner = 'GXPT_WEB'
   and t1.table_name <> 'ICOL$'
   and t1.table_name not like 'BIN$%';
   

-- 查询数据库名称 
select name,value from v$parameter where name='service_names' 

--查询创建的dblink 
select owner,object_name from dba_objects where object_type='DATABASE LINK'; 
select * from dba_db_links; 

--创建public dblink 
create public database link publicdblink connect to ytga_web identified by ytga 
　　 using '(DESCRIPTION = 
(ADDRESS_LIST = 
(ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.83.132)(PORT = 1521)) 
) 
(CONNECT_DATA = 
(SERVICE_NAME =XXXX) 
) 
)'; 

--创建私有dblink 
create database link privatedblink connect to ytga_web identified by ytga 
　　 using '(DESCRIPTION = 
(ADDRESS_LIST = 
(ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.83.132)(PORT = 1521)) 
) 
(CONNECT_DATA = 
(SERVICE_NAME =XXXX) 
) 
)'; 

--删除dblink 
drop public database link DBLINK_KETTLE;

--使用dblink 
select t.*, t.rowid from t_jsec_user@publicdblink t;
  
----------------------通过dblink合并两个数据库中相同表的数据--------------------------------
merge into t_jsec_subsystem@publicdblink b using t_jsec_subsystem c on (b.id=c.id)  --从center将表merge到branch,同步的依据是两个表的pk
when matched then  update set b.sub_systen_name=c.sub_systen_name  --b.web_context=c.web_context,--如果pk值是相同则将指定表的值更新到目标表
when not matched then                                --如果pk值不一至，则将源表中的数据整条插入到目标表中
insert values (c.id, c.sub_systen_name, c.sys_version, c.web_context);
commit;               --记得merge后必须commit,否则更改未能提交

--查询数据文件
  select * from v$datafile;
--查询ctl文件
  select name from v$controlfile;
--更改表空间
  --alter tablespace users online;
  
--当前的连接数 
select * from v$process; 
--设置的最大连接数（默认值为150） 
select value from v$parameter where name = 'processes'; 
--修改最大连接数 
alter system set processes = 300 scope = spfile; 
alter system set sessions=300 scope=spfile;
 commit;

-----------------------创建表空间

/*分为四步 */ 
/*第1步：创建临时表空间 */ 
create temporary tablespace GXPTZJK_TEMP 
tempfile 'D:\ORACLE\PRODUCT\10.2.0\ORADATA\IFLYTEKDB/GXPTZJK_TEMP.dbf' 
size 50m 
autoextend on 
next 50m maxsize 20480m 
extent management local; 

/*第2步：创建数据表空间 */ 
create tablespace GXPTZJK_DATA 
logging 
datafile 'D:\ORACLE\PRODUCT\10.2.0\ORADATA\IFLYTEKDB/GXPTZJK_DATA.dbf' 
size 50m 
autoextend on 
next 50m maxsize 20480m 
extent management local; 

/*第3步：创建用户并指定表空间 */ 
create user xfga_db identified by password 
default tablespace xfga_db_data 
temporary tablespace xfga_db; 

/*第4步：给用户授予权限 */ 
grant connect,resource,dba to xfga_db; 

-- 删除表空间 
DROP TABLESPACE user_lhkga INCLUDING CONTENTS AND DATAFILES; 

--查看表空间使用情况
SELECT UPPER(F.TABLESPACE_NAME) "表空间名", 
　　D.TOT_GROOTTE_MB "表空间大小(M)", 
  　D.TOT_GROOTTE_MB - F.TOTAL_BYTES "已使用空间(M)", 
　　TO_CHAR(ROUND((D.TOT_GROOTTE_MB - F.TOTAL_BYTES) / D.TOT_GROOTTE_MB * 100, 2), 
　　'990.99') "使用比", 
　　F.TOTAL_BYTES "空闲空间(M)", 
　　F.MAX_BYTES "最大块(M)" 
　　FROM (SELECT TABLESPACE_NAME, 
　　ROUND(SUM(BYTES) / (1024 * 1024), 2) TOTAL_BYTES, 
　　ROUND(MAX(BYTES) / (1024 * 1024), 2) MAX_BYTES 
　　FROM SYS.DBA_FREE_SPACE 
　　GROUP BY TABLESPACE_NAME) F, 
　　(SELECT DD.TABLESPACE_NAME, 
　　ROUND(SUM(DD.BYTES) / (1024 * 1024), 2) TOT_GROOTTE_MB 
　　FROM SYS.DBA_DATA_FILES DD 
　　GROUP BY DD.TABLESPACE_NAME) D 
　　WHERE D.TABLESPACE_NAME = F.TABLESPACE_NAME 
　　ORDER BY 4 DESC; 
SELECT a.tablespace_name ,
      a.bytes / 1024 / 1024                              "表空间大小(M)",
      ( a.bytes - b.bytes ) / 1024 / 1024                "已使用空间(M)",
      b.bytes / 1024 / 1024                              "空闲空间(M)",
      Round(( ( a.bytes - b.bytes ) / a.bytes ) * 100, 2) "使用比率"
FROM  (SELECT tablespace_name,
              SUM(bytes) bytes
        FROM  dba_data_files
        GROUP  BY tablespace_name) a,
      (SELECT tablespace_name,
              SUM(bytes) bytes,
              Max(bytes) largest
        FROM  dba_free_space
        GROUP  BY tablespace_name) b
WHERE  a.tablespace_name = b.tablespace_name
ORDER  BY ( ( a.bytes - b.bytes ) / a.bytes ) DESC;

--查看表空间文件
SELECT file_name,
      tablespace_name,
      bytes / 1024 / 1024    "bytes MB",
      maxbytes / 1024 / 1024 "maxbytes MB"
FROM  dba_data_files
WHERE  tablespace_name = 'USERS';
SELECT file_id,
      file_name,
      tablespace_name,
      autoextensible,
      increment_by
FROM  dba_data_files
WHERE  tablespace_name = 'USERS'
ORDER  BY file_id DESC;

ALTER SESSION SET SQL_TRACE=TRUE; --打开追踪
select * from v_log_search ;--要追踪的查询语句
ALTER SESSION SET SQL_TRACE =FALSE; --关闭追踪
SELECT T.VALUE || '/' || LOWER(RTRIM(I.INSTANCE, CHR(0))) || '_ora_' || 
P.SPID || '.trc' TRACE_FILE_NAME 
FROM 
( SELECT P.SPID 
FROM V$MYSTAT M, V$SESSION S, V$PROCESS P 
WHERE M.STATISTIC# =1 
AND S.SID = M.SID 
AND P.ADDR = S.PADDR 
) P, 
( SELECT T.INSTANCE 
FROM V$THREAD T, V$PARAMETER V 
WHERE V.NAME ='thread' 
AND (V.VALUE = 0 OR T.THREAD# = TO_NUMBER(V.VALUE)) 
) I, 
(SELECT VALUE FROM V$PARAMETER WHERE NAME='user_dump_dest') T ; --查看追踪生成的文件
--tkprof D:\ORACLE\PRODUCT\10.2.0\ADMIN\IFLYTEKDB\UDUMP/XXXXdb_ora_5728.trc D:\out.txtoutputfile explain=etl/etl ;

--查看有哪些用户连接
SELECT s.Osuser Os_User_Name,Decode(Sign(48 - Command),1,To_Char(Command),
'Action Code #' || To_Char(Command)) Action,
p.Program Oracle_Process, Status Session_Status, s.Terminal Terminal,
s.Program Program, s.Username User_Name,
s.Fixed_Table_Sequence Activity_Meter, '' Query, 0 Memory,
0 Max_Memory, 0 Cpu_Usage, s.Sid, s.Serial# Serial_Num
FROM V$session s, V$process p
WHERE s.Paddr = p.Addr
AND s.TYPE = 'USER';

--查看数据库当前的游标数配置
--show parameter open_cursors;
--查看游标使用情况：
select * from v$open_cursor c where c.USER_NAME='GXPTZHK_DB';

select o.sid, osuser, machine, count(*) num_curs
from v$open_cursor o, v$session s
where user_name = 'KETTLE' and 
o.sid=s.sid
group by o.sid, osuser, machine
order by  machine desc;
--根据游标占用情况分析访问数据库的程序在资源释放上是否正常,如果程序释放资源没有问题，则加大游标数。
alter system set open_cursors=2000 scope=both;
--补充:在java代码中,执行conn.createStatement()和conn.prepareStatement()的时候，实际上都是相当与在数据库中打开了一个cursor。尤其是，
--如果你的createStatement和prepareStatement是在一个循环里面的话，就会非常容易出现这个问题。因为游标一直在不停的打开，而且没有关闭。
-- 一般来说，我们在写Java代码的时候，createStatement和prepareStatement都应该要放在循环外面，而且使用了这些Statment后，及时关闭。
--最好是在执行了一次executeQuery、executeUpdate等之后，如果不需要使用结果集（ResultSet）的数据，就马上将Statment关闭，调用close()方法。

--查询索引
select t.last_analyzed from DBA_INDEXES t where index_name='PK_AJBH';
--查询表
select * from DBA_TABLES where　table_name='T_XJZD_XSAJ_YW_XSAJXX';
--分析表
analyze table t_xjzd_xsaj_yw_xsajxx compute statistics;
--分析索引
analyze index PK_AJBH compute statistics;
--查询被谁锁住了对象
select * from v$locked_object l inner join dba_objects o on l.OBJECT_ID=o.OBJECT_ID
inner join v$session s on s.SID=l.SESSION_ID ;
--查询正在执行的sql
select * from v$sqlarea sql 
left join v$session se on sql.HASH_VALUE=se.SQL_HASH_VALUE;
--查询指定用户的连接数
  select  sid,serial# from v$session where username='XXXX';
--释放锁 s.SID,s.SERIAL#
alter system kill session '128,13534';
--对象搜索
select * from dba_objects t where t.OBJECT_NAME like '%SJZX_ZSJ_ZSJXX%';
--索引搜索
select * from dba_indexes t where t.owner='GXPT_WEB' and t.table_name='TEST1'
--搜索某个表的索引
select t.table_owner,t.table_name,t.index_name,c.COLUMN_NAME from user_indexes t inner join user_ind_columns c 
on t.index_name=c.INDEX_NAME and t.table_name=c.TABLE_NAME where t.table_owner='GXPT_WEB' and t.table_name='T_DSP_JOB'

--创建函数Function，获取表数据量
CREATE OR REPLACE Function F_TABLE_COUNT(p_table_name in varchar2)
  Return number Is
  PRAGMA AUTONOMOUS_TRANSACTION;
  v_count number;
  v_sql varchar2(2000);
  exception_status varchar2(2000);
begin
  v_sql := 'select count(1)  from '||p_table_name;
  execute immediate v_sql into v_count;
  dbms_output.put_line(p_table_name||':'||v_count);
  return v_count;
exception
  when others then
    exception_status:=to_char(sqlcode)||':'||substr(sqlerrm,1,980);
    dbms_output.put_line(exception_status);
    return 0;
end;
--创建存储过程
create or replace procedure proc_zyml_table_count AS
   TYPE TYPE_CUR IS REF CURSOR;
   cur_cur TYPE_CUR;
   edinfo t_mdm_edinfo%ROWTYPE;
   v_count number;
   exception_status varchar2(2000);
begin
  open cur_cur for  select * from t_mdm_edinfo;
   loop
      fetch cur_cur into edinfo;
      EXIT WHEN cur_cur%NOTFOUND;
      SELECT F_TABLE_COUNT(edinfo.ysid) into v_count FROM DUAL;
      update t_mdm_edinfo t set t.datacount =v_count where t.ysid =edinfo.ysid;
      commit;
   end loop;
   close cur_cur;
exception
  when others then
    exception_status:=to_char(sqlcode)||':'||substr(sqlerrm,1,980);
    dbms_output.put_line(exception_status);
end ;

--创建日志表
create table T_PROC_LOG
(
  IIDD        VARCHAR2(32) default sys_guid() not null,
  LAST_UPDATE VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss'),
  MSG         VARCHAR2(4000),
  OWNER       VARCHAR2(100)
);
-- Add comments to the table 
comment on table T_PROC_LOG
  is '用于存储入存储过程等的错误日志';
-- Add comments to the columns 
comment on column T_PROC_LOG.IIDD
  is '主键';
comment on column T_PROC_LOG.LAST_UPDATE
  is '创建时间';
comment on column T_PROC_LOG.MSG
  is '错误内容';
comment on column T_PROC_LOG.OWNER
  is '属于哪个';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_PROC_LOG
  add constraint PK_PROC_LOG primary key (IIDD);

--写日志的存储过程
create or replace procedure PROC_WRITE_LOG(P_OWNER in varchar2,MSG in varchar2) as
  exception_status varchar2(2000);
begin
   insert into T_PROC_LOG(OWNER, MSG) values (P_OWNER,MSG);
   commit;
exception
  when others then
    exception_status:=to_char(sqlcode)||':'||substr(sqlerrm,1,980);
    dbms_output.put_line(exception_status);
end;

--MD5函数
CREATE OR REPLACE FUNCTION MD5(in_str IN VARCHAR2)
RETURN VARCHAR2
IS
retval varchar2(32);
BEGIN
retval := utl_raw.cast_to_raw(DBMS_OBFUSCATION_TOOLKIT.MD5(INPUT_STRING => in_str));
--dbms_output.put_line('<'||in_str||'>的MD5:'||retval);
RETURN retval;
END;

--des加密
create or replace function
encrypt_des(p_text varchar2, p_key varchar2) return varchar2 is
v_text varchar2(4000);
v_enc varchar2(4000);
raw_input RAW(128) ;
key_input RAW(128) ;
decrypted_raw RAW(2048);
begin
v_text := rpad( p_text, (trunc(length(p_text)/8)+1)*8, chr(0));
raw_input := UTL_RAW.CAST_TO_RAW(v_text);
key_input := UTL_RAW.CAST_TO_RAW(p_key);
dbms_obfuscation_toolkit.DESEncrypt(input => raw_input,key => key_input,encrypted_data =>decrypted_raw);
v_enc := rawtohex(decrypted_raw);
dbms_output.put_line(v_enc);
return v_enc;
end;
select encrypt_des('123', '123asdzxc') from dual;

--des解密
create or replace function decrypt_des(p_text varchar2,p_key varchar2) return varchar2 is
v_text varchar2(2000); 
begin
dbms_obfuscation_toolkit.DESDECRYPT(input_string => UTL_RAW.CAST_TO_varchar2(p_text),key_string =>p_key, decrypted_string=> v_text);
v_text := rtrim(v_text,chr(0));
dbms_output.put_line(v_text);
return v_text;
end;
select decrypt_des('1EA2AEABE55AB2A2', '123asdzxc') from dual;

--long转varchar
CREATE OR REPLACE FUNCTION LONG_TO_CHAR( in_rowid rowid,in_owner
varchar,in_table_name varchar,in_column varchar2)
RETURN varchar AS
text_c1 varchar2(32767);
sql_cur varchar2(2000);
--set serveroutput on size 10000000000;
--
begin
DBMS_OUTPUT.ENABLE (buffer_size=>null);
sql_cur := 'select '||in_column||' from
'||in_owner||'.'||in_table_name||' where rowid =
'||chr(39)||in_rowid||chr(39);
dbms_output.put_line (sql_cur);
execute immediate sql_cur into text_c1;

text_c1 := substr(text_c1, 1, 4000);
RETURN TEXT_C1;
END;

--删除重复数据
delete from tablename t 
where t.rowid<>(select max(rowid) from tablename t2 where t.md5=t2.md5)

--查询删除的表
select * from recyclebin;
--查数据库scn号
select dbms_flashback.get_system_change_number from dual;
--恢复表
flashback table ma to before drop;
--获取视图
select u.name username,o.name viewname,v.text from test.obj$ o,test.view$ v, test.user$ u
where o.obj#=v.obj#
and o.owner#=u.user#
and u.name='UAAC'
;

--数据还原，会还原整张表
alter table sys_sjgl_sjdx enable row movement;
SELECT * FROM sys_sjgl_sjdx AS OF TIMESTAMP TO_TIMESTAMP('20190415100000','YYYYMMDDHH24MISS');
--flashback table sys_sjgl_sjdx to timestamp to_timestamp('20190408190000','YYYYMMDDHH24MISS');

--drop删表恢复
--查询出删除记录
select * from recyclebin t ;
--恢复表
flashback table SYS_SJGL_SJK TO before drop rename to SYS_SJGL_SJK_old;

--oracle中编译java代码
create or replace and compile java source named desutil as
import java.io.IOException;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class Desutil {

    private final static String DES = "DES";

    /**
     * Description 根据键值进行加密
     *
     * @param data
     * @param key
     *            加密键byte数组
     * @return
     * @throws Exception
     */
    public static String encrypt(String data, String key) {
        byte[] bt = null;
        try {
            bt = encrypt(data.getBytes("utf-8"), key.getBytes());
        } catch (Exception e) {
            e.printStackTrace();
        }
        String strs = new BASE64Encoder().encode(bt);
        return strs;
    }

    /**
     * Description 根据键值进行解密
     *
     * @param data
     * @param key
     *            加密键byte数组
     * @return
     * @throws IOException
     * @throws Exception
     */
    public static String decrypt(String data, String key) throws IOException,
            Exception {
        if (data == null)
            return null;
        BASE64Decoder decoder = new BASE64Decoder();
        byte[] buf = decoder.decodeBuffer(data);
        byte[] bt = decrypt(buf, key.getBytes());
        return new String(bt, "utf-8");
    }

    /**
     * Description 根据键值进行加密
     *
     * @param data
     * @param key
     *            加密键byte数组
     * @return
     * @throws Exception
     */
    private static byte[] encrypt(byte[] data, byte[] key) throws Exception {
        // 生成一个可信任的随机数源
        SecureRandom sr = new SecureRandom();

        // 从原始密钥数据创建DESKeySpec对象
        DESKeySpec dks = new DESKeySpec(key);

        // 创建一个密钥工厂，然后用它把DESKeySpec转换成SecretKey对象
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(DES);
        SecretKey securekey = keyFactory.generateSecret(dks);

        // Cipher对象实际完成加密操作
        Cipher cipher = Cipher.getInstance(DES);

        // 用密钥初始化Cipher对象
        cipher.init(Cipher.ENCRYPT_MODE, securekey, sr);

        return cipher.doFinal(data);
    }

    /**
     * Description 根据键值进行解密
     *
     * @param data
     * @param key
     *            加密键byte数组
     * @return
     * @throws Exception
     */
    private static byte[] decrypt(byte[] data, byte[] key) throws Exception {
        // 生成一个可信任的随机数源
        SecureRandom sr = new SecureRandom();

        // 从原始密钥数据创建DESKeySpec对象
        DESKeySpec dks = new DESKeySpec(key);

        // 创建一个密钥工厂，然后用它把DESKeySpec转换成SecretKey对象
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(DES);
        SecretKey securekey = keyFactory.generateSecret(dks);

        // Cipher对象实际完成解密操作
        Cipher cipher = Cipher.getInstance(DES);

        // 用密钥初始化Cipher对象
        cipher.init(Cipher.DECRYPT_MODE, securekey, sr);

        return cipher.doFinal(data);
    }
}

CREATE OR REPLACE FUNCTION des_de (p_text IN STRING,p_pwd IN STRING)
   RETURN String
IS
   LANGUAGE JAVA
   NAME 'Desutil.decrypt(java.lang.String,java.lang.String) return String';










