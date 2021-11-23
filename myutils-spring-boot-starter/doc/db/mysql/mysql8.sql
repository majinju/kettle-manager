
CREATE TABLE JCGA_JCYG_JCXX (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  DW VARCHAR(128),
  DKWB VARCHAR(128) DEFAULT '0',
  DKWBDWMC VARCHAR(128),
  BM VARCHAR(128),
  CDYHBW VARCHAR(128) DEFAULT '0',
  GWGZ VARCHAR(128),
  GWJB VARCHAR(128),
  YGXM VARCHAR(128),
  XB VARCHAR(128),
  NL VARCHAR(128),
  CSRQ VARCHAR(128),
  ZJLX VARCHAR(128),
  GMSFHM VARCHAR(128),
  MZ VARCHAR(128),
  ZZMM VARCHAR(128),
  WHCD VARCHAR(128),
  JTDH VARCHAR(128),
  BGDH VARCHAR(128),
  SJ VARCHAR(128),
  JG VARCHAR(128),
  HJDZ VARCHAR(128),
  XZDZ VARCHAR(128),
  ZW VARCHAR(128),
  YGXZ VARCHAR(128),
  DBDWSJ VARCHAR(128),
  JSZC VARCHAR(128),
  ZYXKZMC VARCHAR(128),
  ZYXKZBH VARCHAR(128),
  QTTC VARCHAR(128),
  KZQTXZ VARCHAR(128) DEFAULT '0',
  KZQTXZLX VARCHAR(128),
  YGBH VARCHAR(128),
  QQ VARCHAR(128),
  MSN VARCHAR(128),
  KSCJ VARCHAR(128),
  SBGLQTXZ VARCHAR(128) DEFAULT '0',
  GLQTXZLX VARCHAR(128),
  GLQTXZYXQ VARCHAR(128),
  LZSJ VARCHAR(128),
  LZYY VARCHAR(1024),
  ZZZT VARCHAR(128) DEFAULT '1',
  JNHBLJ VARCHAR(128),
  JNHBLJRYHQZRYJC VARCHAR(128),
  JQFRZZ VARCHAR(128),
  JQSFJJHGL VARCHAR(128),
  ZXYQFKZS VARCHAR(128),
  JSDYWQZ VARCHAR(128),
  RCJSCL VARCHAR(128),
  SFTZ VARCHAR(128),
  SJLY VARCHAR(128) DEFAULT 'JCGA_JCYG_JCXX'
)
;

-- ----------------------------
-- Table structure for JCGA_JCYG_SHGX
-- ----------------------------

CREATE TABLE JCGA_JCYG_SHGX (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  SHGX VARCHAR(32),
  XM VARCHAR(32),
  XB VARCHAR(32),
  ZJLX VARCHAR(32),
  ZJHM VARCHAR(32),
  XZDZ VARCHAR(128),
  LXDH VARCHAR(32),
  YGBH VARCHAR(128),
  BJHC VARCHAR(8) DEFAULT '1',
  HJDZ VARCHAR(128),
  BZ VARCHAR(1280),
  SFTZ VARCHAR(128)
)
;

-- ----------------------------
-- Table structure for QT_DCXT_CZ
-- ----------------------------

CREATE TABLE QT_DCXT_CZ (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  CZMC VARCHAR(256),
  KRRY bigint,
  JTWZ VARCHAR(256),
  SSDP VARCHAR(32)
)
;

-- ----------------------------
-- Table structure for QT_DCXT_DPGL
-- ----------------------------

CREATE TABLE QT_DCXT_DPGL (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  DPMC VARCHAR(256),
  DPWZ VARCHAR(256),
  DPMS VARCHAR(4000)
)
;

-- ----------------------------
-- Table structure for QT_GJZQ_ZHMX
-- ----------------------------

CREATE TABLE QT_GJZQ_ZHMX (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  YH VARCHAR(32),
  RQ VARCHAR(32),
  BZ VARCHAR(32),
  GDZH VARCHAR(32),
  ZQDM VARCHAR(32),
  ZQMC VARCHAR(256),
  YWBZ VARCHAR(32),
  FSSL VARCHAR(32),
  CJJJ VARCHAR(32),
  YJ VARCHAR(32),
  YHS VARCHAR(32),
  QTF VARCHAR(32),
  SFJE VARCHAR(32),
  ZJYE VARCHAR(32),
  BZXX VARCHAR(2048)
)
;

-- ----------------------------
-- Table structure for SHRMYY_HLB_GPHSZS
-- ----------------------------

CREATE TABLE SHRMYY_HLB_GPHSZS (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  XH VARCHAR(256),
  TJDJSJ VARCHAR(256),
  SYSJ VARCHAR(256),
  LY VARCHAR(256),
  LYXQ VARCHAR(256),
  LZIP VARCHAR(256),
  XM VARCHAR(256),
  XB VARCHAR(256),
  ZJHM VARCHAR(256),
  MZ VARCHAR(256),
  JG VARCHAR(256),
  JTZZ VARCHAR(256),
  ZZMM VARCHAR(256),
  HYZK VARCHAR(256),
  SG VARCHAR(256),
  DYXL VARCHAR(256),
  DYXLXX VARCHAR(256),
  ZGXL VARCHAR(256),
  ZGXLXX VARCHAR(256),
  YJBYS VARCHAR(256),
  DYXLBYSJ VARCHAR(256),
  LXDH1 VARCHAR(256),
  LXDH2 VARCHAR(256),
  BQ VARCHAR(256)
)
;

-- ----------------------------
-- Table structure for SHRMYY_HLB_HSRYXX
-- ----------------------------

CREATE TABLE SHRMYY_HLB_HSRYXX (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  KS VARCHAR(256),
  BH VARCHAR(256),
  XM VARCHAR(256),
  XB VARCHAR(256),
  GZSJ VARCHAR(256),
  XL VARCHAR(256),
  BZ VARCHAR(256),
  DZ VARCHAR(256),
  BYXX VARCHAR(256),
  CJ VARCHAR(256),
  ZC VARCHAR(256),
  NL VARCHAR(256),
  ZJHM VARCHAR(256),
  ZYZSH VARCHAR(256),
  LXDH VARCHAR(256),
  YX VARCHAR(256),
  GZNX VARCHAR(256)
)
;

-- ----------------------------
-- Table structure for SHRMYY_HLB_ZLJCJL
-- ----------------------------

CREATE TABLE SHRMYY_HLB_ZLJCJL (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  KS VARCHAR(32),
  XM VARCHAR(32),
  DH VARCHAR(32),
  DF bigint
)
;

-- ----------------------------
-- Table structure for SHRMYY_HLB_ZLJCX
-- ----------------------------

CREATE TABLE SHRMYY_HLB_ZLJCX (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  SSJL VARCHAR(32),
  SSZB VARCHAR(32),
  SFDB VARCHAR(8),
  QKSM VARCHAR(512)
)
;

-- ----------------------------
-- Table structure for SHRMYY_HLB_ZLJCZB
-- ----------------------------

CREATE TABLE SHRMYY_HLB_ZLJCZB (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  ZBLB VARCHAR(256),
  SSDL VARCHAR(256),
  SSXL VARCHAR(256),
  ZBMC VARCHAR(256),
  ZBMS VARCHAR(1024)
)
;

-- ----------------------------
-- Table structure for SHRMYY_JCXX_KSXX
-- ----------------------------

CREATE TABLE SHRMYY_JCXX_KSXX (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  DM VARCHAR(256),
  MC VARCHAR(256),
  FL VARCHAR(256),
  FZR VARCHAR(256)
)
;

-- ----------------------------
-- Table structure for SYS_BDHC_FK
-- ----------------------------

CREATE TABLE SYS_BDHC_FK (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  CJRLXFS VARCHAR(256),
  HCJG VARCHAR(32),
  MBFXZT VARCHAR(8),
  FXMBHDLB VARCHAR(8),
  HDFXSJ VARCHAR(14),
  HDFXDDQH VARCHAR(8),
  HDFXDDXZ VARCHAR(512),
  HDFXDDSSSHCS VARCHAR(128),
  HDFXDDSSSHCSDM VARCHAR(64),
  FXHDXGXX text,
  FXMBZRMJSFZH VARCHAR(32),
  FXMBZRMJXM VARCHAR(32),
  FXMBZRDW VARCHAR(128),
  FXMBZRDWJGDM VARCHAR(32),
  CQCZCS VARCHAR(200),
  CZSJ VARCHAR(14),
  CZDDQH VARCHAR(6),
  CZDDXZ VARCHAR(500),
  CZZRMJSFZH VARCHAR(18),
  CZZRMJXM VARCHAR(30),
  CZZRDW VARCHAR(70),
  CZZRDWJGDM VARCHAR(12),
  CZJGMS VARCHAR(400),
  CZJG VARCHAR(2),
  CZCS VARCHAR(2),
  BKJG VARCHAR(32)
)
;

-- ----------------------------
-- Table structure for SYS_BDHC_GZ
-- ----------------------------

CREATE TABLE SYS_BDHC_GZ (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  MC VARCHAR(256),
  MS VARCHAR(256),
  DJ VARCHAR(256),
  SSRW VARCHAR(32),
  SSXM VARCHAR(256),
  ZYLB VARCHAR(32),
  HCFS VARCHAR(32),
  SCMB VARCHAR(256),
  SFSC VARCHAR(32)
)
;

-- ----------------------------
-- Table structure for SYS_BDHC_GZZD
-- ----------------------------

CREATE TABLE SYS_BDHC_GZZD (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  GZ VARCHAR(32),
  SJZD VARCHAR(32),
  HDYZGZ VARCHAR(256),
  HDZHGZ VARCHAR(256),
  MS VARCHAR(512)
)
;

-- ----------------------------
-- Table structure for SYS_BDHC_HM
-- ----------------------------

CREATE TABLE SYS_BDHC_HM (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  MC VARCHAR(256),
  MS VARCHAR(256),
  LB VARCHAR(32),
  SSRW VARCHAR(32),
  SSXM VARCHAR(256),
  HCZJLX VARCHAR(256),
  HCZJHM VARCHAR(256),
  QCBZ VARCHAR(256) DEFAULT (REPLACE(UUID(),'-','')),
  ZZJLX VARCHAR(256),
  ZZJHM VARCHAR(256),
  KSSJ VARCHAR(32),
  JSSJ VARCHAR(32),
  BZ text,
  HMYKZJ VARCHAR(32),
  FLAG01 VARCHAR(256),
  FLAG02 VARCHAR(256),
  FLAG03 VARCHAR(256),
  FLAG04 VARCHAR(256),
  FLAG05 VARCHAR(256),
  FLAG06 VARCHAR(256),
  FLAG07 VARCHAR(256),
  FLAG08 VARCHAR(256),
  FLAG09 VARCHAR(256),
  FLAG10 VARCHAR(256),
  GKDW VARCHAR(32)
)
;

-- ----------------------------
-- Table structure for SYS_BDHC_JG
-- ----------------------------

CREATE TABLE SYS_BDHC_JG (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  ZYLB VARCHAR(32),
  QCZD text,
  HCZJLX VARCHAR(256),
  HCZJHM VARCHAR(256),
  ZZJLX VARCHAR(256),
  ZZJHM VARCHAR(256),
  HCHM VARCHAR(32),
  HMYKZJ VARCHAR(32),
  ZYYKZJ VARCHAR(256),
  RYKSJ VARCHAR(256),
  HCFS VARCHAR(32),
  JD VARCHAR(256),
  WD VARCHAR(256),
  SFDMC VARCHAR(256),
  SFDDM VARCHAR(64),
  MDDMC VARCHAR(256),
  MDDDM VARCHAR(64),
  HDFSSJ VARCHAR(14),
  HDFSDDQH VARCHAR(32),
  HDFSDDXZ VARCHAR(256),
  HDFSDDSSSHCS VARCHAR(128),
  HDFSDDSSSHCSDM VARCHAR(32),
  HDFSDDSSGAJG VARCHAR(128),
  HDFSDDSSGAJGJGDM VARCHAR(32),
  DJZJLX VARCHAR(8),
  DJZJHM VARCHAR(64),
  DJXM VARCHAR(64),
  DJWWXM VARCHAR(80),
  DJXB VARCHAR(8),
  DJCSRQ VARCHAR(256),
  HDXGXX text,
  DTXXTGDW VARCHAR(128),
  DTXXTGDWJGDM VARCHAR(32),
  FLAG01 text,
  FLAG02 text,
  FLAG03 text,
  FLAG04 text,
  FLAG05 text,
  FLAG06 text,
  FLAG07 text,
  FLAG08 text,
  FLAG09 text,
  FLAG10 text,
  FLAG11 text,
  FLAG12 text,
  FLAG13 text,
  FLAG14 text,
  FLAG15 text,
  FLAG16 text,
  FLAG17 text,
  FLAG18 text,
  FLAG19 text,
  FLAG20 text,
  FLAG21 text,
  FLAG22 text,
  FLAG23 text,
  FLAG24 text,
  FLAG25 text,
  FLAG26 text,
  FLAG27 text,
  FLAG28 text,
  FLAG29 text,
  FLAG30 text,
  FLAG31 text,
  FLAG32 text,
  FLAG33 text,
  FLAG34 text,
  FLAG35 text,
  FLAG36 text,
  FLAG37 text,
  FLAG38 text,
  FLAG39 text,
  FLAG40 text,
  HDXGWJ longblob,
  PPGZ VARCHAR(1024),
  QSRXM VARCHAR(64),
  QSRDM VARCHAR(32),
  QSRDWMC VARCHAR(256),
  QSRDWDM VARCHAR(32),
  QSSJ VARCHAR(14),
  ZLZT VARCHAR(8) DEFAULT '0'
)
;

-- ----------------------------
-- Table structure for SYS_BDHC_RW
-- ----------------------------

CREATE TABLE SYS_BDHC_RW (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  CJRLXFS VARCHAR(256),
  SQSJ VARCHAR(32),
  MC VARCHAR(256),
  MS VARCHAR(256),
  SSXM VARCHAR(256),
  SY text,
  BDZY text,
  PCZY text,
  FHZY text,
  JCZY VARCHAR(32) DEFAULT '1',
  BZ text,
  SHRXM VARCHAR(256),
  SHRZJHM VARCHAR(256),
  SHDW VARCHAR(256),
  SHSJ VARCHAR(32),
  SJWJ VARCHAR(256),
  SHZT VARCHAR(32) DEFAULT 0,
  SHDJ VARCHAR(32) DEFAULT '01',
  SHYJ text,
  KSSJ VARCHAR(32) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  JSSJ VARCHAR(32)
)
;

-- ----------------------------
-- Table structure for SYS_BDHC_XM
-- ----------------------------

CREATE TABLE SYS_BDHC_XM (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  MC VARCHAR(256),
  MS VARCHAR(256),
  LB VARCHAR(256),
  DJ VARCHAR(32) DEFAULT '06',
  BDZY text,
  PCZY text,
  ZL VARCHAR(32),
  QL VARCHAR(32),
  SSDW VARCHAR(256),
  SCMB VARCHAR(256),
  BZ VARCHAR(4000)
)
;

-- ----------------------------
-- Table structure for SYS_BDHC_ZY
-- ----------------------------

CREATE TABLE SYS_BDHC_ZY (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  MC VARCHAR(256),
  MS VARCHAR(256),
  DL VARCHAR(32),
  XL VARCHAR(256),
  DM VARCHAR(32),
  DJ VARCHAR(32) DEFAULT '06',
  SJDX VARCHAR(32),
  SJZT VARCHAR(32),
  BZ text,
  GXPL VARCHAR(256),
  HCYJ text,
  SJZY VARCHAR(256),
  XIAOLV VARCHAR(256),
  SJL bigint,
  QYHC VARCHAR(8) DEFAULT '0'
)
;

-- ----------------------------
-- Table structure for SYS_LOG_FWZR
-- ----------------------------

CREATE TABLE SYS_LOG_FWZR (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  SJDX VARCHAR(32),
  CZIP VARCHAR(64),
  CZLX VARCHAR(32),
  URL text,
  XGCS text,
  TOKEN VARCHAR(32),
  SJJL VARCHAR(256),
  FHNR text,
  QQHS bigint
)
;

-- ----------------------------
-- Table structure for SYS_LOG_HTRZ
-- ----------------------------

CREATE TABLE SYS_LOG_HTRZ (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  XC VARCHAR(512),
  JB VARCHAR(512),
  SCL VARCHAR(512),
  SCH VARCHAR(8),
  XX text,
  SSXM VARCHAR(512)
)
;

-- ----------------------------
-- Table structure for SYS_LOG_SJSCCW
-- ----------------------------

CREATE TABLE SYS_LOG_SJSCCW (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  SJDX VARCHAR(32),
  SJWJ VARCHAR(32),
  SJH VARCHAR(32),
  SJL VARCHAR(32),
  SJLM VARCHAR(128),
  SJZ VARCHAR(1024),
  CWXX VARCHAR(1024)
)
;

-- ----------------------------
-- Table structure for SYS_QX_APP
-- ----------------------------

CREATE TABLE SYS_QX_APP (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  DM VARCHAR(32),
  MC VARCHAR(128),
  MS text,
  JP VARCHAR(512),
  QP VARCHAR(512),
  SJY VARCHAR(512),
  LB VARCHAR(512),
  BB VARCHAR(32),
  DZ VARCHAR(512),
  ZT VARCHAR(32),
  MM VARCHAR(256),
  ZDDLMS VARCHAR(32),
  JCGJZ VARCHAR(32),
  FWDK VARCHAR(32),
  TZDK VARCHAR(32),
  FWQ VARCHAR(512)
)
;

-- ----------------------------
-- Table structure for SYS_QX_FWQ
-- ----------------------------

CREATE TABLE SYS_QX_FWQ (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  IP VARCHAR(32),
  MS VARCHAR(1024),
  LB VARCHAR(32),
  MC VARCHAR(32),
  LX VARCHAR(32),
  MM VARCHAR(256),
  FZR VARCHAR(1024),
  ZT VARCHAR(32)
)
;

-- ----------------------------
-- Table structure for SYS_QX_JGXX
-- ----------------------------

CREATE TABLE SYS_QX_JGXX (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  JGDM VARCHAR(32),
  JGMC VARCHAR(256),
  MCJP VARCHAR(1024),
  JGBM VARCHAR(256),
  JGJC VARCHAR(256),
  JCJP VARCHAR(128),
  JGLX VARCHAR(3),
  SJJG VARCHAR(32),
  JGCJ bigint,
  LXR VARCHAR(128),
  LXRDH VARCHAR(128),
  JGYX VARCHAR(32),
  JGDZ VARCHAR(256),
  JGMS VARCHAR(512),
  BZ VARCHAR(512)
)
;

-- ----------------------------
-- Table structure for SYS_QX_JSQXGL
-- ----------------------------

CREATE TABLE SYS_QX_JSQXGL (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  JS VARCHAR(32),
  QX VARCHAR(256),
  BZ VARCHAR(256)
)
;

-- ----------------------------
-- Table structure for SYS_QX_JSXX
-- ----------------------------

CREATE TABLE SYS_QX_JSXX (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  MC VARCHAR(32) NOT NULL,
  DM VARCHAR(32) NOT NULL,
  MS VARCHAR(256),
  JSLX VARCHAR(32),
  SSYY VARCHAR(256),
  BZ VARCHAR(1024),
  FJS VARCHAR(1024),
  JSDJ VARCHAR(32)
)
;

-- ----------------------------
-- Table structure for SYS_QX_QXXX
-- ----------------------------

CREATE TABLE SYS_QX_QXXX (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  MC VARCHAR(256) NOT NULL,
  DM VARCHAR(256) NOT NULL,
  MS VARCHAR(256),
  LX VARCHAR(32),
  SSYY VARCHAR(256),
  BZ VARCHAR(1024),
  FQX VARCHAR(256),
  DZLX VARCHAR(32),
  DKFS VARCHAR(32),
  DZ VARCHAR(256),
  TB VARCHAR(32),
  MCJP VARCHAR(256),
  MCQP VARCHAR(1024),
  ZCSJD VARCHAR(8) DEFAULT '0'
)
;

-- ----------------------------
-- Table structure for SYS_QX_YHJSGL
-- ----------------------------

CREATE TABLE SYS_QX_YHJSGL (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  YH VARCHAR(32),
  JS VARCHAR(32),
  BZ VARCHAR(256),
  SHZT VARCHAR(32) DEFAULT 0,
  SHDJ VARCHAR(32) DEFAULT '01'
)
;

-- ----------------------------
-- Table structure for SYS_QX_YHXX
-- ----------------------------

CREATE TABLE SYS_QX_YHXX (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(32) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  YHXM VARCHAR(32) NOT NULL,
  YHDM VARCHAR(32),
  YHMM VARCHAR(256),
  SFZH VARCHAR(18),
  YXQKS VARCHAR(64),
  YXQJS VARCHAR(64),
  SSJG VARCHAR(32) DEFAULT '141B1AFC7E634176BDA7DB7F491A9004',
  THLX VARCHAR(32),
  YHDJ VARCHAR(32) DEFAULT '06',
  YHMS VARCHAR(1024),
  YHYX VARCHAR(128),
  LXDH VARCHAR(256),
  LXDZ VARCHAR(256),
  MZ VARCHAR(32),
  GJ VARCHAR(32),
  XL VARCHAR(32),
  ZZMM VARCHAR(32),
  ZW VARCHAR(32),
  ZJ VARCHAR(32),
  BZ VARCHAR(1024),
  TX VARCHAR(32),
  XZIP VARCHAR(1024),
  SHZT VARCHAR(32) DEFAULT '2',
  SHDJ VARCHAR(32) DEFAULT '01',
  WXYHID VARCHAR(32),
  WXYHXX VARCHAR(1024)
)
;

-- ----------------------------
-- Table structure for SYS_SJGL_BHSC
-- ----------------------------

CREATE TABLE SYS_SJGL_BHSC (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  BHLB VARCHAR(32),
  DQZ bigint DEFAULT 1,
  DZL bigint DEFAULT 1,
  CSZ bigint DEFAULT 1,
  ZDZ bigint DEFAULT 99999999,
  DQZQ VARCHAR(32),
  CZZQ VARCHAR(32),
  MC VARCHAR(256),
  MS VARCHAR(256)
)
;

-- ----------------------------
-- Table structure for SYS_SJGL_BLOB
-- ----------------------------

CREATE TABLE SYS_SJGL_BLOB (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  NR longblob
)
;

-- ----------------------------
-- Table structure for SYS_SJGL_DZD
-- ----------------------------

CREATE TABLE SYS_SJGL_DZD (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  DM VARCHAR(100),
  MC text,
  MS text,
  JP text,
  QP text,
  ZDLB VARCHAR(100),
  BZZD VARCHAR(100),
  SJLY VARCHAR(300),
  UPNODE VARCHAR(100),
  SJDJ VARCHAR(10) DEFAULT '3'
)
;

-- ----------------------------
-- Table structure for SYS_SJGL_FILE
-- ----------------------------

CREATE TABLE SYS_SJGL_FILE (
  ID VARCHAR(256) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  YWDM VARCHAR(100),
  GLID VARCHAR(32),
  WJM VARCHAR(500),
  QCM VARCHAR(100),
  SJZT VARCHAR(10),
  SCLJ VARCHAR(1000),
  WJLX VARCHAR(10),
  WJLB VARCHAR(100),
  SJDJ VARCHAR(10) DEFAULT '2',
  WJDX bigint
)
;

-- ----------------------------
-- Table structure for SYS_SJGL_GRBJ
-- ----------------------------

CREATE TABLE SYS_SJGL_GRBJ (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  BT VARCHAR(256),
  LB VARCHAR(256) DEFAULT '99',
  BQ VARCHAR(256),
  LX VARCHAR(256) DEFAULT '02',
  KJX VARCHAR(256) DEFAULT '01',
  ZT VARCHAR(256) DEFAULT '01',
  NR text,
  JP VARCHAR(256),
  QP VARCHAR(1024),
  YDCS bigint DEFAULT 0,
  FJ VARCHAR(1024),
  SJBJ VARCHAR(256) DEFAULT NULL,
  TB VARCHAR(32)
)
;

-- ----------------------------
-- Table structure for SYS_SJGL_SJDX
-- ----------------------------

CREATE TABLE SYS_SJGL_SJDX (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  DXDM VARCHAR(256),
  DXMC VARCHAR(256),
  DXMS text,
  DXJP VARCHAR(512),
  DXQP VARCHAR(512),
  DXLB VARCHAR(512),
  DXLX VARCHAR(32),
  DXZY VARCHAR(512),
  DXZTLX VARCHAR(32),
  DXZT VARCHAR(32) DEFAULT 'default',
  DXGS VARCHAR(512),
  JTDX VARCHAR(64),
  ZJZD VARCHAR(32),
  QXZD VARCHAR(32),
  ZLZD VARCHAR(32),
  QCZD VARCHAR(32),
  JYZD VARCHAR(32),
  PCZD VARCHAR(32),
  YXXZD VARCHAR(32),
  FYTJXS VARCHAR(32) DEFAULT '1',
  MRPX VARCHAR(256),
  CSCX VARCHAR(32) DEFAULT '1',
  XQAN VARCHAR(8) DEFAULT '1',
  CXTJ VARCHAR(8) DEFAULT '1',
  SXXZ VARCHAR(8) DEFAULT '1',
  LBFXK VARCHAR(8) DEFAULT '0',
  BJXH VARCHAR(8) DEFAULT '1',
  LJQ VARCHAR(512) DEFAULT '',
  ZDDRSQL text,
  SQLMB text,
  CXLBKZ text,
  BJYMKZ text,
  PLYMKZ text,
  ZYDJ VARCHAR(8) DEFAULT '06'
)
;

-- ----------------------------
-- Table structure for SYS_SJGL_SJZD
-- ----------------------------

CREATE TABLE SYS_SJGL_SJZD (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  SJDX VARCHAR(32),
  ZDDM VARCHAR(32),
  ZDMC VARCHAR(512),
  ZDMS VARCHAR(1024),
  ZDJP VARCHAR(256),
  ZDQP VARCHAR(1024),
  ZDLX VARCHAR(32),
  ZDCD bigint,
  ZDKD bigint DEFAULT 80,
  ZDGD bigint,
  CXMRZ VARCHAR(256),
  XZMRZ VARCHAR(1024),
  KJLX VARCHAR(32) DEFAULT 'input',
  ZDDX VARCHAR(32) DEFAULT '0',
  ZDFY VARCHAR(32) DEFAULT '0',
  YXPX VARCHAR(8) DEFAULT '0',
  LBZS VARCHAR(8) DEFAULT '0',
  CXZS VARCHAR(8) DEFAULT '0',
  XZZS VARCHAR(8) DEFAULT '1',
  BJZS VARCHAR(8) DEFAULT '1',
  XQZS VARCHAR(8) DEFAULT '1',
  CXBT VARCHAR(8) DEFAULT '0',
  BJBT VARCHAR(8) DEFAULT '0',
  YXBJ VARCHAR(8) DEFAULT '1',
  ZDZDLB VARCHAR(32),
  ZDYWLB VARCHAR(32),
  GSHFF VARCHAR(64),
  FGSHFF VARCHAR(64),
  SZHD VARCHAR(64),
  ZDTS text,
  HDYZGZ VARCHAR(256),
  QDYZGZ VARCHAR(256),
  STYLE VARCHAR(256),
  CSSL VARCHAR(128),
  QCBH bigint,
  BZZD VARCHAR(32),
  MBZS VARCHAR(8) DEFAULT '1',
  HDZHGZ VARCHAR(256),
  CXMS VARCHAR(8) DEFAULT '1',
  ZYDJ VARCHAR(8) DEFAULT '06'
)
;

-- ----------------------------
-- Table structure for SYS_SJGL_SJZT
-- ----------------------------

CREATE TABLE SYS_SJGL_SJZT (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  DM VARCHAR(32),
  MC VARCHAR(128),
  MS text,
  JP VARCHAR(512),
  QP VARCHAR(512),
  LX VARCHAR(256),
  FWFS VARCHAR(256),
  JNDI VARCHAR(256),
  LJC VARCHAR(1024),
  YHM VARCHAR(256),
  MM VARCHAR(256),
  ZT VARCHAR(32) DEFAULT '0',
  CSYJ VARCHAR(256),
  SJKQD VARCHAR(256)
)
;

-- ----------------------------
-- Table structure for SYS_SJGL_TYZD
-- ----------------------------

CREATE TABLE SYS_SJGL_TYZD (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  DM VARCHAR(100),
  MC text,
  MS text,
  JP text,
  QP text,
  ZDLB VARCHAR(100),
  BZZD VARCHAR(100),
  LBSQL text,
  SJLY VARCHAR(300),
  UPNODE VARCHAR(100),
  CACHE VARCHAR(10) DEFAULT '1',
  SJDJ VARCHAR(10) DEFAULT '3'
)
;

-- ----------------------------
-- Table structure for SYS_SJGL_TYZD_DEMO
-- ----------------------------

CREATE TABLE SYS_SJGL_TYZD_DEMO (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  DM VARCHAR(100),
  MC text,
  MS text,
  JP text,
  QP text,
  ZDLB VARCHAR(100),
  BZZD VARCHAR(100),
  LBSQL text,
  SJLY VARCHAR(300),
  UPNODE VARCHAR(100),
  CACHE VARCHAR(10) DEFAULT '1',
  SJDJ VARCHAR(10) DEFAULT '3'
)
;

-- ----------------------------
-- Table structure for SYS_SJGL_XTCS
-- ----------------------------

CREATE TABLE SYS_SJGL_XTCS (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  DM VARCHAR(100),
  MC text,
  MRZ text,
  MS text,
  JP text,
  QP text,
  SJLY VARCHAR(300),
  UPNODE VARCHAR(100)
)
;

-- ----------------------------
-- Table structure for SYS_TEST_USER
-- ----------------------------

CREATE TABLE SYS_TEST_USER (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  YHXM VARCHAR(32) NOT NULL,
  YHDM VARCHAR(32) NOT NULL,
  YHMM VARCHAR(64),
  SFZH VARCHAR(18),
  YXQKS VARCHAR(64),
  YXQJS VARCHAR(64),
  SSJG VARCHAR(32),
  THLX VARCHAR(2),
  YHDJ VARCHAR(2),
  YHMS VARCHAR(1024),
  YHYX VARCHAR(32),
  LXDH VARCHAR(32),
  LXDZ VARCHAR(256),
  MZ VARCHAR(2),
  GJ VARCHAR(5),
  XL VARCHAR(2),
  ZZMM VARCHAR(2),
  ZW VARCHAR(2),
  ZJ VARCHAR(2),
  BZ VARCHAR(1024),
  TX VARCHAR(32),
  XZIP VARCHAR(1024)
)
;

-- ----------------------------
-- Table structure for SYS_YXJK_JKRW
-- ----------------------------

CREATE TABLE SYS_YXJK_JKRW (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  RWLX VARCHAR(32) NOT NULL,
  JTRW VARCHAR(32) NOT NULL,
  LXRXM VARCHAR(1024),
  LXRDM VARCHAR(1024),
  LXDWMC VARCHAR(256),
  LXDWDM VARCHAR(32),
  YLRW VARCHAR(512),
  RWZT VARCHAR(32) DEFAULT '0' NOT NULL,
  RWDJ VARCHAR(32) DEFAULT '1' NOT NULL,
  CLFK VARCHAR(1024),
  JCSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')) NOT NULL,
  XXMB VARCHAR(512),
  YCYY text,
  RWMC VARCHAR(256) NOT NULL,
  RWLB VARCHAR(32) DEFAULT '99',
  RWPCH VARCHAR(64),
  RWDM VARCHAR(64) NOT NULL,
  RWDS VARCHAR(64),
  YCLX VARCHAR(64)
)
;

-- ----------------------------
-- Table structure for SYS_YXJK_XX
-- ----------------------------

CREATE TABLE SYS_YXJK_XX (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  JKRW VARCHAR(32),
  XXLX VARCHAR(32),
  YCYY text,
  XXNR VARCHAR(1024),
  XXDJ VARCHAR(32),
  YCLX VARCHAR(64)
)
;

-- ----------------------------
-- Table structure for SYS_YXJK_ZDYSQL
-- ----------------------------

CREATE TABLE SYS_YXJK_ZDYSQL (
  ID VARCHAR(32) DEFAULT (REPLACE(UUID(),'-','')) NOT NULL,
  CJSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  GXSJ VARCHAR(14) DEFAULT (date_format(now(), '%Y%m%d%H%I%S')),
  YXX VARCHAR(8) DEFAULT '1',
  PX bigint DEFAULT 99999,
  KZXX VARCHAR(4000) DEFAULT '```json
{}
```',
  CJRXM VARCHAR(64),
  CJRDM VARCHAR(32),
  CJRDWMC VARCHAR(256),
  CJRDWDM VARCHAR(32),
  DM VARCHAR(32),
  MC VARCHAR(128),
  MS text,
  JP VARCHAR(512),
  QP VARCHAR(512),
  `SQL` text,
  ZT VARCHAR(32),
  SJK VARCHAR(128)
)
;

-- ----------------------------
-- View structure for V_SYS_BDHC_HM
-- ----------------------------
CREATE OR REPLACE VIEW V_SYS_BDHC_HM AS select hm.ID,
       hm.CJSJ,
       hm.GXSJ,
       hm.YXX,
       hm.PX,
       hm.KZXX,
       hm.MC,
       hm.MS,
       hm.LB,
       hm.SSRW,
       hm.SSXM,
       hm.HCZJLX,
       hm.HCZJHM,
       hm.QCBZ,
       hm.ZZJLX,
       hm.ZZJHM,
       hm.KSSJ,
       hm.JSSJ,
       hm.BZ,
       hm.HMYKZJ,
       hm.FLAG01,
       hm.FLAG02,
       hm.FLAG03,
       hm.FLAG04,
       hm.FLAG05,
       hm.FLAG06,
       hm.FLAG07,
       hm.FLAG08,
       hm.FLAG09,
       hm.FLAG10,
       rw.cjsj     rw_cjsj,
       rw.gxsj     rw_gxsj,
       rw.yxx      rw_yxx,
       rw.px       rw_px,
       rw.kzxx     rw_kzxx,
       rw.cjrxm    rw_cjrxm,
       rw.cjrdm    rw_cjrdm,
       rw.cjrdwmc  rw_cjrdwmc,
       rw.cjrdwdm  rw_cjrdwdm,
       rw.cjrlxfs  rw_cjrlxfs,
       rw.sqsj     rw_sqsj,
       rw.mc       rw_mc,
       rw.ms       rw_ms,
       rw.ssxm     rw_ssxm,
       rw.sy       rw_sy,
       rw.bdzy     rw_bdzy,
       rw.pczy     rw_pczy,
       rw.fhzy     rw_fhzy,
       rw.jczy     rw_jczy,
       rw.bz       rw_bz,
       rw.shrxm    rw_shrxm,
       rw.shrzjhm  rw_shrzjhm,
       rw.shdw     rw_shdw,
       rw.shsj     rw_shsj
  from sys_bdhc_hm hm
 inner join sys_bdhc_rw rw
    on hm.ssrw = rw.id
/**
系统-比对核查-号码关联视图
**/;

-- ----------------------------
-- View structure for V_SYS_BDHC_JG
-- ----------------------------
CREATE OR REPLACE VIEW V_SYS_BDHC_JG AS select jg.ID,
       jg.CJSJ,
       jg.GXSJ,
       jg.YXX,
       jg.PX,
       jg.KZXX,
       jg.ZYLB,
       jg.QCZD,
       jg.HCZJLX,
       jg.HCZJHM,
       jg.ZZJLX,
       jg.ZZJHM,
       jg.HCHM,
       jg.HMYKZJ,
       jg.ZYYKZJ,
       jg.RYKSJ,
       jg.HCFS,
       jg.JD,
       jg.WD,
       jg.SFDMC,
       jg.SFDDM,
       jg.MDDMC,
       jg.MDDDM,
       jg.HDFSSJ,
       jg.HDFSDDQH,
       jg.HDFSDDXZ,
       jg.HDFSDDSSSHCS,
       jg.HDFSDDSSSHCSDM,
       jg.HDFSDDSSGAJG,
       jg.HDFSDDSSGAJGJGDM,
       jg.DJZJLX,
       jg.DJZJHM,
       jg.DJXM,
       jg.DJWWXM,
       jg.DJXB,
       jg.DJCSRQ,
       jg.HDXGXX,
       jg.DTXXTGDW,
       jg.DTXXTGDWJGDM,
       jg.FLAG01,
       jg.FLAG02,
       jg.FLAG03,
       jg.FLAG04,
       jg.FLAG05,
       jg.FLAG06,
       jg.FLAG07,
       jg.FLAG08,
       jg.FLAG09,
       jg.FLAG10,
       jg.FLAG11,
       jg.FLAG12,
       jg.FLAG13,
       jg.FLAG14,
       jg.FLAG15,
       jg.FLAG16,
       jg.FLAG17,
       jg.FLAG18,
       jg.FLAG19,
       jg.FLAG20,
       jg.FLAG21,
       jg.FLAG22,
       jg.FLAG23,
       jg.FLAG24,
       jg.FLAG25,
       jg.FLAG26,
       jg.FLAG27,
       jg.FLAG28,
       jg.FLAG29,
       jg.FLAG30,
       jg.FLAG31,
       jg.FLAG32,
       jg.FLAG33,
       jg.FLAG34,
       jg.FLAG35,
       jg.FLAG36,
       jg.FLAG37,
       jg.FLAG38,
       jg.FLAG39,
       jg.FLAG40,
       jg.HDXGWJ,
       jg.PPGZ,
       jg.QSRXM,
       jg.QSRDM,
       jg.QSRDWMC,
       jg.QSRDWDM,
       jg.QSSJ,
       jg.ZLZT,
       hm.cjsj               hm_cjsj,
       hm.gxsj               hm_gxsj,
       hm.yxx                hm_yxx,
       hm.px                 hm_px,
       hm.kzxx               hm_kzxx,
       hm.mc                 hm_mc,
       hm.ms                 hm_ms,
       hm.lb                 hm_lb,
       hm.ssrw               hm_ssrw,
       hm.ssxm               hm_ssxm,
       hm.hczjlx             hm_hczjlx,
       hm.hczjhm             hm_hczjhm,
       hm.qcbz               hm_qcbz,
       hm.zzjlx              hm_zzjlx,
       hm.zzjhm              hm_zzjhm,
       hm.kssj               hm_kssj,
       hm.jssj               hm_jssj,
       hm.bz                 hm_bz,
       hm.hmykzj             hm_hmykzj,
       hm.flag01             hm_flag01,
       hm.flag02             hm_flag02,
       hm.flag03             hm_flag03,
       hm.flag04             hm_flag04,
       hm.flag05             hm_flag05,
       hm.flag06             hm_flag06,
       hm.flag07             hm_flag07,
       hm.flag08             hm_flag08,
       hm.flag09             hm_flag09,
       hm.flag10             hm_flag10,
       rw.cjsj               rw_cjsj,
       rw.gxsj               rw_gxsj,
       rw.yxx                rw_yxx,
       rw.px                 rw_px,
       rw.kzxx               rw_kzxx,
       rw.cjrxm              rw_cjrxm,
       rw.cjrdm              rw_cjrdm,
       rw.cjrdwmc            rw_cjrdwmc,
       rw.cjrdwdm            rw_cjrdwdm,
       rw.cjrlxfs            rw_cjrlxfs,
       rw.sqsj               rw_sqsj,
       rw.mc                 rw_mc,
       rw.ms                 rw_ms,
       rw.ssxm               rw_ssxm,
       rw.sy                 rw_sy,
       rw.bdzy               rw_bdzy,
       rw.pczy               rw_pczy,
       rw.fhzy               rw_fhzy,
       rw.jczy               rw_jczy,
       rw.bz                 rw_bz,
       rw.shrxm              rw_shrxm,
       rw.shrzjhm            rw_shrzjhm,
       rw.shdw               rw_shdw,
       rw.shsj               rw_shsj
  from SYS_BDHC_JG jg
 inner join sys_bdhc_hm hm
    on hm.id = jg.hchm
 inner join sys_bdhc_rw rw
    on hm.ssrw = rw.id
/**
系统-比对核查-比对结果关联视图
**/;