/*
Navicat Oracle Data Transfer
Oracle Client Version : 11.2.0.1.0

Source Server         : mydb
Source Server Version : 110200
Source Host           : 127.0.0.1:1521
Source Schema         : SJSJ

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2018-12-21 13:14:32
*/


-- ----------------------------
-- Table structure for SYS_FILE_RECORD
-- ----------------------------
DROP TABLE "SJSJ"."SYS_FILE_RECORD";
CREATE TABLE "SJSJ"."SYS_FILE_RECORD" (
"ID" VARCHAR2(32 BYTE) DEFAULT sys_guid()  NOT NULL ,
"CREATEDATE" VARCHAR2(14 BYTE) DEFAULT to_char(sysdate,'yyyymmddhh24miss')  NULL ,
"ETLDATE" VARCHAR2(14 BYTE) DEFAULT to_char(sysdate,'yyyymmddhh24miss')  NULL ,
"ISDEL" VARCHAR2(10 BYTE) DEFAULT '0'  NULL ,
"YWDM" VARCHAR2(100 BYTE) NULL ,
"GLID" VARCHAR2(32 BYTE) NULL ,
"WJM" VARCHAR2(500 BYTE) NULL ,
"QCM" VARCHAR2(100 BYTE) NULL ,
"SCLB" VARCHAR2(10 BYTE) NULL ,
"SCLJ" VARCHAR2(1000 BYTE) NULL ,
"WJLX" VARCHAR2(10 BYTE) NULL ,
"WJLB" VARCHAR2(100 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SJSJ"."SYS_FILE_RECORD" IS '系统-文件-记录';
COMMENT ON COLUMN "SJSJ"."SYS_FILE_RECORD"."ID" IS '主键';
COMMENT ON COLUMN "SJSJ"."SYS_FILE_RECORD"."CREATEDATE" IS '创建时间';
COMMENT ON COLUMN "SJSJ"."SYS_FILE_RECORD"."ETLDATE" IS '更新时间';
COMMENT ON COLUMN "SJSJ"."SYS_FILE_RECORD"."ISDEL" IS '删除标记';
COMMENT ON COLUMN "SJSJ"."SYS_FILE_RECORD"."YWDM" IS '业务代码;ZDRY_RYGL';
COMMENT ON COLUMN "SJSJ"."SYS_FILE_RECORD"."GLID" IS '关联id;前端传';
COMMENT ON COLUMN "SJSJ"."SYS_FILE_RECORD"."WJM" IS '文件名';
COMMENT ON COLUMN "SJSJ"."SYS_FILE_RECORD"."QCM" IS '去重码';
COMMENT ON COLUMN "SJSJ"."SYS_FILE_RECORD"."SCLB" IS '上传类别;LOCAL,FASTDFS';
COMMENT ON COLUMN "SJSJ"."SYS_FILE_RECORD"."SCLJ" IS '上传路径;ZDRY_RYGL/去重码.wjlx';
COMMENT ON COLUMN "SJSJ"."SYS_FILE_RECORD"."WJLX" IS '文件类型';
COMMENT ON COLUMN "SJSJ"."SYS_FILE_RECORD"."WJLB" IS '文件类别';

-- ----------------------------
-- Records of SYS_FILE_RECORD
-- ----------------------------
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('1D52A72F3B90409A8CAC65ACDE8605AE', '20181204210628', '20181207214406', '1', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg27c5e0a035dd2b085f99f6974db91429', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181204210627.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('850F792CDB0443B1AB4EB75E8B868B7F', '20180723214620', '20180723214620', '0', 'ryhc', null, '人员核查.xls', 'ryhcdzhca48f3bca1985a189a582c1711f66edd9', null, '/tmp/upload/ryhc/人员核查_201807232146190795.xls', 'xls', 'dzhc');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('jcygxxmb22', '20181203170441', '20181203170441', '0', 'jcga', null, '机场员工信息采集表模板.xls', 'jcgajcyg8bd7d2c3ebc23425cc552069820bd03d', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表模板_20181203170441.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('4CD1386AF28F45EA8B77FBAF6813B8D0', '20181204210818', '20181207214406', '1', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg3c13cd95165709cfab26fc6ad4303702', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181204210818.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('CAE096BA9DF04BDAA9F5FD6904CC9931', '20181205163902', '20181207214355', '1', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg69fdb0ce0c757a9955bb70c627f2b5ab', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181205163902.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('97922F4EB48D42FF87FA67EA7EA2A4E6', '20181205170902', '20181205170902', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg783b80dae0e2491956e4525713c2ce84', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181205170902.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('F5C9BB744F244C16B8ACA55A23819C34', '20180723221420', '20180723221420', '0', 'ryhc', null, '人员核查.xls', 'ryhcdzhc18fa463b0415ebdbccda959c15d99d56', 'LOCAL', '/tmp/upload/ryhc/人员核查_201807232214200597.xls', 'xls', 'dzhc');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('9F80BC3540D24B3CB3B0A6D1B0D270B7', '20180723221525', '20180723221525', '0', 'ryhc', null, '人员核查.xls', 'ryhcdzhc790fd2d24bfb0c4d1f74ac8244a78aa', 'LOCAL', '/tmp/upload/ryhc/人员核查_201807232215250785.xls', 'xls', 'dzhc');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('6F3A49B593AA4630ACF2A87A0A94B748', '20180723221628', '20180723221628', '0', 'ryhc', null, '人员核查.xls', 'ryhcdzhc18ac62abdec5bd7b3c349a9c66801b62', 'LOCAL', '/tmp/upload/ryhc/人员核查_201807232216280415.xls', 'xls', 'dzhc');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('BCBCB272D4AD478FB7110B73B95CD9CD', '20180723221922', '20180723221922', '0', 'ryhc', null, '人员核查.xls', 'ryhcdzhc85f883280c00d9b6ea1cd12cbf0407c2', 'LOCAL', '/tmp/upload/ryhc/人员核查_201807232219220743.xls', 'xls', 'dzhc');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('B4F37BC8887D43AC8A9EE8F93E90933E', '20180723222012', '20180723222012', '0', 'ryhc', null, '人员核查.xls', 'ryhcdzhc11ebe9fd2da37bcbd32089667e525216', 'LOCAL', '/tmp/upload/ryhc/人员核查_201807232220120412.xls', 'xls', 'dzhc');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('D0EFCFE16E89431ABE455B2EC8931BC8', '20181205143204', '20181207214406', '1', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg2a2856006f3c47b4ea9776b30608efec', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181205143203.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('6730760078444578996B09489C34C2F7', '20181205143307', '20181205143307', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg44b14aa238587a73a40ce7e5adc44f9c', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181205143307.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('986940A611614E069F52C85442987CDA', '20181205143336', '20181205143336', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg224b38a675ca41a74991e62459337d07', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181205143336.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('60774F2DE7AA40099498B97E4CA3D1B6', '20181205143352', '20181205143352', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyga0db806ce2b9c19aaf5b82a98d598c7', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181205143352.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('0F38A0DC8F68465CB1E548E2AF3F6D3F', '20181205143413', '20181205143413', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg90d49757aa238fd7c3b03e36192dd514', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181205143413.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('3BBC4A4D00964DF8B23385125E53327B', '20181205144407', '20181205144407', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg198f90b51dc85c51b1536d76915fbbbb', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181205144407.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('A612FC20C4DA45DAB6188C51071BE653', '20181205144525', '20181205144525', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcygf3a31f4b1c51c268619b46e11ee860f9', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181205144525.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('BF103C1B2FD043E0B263AF50E47274C8', '20181205145352', '20181205145352', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcygca69337cda59c84d51f78f8bc078cb9e', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181205145352.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('1206C8C8888648FFB08599123E7460BC', '20181205145504', '20181207213632', '1', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcygefd677aa76a7d135147aea034e7cb4d', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181205145504.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('E01946AE8ADF4AF891B44FE9FB426B97', '20181205150346', '20181205150346', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyge0d3de65a538e4ae9bf3a069a3e2860b', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181205150346.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('0AAEEBB2DF7646D9AEBABFBE59C43E33', '20181205150445', '20181207214355', '1', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcygf1eff61c746f0ea2ba4b9c5cad0b3caf', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181205150445.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('773642E0779B4357A31B6249CC7527E7', '20181205150943', '20181207213626', '1', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg8a6e66f56a3ababaa87ffeb378fccfe', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181205150943.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('61EC403970F346A58081436376513FB9', '20180723222301', '20180723222301', '0', 'ryhc', null, '人员核查.xls', 'ryhcdzhcbab5fb0ef8724c88feb54f954c2ee2de', 'LOCAL', '/tmp/upload/ryhc/人员核查_201807232223010224.xls', 'xls', 'dzhc');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('1DC110F56BBD4B7E8FD7ED0DB88B08CD', '20180723222330', '20180723222330', '0', 'ryhc', null, '人员核查.xls', 'ryhcdzhc2fe31d64fa3ff6f4aca2559ec561a2ac', 'LOCAL', '/tmp/upload/ryhc/人员核查_201807232223300057.xls', 'xls', 'dzhc');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('A54366FD2E044AE9817E8F6AB728AB18', '20181203201918', '20181203201918', '0', 'jcga', null, '机场员工信息采集表模板.xls', 'jcgajcyga7a64315e1e7bdbaa09434c65900ae5d', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表模板_20181203201917.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('9C569DF8F5CC468DA07D95F7277EE0DD', '20181203202406', '20181203202406', '0', 'jcga', null, '机场员工信息采集表模板.xls', 'jcgajcyg9e3697245ffc9ed7e297a2c5275b1063', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表模板_20181203202406.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('63C7AC895B3742DF879F9860AFF904EB', '20181203202435', '20181203202435', '0', 'jcga', null, '机场员工信息采集表模板.xls', 'jcgajcygf9c7f0c3cf385bfd4bb42db23b89c7f7', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表模板_20181203202435.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('00A94AD20A0641C49645FF016ACCABE3', '20181203202853', '20181203202853', '0', 'jcga', null, '机场员工信息采集表模板.xls', 'jcgajcygba47cf0be8946f4afcff19ca19c7c41', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表模板_20181203202853.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('40BBED150A324610B6966F11325029D9', '20181203210058', '20181203210058', '0', 'jcga', null, '机场员工信息采集表模板.xls', 'jcgajcyg7b11284fcab16e8c45bf8406e73bd358', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表模板_20181203210058.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('C320A97862D34080BE5CE27BBAB7FB06', '20181204111429', '20181204111429', '0', 'jcga', null, '机场员工信息采集表模板.xls', 'jcgajcyg225ab3ca8736e1f1acd2a911d45466b2', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表模板_20181204111428.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('D12CB2A6EEEE4A7F916A47F0CEAD33FF', '20181204111655', '20181204111655', '0', 'jcga', null, '机场员工信息采集表模板.xls', 'jcgajcyg8dabb5add72ea3c793914e5a8bca147a', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表模板_20181204111655.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('jcygxxmb', '20181204111826', '20181204111826', '0', 'jcga', null, '机场员工信息采集表模板.xls', 'jcgajcygf01cf333b62cae7de2d656cc70d0b20', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表模板_20181204111826.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('8CB4A501548A4F198F973B2C51A4DB28', '20181204114233', '20181204114233', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg7836c09bc95c2a74547680fadc83d1c', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181204114233.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('7CA2E7A7D21B4D9D8E3F02AC15583E62', '20181204114301', '20181204114301', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg1eb9a62981e207bebb903cb1782ae348', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181204114301.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('1963B287BE5444E19EB53A31980EB085', '20181204114339', '20181204114339', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg644801200252c9f6f8055dd74610aaa7', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181204114339.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('5A2466B7D66844EFAAE2FFE50789DBF1', '20181204114618', '20181204114618', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg21fb78240f9e5b700c099428e991c693', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181204114618.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('CE900AB7088549549AC554C793630779', '20181204114639', '20181204114639', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcygc012d47185bedb42ecb564ea0ba70598', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181204114639.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('D7C3BEFE20B44D2BABE8920C959EC135', '20181204114816', '20181204114816', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg3e1950a979578b1c07d5bdaed03c27f2', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181204114816.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('087B031DC8944C2DB1403B25CA8AA4C5', '20181204114859', '20181204114859', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyga6312453f786eef0d63ceaf564b9f1f3', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181204114859.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('D61BB8C54F9A44669217AE9B3A9A3E4B', '20181204115136', '20181204115136', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcygdff537f94571b4cb20e35c11e8c8ba99', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181204115136.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('D2AD63EFA113429D8E1B8CF027D42FAD', '20181204115354', '20181204115354', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcygbcfb140bbab4fe71029ecc8f580e3f0d', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181204115354.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('1FDB68339C404DCE8395B42889367157', '20181204120351', '20181204120351', '0', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg6a76ad83e6161463d26b5f8d24f999a7', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181204120351.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('390939A20F73492A878887A9BBD8826A', '20181204131759', '20181207214406', '1', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg3750980e5ed9dbe6b5e8d8b3ff492b19', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181204131758.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('E2B1C8CFABD649E182E5C69841BF0C01', '20181204131853', '20181207214406', '1', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg46d16fc1e6bbd01127e6679d2b8d6af', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181204131853.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('62334409F299486297CEC30BE289E748', '20181204132122', '20181207214406', '1', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg4d0f78250286abcb18d3e169bf92daf', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181204132121.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('B33C5E92EDCB4F47AE4769DE7F57C4BE', '20181204161858', '20181207214406', '1', 'jcga', null, '机场员工信息采集表模板.xls', 'jcgajcyg4215c3484a53d4a7f95138da7f22d8eb', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表模板_20181204161858.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('2A75075E354540FA88407EDEBB37935A', '20181204162354', '20181207214406', '1', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg39d1e816103a59a7291621b2b0d3ea94', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181204162354.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('EAA1E7E0E1814A81BC056028BFE2A942', '20181205102807', '20181207214406', '1', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg29daae566f8683947564ea914a499436', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181205102807.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('C178B5B56B9D45B896D61DB44A7D3CE5', '20181205120150', '20181207214406', '1', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg8be996412e57ad884846b38c2c46372c', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181205120150.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('F169D91A248D4FF69D24B6FF42A66849', '20181207202519', '20181207213622', '1', 'jcga', null, '机场员工信息采集表样例数据.xls', 'jcgajcyg7e85a58d8ea7e474415512357858dcd4', 'LOCAL', '/tmp/upload/jcga/机场员工信息采集表样例数据_20181207202519.xls', 'xls', 'jcyg');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('7266FF49F41C40BB95EC6E15F8F1CBB6', '20181207213935', '20181207213935', '0', 'common', null, '犯罪记录表.txt', 'commonwjmb2ef280434a1d4553e6305019a7ca7c2f', 'LOCAL', '/tmp/upload/common/犯罪记录表_20181207213935.txt', 'txt', 'wjmb');
INSERT INTO "SJSJ"."SYS_FILE_RECORD" VALUES ('D80C0CEA602745A3BACB8D3F0DA9DA26', '20181208163950', '20181208163950', '0', 'common', null, '表变化1206.txt', 'commonwjmbf50e001b267ddf9fd67b3aa90054e34c', 'LOCAL', '/tmp/upload/common/表变化1206_20181208163950.txt', 'txt', 'wjmb');

-- ----------------------------
-- Table structure for SYS_LOG_FWZR
-- ----------------------------
DROP TABLE "SJSJ"."SYS_LOG_FWZR";
CREATE TABLE "SJSJ"."SYS_LOG_FWZR" (
"ID" VARCHAR2(32 BYTE) DEFAULT sys_guid()  NOT NULL ,
"CJSJ" VARCHAR2(14 BYTE) DEFAULT to_char(sysdate,'yyyymmddhh24miss')  NULL ,
"GXSJ" VARCHAR2(14 BYTE) DEFAULT to_char(sysdate,'yyyymmddhh24miss')  NULL ,
"YXX" VARCHAR2(8 BYTE) DEFAULT '1'  NULL ,
"PX" NUMBER DEFAULT 99999  NULL ,
"KZXX" VARCHAR2(4000 BYTE) DEFAULT '{}'  NULL ,
"CJRXM" VARCHAR2(64 BYTE) NULL ,
"CJRDM" VARCHAR2(32 BYTE) NULL ,
"CJRDWMC" VARCHAR2(256 BYTE) NULL ,
"CJRDWDM" VARCHAR2(32 BYTE) NULL ,
"SJDX" VARCHAR2(32 BYTE) NULL ,
"CZIP" VARCHAR2(32 BYTE) NULL ,
"CZLX" VARCHAR2(32 BYTE) NULL ,
"URL" VARCHAR2(4000 BYTE) NULL ,
"XGCS" VARCHAR2(4000 BYTE) NULL ,
"TOKEN" VARCHAR2(32 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SJSJ"."SYS_LOG_FWZR" IS '系统-日志-访问日志';
COMMENT ON COLUMN "SJSJ"."SYS_LOG_FWZR"."ID" IS '主键';
COMMENT ON COLUMN "SJSJ"."SYS_LOG_FWZR"."CJSJ" IS '创建时间';
COMMENT ON COLUMN "SJSJ"."SYS_LOG_FWZR"."GXSJ" IS '更新时间';
COMMENT ON COLUMN "SJSJ"."SYS_LOG_FWZR"."YXX" IS '有效性@SYS_COMMON_LJPD';
COMMENT ON COLUMN "SJSJ"."SYS_LOG_FWZR"."PX" IS '排序';
COMMENT ON COLUMN "SJSJ"."SYS_LOG_FWZR"."KZXX" IS '扩展信息;JSON格式';
COMMENT ON COLUMN "SJSJ"."SYS_LOG_FWZR"."CJRXM" IS '创建人姓名';
COMMENT ON COLUMN "SJSJ"."SYS_LOG_FWZR"."CJRDM" IS '创建人代码@SYS_COMMON_USER';
COMMENT ON COLUMN "SJSJ"."SYS_LOG_FWZR"."CJRDWMC" IS '创建人单位名称';
COMMENT ON COLUMN "SJSJ"."SYS_LOG_FWZR"."CJRDWDM" IS '创建人单位代码@SYS_COMMON_ORG';
COMMENT ON COLUMN "SJSJ"."SYS_LOG_FWZR"."SJDX" IS '数据对象';
COMMENT ON COLUMN "SJSJ"."SYS_LOG_FWZR"."CZIP" IS '操作ip';
COMMENT ON COLUMN "SJSJ"."SYS_LOG_FWZR"."CZLX" IS '操作类型';
COMMENT ON COLUMN "SJSJ"."SYS_LOG_FWZR"."URL" IS 'URL';
COMMENT ON COLUMN "SJSJ"."SYS_LOG_FWZR"."XGCS" IS '相关参数';
COMMENT ON COLUMN "SJSJ"."SYS_LOG_FWZR"."TOKEN" IS '权限id';

-- ----------------------------
-- Records of SYS_LOG_FWZR
-- ----------------------------

-- ----------------------------
-- Table structure for SYS_QX_JGXX
-- ----------------------------
DROP TABLE "SJSJ"."SYS_QX_JGXX";
CREATE TABLE "SJSJ"."SYS_QX_JGXX" (
"ID" VARCHAR2(32 BYTE) DEFAULT sys_guid()  NOT NULL ,
"CJSJ" VARCHAR2(14 BYTE) DEFAULT to_char(sysdate,'yyyymmddhh24miss')  NULL ,
"GXSJ" VARCHAR2(14 BYTE) DEFAULT to_char(sysdate,'yyyymmddhh24miss')  NULL ,
"YXX" VARCHAR2(8 BYTE) DEFAULT '1'  NULL ,
"PX" NUMBER DEFAULT 99999  NULL ,
"KZXX" VARCHAR2(4000 BYTE) DEFAULT '{}'  NULL ,
"CJRXM" VARCHAR2(64 BYTE) NULL ,
"CJRDM" VARCHAR2(32 BYTE) NULL ,
"CJRDWMC" VARCHAR2(256 BYTE) NULL ,
"CJRDWDM" VARCHAR2(32 BYTE) NULL ,
"JGDM" VARCHAR2(32 BYTE) NULL ,
"JGMC" VARCHAR2(256 BYTE) NULL ,
"MCJP" VARCHAR2(128 BYTE) NULL ,
"JGBM" VARCHAR2(256 BYTE) NULL ,
"JGJC" VARCHAR2(256 BYTE) NULL ,
"JCJP" VARCHAR2(128 BYTE) NULL ,
"JGLX" VARCHAR2(3 BYTE) NULL ,
"SJJG" VARCHAR2(32 BYTE) NULL ,
"JGCJ" NUMBER NULL ,
"LXR" VARCHAR2(128 BYTE) NULL ,
"LXRDH" VARCHAR2(128 BYTE) NULL ,
"JGYX" VARCHAR2(32 BYTE) NULL ,
"JGDZ" VARCHAR2(256 BYTE) NULL ,
"JGMS" VARCHAR2(512 BYTE) NULL ,
"BZ" VARCHAR2(512 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SJSJ"."SYS_QX_JGXX" IS '系统-权限-机构信息';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."ID" IS '主键';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."CJSJ" IS '创建时间';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."GXSJ" IS '更新时间';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."YXX" IS '有效性@SYS_COMMON_LJPD';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."PX" IS '排序';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."KZXX" IS '扩展信息;JSON格式';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."CJRXM" IS '创建人姓名';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."CJRDM" IS '创建人代码@SYS_COMMON_USER';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."CJRDWMC" IS '创建人单位名称';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."CJRDWDM" IS '创建人单位代码@SYS_COMMON_ORG';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."JGDM" IS '机构代码';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."JGMC" IS '机构名称';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."MCJP" IS '名称简拼';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."JGBM" IS '机构别名';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."JGJC" IS '机构简称';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."JCJP" IS '简称简拼';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."JGLX" IS '机构类型';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."SJJG" IS '上级机构';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."JGCJ" IS '机构层级';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."LXR" IS '联系人';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."LXRDH" IS '联系人电话';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."JGYX" IS '机构邮箱';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."JGDZ" IS '机构地址';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."JGMS" IS '机构描述';
COMMENT ON COLUMN "SJSJ"."SYS_QX_JGXX"."BZ" IS '备注';

-- ----------------------------
-- Records of SYS_QX_JGXX
-- ----------------------------
INSERT INTO "SJSJ"."SYS_QX_JGXX" VALUES ('141B1AFC7E634176BDA7DB7F491A9004', '20181220144902', '20181220144902', '1', '99999', '{}', null, null, null, null, '99000001', '临时机构', null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for SYS_QX_YHXX
-- ----------------------------
DROP TABLE "SJSJ"."SYS_QX_YHXX";
CREATE TABLE "SJSJ"."SYS_QX_YHXX" (
"ID" VARCHAR2(32 BYTE) DEFAULT sys_guid()  NOT NULL ,
"CJSJ" VARCHAR2(14 BYTE) DEFAULT to_char(sysdate,'yyyymmddhh24miss')  NULL ,
"GXSJ" VARCHAR2(14 BYTE) DEFAULT to_char(sysdate,'yyyymmddhh24miss')  NULL ,
"YXX" VARCHAR2(8 BYTE) DEFAULT '1'  NULL ,
"PX" NUMBER DEFAULT 99999  NULL ,
"KZXX" VARCHAR2(4000 BYTE) DEFAULT '{}'  NULL ,
"CJRXM" VARCHAR2(64 BYTE) NULL ,
"CJRDM" VARCHAR2(32 BYTE) NULL ,
"CJRDWMC" VARCHAR2(256 BYTE) NULL ,
"CJRDWDM" VARCHAR2(32 BYTE) NULL ,
"YHXM" VARCHAR2(32 BYTE) NULL ,
"YHDM" VARCHAR2(32 BYTE) NULL ,
"YHMM" VARCHAR2(64 BYTE) NULL ,
"SFZH" VARCHAR2(18 BYTE) NULL ,
"YXQKS" VARCHAR2(8 BYTE) NULL ,
"YXQJS" VARCHAR2(8 BYTE) NULL ,
"SSJG" VARCHAR2(32 BYTE) NULL ,
"THLX" VARCHAR2(2 BYTE) NULL ,
"YHDJ" VARCHAR2(2 BYTE) NULL ,
"YHMS" VARCHAR2(1024 BYTE) NULL ,
"YHYX" VARCHAR2(32 BYTE) NULL ,
"LXDH" VARCHAR2(32 BYTE) NULL ,
"LXDZ" VARCHAR2(256 BYTE) NULL ,
"MZ" VARCHAR2(2 BYTE) NULL ,
"GJ" VARCHAR2(5 BYTE) NULL ,
"XL" VARCHAR2(2 BYTE) NULL ,
"ZZMM" VARCHAR2(2 BYTE) NULL ,
"ZW" VARCHAR2(2 BYTE) NULL ,
"ZJ" VARCHAR2(2 BYTE) NULL ,
"BZ" VARCHAR2(1024 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SJSJ"."SYS_QX_YHXX" IS '系统-权限-用户信息';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."ID" IS '主键';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."CJSJ" IS '创建时间';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."GXSJ" IS '更新时间';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."YXX" IS '有效性@SYS_COMMON_LJPD';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."PX" IS '排序';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."KZXX" IS '扩展信息;JSON格式';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."CJRXM" IS '创建人姓名';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."CJRDM" IS '创建人代码@SYS_COMMON_USER';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."CJRDWMC" IS '创建人单位名称';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."CJRDWDM" IS '创建人单位代码@SYS_COMMON_ORG';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."YHXM" IS '用户姓名';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."YHDM" IS '用户代码';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."YHMM" IS '用户密码';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."SFZH" IS '身份证号';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."YXQKS" IS '有效期开始';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."YXQJS" IS '有效期结束';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."SSJG" IS '所属机构@SYS_COMMON_ORG';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."THLX" IS '用户类型@SYS_QX_YHLX';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."YHDJ" IS '用户等级@SYS_QX_YHDJ';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."YHMS" IS '用户描述';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."YHYX" IS '用户邮箱';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."LXDH" IS '联系电话';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."LXDZ" IS '联系地址';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."MZ" IS '民族@SYS_COMMON_MZ';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."GJ" IS '国籍@SYS_COMMON_GJ';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."XL" IS '学历@SYS_COMMON_XL';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."ZZMM" IS '政治面貌@SYS_COMMON_ZZMM';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."ZW" IS '职务@SYS_QX_ZW';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."ZJ" IS '职级@SYS_QX_ZJ';
COMMENT ON COLUMN "SJSJ"."SYS_QX_YHXX"."BZ" IS '备注';

-- ----------------------------
-- Records of SYS_QX_YHXX
-- ----------------------------
INSERT INTO "SJSJ"."SYS_QX_YHXX" VALUES ('B15FEE07E9C247DAB42058902AB28C99', '20181220144725', '20181220144725', '1', '99999', '{}', null, null, null, null, '临时用户', 'lsyh', null, null, null, null, '141B1AFC7E634176BDA7DB7F491A9004', null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for SYS_SJGL_SJDX
-- ----------------------------
DROP TABLE "SJSJ"."SYS_SJGL_SJDX";
CREATE TABLE "SJSJ"."SYS_SJGL_SJDX" (
"ID" VARCHAR2(32 BYTE) DEFAULT sys_guid()  NOT NULL ,
"CJSJ" VARCHAR2(14 BYTE) DEFAULT to_char(sysdate,'yyyymmddhh24miss')  NULL ,
"GXSJ" VARCHAR2(14 BYTE) DEFAULT to_char(sysdate,'yyyymmddhh24miss')  NULL ,
"YXX" VARCHAR2(8 BYTE) DEFAULT '1'  NULL ,
"PX" NUMBER DEFAULT 99999  NULL ,
"KZXX" VARCHAR2(4000 BYTE) DEFAULT '{}'  NULL ,
"CJRXM" VARCHAR2(64 BYTE) NULL ,
"CJRDM" VARCHAR2(32 BYTE) NULL ,
"CJRDWMC" VARCHAR2(256 BYTE) NULL ,
"CJRDWDM" VARCHAR2(32 BYTE) NULL ,
"DXDM" VARCHAR2(32 BYTE) NULL ,
"DXMC" VARCHAR2(128 BYTE) NULL ,
"DXMS" VARCHAR2(4000 BYTE) NULL ,
"DXJP" VARCHAR2(512 BYTE) NULL ,
"DXQP" VARCHAR2(512 BYTE) NULL ,
"DXLB" VARCHAR2(512 BYTE) NULL ,
"DXLX" VARCHAR2(32 BYTE) NULL ,
"DXZY" VARCHAR2(512 BYTE) NULL ,
"DXZTLX" VARCHAR2(32 BYTE) NULL ,
"DXZT" VARCHAR2(32 BYTE) DEFAULT 'default'  NULL ,
"DXGS" VARCHAR2(512 BYTE) NULL ,
"JTDX" VARCHAR2(64 BYTE) NULL ,
"ZJZD" VARCHAR2(32 BYTE) NULL ,
"QXZD" VARCHAR2(32 BYTE) NULL ,
"ZLZD" VARCHAR2(32 BYTE) NULL ,
"QCZD" VARCHAR2(32 BYTE) NULL ,
"JYZD" VARCHAR2(32 BYTE) NULL ,
"PCZD" VARCHAR2(32 BYTE) NULL ,
"YXXZD" VARCHAR2(32 BYTE) NULL ,
"FYTJXS" VARCHAR2(32 BYTE) DEFAULT '1'  NULL ,
"MRPX" VARCHAR2(256 BYTE) NULL ,
"CSCX" VARCHAR2(32 BYTE) DEFAULT '1'  NULL ,
"XQAN" VARCHAR2(8 BYTE) DEFAULT '1'  NULL ,
"CXTJ" VARCHAR2(8 BYTE) DEFAULT '1'  NULL ,
"SXXZ" VARCHAR2(8 BYTE) DEFAULT '1'  NULL ,
"LBFXK" VARCHAR2(8 BYTE) DEFAULT '0'  NULL ,
"BJXH" VARCHAR2(8 BYTE) DEFAULT '1'  NULL ,
"LJQ" VARCHAR2(512 BYTE) DEFAULT ''  NULL ,
"ZDDRSQL" CLOB NULL ,
"SQLMB" CLOB NULL ,
"CXLBKZ" CLOB NULL ,
"BJYMKZ" CLOB NULL ,
"PLYMKZ" CLOB NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SJSJ"."SYS_SJGL_SJDX" IS '系统-数据管理-数据对象';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."ID" IS '主键';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."CJSJ" IS '创建时间';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."GXSJ" IS '更新时间';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."YXX" IS '有效性@SYS_COMMON_LJPD';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."PX" IS '排序';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."KZXX" IS '扩展信息;JSON格式';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."CJRXM" IS '创建人姓名';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."CJRDM" IS '创建人代码@SYS_COMMON_USER';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."CJRDWMC" IS '创建人单位名称';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."CJRDWDM" IS '创建人单位代码@SYS_COMMON_ORG';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."DXDM" IS '对象代码;代表唯一数据对象，多处使用，唯一';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."DXMC" IS '对象名称';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."DXMS" IS '对象描述';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."DXJP" IS '对象简拼';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."DXQP" IS '对象全拼';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."DXLB" IS '对象类别@SYS_SJGL_DXLB;标准对象、临时对象、系统对象等人工分类';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."DXLX" IS '对象类型@SYS_SJGL_DXLX;表、视图、excel、txt等';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."DXZY" IS '对象作用@SYS_SJGL_DXZY;增量导出、数据插入、数据更新、页面查询、页面新增、页面修改等';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."DXZTLX" IS '对象载体类型@SYS_SJGL_DXZTLX;ORACLE、POSTGRESS、MYSQL、GREEPLAM、本地文件、FTP文件、FASTDFS文件、SOLR、ES、HIVE、HBASE等';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."DXZT" IS '对象载体;根据对象载体类型不同，表示不同的具体载体，如具体数据库、ftp等';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."DXGS" IS '对象归属;数据库的某个用户、ftp的目录等';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."JTDX" IS '具体对象;数据库的表视图、文件名、文件正则等';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."ZJZD" IS '主键字段;用于查询详情等';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."QXZD" IS '权限字段;进行权限控制';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."ZLZD" IS '增量字段;进行增量抽取等';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."QCZD" IS '去重字段;用于插入更新';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."JYZD" IS '校验字段;用于存放校验信息';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."PCZD" IS '批次字段;用于存放批次号，知道具体数据来自哪次抽取等';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."YXXZD" IS '有效性字段;做逻辑删除等';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."FYTJXS" IS '分页统计形式@SYS_SJGL_FYTJXS;控制分页查询数据量统计形式，如：默认形式、异步统计、默认不统计';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."MRPX" IS '默认排序;查询时的默认排序规则';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."CSCX" IS '初始查询@SYS_COMMON_LJPD;控制查询页面是否初始化查询';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."XQAN" IS '详情按钮@SYS_COMMON_LJPD;控制是否展示';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."CXTJ" IS '查询条件@SYS_COMMON_LJPD;控制是否展示';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."SXXZ" IS '属性选择@SYS_COMMON_LJPD;控制是否展示';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."LBFXK" IS '列表复选框@SYS_COMMON_LJPD;控制是否展示';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."BJXH" IS '编辑序号@SYS_COMMON_LJPD;控制是否显示编辑页面的字段序号';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."LJQ" IS '拦截器;后台扩展系统';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."ZDDRSQL" IS '字段导入SQL;用于刷新对象字段';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."SQLMB" IS 'SQL模板;用于扩展后端，基于beetl实现';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."CXLBKZ" IS '查询列表扩展;可以扩展成各种基于数据查询的展示页面。';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."BJYMKZ" IS '编辑页面扩展;涵盖新增、修改、详情';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJDX"."PLYMKZ" IS '批量页面扩展;主要用于扩展批量上传页面';

-- ----------------------------
-- Records of SYS_SJGL_SJDX
-- ----------------------------
INSERT INTO "SJSJ"."SYS_SJGL_SJDX" VALUES ('2DAE24C7EC4D4B639EAB7361638EA61A', '20181218112657', '20181219131646', '1', '99999', '{}', '超级管理员', '342622198002280614', '物流园区管委会', 'jc5001020000', 'T_UAAC_APP', '系统-权限-应用管理', null, null, null, '02', 'table', null, 'oracle', 'default', null, 'T_UAAC_APP', 'id', null, null, null, null, null, null, '1', null, '1', '1', '1', '1', '0', '1', null, 'select a.column_name as zddm,
       a.comments    as zdms,
       c.data_type   as zdlx,
       c.data_length as zdcd
  from all_col_comments a
  left join all_tab_columns c
    on a.table_name = c.table_name
   and a.owner = c.owner
   and a.column_name = c.column_name
   and a.owner = c.owner
 where a.table_name = ''T_UAAC_APP''
', null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJDX" VALUES ('SYS_SJGL_SJDX', '20181210203129', '20181220214809', '1', '10', '{
    "fields": {
        "sszzd": {
            "zddm": "dxmc",
            "zdms": "搜索主字段"
        },
        "pyjp": {
            "zdms": "拼音简拼",
            "zddm": "dxjp"
        },
        "pyqp": {
            "zdms": "拼音全拼",
            "zddm": "dxqp"
        },
        "sszdlb": {
            "zdms": "搜索字段列表",
            "zddm": "dxms"
        }
    }
}', '超级管理员', '342622198002280614', '物流园区管委会', 'jc5001020000', 'SYS_SJGL_SJDX', '系统-数据管理-数据对象', '1', null, null, '02', 'table', null, 'oracle', 'default', null, 'SYS_SJGL_SJDX', 'id', null, 'gxsj', null, null, null, 'yxx', '1', 'px', '1', '1', '1', '1', '0', '1', 'cn.benma666.sjgl.ljq.SjdxLjq', 'select a.column_name as zddm,
       a.comments    as zdms,
       c.data_type   as zdlx,
       c.data_length as zdcd
  from all_col_comments a
  left join all_tab_columns c
    on a.table_name = c.table_name
   and a.owner = c.owner
   and a.column_name = c.column_name
   and a.owner = c.owner
 where a.table_name = ''SYS_SJGL_SJDX''
', null, '<my-list id="listPage1" :fromdata="fromdata" :sjdxid="sjdxid">
        <button class="btn btn-primary btn-sm" a-oper="batch"
		:href="''sjdx/plcl.do?id=''+sjdxid+''&map[\''cllx\'']=fzdx''">复制对象</button>
        <button class="btn btn-primary btn-sm" a-oper="batch"
		:href="''sjdx/plcl.do?id=''+sjdxid+''&map[\''cllx\'']=scdxst''">生成实体</button>
</my-list>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
<br/>
<a href="sjdx/list.do?id={{= row[sjdx.zjzd]}}" target="_blank">查看对象</a>
<span class="divider"></span>
<a href="sjdx/plcl.do?id={{= sjdx.id}}&map[''cllx'']=sxdx&map[''ids'']={{= row[sjdx.zjzd]}}" a-oper="dxcl">刷新对象</a>
</span>
</script>
<script>
function sjdxZdy(vp){
    vp.el="#listPage1";
}
function sjdxlbcz(value,_this) {
    var cz = defaultLbcz(value,_this);
    if("非列表模式"==cz){
        return cz;
    }
    var qtcz = $("#my-sjdx-lbcz-tp").tmpl({sjdx:_this.$root.sjdx,
	    row:_this.$root.listPage.rows[_this.$parent.$parent.ri]}).html();
    return cz+qtcz;
}
</script>                         ', '
<my-edit id="dataform1" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel">
      <button type="button" v-if="pagemodel==''add''||pagemodel==''edit''" class="btn btn-primary btn-sm" 
    	     title="获取默认字段导入SQL" @click="getDefaultImpSql">默认SQL</button>
</my-edit>
<script>
function sjdxZdy(vp){
	vp.el="#dataform1";
	vp.methods.getDefaultImpSql=function(){
        var _this=this;
   		if(!$(_this.$options.el).isValid()){
    		return;
    	}else{
    		var _params = _this.$children[0]._data.updatedata;
                _params.myparams=JSON.stringify({sqlType:"dis"});
    		$.post("sjdx/getDefaultSql.do",_params,function(data){
    			if(data.status){
    			    Vue.set(_this.fromdata,"zddrsql",data.msg);
    			}else{
    	        	layer.alert(data.msg ? data.msg : "操作失败！", { 
    	    	   		icon:2       	   		
    	    		});
    			}
    		});
    	}
	}
}
function sjdxZdyjy(data,_this){
    if(!((_this.pagemodel==''edit''&&data.zddrsql==undefined)||!isEmpty(data.zddrsql))){
    	layer.alert("字段导入SQL不能为空", { 
	   		icon:2       	   		
		});
    	return false;
    }
    return true;
}
</script> ', null);
INSERT INTO "SJSJ"."SYS_SJGL_SJDX" VALUES ('SYS_SJGL_SJZD', '20181210204048', '20181219141420', '1', '20', '{
    "fields": {
        "sszzd": {
            "zddm": "zdmc",
            "zdms": "搜索主字段"
        },
        "pyjp": {
            "zdms": "拼音简拼",
            "zddm": "zdjp"
        },
        "pyqp": {
            "zdms": "拼音全拼",
            "zddm": "zdqp"
        },
        "sszdlb": {
            "zdms": "搜索字段列表",
            "zddm": "dmgs||dxdm||dxms"
        }
    }
}', '超级管理员', '342622198002280614', '物流园区管委会', 'jc5001020000', 'SYS_SJGL_SJZD', '系统-数据管理-数据字段', null, null, null, '02', 'table', null, 'oracle', 'default', null, 'SYS_SJGL_SJZD', 'id', null, 'gxsj', null, null, null, 'yxx', '1', 'px', '1', '1', '1', '1', '0', '1', 'cn.benma666.sjgl.ljq.SjzdLjq', null, null, '<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
            <button class="btn btn-primary btn-sm" :href="''sjdx/plcl.do?id=''+sjdxid+''&map[\''cllx\'']=bzpx&map[\''ids\'']=''+(fromdata.sjdx||'''')"
                a-oper="dxcl" title="重新按10的间隔编排序号，方便穿插调整顺序">标准排序</button>
</my-list>', null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJDX" VALUES ('AD6FF4C358284A8DB3954B3E32A51E86', '20181219195237', '20181219195237', '1', '99999', '{}', '超级管理员', '342622198002280614', '物流园区管委会', 'jc5001020000', 'SYS_QX_YHXX', '系统-权限-用户信息', null, null, null, '02', 'table', null, 'oracle', 'default', null, 'SYS_QX_YHXX', 'id', null, null, null, null, null, null, '1', null, '1', '1', '1', '1', '0', '1', null, 'select a.column_name as zddm,
       a.comments    as zdms,
       c.data_type   as zdlx,
       c.data_length as zdcd
  from all_col_comments a
  left join all_tab_columns c
    on a.table_name = c.table_name
   and a.owner = c.owner
   and a.column_name = c.column_name
   and a.owner = c.owner
 where a.table_name = ''SYS_QX_YHXX''
', null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJDX" VALUES ('2FA019BF3F0B434287C44330A563E1E0', '20181220172921', '20181220172921', '1', '99999', '{}', '临时用户', null, '临时机构', '99000001', 'T_SYS_ZD', 'T_SYS_ZD', null, null, null, '02', 'table', null, 'oracle', 'default', null, 'T_SYS_ZD', 'id', null, null, null, null, null, null, '1', null, '1', '1', '1', '1', '0', '1', null, 'select a.column_name as zddm,
       a.comments    as zdms,
       c.data_type   as zdlx,
       c.data_length as zdcd
  from all_col_comments a
  left join all_tab_columns c
    on a.table_name = c.table_name
   and a.owner = c.owner
   and a.column_name = c.column_name
   and a.owner = c.owner
 where a.table_name = ''T_SYS_ZD''
', null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJDX" VALUES ('A0AB3007C2D04BA3B8A58EC24F5550C5', '20181217164122', '20181217165611', '1', '99999', '{}', '超级管理员', '342622198002280614', '物流园区管委会', 'jc5001020000', 'SYS_FILE_RECORD', '系统-文件-记录', null, null, null, '02', 'table', null, 'oracle', 'default', null, 'SYS_FILE_RECORD', 'id', null, null, null, null, null, null, '1', null, '1', '1', '1', '1', '0', '1', null, 'select a.column_name as zddm,
       a.comments    as zdms,
       c.data_type   as zdlx,
       c.data_length as zdcd
  from all_col_comments a
  left join all_tab_columns c
    on a.table_name = c.table_name
   and a.owner = c.owner
   and a.column_name = c.column_name
   and a.owner = c.owner
 where a.table_name = ''SYS_FILE_RECORD''
', null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJDX" VALUES ('07DCAFB42634494C85B1F90A442489F1', '20181220215058', '20181220215343', '1', '99999', '{}', '临时用户', 'lsyh', '临时机构', '99000001', 'SYS_LOG_FWZR', '系统-日志-访问日志', null, null, null, '02', 'table', null, 'oracle', 'default', null, 'SYS_LOG_FWZR', 'id', null, null, null, null, null, null, '1', 'cjsj desc', '1', '1', '1', '1', '0', '1', null, 'select a.column_name as zddm,
       a.comments    as zdms,
       c.data_type   as zdlx,
       c.data_length as zdcd
  from all_col_comments a
  left join all_tab_columns c
    on a.table_name = c.table_name
   and a.owner = c.owner
   and a.column_name = c.column_name
   and a.owner = c.owner
 where a.table_name = ''SYS_LOG_FWZR''
', null, null, null, null);

-- ----------------------------
-- Table structure for SYS_SJGL_SJZD
-- ----------------------------
DROP TABLE "SJSJ"."SYS_SJGL_SJZD";
CREATE TABLE "SJSJ"."SYS_SJGL_SJZD" (
"ID" VARCHAR2(32 BYTE) DEFAULT sys_guid()  NOT NULL ,
"CJSJ" VARCHAR2(14 BYTE) DEFAULT to_char(sysdate,'yyyymmddhh24miss')  NULL ,
"GXSJ" VARCHAR2(14 BYTE) DEFAULT to_char(sysdate,'yyyymmddhh24miss')  NULL ,
"YXX" VARCHAR2(8 BYTE) DEFAULT '1'  NULL ,
"PX" NUMBER DEFAULT 99999  NULL ,
"KZXX" VARCHAR2(4000 BYTE) DEFAULT '{}'  NULL ,
"SJDX" VARCHAR2(32 BYTE) NULL ,
"ZDDM" VARCHAR2(32 BYTE) NULL ,
"ZDMC" VARCHAR2(128 BYTE) NULL ,
"ZDMS" VARCHAR2(256 BYTE) NULL ,
"ZDJP" VARCHAR2(32 BYTE) NULL ,
"ZDQP" VARCHAR2(256 BYTE) NULL ,
"ZDLX" VARCHAR2(32 BYTE) NULL ,
"ZDCD" NUMBER NULL ,
"ZDKD" NUMBER DEFAULT 80  NULL ,
"ZDGD" NUMBER NULL ,
"CXMRZ" VARCHAR2(64 BYTE) NULL ,
"XZMRZ" VARCHAR2(64 BYTE) NULL ,
"KJLX" VARCHAR2(32 BYTE) DEFAULT 'input'  NULL ,
"ZDDX" VARCHAR2(32 BYTE) DEFAULT '0'  NULL ,
"ZDFY" VARCHAR2(32 BYTE) DEFAULT '0'  NULL ,
"YXPX" VARCHAR2(8 BYTE) DEFAULT '0'  NULL ,
"LBZS" VARCHAR2(8 BYTE) DEFAULT '0'  NULL ,
"CXZS" VARCHAR2(8 BYTE) DEFAULT '0'  NULL ,
"XZZS" VARCHAR2(8 BYTE) DEFAULT '1'  NULL ,
"BJZS" VARCHAR2(8 BYTE) DEFAULT '1'  NULL ,
"XQZS" VARCHAR2(8 BYTE) DEFAULT '1'  NULL ,
"CXBT" VARCHAR2(8 BYTE) DEFAULT '0'  NULL ,
"BJBT" VARCHAR2(8 BYTE) DEFAULT '0'  NULL ,
"YXBJ" VARCHAR2(8 BYTE) DEFAULT '1'  NULL ,
"ZDZDLB" VARCHAR2(32 BYTE) NULL ,
"ZDYWLB" VARCHAR2(32 BYTE) NULL ,
"GSHFF" VARCHAR2(64 BYTE) NULL ,
"FGSHFF" VARCHAR2(64 BYTE) NULL ,
"SZHD" VARCHAR2(64 BYTE) NULL ,
"ZDTS" VARCHAR2(256 BYTE) NULL ,
"HDYZGZ" VARCHAR2(256 BYTE) NULL ,
"QDYZGZ" VARCHAR2(256 BYTE) NULL ,
"STYLE" VARCHAR2(256 BYTE) NULL ,
"CSSL" VARCHAR2(128 BYTE) NULL ,
"QCBH" NUMBER NULL ,
"BZZD" VARCHAR2(32 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SJSJ"."SYS_SJGL_SJZD" IS '系统-数据管理-数据字段';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."ID" IS '主键';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."CJSJ" IS '创建时间';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."GXSJ" IS '更新时间';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."YXX" IS '有效性@SYS_COMMON_LJPD';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."PX" IS '排序';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."KZXX" IS '扩展信息;JSON格式';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."SJDX" IS '数据对象';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."ZDDM" IS '字段代码';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."ZDMC" IS '字段名称';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."ZDMS" IS '字段描述';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."ZDJP" IS '字段简拼';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."ZDQP" IS '字段全拼';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."ZDLX" IS '字段类型';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."ZDCD" IS '字段长度';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."ZDKD" IS '字段宽度';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."ZDGD" IS '字段高度';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."CXMRZ" IS '查询默认值';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."XZMRZ" IS '新增默认值';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."KJLX" IS '控件类型@SYS_SJGL_KJLX;默认为1，1就是输入框，2是时间框，3是下拉框；';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."ZDDX" IS '字典多选@SYS_COMMON_LJPD;字典下拉框是否支持多选';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."ZDFY" IS '字典分页@SYS_COMMON_LJPD;字典下拉框是否分页展示';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."YXPX" IS '允许排序@SYS_COMMON_LJPD';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."LBZS" IS '列表展示@SYS_COMMON_LJPD';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."CXZS" IS '查询展示@SYS_COMMON_LJPD';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."XZZS" IS '新增展示@SYS_COMMON_LJPD';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."BJZS" IS '编辑展示@SYS_COMMON_LJPD';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."XQZS" IS '详情展示@SYS_COMMON_LJPD';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."CXBT" IS '查询必填@SYS_COMMON_LJPD';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."BJBT" IS '编辑必填@SYS_COMMON_LJPD';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."YXBJ" IS '允许编辑@SYS_COMMON_LJPD';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."ZDZDLB" IS '字段字典类别@SYS_COMMON_ZDLB';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."ZDYWLB" IS '字典业务类别@SYS_SJGL_ZDYWLB';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."GSHFF" IS '格式化方法;方法名称，传入参数：数据、字段描述对象、行数据';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."FGSHFF" IS '反格式化方法;方法名称，传入参数：数据、字段描述对象、行数据';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."SZHD" IS '设值回调;设置值的回调方法';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."ZDTS" IS '字段提示';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."HDYZGZ" IS '后端验证规则;人工输入';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."QDYZGZ" IS '前端验证规则;人工输入';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."STYLE" IS '前端样式;人工输入';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."CSSL" IS 'CSS类;将填充到class中';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."QCBH" IS '去重编号';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_SJZD"."BZZD" IS '标准字段';

-- ----------------------------
-- Records of SYS_SJGL_SJZD
-- ----------------------------
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('FF9BACCE13CE4573B4A876CA011059A3', '20181211224756', '20181214203942', '1', '20', '{}', 'SYS_SJGL_SJZD', 'zdmc', '字段名称', null, 'ZDMC', 'ZIDUANMINGCHENG', 'VARCHAR2', '128', '100', null, null, null, 'input', '0', '0', '0', '1', '1', '1', '1', '1', '0', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('45736A87D81D4D8980D1FB219E6A8BE3', '20181211224756', '20181211224756', '1', '150', '{}', 'SYS_SJGL_SJZD', 'zdms', '字段描述', null, 'ZDMS', 'ZIDUANMIAOSHU', 'VARCHAR2', '256', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('3023B134658147718A4585E616C13F3B', '20181211224756', '20181219142808', '1', '160', '{}', 'SYS_SJGL_SJZD', 'zdjp', '字段简拼', null, 'ZDJP', 'ZIDUANJIANPIN', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('1BA6B211DC6E4D1C937C5C483BC06522', '20181211224756', '20181219142808', '1', '170', '{}', 'SYS_SJGL_SJZD', 'zdqp', '字段全拼', null, 'ZDQP', 'ZIDUANQUANPIN', 'VARCHAR2', '256', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('770CA14A7E94426E938B72B9D1018E9B', '20181211224756', '20181219132956', '1', '180', '{}', 'SYS_SJGL_SJZD', 'zdlx', '字段类型', null, 'ZDLX', 'ZIDUANLEIXING', 'VARCHAR2', '32', '80', null, null, 'VARCHAR2', 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('56821F487F8F437C96CBAE8A7AA130F1', '20181211224756', '20181219133020', '1', '190', '{}', 'SYS_SJGL_SJZD', 'zdcd', '字段长度', null, 'ZDCD', 'ZIDUANCHANGDU', 'NUMBER', '22', '80', null, null, '0', 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('D046AA7B557A47898AA2D1E7D50D9D92', '20181211224756', '20181216153321', '1', '50', '{}', 'SYS_SJGL_SJZD', 'zdkd', '字段宽度', null, 'ZDKD', 'ZIDUANKUANDU', 'NUMBER', '22', '70', null, null, null, 'input', '0', '0', '0', '1', '1', '1', '1', '1', '0', '0', '1', null, null, null, null, null, '当值小于11时列表宽度为自动，值为2时编辑页面占整行', null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('ADB0F179D0244F60A31EEE1EA775807D', '20181211224756', '20181211224756', '1', '200', '{}', 'SYS_SJGL_SJZD', 'zdgd', '字段高度', null, 'ZDGD', 'ZIDUANGAODU', 'NUMBER', '22', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('7CDCB161F7484C658F509CA887250588', '20181211224756', '20181211224756', '1', '210', '{}', 'SYS_SJGL_SJZD', 'cxmrz', '查询默认值', null, 'CXMRZ', 'CHAXUNMORENZHI', 'VARCHAR2', '64', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('6EBE618C7737482293453BB1E14A7A66', '20181211224756', '20181217192803', '1', '220', '{}', 'SYS_SJGL_SJZD', 'xzmrz', '新增默认值', null, 'XZMRZ', 'XINZENGMORENZHI', 'VARCHAR2', '64', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('7D2EEB8265B146718335D9CDE478D300', '20181211224756', '20181219132912', '1', '40', '{}', 'SYS_SJGL_SJZD', 'kjlx', '控件类型', '默认为1，1就是输入框，2是时间框，3是下拉框', 'KJLX', 'KONGJIANLEIXING', 'VARCHAR2', '32', '100', null, null, 'input', 'dict', '0', '0', '0', '1', '0', '1', '1', '1', '0', '1', '1', 'SYS_SJGL_KJLX', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('30D80E4B7587484EA16272808EE9018D', '20181211224756', '20181211224756', '1', '230', '{}', 'SYS_SJGL_SJZD', 'zddx', '字典多选', '字典下拉框是否支持多选', 'ZDDX', 'ZIDIANDUOXUAN', 'VARCHAR2', '32', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('5C0557FEC9A5423CB269122B14ACF50E', '20181211224756', '20181211224756', '1', '240', '{}', 'SYS_SJGL_SJZD', 'zdfy', '字典分页', '字典下拉框是否分页展示', 'ZDFY', 'ZIDIANFENYE', 'VARCHAR2', '32', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('8751C151370A40959182A9E03E4F784B', '20181211224756', '20181217192804', '1', '250', '{}', 'SYS_SJGL_SJZD', 'yxpx', '允许排序', null, 'YXPX', 'YUNXUPAIXU', 'VARCHAR2', '8', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('B9FC7F7B3473443798085A8A46AA0571', '20181211224756', '20181212231917', '1', '70', '{}', 'SYS_SJGL_SJZD', 'lbzs', '列表展示', null, 'LBZS', 'LIEBIAOZHANSHI', 'VARCHAR2', '8', '80', null, null, null, 'dict', '0', '0', '0', '1', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('3AD3D9F7722C4538A81B403CBD245351', '20181211224756', '20181214202352', '1', '60', '{}', 'SYS_SJGL_SJZD', 'cxzs', '查询展示', null, 'CXZS', 'CHAXUNZHANSHI', 'VARCHAR2', '8', '80', null, null, null, 'dict', '0', '0', '0', '1', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('D21648C1E06F4F98871C916400D4646B', '20181211224756', '20181217175053', '1', '80', '{}', 'SYS_SJGL_SJZD', 'xzzs', '新增展示', null, 'XZZS', 'XINZENGZHANSHI', 'VARCHAR2', '8', '80', null, null, null, 'dict', '0', '0', '0', '1', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('0D4292DD1303482C9CEF754BE311EBC9', '20181211224756', '20181212231815', '1', '90', '{}', 'SYS_SJGL_SJZD', 'bjzs', '编辑展示', null, 'BJZS', 'BIANJIZHANSHI', 'VARCHAR2', '8', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('EACEC71BDB7948898AA1A567EAA734EF', '20181211224756', '20181213095716', '1', '110', '{}', 'SYS_SJGL_SJZD', 'xqzs', '详情展示', null, 'XQZS', 'XIANGQINGZHANSHI', 'VARCHAR2', '8', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('5DBCCF755D044F8AB8A6959F662F3366', '20181211224756', '20181211224756', '1', '270', '{}', 'SYS_SJGL_SJZD', 'cxbt', '查询必填', null, 'CXBT', 'CHAXUNBITIAN', 'VARCHAR2', '8', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('3DCF50309A8F4A1F8F74779B1931EF17', '20181211224756', '20181214202352', '1', '100', '{}', 'SYS_SJGL_SJZD', 'bjbt', '编辑必填', null, 'BJBT', 'BIANJIBITIAN', 'VARCHAR2', '8', '80', null, null, null, 'dict', '0', '0', '0', '1', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('3079350271334D90A88C33A8EF0F33E5', '20181211224756', '20181214202501', '1', '260', '{}', 'SYS_SJGL_SJZD', 'yxbj', '允许编辑', null, 'YXBJ', 'YUNXUBIANJI', 'VARCHAR2', '8', '80', null, null, null, 'dict', '0', '0', '0', '1', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('2B38E10AC74D42229EFBC77B9C26BA5C', '20181211224756', '20181213173321', '1', '280', '{}', 'SYS_SJGL_SJZD', 'zdzdlb', '字段字典类别', null, 'ZDZDLB', 'ZIDUANZIDIANLEIBIE', 'VARCHAR2', '32', '200', null, null, null, 'dict', '0', '1', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_ZDLB', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('8D1A2C32FAB745D69E18FFB58E176893', '20181211224756', '20181211224756', '1', '290', '{}', 'SYS_SJGL_SJZD', 'zdywlb', '字典业务类别', null, 'ZDYWLB', 'ZIDIANYEWULEIBIE', 'VARCHAR2', '32', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_SJGL_ZDYWLB', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('90F92754108946AB850F455B2514C952', '20181211224756', '20181211224756', '1', '300', '{}', 'SYS_SJGL_SJZD', 'gshff', '格式化方法', '方法名称，传入参数：数据、字段描述对象、行数据', 'GSHFF', 'GESHIHUAFANGFA', 'VARCHAR2', '64', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('8F7DE8B98FE84550970EB681C6A58061', '20181211224756', '20181211224756', '1', '310', '{}', 'SYS_SJGL_SJZD', 'fgshff', '反格式化方法', '方法名称，传入参数：数据、字段描述对象、行数据', 'FGSHFF', 'FANGESHIHUAFANGFA', 'VARCHAR2', '64', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('EB5656A70BC544699BB0841779D55EA0', '20181211224756', '20181211224756', '1', '320', '{}', 'SYS_SJGL_SJZD', 'szhd', '设值回调', '设置值的回调方法', 'SZHT', 'SHEZHIHUITIAO', 'VARCHAR2', '64', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('FA14ABD5B7074B70A5EC786F8902661D', '20181211224756', '20181216155328', '1', '330', '{}', 'SYS_SJGL_SJZD', 'zdts', '字段提示', null, 'ZDTS', 'ZIDUANTISHI', 'VARCHAR2', '256', '2', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('0407486BC1284D0985BD3D99192B3CD6', '20181211224756', '20181211224756', '1', '340', '{}', 'SYS_SJGL_SJZD', 'hdyzgz', '后端验证规则', '人工输入', 'HDYZGZ', 'HOUDUANYANZHENGGUIZE', 'VARCHAR2', '256', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('72379B00889D43C5B69E5B17D7DAAB6F', '20181211224756', '20181211224756', '1', '350', '{}', 'SYS_SJGL_SJZD', 'qdyzgz', '前端验证规则', '人工输入', 'QDYZGZ', 'QIANDUANYANZHENGGUIZE', 'VARCHAR2', '256', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('44B164B44BD6483B98CA741DAA395AC2', '20181211224756', '20181211224756', '1', '360', '{}', 'SYS_SJGL_SJZD', 'style', '前端样式', '人工输入', 'QDYS', 'QIANDUANYANGSHI', 'VARCHAR2', '256', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('2F9CEA0427EC4A4EA8D0A5543A53CECF', '20181211224756', '20181211224756', '1', '370', '{}', 'SYS_SJGL_SJZD', 'cssl', 'CSS类', '将填充到class中', 'CSSL', 'CSSLEI', 'VARCHAR2', '128', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('861EDA8CD5054DA6BCA2E1E8B23A7D23', '20181211224756', '20181211224756', '1', '380', '{}', 'SYS_SJGL_SJZD', 'qcbh', '去重编号', null, 'QZBH', 'QUZHONGBIANHAO', 'NUMBER', '22', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('93B191FC654D4296B7866105E4AE9300', '20181211224756', '20181211224756', '1', '390', '{}', 'SYS_SJGL_SJZD', 'bzzd', '标准字段', null, 'BZZD', 'BIAOZHUNZIDUAN', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('D58A70DD56FF4973A4302497C4EECF53', '20181213180855', '20181213180855', '1', '99999', '{}', null, null, null, null, null, null, null, null, '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('926C9F7F88CC49589EA424B9932B9DF4', '20181213180942', '20181213180942', '1', '99999', '{}', null, null, null, null, null, null, null, null, '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('62515063C77343F8B1824DC12D2BF794', '20181214210057', '20181216123732', '1', '430', '{}', 'SYS_SJGL_SJZD', 'dxcz', '操作', null, null, null, 'VARCHAR2', '0', '140', null, null, null, 'input', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', null, '99', 'defaultLbcz', null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('3113272B5A7E41E9B357C2C0A2970C8E', '20181214210403', '20181218103143', '1', '440', '{}', 'SYS_SJGL_SJDX', 'dxcz', '操作', null, null, null, 'VARCHAR2', '0', '130', null, null, null, 'input', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', null, '99', 'sjdxlbcz', null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('70B2626F961E42F3B7CA383139E6DAA4', '20181221100709', '20181221100939', '1', '440', '{}', '07DCAFB42634494C85B1F90A442489F1', 'dxcz', '操作', null, null, null, 'VARCHAR2', '0', '130', null, null, null, 'input', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', null, '99', 'defaultLbcz', null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('ECCEF389C0264B3F85E648BD44D9875C', '20181217164122', '20181217164122', '1', '10', '{}', 'A0AB3007C2D04BA3B8A58EC24F5550C5', 'id', '主键', '主键', 'ZJ', 'ZHUJIAN', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('FF71E0FD42934849998873B333ED5BF9', '20181217164122', '20181217181250', '1', '20', '{}', 'A0AB3007C2D04BA3B8A58EC24F5550C5', 'createdate', '创建时间', '创建时间', 'CJSJ', 'CHUANGJIANSHIJIAN', 'VARCHAR2', '14', '130', null, 'goDay:-30', null, 'time', '0', '0', '0', '0', '0', '1', '1', '1', '0', '1', '0', null, null, 'vueTimeGsh', 'vueTimeFgsh', null, null, 'zd:yyyyMMddHHmmss', null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('FA1B66E253424672B8EDFA30FC6DC279', '20181217164122', '20181218102724', '1', '300', '{}', 'A0AB3007C2D04BA3B8A58EC24F5550C5', 'etldate', '更新时间', '更新时间', 'GXSJ', 'GENGXINSHIJIAN', 'VARCHAR2', '14', '130', null, 'goDay:-30', null, 'time', '0', '0', '0', '1', '1', '0', '1', '1', '0', '0', '0', null, null, 'vueTimeGsh', 'vueTimeFgsh', null, null, 'zd:yyyyMMddHHmmss', null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('8CD2C7A4076242579AB772C56ECE04A7', '20181217164122', '20181217164122', '1', '40', '{}', 'A0AB3007C2D04BA3B8A58EC24F5550C5', 'isdel', '删除标记', '删除标记', 'SCBJ', 'SHANCHUBIAOJI', 'VARCHAR2', '10', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('4AE599170CB1432CB8C3DD7FD7C8A81B', '20181217164122', '20181217164122', '1', '50', '{}', 'A0AB3007C2D04BA3B8A58EC24F5550C5', 'ywdm', '业务代码', 'ZDRY_RYGL', 'YWDM', 'YEWUDAIMA', 'VARCHAR2', '100', '80', null, null, null, 'input', '0', '0', '0', '1', '1', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('0A9EECD77ACF41DC9FB4672F6C98E064', '20181217164122', '20181217164122', '1', '60', '{}', 'A0AB3007C2D04BA3B8A58EC24F5550C5', 'glid', '关联id', '前端传', 'GLID', 'GUANLIANID', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('20276CED3E764FF5B99FC6D7D56ACDF0', '20181217164122', '20181217164122', '1', '70', '{}', 'A0AB3007C2D04BA3B8A58EC24F5550C5', 'wjm', '文件名', '文件名', 'WJM', 'WENJIANMING', 'VARCHAR2', '500', '200', null, null, null, 'input', '0', '0', '0', '1', '1', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('586C5E4890D9406EA9A5CEF839D66FCB', '20181217164122', '20181217164122', '1', '80', '{}', 'A0AB3007C2D04BA3B8A58EC24F5550C5', 'qcm', '去重码', '去重码', 'QZM', 'QUZHONGMA', 'VARCHAR2', '100', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('77C67B7B2D1B4842A4C95A697021BEC9', '20181217164122', '20181217164122', '1', '90', '{}', 'A0AB3007C2D04BA3B8A58EC24F5550C5', 'sclb', '上传类别', 'LOCAL,FASTDFS', 'SCLB', 'SHANGCHUANLEIBIE', 'VARCHAR2', '10', '80', null, null, null, 'input', '0', '0', '0', '1', '1', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('A42DDBD9C10F471997E3183CD57FAF7A', '20181217164122', '20181217164122', '1', '100', '{}', 'A0AB3007C2D04BA3B8A58EC24F5550C5', 'sclj', '上传路径', 'ZDRY_RYGL/去重码.wjlx', 'SCLJ', 'SHANGCHUANLUJING', 'VARCHAR2', '1000', '2', null, null, null, 'input', '0', '0', '0', '1', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('8978F08492D4402BA3B117B5540F42E2', '20181217164122', '20181217164122', '1', '110', '{}', 'A0AB3007C2D04BA3B8A58EC24F5550C5', 'wjlx', '文件类型', '文件类型', 'WJLX', 'WENJIANLEIXING', 'VARCHAR2', '10', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('5D83E90B17F14B05B5F58DF062FEAA43', '20181217164122', '20181217164122', '1', '120', '{}', 'A0AB3007C2D04BA3B8A58EC24F5550C5', 'wjlb', '文件类别', '文件类别', 'WJLB', 'WENJIANLEIBIE', 'VARCHAR2', '100', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('55B01478F346499D941B2E20FFE6EF7B', '20181217164122', '20181217164122', '1', '5000', '{}', 'A0AB3007C2D04BA3B8A58EC24F5550C5', 'dxcz', '操作', null, null, null, 'VARCHAR2', null, '140', null, null, null, 'input', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', null, '99', 'defaultLbcz', null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('24E48D91B1014A63869E29309872F82E', '20181219195237', '20181219195237', '1', '10', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'yxqks', '有效期开始', '有效期开始', 'YXQKS', 'YOUXIAOQIKAISHI', 'VARCHAR2', '8', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('7B92559DBAFF4EAA99355E351DDB95F2', '20181219195237', '20181219195237', '1', '20', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'yxqjs', '有效期结束', '有效期结束', 'YXQJS', 'YOUXIAOQIJIESHU', 'VARCHAR2', '8', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('F2436C6DEFFA41AE9C5583A3A959D658', '20181219195237', '20181219195237', '1', '30', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'ssjg', '所属机构', '所属机构@SYS_COMMON_ORG', 'SSJG', 'SUOSHUJIGOU', 'VARCHAR2', '32', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_ORG', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('65A6A94E327D4E3E976A697AC2075F54', '20181219195237', '20181219195237', '1', '40', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'thlx', '用户类型', '用户类型@SYS_QX_YHLX', 'YHLX', 'YONGHULEIXING', 'VARCHAR2', '2', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_QX_YHLX', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('85776F2D3D8C47F7A11A80D3DDADD45D', '20181219195237', '20181219195237', '1', '50', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'yhdj', '用户等级', '用户等级@SYS_QX_YHDJ', 'YHDJ', 'YONGHUDENGJI', 'VARCHAR2', '2', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_QX_YHDJ', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('D12C507017D4415F85E10DAD3A798314', '20181219195237', '20181219195237', '1', '60', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'yhms', '用户描述', '用户描述', 'YHMS', 'YONGHUMIAOSHU', 'VARCHAR2', '1024', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('5A6292A51B994EACAF2EE80A960B6EBB', '20181219195237', '20181219195237', '1', '70', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'yhyx', '用户邮箱', '用户邮箱', 'YHYX', 'YONGHUYOUXIANG', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('06C3A4FC0A984684BCBF68ADC3E0296B', '20181219195237', '20181219195237', '1', '80', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'lxdh', '联系电话', '联系电话', 'LXDH', 'LIANXIDIANHUA', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('79BD924DE1D64F9D85D7824D03471351', '20181219195237', '20181219195237', '1', '90', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'lxdz', '联系地址', '联系地址', 'LXDZ', 'LIANXIDIZHI', 'VARCHAR2', '256', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('14C052D479554A12AE42C241348053C5', '20181219195237', '20181219195237', '1', '100', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'mz', '民族', '民族@SYS_COMMON_MZ', 'MZ', 'MINZU', 'VARCHAR2', '2', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_MZ', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('4BBD97EECD56418E8C05BC1984B08610', '20181219195237', '20181219195237', '1', '110', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'gj', '国籍', '国籍@SYS_COMMON_GJ', 'GJ', 'GUOJI', 'VARCHAR2', '5', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_GJ', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('9BC28584626F46F6AD397C2C84297F89', '20181219195237', '20181219195237', '1', '120', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'xl', '学历', '学历@SYS_COMMON_XL', 'XL', 'XUELI', 'VARCHAR2', '2', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_XL', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('89306EC1A677490985708F2F4052EDFC', '20181219195237', '20181219195237', '1', '130', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'zzmm', '政治面貌', '政治面貌@SYS_COMMON_ZZMM', 'ZZMM', 'ZHENGZHIMIANMAO', 'VARCHAR2', '2', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_ZZMM', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('B6A5E76AE24644E59B5BD6973F1DF3C2', '20181219195237', '20181219195237', '1', '140', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'zw', '职务', '职务@SYS_QX_ZW', 'ZW', 'ZHIWU', 'VARCHAR2', '2', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_QX_ZW', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('3A010FBA053E49DAA9D6B33A977E830D', '20181219195237', '20181219195237', '1', '150', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'zj', '职级', '职级@SYS_QX_ZJ', 'ZJ', 'ZHIJI', 'VARCHAR2', '2', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_QX_ZJ', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('291B27ECC0FD416F85A4AED603416BD9', '20181219195237', '20181219195237', '1', '160', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'bz', '备注', '备注', 'BZ', 'BEIZHU', 'VARCHAR2', '1024', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('7AE7C42AC31E44B78BF27A2D39D38927', '20181219195237', '20181219195237', '1', '170', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'id', '主键', '主键', 'ZJ', 'ZHUJIAN', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('CB257B70C3A24E31A1BC28F838C07E76', '20181219195237', '20181219195237', '1', '180', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'cjsj', '创建时间', '创建时间', 'CJSJ', 'CHUANGJIANSHIJIAN', 'VARCHAR2', '14', '130', null, 'goDay:-30', null, 'time', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, 'vueTimeGsh', 'vueTimeFgsh', null, null, 'zd:yyyyMMddHHmmss', null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('A9706F30843F472BA0D6B54EDBC31417', '20181219195237', '20181219195237', '1', '190', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'gxsj', '更新时间', '更新时间', 'GXSJ', 'GENGXINSHIJIAN', 'VARCHAR2', '14', '130', null, 'goDay:-30', null, 'time', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, 'vueTimeGsh', 'vueTimeFgsh', null, null, 'zd:yyyyMMddHHmmss', null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('2A54A97D81C8448C800A5B491C426B59', '20181219195237', '20181219195237', '1', '200', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'yxx', '有效性', '有效性@SYS_COMMON_LJPD', 'YXX', 'YOUXIAOXING', 'VARCHAR2', '8', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('0B58830D1E984EF88E7AFB1888348C79', '20181219195237', '20181219195237', '1', '210', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'px', '排序', '排序', 'PX', 'PAIXU', 'NUMBER', '22', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('98C2A07B604E49A5BF3C079C99B4950B', '20181219195237', '20181219195237', '1', '220', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'kzxx', '扩展信息', 'JSON格式', 'KZXX', 'KUOZHANXINXI', 'VARCHAR2', '4000', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('521E6D92D01043A58244BE1E3E157AD4', '20181219195237', '20181219195237', '1', '230', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'cjrxm', '创建人姓名', '创建人姓名', 'CJRXM', 'CHUANGJIANRENXINGMING', 'VARCHAR2', '64', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('718565746F1B4A2D8888E229217A83B6', '20181219195237', '20181219195237', '1', '240', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'cjrdm', '创建人代码', '创建人代码@SYS_COMMON_USER', 'CJRDM', 'CHUANGJIANRENDAIMA', 'VARCHAR2', '32', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_USER', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('D83B83D82BBD4677AF093807C1127FF9', '20181219195237', '20181219195237', '1', '250', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'cjrdwmc', '创建人单位名称', '创建人单位名称', 'CJRDWMC', 'CHUANGJIANRENDANWEIMINGCHENG', 'VARCHAR2', '256', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('F49BFD9FCBAE4AF1BA843BA7E3B57D29', '20181219195237', '20181219195237', '1', '260', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'cjrdwdm', '创建人单位代码', '创建人单位代码@SYS_COMMON_ORG', 'CJRDWDM', 'CHUANGJIANRENDANWEIDAIMA', 'VARCHAR2', '32', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_ORG', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('0FDF6FFE5F4E4A7DBE98F405CD76A720', '20181219195237', '20181219195237', '1', '270', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'yhxm', '用户姓名', '用户姓名', 'YHXM', 'YONGHUXINGMING', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('CD161CB78A824643A29618A02685C9A7', '20181219195237', '20181219195237', '1', '280', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'yhdm', '用户代码', '用户代码', 'YHDM', 'YONGHUDAIMA', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('07C9B02C364B4953BB6E7DA0C5A640AC', '20181219195237', '20181219195237', '1', '290', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'yhmm', '用户密码', '用户密码', 'YHMM', 'YONGHUMIMA', 'VARCHAR2', '64', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('C0EF11636A144252B8F7CACAC5088C02', '20181219195237', '20181219195237', '1', '300', '{}', 'AD6FF4C358284A8DB3954B3E32A51E86', 'sfzh', '身份证号', '身份证号', 'SFZH', 'SHENFENZHENGHAO', 'VARCHAR2', '18', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('2C3D85AFB9A745EE8C1E2C2D6F287300', '20181220215059', '20181220215149', '1', '20', '{}', '07DCAFB42634494C85B1F90A442489F1', 'cjsj', '创建时间', '创建时间', 'CJSJ', 'CHUANGJIANSHIJIAN', 'VARCHAR2', '14', '130', null, 'goDay:-30', null, 'time', '0', '0', '0', '1', '1', '1', '1', '1', '0', '0', '1', null, null, 'vueTimeGsh', 'vueTimeFgsh', null, null, 'zd:yyyyMMddHHmmss', null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('749882A46E0E41FB8FB7D69BC41E78C2', '20181220215059', '20181220215059', '1', '30', '{}', '07DCAFB42634494C85B1F90A442489F1', 'gxsj', '更新时间', '更新时间', 'GXSJ', 'GENGXINSHIJIAN', 'VARCHAR2', '14', '130', null, 'goDay:-30', null, 'time', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, 'vueTimeGsh', 'vueTimeFgsh', null, null, 'zd:yyyyMMddHHmmss', null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('9CAF7145FD5E4A4791248B981129DE45', '20181220215059', '20181220215059', '1', '40', '{}', '07DCAFB42634494C85B1F90A442489F1', 'yxx', '有效性', '有效性@SYS_COMMON_LJPD', 'YXX', 'YOUXIAOXING', 'VARCHAR2', '8', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('5C44EBF574CF4E87BE6658EEA369B473', '20181220215059', '20181220215059', '1', '50', '{}', '07DCAFB42634494C85B1F90A442489F1', 'px', '排序', '排序', 'PX', 'PAIXU', 'NUMBER', '22', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('56682F4E33A845E8880D5D5F483E0DF6', '20181220215059', '20181220215059', '1', '60', '{}', '07DCAFB42634494C85B1F90A442489F1', 'kzxx', '扩展信息', 'JSON格式', 'KZXX', 'KUOZHANXINXI', 'VARCHAR2', '4000', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('6477897129A44377AD0C06A15B80C1F5', '20181220215059', '20181220215149', '1', '70', '{}', '07DCAFB42634494C85B1F90A442489F1', 'cjrxm', '创建人姓名', '创建人姓名', 'CJRXM', 'CHUANGJIANRENXINGMING', 'VARCHAR2', '64', '80', null, null, null, 'input', '0', '0', '0', '1', '1', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('F4154FF4AAB7478EA5E5A51F11C650D2', '20181220215059', '20181220215149', '1', '80', '{}', '07DCAFB42634494C85B1F90A442489F1', 'cjrdm', '创建人代码', '创建人代码@SYS_COMMON_USER', 'CJRDM', 'CHUANGJIANRENDAIMA', 'VARCHAR2', '32', '80', null, null, null, 'dict', '0', '0', '0', '1', '1', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_USER', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('D512EE4117514A71B8440AB0BFB8427F', '20181220215059', '20181220215149', '1', '90', '{}', '07DCAFB42634494C85B1F90A442489F1', 'cjrdwmc', '创建人单位名称', '创建人单位名称', 'CJRDWMC', 'CHUANGJIANRENDANWEIMINGCHENG', 'VARCHAR2', '256', '80', null, null, null, 'input', '0', '0', '0', '1', '1', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('F0D755F686DC4B53AFF46186D6C2D1CC', '20181220215059', '20181220215059', '1', '100', '{}', '07DCAFB42634494C85B1F90A442489F1', 'cjrdwdm', '创建人单位代码', '创建人单位代码@SYS_COMMON_ORG', 'CJRDWDM', 'CHUANGJIANRENDANWEIDAIMA', 'VARCHAR2', '32', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_ORG', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('90F38E252871478B9FBCB7858465B589', '20181220215059', '20181221120251', '1', '110', '{}', '07DCAFB42634494C85B1F90A442489F1', 'sjdx', '数据对象', '数据对象', 'SJDX', 'SHUJUDUIXIANG', 'VARCHAR2', '32', '150', null, null, null, 'dict', '0', '0', '0', '1', '1', '1', '1', '1', '0', '0', '1', 'SYS_SJGL_SJDX', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('7A0650B4B8574884B489D43E4A00C549', '20181220215059', '20181220215216', '1', '120', '{}', '07DCAFB42634494C85B1F90A442489F1', 'czip', '操作ip', '操作ip', 'CZIP', 'CAOZUOIP', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '1', '1', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('F3EE7C3E31B349588441F4A06DFC5578', '20181220215059', '20181220215059', '1', '130', '{}', '07DCAFB42634494C85B1F90A442489F1', 'czlx', '操作类型', '操作类型', 'CZLX', 'CAOZUOLEIXING', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('44C19395246B4B3AAA26160DE810F600', '20181220215059', '20181220215546', '1', '140', '{}', '07DCAFB42634494C85B1F90A442489F1', 'url', 'URL', 'URL', 'URL', 'URL', 'VARCHAR2', '4000', '150', null, null, null, 'input', '0', '0', '0', '1', '1', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('95745976126C48FC975615C9EFFAC83C', '20181220215059', '20181221120418', '1', '150', '{}', '07DCAFB42634494C85B1F90A442489F1', 'xgcs', '相关参数', '相关参数', 'XGCS', 'XIANGGUANCANSHU', 'VARCHAR2', '4000', '2', null, null, null, 'textarea', '0', '0', '0', '1', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('A6C748953679412CB82428D6D87E817B', '20181220215059', '20181220215059', '1', '160', '{}', '07DCAFB42634494C85B1F90A442489F1', 'token', '权限id', '权限id', 'QXID', 'QUANXIANID', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('FEA7054C29F941C98CEE09F5D0A12FE4', '20181220215059', '20181220215059', '1', '10', '{}', '07DCAFB42634494C85B1F90A442489F1', 'id', '主键', '主键', 'ZJ', 'ZHUJIAN', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('00C156A2D94A4354B941794C38AACE2D', '20181220172921', '20181220172921', '1', '20', '{}', '2FA019BF3F0B434287C44330A563E1E0', 'mc', '名称', '名称', 'MC', 'MINGCHENG', 'VARCHAR2', '200', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('74EEDF9A752A437DAE87DB22C7FB7AE7', '20181220172921', '20181220172921', '1', '30', '{}', '2FA019BF3F0B434287C44330A563E1E0', 'jc', '简称', '简称', 'JC', 'JIANCHENG', 'VARCHAR2', '100', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('A7778849DDC04156AEEB70C594DECA73', '20181220172921', '20181220172921', '1', '40', '{}', '2FA019BF3F0B434287C44330A563E1E0', 'sm', '说明', '说明', 'SM', 'SHUOMING', 'VARCHAR2', '500', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('B42E92B057F54F86A58F92D4CEABB1CB', '20181220172921', '20181220172921', '1', '50', '{}', '2FA019BF3F0B434287C44330A563E1E0', 'pyjp', '拼音简拼', '拼音简拼', 'PYJP', 'PINYINJIANPIN', 'VARCHAR2', '100', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('A6E5FA289CDA4CD4AC4CBAF74C3F9D27', '20181220172921', '20181220172921', '1', '60', '{}', '2FA019BF3F0B434287C44330A563E1E0', 'lxjp', '类型简拼', '类型简拼', 'LXJP', 'LEIXINGJIANPIN', 'VARCHAR2', '50', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('D57A0A7DACBD4201B3AAE35DE089B0E8', '20181220172921', '20181220172921', '1', '70', '{}', '2FA019BF3F0B434287C44330A563E1E0', 'sourceid', '来源对象', '来源对象', 'LYDX', 'LAIYUANDUIXIANG', 'VARCHAR2', '50', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('CBBD61F728FB45ED9093C7A36B3FA07D', '20181220172921', '20181220172921', '1', '80', '{}', '2FA019BF3F0B434287C44330A563E1E0', 'yxx', '有效性', '有效性', 'YXX', 'YOUXIAOXING', 'VARCHAR2', '1', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('4DA53AAB5C844A97B159AF0E72851B5D', '20181218185659', '20181218185659', '1', '80', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'org_id', '所属机构', '所属机构', 'SSJG', 'SUOSHUJIGOU', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('8D6A552A3D8740539E2C08E0634696AA', '20181218185659', '20181218185659', '1', '90', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'contacts', '联系人', '联系人', 'LXR', 'LIANXIREN', 'VARCHAR2', '64', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('23121D03D76A47F6848E300AE95320E5', '20181218185659', '20181218185659', '1', '100', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'phone', '联系电话', '联系电话', 'LXDH', 'LIANXIDIANHUA', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('E0809F31D489428C898D17857C19D1A4', '20181220172921', '20181220172921', '1', '10', '{}', '2FA019BF3F0B434287C44330A563E1E0', 'dm', '代码', '代码', 'DM', 'DAIMA', 'VARCHAR2', '20', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('EA099AA2E21B433895ED6B622C3C704A', '20181218184808', '20181218184849', '1', '20', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'code', '应用编码', '应用编码', 'YYBM', 'YINGYONGBIANMA', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '1', '1', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('0AA8E699780147F4ADAD15ED85B2CFA2', '20181218184808', '20181218184849', '1', '30', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'name', '应用名称', '应用名称', 'YYMC', 'YINGYONGMINGCHENG', 'VARCHAR2', '128', '80', null, null, null, 'input', '0', '0', '0', '1', '1', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('A21F148D59C84773B4B80EBA9364509E', '20181218184808', '20181218184808', '1', '40', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'name_pinyin', '名称简拼', '名称简拼', 'MCJP', 'MINGCHENGJIANPIN', 'VARCHAR2', '64', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('B6E7890CFAE94E03837C23AEF15E1099', '20181218184808', '20181218184808', '1', '50', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'alias', '应用别名', '应用别名', 'YYBM', 'YINGYONGBIEMING', 'VARCHAR2', '128', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('3236EE8553D641F1AA06E3B68B155C75', '20181218184808', '20181218184808', '1', '60', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'auth_code', '授权码', '授权码', 'SQM', 'SHOUQUANMA', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('2ECDC352A81048049D63A6F4E9BFACA1', '20181218184808', '20181218184808', '1', '70', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'security_code', '安全码', '安全码', 'AQM', 'ANQUANMA', 'VARCHAR2', '8', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('C6FE105F791949E9B67C624AE5E14586', '20181218184808', '20181218184808', '1', '110', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'appversion', '应用版本', '应用版本', 'YYBB', 'YINGYONGBANBEN', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('0DF6CCB2D953428194EE1F22C7599C26', '20181218184808', '20181218184808', '1', '120', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'ip', '应用IP,可多值,","分隔', '应用IP,可多值,","分隔', 'YYIP,KDZ,","FG', 'YINGYONGIP,KEDUOZHI,","FENGE', 'VARCHAR2', '128', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('08AE85DEDEFC4E6D943289073B61C482', '20181218184808', '20181218184808', '1', '130', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'url', '应用地址', '应用地址', 'YYDZ', 'YINGYONGDIZHI', 'VARCHAR2', '128', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('1A43C3E9265B4C80A9927BD7E2510B1E', '20181218184808', '20181218184808', '1', '140', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'description', '应用描述', '应用描述', 'YYMS', 'YINGYONGMIAOSHU', 'VARCHAR2', '512', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('7ABFE84C6EEA41559863FCA292AED25D', '20181218184808', '20181218184808', '1', '150', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'user_type', '用户类型', '用户类型', 'YHLX', 'YONGHULEIXING', 'VARCHAR2', '2', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('EA1338EFDE684FF585015AD3CE0669D5', '20181218184808', '20181218184808', '1', '160', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'authority_type', '权限类型', '权限类型', 'QXLX', 'QUANXIANLEIXING', 'VARCHAR2', '2', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('8DB982234D664B189F466E95422792A3', '20181218184808', '20181218184808', '1', '170', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'sso_type', 'SSO方式', 'SSO方式', 'SSOFS', 'SSOFANGSHI', 'VARCHAR2', '5', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('363843EEC1154E0293F5DA5B9E5FBBC8', '20181218184808', '20181218184808', '1', '180', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'sso_url', 'SSO地址', 'SSO地址', 'SSODZ', 'SSODIZHI', 'VARCHAR2', '128', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('353A2DD55E4842B0930761D905B1A712', '20181218184808', '20181218184808', '1', '190', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'sso_content', 'SSO内容', 'SSO内容', 'SSONR', 'SSONEIRONG', 'VARCHAR2', '1024', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('B8BC49E596854B9B93A2E7BC78638330', '20181218184808', '20181218184808', '1', '200', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'remark', '备注', '备注', 'BZ', 'BEIZHU', 'VARCHAR2', '512', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('4253FF28C1D54A27B3A01246AA01A618', '20181218184808', '20181218184808', '1', '210', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'valid_state', '有效性', '有效性', 'YXX', 'YOUXIAOXING', 'VARCHAR2', '2', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('9EF3753C10864BE0A5ECA68D11180099', '20181218184808', '20181218184808', '1', '220', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'update_time', '更新时间', '更新时间', 'GXSJ', 'GENGXINSHIJIAN', 'VARCHAR2', '14', '130', null, 'goDay:-30', null, 'time', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, 'vueTimeGsh', 'vueTimeFgsh', null, null, 'zd:yyyyMMddHHmmss', null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('77720ED008904821B2C29158826A90BA', '20181218184808', '20181218184808', '1', '230', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'delete_state', '删除状态', '删除状态', 'SCZT', 'SHANCHUZHUANGTAI', 'VARCHAR2', '2', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('B52EF40B273D42DFBD7D4ACCFCC9D66E', '20181218184808', '20181218184808', '1', '10', '{}', '2DAE24C7EC4D4B639EAB7361638EA61A', 'id', '应用ID', '应用ID', 'YYID', 'YINGYONGID', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('07997AE0327B4C39826FEAD22836EB9D', '20181211224727', '20181216154706', '1', '430', '{}', 'SYS_SJGL_SJDX', 'id', '主键', null, 'ZJ', 'ZHUJIAN', 'VARCHAR2', '32', '2', null, null, null, 'input', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('DEF6643C4553418A9A5413B3E88D5351', '20181211224727', '20181217175132', '1', '330', '{}', 'SYS_SJGL_SJDX', 'cjsj', '创建时间', null, 'CJSJ', 'CHUANGJIANSHIJIAN', 'VARCHAR2', '14', '130', null, 'goDay:-30', null, 'time', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', null, null, 'vueTimeGsh', 'vueTimeFgsh', null, null, 'date:yyyyMMddHHmmss', null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('7D0E4866234C4E90A30D44A12A8A9256', '20181211224727', '20181217175223', '1', '340', '{}', 'SYS_SJGL_SJDX', 'gxsj', '更新时间', null, 'GXSJ', 'GENGXINSHIJIAN', 'VARCHAR2', '14', '130', null, 'goDay:-30', null, 'time', '0', '0', '0', '1', '0', '0', '1', '1', '0', '0', '0', null, null, 'vueTimeGsh', 'vueTimeFgsh', null, null, 'date:yyyyMMddHHmmss', null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('862C5DD21DFD4E03ABE18D5431A34369', '20181211224727', '20181219101612', '1', '350', '{}', 'SYS_SJGL_SJDX', 'yxx', '有效性', null, 'YXX', 'YOUXIAOXING', 'VARCHAR2', '8', '80', null, '1', '1', 'dict', '0', '0', '0', '0', '1', '1', '1', '1', '0', '1', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('B13DA5C5E54642A0B0795DC64C4DAC36', '20181211224727', '20181218214832', '1', '30', '{}', 'SYS_SJGL_SJDX', 'px', '排序', null, 'PX', 'PAIXU', 'NUMBER', '22', '80', null, null, '99999', 'input', '0', '0', '0', '1', '0', '1', '1', '1', '0', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('19B3B82F6D144DF1AB270F3CFA0145F4', '20181211224727', '20181217175246', '1', '360', '{}', 'SYS_SJGL_SJDX', 'kzxx', '扩展信息', 'JSON格式', 'KZXX', 'KUOZHANXINXI', 'VARCHAR2', '4000', '2', null, null, '{}', 'textarea', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('6D4C2E8FDF144C33A052F73A5023FC70', '20181211224727', '20181217175132', '1', '370', '{}', 'SYS_SJGL_SJDX', 'cjrxm', '创建人姓名', null, 'CJRXM', 'CHUANGJIANRENXINGMING', 'VARCHAR2', '64', '80', null, null, null, 'input', '0', '0', '0', '1', '0', '0', '1', '1', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('74C136CED3234539BE0C9BBCCA0B681E', '20181211224727', '20181217175132', '1', '380', '{}', 'SYS_SJGL_SJDX', 'cjrdm', '创建人代码', null, 'CJRDM', 'CHUANGJIANRENDAIMA', 'VARCHAR2', '32', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', 'SYS_COMMON_USER', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('46EC9E47E5B7495BAB3CA82CE1303467', '20181211224727', '20181217175132', '1', '390', '{}', 'SYS_SJGL_SJDX', 'cjrdwmc', '创建人单位名称', null, 'CJRDWMC', 'CHUANGJIANRENDANWEIMINGCHENG', 'VARCHAR2', '256', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('BABA0BA35E82425DAB5EBC6ED313FE1C', '20181211224727', '20181217175132', '1', '400', '{}', 'SYS_SJGL_SJDX', 'cjrdwdm', '创建人单位代码', null, 'CJRDWDM', 'CHUANGJIANRENDANWEIDAIMA', 'VARCHAR2', '32', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', 'SYS_COMMON_ORG', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('1791DFCBA8D24121AE9F3C3B2D536756', '20181211224727', '20181216152320', '1', '10', '{}', 'SYS_SJGL_SJDX', 'dxdm', '对象代码', '代表唯一数据对象，多处使用，唯一', 'DXDM', 'DUIXIANGDAIMA', 'VARCHAR2', '32', '1', null, null, null, 'input', '0', '0', '0', '1', '1', '1', '1', '1', '0', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('11F61230810B49B58632DFA903ACCC9C', '20181211224727', '20181216152320', '1', '20', '{}', 'SYS_SJGL_SJDX', 'dxmc', '对象名称', null, 'DXMC', 'DUIXIANGMINGCHENG', 'VARCHAR2', '128', '1', null, null, null, 'input', '0', '0', '0', '1', '1', '1', '1', '1', '0', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('C7C60D1E8D6D45D194F1694FC3373256', '20181211224727', '20181216154706', '1', '40', '{}', 'SYS_SJGL_SJDX', 'dxms', '对象描述', null, 'DXMS', 'DUIXIANGMIAOSHU', 'VARCHAR2', '4000', '2', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('3A4BA1700D9A4BEE94A0C39EBD07C719', '20181211224727', '20181219142757', '1', '410', '{}', 'SYS_SJGL_SJDX', 'dxjp', '对象简拼', null, 'DXJP', 'DUIXIANGJIANPIN', 'VARCHAR2', '512', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('24008D5E8ED94CF5A5514372D666B17C', '20181211224727', '20181219142758', '1', '420', '{}', 'SYS_SJGL_SJDX', 'dxqp', '对象全拼', null, 'DXQP', 'DUIXIANGQUANPIN', 'VARCHAR2', '512', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('C1A47EAAC6DF444AADF6AE7CEF2261EB', '20181211224727', '20181214144918', '1', '60', '{}', 'SYS_SJGL_SJDX', 'dxlb', '对象类别', '标准对象、临时对象、系统对象等人工分类', 'DXLB', 'DUIXIANGLEIBIE', 'VARCHAR2', '512', '80', null, null, '02', 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '1', '1', 'SYS_SJGL_DXLB', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('1F0D95F5C7934A9A9672B43DAAC1CFAD', '20181211224727', '20181214144952', '1', '70', '{}', 'SYS_SJGL_SJDX', 'dxlx', '对象类型', '表、视图、excel、txt等', 'DXLX', 'DUIXIANGLEIXING', 'VARCHAR2', '32', '80', null, null, 'table', 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '1', '1', 'SYS_SJGL_DXLX', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('7F242AE208054131BB6095472B1E2B17', '20181211224727', '20181218095607', '1', '50', '{}', 'SYS_SJGL_SJDX', 'dxzy', '对象作用', '增量导出、数据插入、数据更新、页面查询、页面新增、页面修改等', 'DXZY', 'DUIXIANGZUOYONG', 'VARCHAR2', '512', '2', null, null, null, 'dict', '1', '1', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_SJGL_DXZY', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('BE07EAECA1B14074840607D13D91C5C8', '20181211224727', '20181214145013', '1', '80', '{}', 'SYS_SJGL_SJDX', 'dxztlx', '对象载体类型', 'ORACLE、POSTGRESS、MYSQL、GREEPLAM、本地文件、FTP文件、FASTDFS文件、SOLR、ES、HIVE、HBASE等', 'DXZTLX', 'DUIXIANGZAITILEIXING', 'VARCHAR2', '32', '80', null, null, 'oracle', 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '1', '1', 'SYS_SJGL_DXZTLX', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('AFF62B502F2F4479A223C4D4FC604268', '20181211224727', '20181214202714', '1', '90', '{}', 'SYS_SJGL_SJDX', 'dxzt', '对象载体', '根据对象载体类型不同，表示不同的具体载体，如具体数据库、ftp等', 'DXZT', 'DUIXIANGZAITI', 'VARCHAR2', '32', '80', null, null, 'default', 'input', '0', '0', '0', '1', '1', '1', '1', '1', '0', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('42DDB02C6BE54F3287E966536A28FF36', '20181211224727', '20181211224727', '1', '100', '{}', 'SYS_SJGL_SJDX', 'dxgs', '对象归属', '数据库的某个用户、ftp的目录等', 'DXGS', 'DUIXIANGGUISHU', 'VARCHAR2', '512', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('8C8F79468C5440CE958976F2F1D8B2F7', '20181211224727', '20181216152959', '1', '110', '{}', 'SYS_SJGL_SJDX', 'jtdx', '具体对象', '数据库的表视图、文件名、文件正则等', 'JTDX', 'JUTIDUIXIANG', 'VARCHAR2', '64', '1', null, null, null, 'input', '0', '0', '0', '1', '1', '1', '1', '1', '0', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('225C33985D934B8C86EA09F0602E3A15', '20181211224727', '20181217165554', '1', '120', '{}', 'SYS_SJGL_SJDX', 'zjzd', '主键字段', '用于查询详情等', 'ZJZD', 'ZHUJIANZIDUAN', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '1', '0', '1', '1', '1', '0', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('85A238DFA38C4635BF0A122D531652EC', '20181211224727', '20181211224727', '1', '130', '{}', 'SYS_SJGL_SJDX', 'qxzd', '权限字段', '进行权限控制', 'QXZD', 'QUANXIANZIDUAN', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('6252549EFB054AF092F56255A9B818BF', '20181211224727', '20181211224727', '1', '140', '{}', 'SYS_SJGL_SJDX', 'zlzd', '增量字段', '进行增量抽取等', 'ZLZD', 'ZENGLIANGZIDUAN', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('F645E558F568423FB6F3DFBF653133E5', '20181211224727', '20181211224727', '1', '150', '{}', 'SYS_SJGL_SJDX', 'qczd', '去重字段', '用于插入更新', 'QZZD', 'QUZHONGZIDUAN', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('E31106B570C34EFA99DA7A5D0ECD3A68', '20181211224727', '20181211224727', '1', '160', '{}', 'SYS_SJGL_SJDX', 'jyzd', '校验字段', '用于存放校验信息', 'XYZD', 'XIAOYANZIDUAN', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('30C8FA8F466049C7B5B18D7EA6E4455C', '20181211224727', '20181211224727', '1', '170', '{}', 'SYS_SJGL_SJDX', 'pczd', '批次字段', '用于存放批次号，知道具体数据来自哪次抽取等', 'PCZD', 'PICIZIDUAN', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('6DA0E66189F24622A5D638D7471ABE75', '20181211224727', '20181218173559', '1', '180', '{}', 'SYS_SJGL_SJDX', 'yxxzd', '有效性字段', '忘了', 'WXZD', 'WUXIAOZIDUAN', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('D2C8B252E66749AD88DE11F7AEA41CAD', '20181211224727', '20181211224727', '1', '190', '{}', 'SYS_SJGL_SJDX', 'fytjxs', '分页统计形式', '控制分页查询数据量统计形式，如：默认形式、异步统计、默认不统计', 'FYTJXS', 'FENYETONGJIXINGSHI', 'VARCHAR2', '32', '80', null, null, '1', 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '1', '1', 'SYS_SJGL_FYTJXS', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('0458F1D14CFA4F129A7C3D4080E53C3A', '20181211224727', '20181211224727', '1', '200', '{}', 'SYS_SJGL_SJDX', 'mrpx', '默认排序', '查询时的默认排序规则', 'MRPX', 'MORENPAIXU', 'VARCHAR2', '256', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('98022689F9964C5EB01277D7CDDEF414', '20181211224727', '20181211224727', '1', '210', '{}', 'SYS_SJGL_SJDX', 'cscx', '初始查询', '控制查询页面是否初始化查询', 'CSCX', 'CHUSHICHAXUN', 'VARCHAR2', '32', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('370C8E3A4D3549B5BA64612863C7CB45', '20181211224727', '20181211224727', '1', '220', '{}', 'SYS_SJGL_SJDX', 'xqan', '详情按钮', '控制是否展示', 'XQAN', 'XIANGQINGANNIU', 'VARCHAR2', '8', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('9B67E5497FEF41B59F6532E58F406380', '20181211224727', '20181211224727', '1', '230', '{}', 'SYS_SJGL_SJDX', 'cxtj', '查询条件', '控制是否展示', 'CXTJ', 'CHAXUNTIAOJIAN', 'VARCHAR2', '8', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('79D6A31B437D42BC924402FB75F00E98', '20181211224727', '20181211224727', '1', '240', '{}', 'SYS_SJGL_SJDX', 'sxxz', '属性选择', '控制是否展示', 'SXXZ', 'SHUXINGXUANZE', 'VARCHAR2', '8', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('4F5082A48E6C4383878A57DBC3E11A86', '20181211224727', '20181211224727', '1', '250', '{}', 'SYS_SJGL_SJDX', 'lbfxk', '列表复选框', '控制是否展示', 'LBFXK', 'LIEBIAOFUXUANKUANG', 'VARCHAR2', '8', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('00B7DB2CE2AB4000B8D7CA38B38C4101', '20181211224727', '20181211224727', '1', '260', '{}', 'SYS_SJGL_SJDX', 'bjxh', '编辑序号', '控制是否显示编辑页面的字段序号', 'BJXH', 'BIANJIXUHAO', 'VARCHAR2', '8', '80', null, null, null, 'dict', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('91356492ACB7420096C3B148DA2DEFEB', '20181211224727', '20181216154706', '1', '270', '{}', 'SYS_SJGL_SJDX', 'ljq', '拦截器', '后台扩展系统', 'LJQ', 'LANJIEQI', 'VARCHAR2', '512', '2', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('F5077DF906A845A0881E1AE96123AEBF', '20181211224727', '20181216154706', '1', '280', '{}', 'SYS_SJGL_SJDX', 'zddrsql', '字段导入SQL', '用于刷新对象字段', 'ZDDRSQL', 'ZIDUANDAORUSQL', 'CLOB', '4000', '2', null, null, null, 'textarea', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, 'height:200px', null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('49E9745E2F0D4B46AF2C6FB4C15D9050', '20181211224727', '20181216154706', '1', '290', '{}', 'SYS_SJGL_SJDX', 'sqlmb', 'SQL模板', '用于扩展后端，基于beetl实现', 'SQLMB', 'SQLMOBAN', 'CLOB', '4000', '2', null, null, null, 'textarea', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, 'height:200px', null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('068CFFACF6C24BD6B27C86A4141FAB87', '20181211224727', '20181218200004', '1', '300', '{}', 'SYS_SJGL_SJDX', 'cxlbkz', '查询列表扩展', '可以扩展成各种基于数据查询的展示页面。', 'CXLBKZ', 'CHAXUNLIEBIAOKUOZHAN', 'CLOB', '4000', '2', null, null, null, 'textarea', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, 'height:200px;', null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('66E00A63985547C0905A45134A435379', '20181211224727', '20181218200048', '1', '310', '{}', 'SYS_SJGL_SJDX', 'bjymkz', '编辑页面扩展', '涵盖新增、修改、详情', 'BJYMKZ', 'BIANJIYEMIANKUOZHAN', 'CLOB', '4000', '2', null, null, null, 'textarea', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, 'height:200px', null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('51F207BDDDB94A49B27125C0B7A9B6D0', '20181211224727', '20181218200057', '1', '320', '{}', 'SYS_SJGL_SJDX', 'plymkz', '批量页面扩展', '主要用于扩展批量上传页面', 'PLYMKZ', 'PILIANGYEMIANKUOZHAN', 'CLOB', '4000', '2', null, null, null, 'textarea', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('99EEAF82430242D38100B97B3B9875DE', '20181211224756', '20181216154717', '1', '420', '{}', 'SYS_SJGL_SJZD', 'id', '主键', null, 'ZJ', 'ZHUJIAN', 'VARCHAR2', '32', '2', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('2195899136A849AAAB4B2CF0157C426A', '20181211224756', '20181216154717', '1', '400', '{}', 'SYS_SJGL_SJZD', 'cjsj', '创建时间', null, 'CJSJ', 'CHUANGJIANSHIJIAN', 'VARCHAR2', '14', '2', null, 'goDay:-30', null, 'time', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', null, null, 'vueTimeGsh', 'vueTimeFgsh', null, null, 'date:yyyyMMddHHmmss', null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('E100886F3A5743A28502F153F70BF427', '20181211224756', '20181216152550', '1', '410', '{}', 'SYS_SJGL_SJZD', 'gxsj', '更新时间', null, 'GXSJ', 'GENGXINSHIJIAN', 'VARCHAR2', '14', '1', null, 'goDay:-30', null, 'time', '0', '0', '0', '1', '0', '1', '1', '1', '0', '0', '0', null, null, 'vueTimeGsh', 'vueTimeFgsh', null, null, 'date:yyyyMMddHHmmss', null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('8AFDD1C0205645A79353662E0D860616', '20181211224756', '20181213205516', '1', '120', '{}', 'SYS_SJGL_SJZD', 'yxx', '有效性', null, 'YXX', 'YOUXIAOXING', 'VARCHAR2', '8', '80', null, '1', null, 'dict', '0', '0', '0', '0', '1', '1', '1', '1', '0', '0', '1', 'SYS_COMMON_LJPD', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('F0DB1F22E60349BB93918E36FE624916', '20181211224756', '20181219132851', '1', '30', '{}', 'SYS_SJGL_SJZD', 'px', '排序', null, 'PX', 'PAIXU', 'NUMBER', '22', '80', null, null, '99999', 'input', '0', '0', '1', '1', '0', '1', '1', '1', '0', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('A4417989A5044A6C9B7296C27A788406', '20181211224756', '20181211224756', '1', '130', '{}', 'SYS_SJGL_SJZD', 'kzxx', '扩展信息', 'JSON格式', 'KZXX', 'KUOZHANXINXI', 'VARCHAR2', '4000', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('DFA69F2ADC054C5E94F1F8E7CC3FED08', '20181211224756', '20181213221141', '1', '140', '{}', 'SYS_SJGL_SJZD', 'sjdx', '数据对象', null, 'SJDX', 'SHUJUDUIXIANG', 'VARCHAR2', '32', '200', null, null, null, 'dict', '0', '1', '0', '0', '1', '1', '1', '1', '0', '1', '1', 'SYS_SJGL_SJDX', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('5D1FA50845584613A18B25AB4FC2380B', '20181211224756', '20181218101827', '1', '10', '{}', 'SYS_SJGL_SJZD', 'zddm', '字段代码', null, 'ZDDM', 'ZIDUANDAIMA', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '1', '1', '1', '1', '1', '0', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('ADB35F2D2A114A8796C580A30BE87E53', '20181220172921', '20181220172921', '1', '90', '{}', '2FA019BF3F0B434287C44330A563E1E0', 'px', '排序', '排序', 'PX', 'PAIXU', 'NUMBER', '22', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "SJSJ"."SYS_SJGL_SJZD" VALUES ('EAB393BF81A0423F9AE3B53DDC208D26', '20181220172921', '20181220172921', '1', '100', '{}', '2FA019BF3F0B434287C44330A563E1E0', 'iidd', '主键', '主键', 'ZJ', 'ZHUJIAN', 'VARCHAR2', '32', '80', null, null, null, 'input', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '1', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for SYS_SJGL_YHZDY
-- ----------------------------
DROP TABLE "SJSJ"."SYS_SJGL_YHZDY";
CREATE TABLE "SJSJ"."SYS_SJGL_YHZDY" (
"ID" VARCHAR2(32 BYTE) DEFAULT sys_guid()  NOT NULL ,
"CJSJ" VARCHAR2(14 BYTE) DEFAULT to_char(sysdate,'yyyymmddhh24miss')  NULL ,
"GXSJ" VARCHAR2(14 BYTE) DEFAULT to_char(sysdate,'yyyymmddhh24miss')  NULL ,
"YXX" VARCHAR2(8 BYTE) DEFAULT '1'  NULL ,
"PX" NUMBER DEFAULT 99999  NULL ,
"KZXX" VARCHAR2(4000 BYTE) DEFAULT '{}'  NULL ,
"CJRXM" VARCHAR2(64 BYTE) NULL ,
"CJRDM" VARCHAR2(32 BYTE) NULL ,
"CJRDWMC" VARCHAR2(256 BYTE) NULL ,
"CJRDWBM" VARCHAR2(32 BYTE) NULL ,
"SJDX" VARCHAR2(32 BYTE) NULL ,
"SJZD" VARCHAR2(32 BYTE) NULL ,
"MRZ" VARCHAR2(64 BYTE) NULL ,
"LBZS" VARCHAR2(8 BYTE) DEFAULT '1'  NULL ,
"CXZS" VARCHAR2(8 BYTE) DEFAULT '0'  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SJSJ"."SYS_SJGL_YHZDY" IS '系统-数据管理-用户自定义';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_YHZDY"."ID" IS '主键';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_YHZDY"."CJSJ" IS '创建时间';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_YHZDY"."GXSJ" IS '更新时间';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_YHZDY"."YXX" IS '有效性@SYS_COMMON_LJPD';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_YHZDY"."PX" IS '排序';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_YHZDY"."KZXX" IS '扩展信息;JSON格式';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_YHZDY"."CJRXM" IS '创建人姓名';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_YHZDY"."CJRDM" IS '创建人代码@SYS_COMMON_USER';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_YHZDY"."CJRDWMC" IS '创建人单位名称';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_YHZDY"."CJRDWBM" IS '创建人单位代码@SYS_COMMON_ORG';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_YHZDY"."SJDX" IS '数据对象';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_YHZDY"."SJZD" IS '数据字段';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_YHZDY"."MRZ" IS '默认值';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_YHZDY"."LBZS" IS '列表展示@SYS_COMMON_LJPD';
COMMENT ON COLUMN "SJSJ"."SYS_SJGL_YHZDY"."CXZS" IS '查询展示@SYS_COMMON_LJPD';

-- ----------------------------
-- Records of SYS_SJGL_YHZDY
-- ----------------------------

-- ----------------------------
-- Table structure for SYS_ZD_TYZD
-- ----------------------------
DROP TABLE "SJSJ"."SYS_ZD_TYZD";
CREATE TABLE "SJSJ"."SYS_ZD_TYZD" (
"ID" VARCHAR2(32 BYTE) DEFAULT sys_guid()  NOT NULL ,
"DM" VARCHAR2(100 BYTE) NULL ,
"MC" VARCHAR2(4000 BYTE) NULL ,
"MS" VARCHAR2(4000 BYTE) NULL ,
"PX" NUMBER DEFAULT 99999  NULL ,
"JP" VARCHAR2(4000 BYTE) NULL ,
"QP" VARCHAR2(4000 BYTE) NULL ,
"ZDLB" VARCHAR2(100 BYTE) NULL ,
"BZZDLB" VARCHAR2(100 BYTE) NULL ,
"LBSQL" VARCHAR2(500 BYTE) NULL ,
"CREATEDATE" VARCHAR2(14 BYTE) DEFAULT to_char(sysdate,'yyyymmddhh24miss')  NULL ,
"ETLDATE" VARCHAR2(14 BYTE) DEFAULT to_char(sysdate,'yyyymmddhh24miss')  NULL ,
"SJLY" VARCHAR2(300 BYTE) NULL ,
"ISDEL" VARCHAR2(10 BYTE) DEFAULT '0'  NULL ,
"UPNODE" VARCHAR2(100 BYTE) NULL ,
"CACHE" VARCHAR2(10 BYTE) DEFAULT '1'  NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON TABLE "SJSJ"."SYS_ZD_TYZD" IS '系统-字典-统一字典';
COMMENT ON COLUMN "SJSJ"."SYS_ZD_TYZD"."ID" IS '主键';
COMMENT ON COLUMN "SJSJ"."SYS_ZD_TYZD"."DM" IS '代码';
COMMENT ON COLUMN "SJSJ"."SYS_ZD_TYZD"."MC" IS '名称';
COMMENT ON COLUMN "SJSJ"."SYS_ZD_TYZD"."MS" IS '描述';
COMMENT ON COLUMN "SJSJ"."SYS_ZD_TYZD"."PX" IS '排序;建议排序都按10、20、30的方式排序，方便修改穿插';
COMMENT ON COLUMN "SJSJ"."SYS_ZD_TYZD"."JP" IS '简拼';
COMMENT ON COLUMN "SJSJ"."SYS_ZD_TYZD"."QP" IS '全拼';
COMMENT ON COLUMN "SJSJ"."SYS_ZD_TYZD"."ZDLB" IS '字典类别';
COMMENT ON COLUMN "SJSJ"."SYS_ZD_TYZD"."BZZDLB" IS '标准字典类别;用于数据标准化等场景，如性别可以有几套字典，然后关联一个标准字典,进一步通过mc关联';
COMMENT ON COLUMN "SJSJ"."SYS_ZD_TYZD"."LBSQL" IS '类别SQL;当次SQL为空时，字典默认在此统一字典表中，有SQL则通过SQL获取字典';
COMMENT ON COLUMN "SJSJ"."SYS_ZD_TYZD"."CREATEDATE" IS '创建时间';
COMMENT ON COLUMN "SJSJ"."SYS_ZD_TYZD"."ETLDATE" IS '更新时间';
COMMENT ON COLUMN "SJSJ"."SYS_ZD_TYZD"."SJLY" IS '数据来源';
COMMENT ON COLUMN "SJSJ"."SYS_ZD_TYZD"."ISDEL" IS '是否删除;与共享平台一致，所以这里没有采用中文简拼命名';
COMMENT ON COLUMN "SJSJ"."SYS_ZD_TYZD"."UPNODE" IS '父节点';
COMMENT ON COLUMN "SJSJ"."SYS_ZD_TYZD"."CACHE" IS '是否缓存';

-- ----------------------------
-- Records of SYS_ZD_TYZD
-- ----------------------------
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8BC8FB1505F94766971264D977E9D888', '180', '刚果民主共和国', null, '99999', 'GGMZGHG', 'GANGGUOMINZHUGONGHEGUO', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E1414BD6E79D458D9590D37EE4DA4069', '148', '乍得', null, '99999', 'ZD', 'ZHADE', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E05E18A653A24CAEB66BE03ECB9E7A4F', '292', '直布罗陀', null, '99999', 'ZBLT', 'ZHIBULUOTUO', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4A4E8CF68EF644F994EFB2056C275041', '152', '智利', null, '99999', 'ZL', 'ZHILI', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('CD94676531B94F88A4575F838F4D9E9D', '140', '中非', null, '99999', 'ZF', 'ZHONGFEI', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7FFEDFB42D53467F92F501E53571FC8A', '536', '中间地带', null, '99999', 'ZJDD', 'ZHONGJIANDIDAI', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('00E2818900834A5A824F21F96700503B', '784', '阿拉伯联合酋长国', null, '99999', 'ALBLHQCG', 'ALABOLIANHEQIUCHANGGUO', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('954A4D4E7F3D4367B56931F154801D84', 'SYS_COMMON_XB', '系统-公用-性别', null, '60', 'XT-GY-XB', 'XITONG-GONGYONG-XINGBIE', 'SYS_COMMON_ZDLB', null, null, '20170630104524', '20181208135608', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('EB04CD96D4BF4E008F2DEEE544A5C0E4', '1', '男', null, '99999', 'N', 'NAN', 'SYS_COMMON_XB', null, null, '20170630105230', '20180620130449', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('60662DE438F34AA396708175C51A7F48', '2', '女', null, '99999', 'N', 'NV', 'SYS_COMMON_XB', null, null, '20170630105343', '20180620130449', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('26FD192A341243B68A41727533790DD4', 'SYS_COMMON_LJPD', '系统-公用-逻辑判断', '逻辑判断-是否', '50', 'XT-GY-LJPD', 'XITONG-GONGYONG-LUOJIPANDUAN', 'SYS_COMMON_ZDLB', null, null, '20170629170132', '20181208135513', 'jingma', '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('32820A1E2F46421B8A23E0D9D1D23A60', '0', '否', null, '99999', 'F', 'FOU', 'SYS_COMMON_LJPD', null, null, '20170629170132', '20170629170132', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('10405321B60D4BCEB3711171F2BA61F5', '1', '是', null, '99999', 'S', 'SHI', 'SYS_COMMON_LJPD', null, null, '20170629170132', '20170629170132', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F79B89FC06844F3E8648E3B14FCB78AA', 'SYS_COMMON_MZ', '系统-公用-民族', null, '60', 'XT-GY-MZ', 'XITONG-GONGYONG-MINZU', 'SYS_COMMON_ZDLB', null, null, '20170630102221', '20181208135641', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7729A402A72245BE9458DB7D938ABE9F', '818', '埃及', null, '99999', 'AJ', 'AIJI', 'SYS_COMMON_GJ', null, null, '20170630102221', '20170630102221', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('95FB963F6C7C4843BDC814F335F3B48B', '598', '巴布亚新几内亚', null, '99999', 'BBYXJNY', 'BABUYAXINJINEIYA', 'SYS_COMMON_GJ', null, null, '20170630102221', '20170630102221', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A62808C60BBA41E08172DAAF9F2D99AB', '600', '巴拉圭', null, '99999', 'BLG', 'BALAGUI', 'SYS_COMMON_GJ', null, null, '20170630102221', '20170630102221', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7B4DB13D5F7949C4BBB1EF5ECA17F378', '643', '俄罗斯联邦', null, '99999', 'ELSLB', 'ELUOSILIANBANG', 'SYS_COMMON_GJ', null, null, '20170630102221', '20170630102221', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('817EB924E7554903A86B2F67D0FEF347', '630', '波多黎各', null, '99999', 'BDLG', 'BODUOLIGE', 'SYS_COMMON_GJ', null, null, '20170630102221', '20170630102221', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C8E9BE71B047431E979E75251F3DD97F', '616', '波兰', null, '99999', 'BL', 'BOLAN', 'SYS_COMMON_GJ', null, null, '20170630102221', '20170630102221', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('61E49CD5A7184D47A504FCCCF183475E', '626', '东帝汶', null, '99999', 'DDW', 'DONGDIWEN', 'SYS_COMMON_GJ', null, null, '20170630102221', '20170630102221', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3E44969ED8DE46D4A0322594F3319BA0', '768', '多哥', null, '99999', 'DG', 'DUOGE', 'SYS_COMMON_GJ', null, null, '20170630102221', '20170630102221', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0F1AE55E8D414C0A9B42DAE79A385BA7', '608', '菲律宾', null, '99999', 'FLB', 'FEILVBIN', 'SYS_COMMON_GJ', null, null, '20170630102221', '20170630102221', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4E2D5EE2FEC743B7A9EB4720DF86C783', '624', '几内亚比绍', null, '99999', 'JNYBS', 'JINEIYABISHAO', 'SYS_COMMON_GJ', null, null, '20170630102221', '20170630102221', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F4ED73387B2448C1BE71384282E6B7A8', '716', '津巴布韦', null, '99999', 'JBBW', 'JINBABUWEI', 'SYS_COMMON_GJ', null, null, '20170630102221', '20170630102221', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('52FB7664CBE34AA89561B76BA0EAA616', '634', '卡塔尔', null, '99999', 'KTE', 'KATAER', 'SYS_COMMON_GJ', null, null, '20170630102221', '20170630102221', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C28C5AEFC99B416585648D1FEFB58162', '638', '留尼汪', null, '99999', 'LNW', 'LIUNIWANG', 'SYS_COMMON_GJ', null, null, '20170630102221', '20170630102221', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('493F6EB80C384DA8AC55E02AB1F3D05C', '646', '卢旺达', null, '99999', 'LWD', 'LUWANGDA', 'SYS_COMMON_GJ', null, null, '20170630102221', '20170630102221', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8EC5C6327BFF41B0906693F04448DF61', '642', '罗马尼亚', null, '99999', 'LMNY', 'LUOMANIYA', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('2C78E518F8FD47E0A3886C87B446B7CE', '840', '美国', null, '99999', 'MG', 'MEIGUO', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('08B04228B82E4710A6D6A6D3B2F27015', '850', '美属维尔京群岛', null, '99999', 'MSWEJQD', 'MEISHUWEIERJINGQUNDAO', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B7ECFC6C948D446793AD122F7A5C3A85', '604', '秘鲁', null, '99999', 'ML', 'MILU', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('629B90F188D94E32B5C24101EABE6841', '710', '南非', null, '99999', 'NF', 'NANFEI', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7DBA728ECA12463E9430F76A841B3C6F', '570', '纽埃', null, '99999', 'NA', 'NIUAI', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('5E17FE969E444730BE8E280EC56B6B06', '578', '挪威', null, '99999', 'NW', 'NUOWEI', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('2785CC0A7AA844658A598B6F9E604DFF', '574', '诺福克岛', null, '99999', 'NFKD', 'NUOFUKEDAO', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('526989C0789E4683A3C7A65A5D2A3CBA', '612', '皮特凯恩岛', null, '99999', 'PTKED', 'PITEKAIENDAO', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('512D5CFF5F834441872A8286BC5B0B67', '620', '葡萄牙', null, '99999', 'PTY', 'PUTAOYA', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('CFC2387E41D040E9BC4C8AE850897310', '752', '瑞典', null, '99999', 'RD', 'RUIDIAN', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6590A4105F6241F7A95EDEF7A851E858', '756', '瑞士', null, '99999', 'RS', 'RUISHI', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C770FE4034B745F1A35849F10699444B', '694', '塞拉利昂', null, '99999', 'SLLA', 'SAILALIANG', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('783AE88E8D824ACFACD3412E095EDFAF', '686', '塞内加尔', null, '99999', 'SNJE', 'SAINEIJIAER', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('80C017279A0D4A0C8B3A03FAE044B955', '690', '塞舌尔', null, '99999', 'SSE', 'SAISHEER', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6D92566B43CC4DBD8A255E95DC36DB92', '682', '沙特阿拉伯', null, '99999', 'STALB', 'SHATEALABO', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4B834FFE3ABA4AAABBC6B00357161BCA', '854', '布基纳法索', null, '99999', 'BJNFS', 'BUJINAFASUO', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('07B7939BC81F470BB472E096E33E7E8B', '678', '圣多美和普林西比', null, '99999', 'SDMHPLXB', 'SHENGDUOMEIHEPULINXIBI', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F22F01209CFA4CBE80C857E9437021FA', '654', '圣赫勒拿', null, '99999', 'SHLN', 'SHENGHELENA', 'SYS_COMMON_GJ', null, null, '20170630102222', '20170630102222', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8E8CCD1F9EB24C2CB63E24852D87516C', '662', '圣卢西亚', null, '99999', 'SLXY', 'SHENGLUXIYA', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('CA9C1B3412444BCEB5D75C85B9B12A69', '674', '圣马力诺', null, '99999', 'SMLN', 'SHENGMALINUO', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('5FC8780B226B4526B97072EC83AD992B', '666', '圣皮埃尔和密克隆', null, '99999', 'SPAEHMKL', 'SHENGPIAIERHEMIKELONG', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('9AA1B4A294164852BC5CB5AB9A5E2A89', '670', '圣文森特和格林纳丁斯', null, '99999', 'SWSTHGLNDS', 'SHENGWENSENTEHEGELINNADINGSI', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7C536A1B47204AB0AD8C23444DE186E9', '744', '斯瓦尔巴岛和扬马延岛', null, '99999', 'SWEBDHYMYD', 'SIWAERBADAOHEYANGMAYANDAO', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('9ABAF18AC6344DBDA181E0FCB19D40BE', '748', '斯威士兰', null, '99999', 'SWSL', 'SIWEISHILAN', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B6DA20AA01544FECB276B3DA84D42362', '736', '苏丹', null, '99999', 'SD', 'SUDAN', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('12EB42FC747F485193B2A248575D5297', '740', '苏里南', null, '99999', 'SLN', 'SULINAN', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('5E990A18CB3F4204BE0FD0DF86D2D529', '706', '索马里', null, '99999', 'SML', 'SUOMALI', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8E25DE3E10FB4A4E824CFEC099DF4B40', '834', '坦桑尼亚', null, '99999', 'TSNY', 'TANSANGNIYA', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D277DB95310140DC84D4E23F598087D5', '776', '汤加', null, '99999', 'TJ', 'TANGJIA', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DDE7FCE84AEC4AEBB29323A57483319F', '796', '特克斯和凯科斯群岛', null, '99999', 'TKSHKKSQD', 'TEKESIHEKAIKESIQUNDAO', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('08FE6088317944ABAA93D31F81AE9363', '780', '特立尼达和多哥巴', null, '99999', 'TLNDHDGB', 'TELINIDAHEDUOGEBA', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('EF055B441A654E7D8D6B2E059D9BEC81', '788', '突尼斯', null, '99999', 'TNS', 'TUNISI', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4856ABB27D7D4A7A9BA9742855678AC7', '798', '图瓦卢', null, '99999', 'TWL', 'TUWALU', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('438EC6CF15ED49AC9134E1D5555B3967', '792', '土耳其', null, '99999', 'TEQ', 'TUERQI', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E42029283A1549648BC231CCA0B967B8', '772', '托克劳', null, '99999', 'TKL', 'TUOKELAO', 'SYS_COMMON_GJ', null, null, '20170630102223', '20170630102223', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FD73B5D791DA407C8724BDFBD7FF35D2', '876', '瓦利斯和富图纳', null, '99999', 'WLSHFTN', 'WALISIHEFUTUNA', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7872FA42969E4D648E63566DF4D462FB', '862', '委内瑞拉', null, '99999', 'WNRL', 'WEINEIRUILA', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('BDF3E20F258E4325BFD8BA7CC4748561', '800', '乌干达', null, '99999', 'WGD', 'WUGANDA', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D9773222EBAB4757B87113680033FBDD', '804', '乌克兰', null, '99999', 'WKL', 'WUKELAN', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('737AAA77FD6D4441A80A13EBD826958D', '858', '乌拉圭', null, '99999', 'WLG', 'WULAGUI', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('26B339516058484CB4CF27D41A003B57', '724', '西班牙', null, '99999', 'XBY', 'XIBANYA', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('EBF3475D59DB4CC79570A2273E85D6C6', '732', '西撒哈拉', null, '99999', 'XSHL', 'XISAHALA', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('CA9FAB81EB3F4E29AC4990C947A62B5C', '882', '萨摩亚', null, '99999', 'SMY', 'SAMOYA', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4C53E2B445D84CDAA93A49CA8E2C4F33', '702', '新加坡', null, '99999', 'XJP', 'XINJIAPO', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6CF27491A37246329D948C292011D0C1', '891', '南斯拉夫', null, '99999', 'NSLF', 'NANSILAFU', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('62F738DC214B42DDA25FB4948D37CDF0', '826', '英国', null, '99999', 'YG', 'YINGGUO', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('47407C0F0BF64A55A1DBF86131FB6075', 'SYS_COMMON_ZDLB', '系统-公用-字典类别', '字典类别的自我定义', '10', 'XT-GY-ZDLB', 'XITONG-GONGYONG-ZIDIANLEIBIE', 'SYS_COMMON_ZDLB', null, null, '20170628194254', '20181208135432', 'jingma', '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6EEED707FFA14400B2B0F3FABE3953BF', '704', '越南', null, '99999', 'YN', 'YUENAN', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B2C4F47768B642C7A6DEAE0F527C3615', 'SYS_COMMON_HYZK', '系统-公用-婚姻状况', null, '100', 'HYZK', 'HUNYINZHUANGKUANG', 'SYS_COMMON_ZDLB', null, null, '20170630142622', '20181208133133', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('AD8DC443EE3B436D81960838B13A2246', '1', '未婚', null, '99999', 'WH', 'WEIHUN', 'SYS_COMMON_HYZK', null, null, '20170630142703', '20180620130449', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8187BBA9C00949F79336C86B7156CA4D', '2', '已婚', null, '99999', 'YH', 'YIHUN', 'SYS_COMMON_HYZK', null, null, '20170630142823', '20180620130449', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('41F4E759DED84FC5A148D409804172C9', '3', '丧偶', null, '99999', 'SO', 'SANGOU', 'SYS_COMMON_HYZK', null, null, '20170630142843', '20180620130449', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FBB83EC0F89C49D5AF82AC359D941B00', '4', '离婚', null, '99999', 'LH', 'LIHUN', 'SYS_COMMON_HYZK', null, null, '20170630142907', '20180620130449', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('051DDF924650476098E3BE55C4D23C81', '894', '赞比亚', null, '99999', 'ZBY', 'ZANBIYA', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C380F82026284901BC806EE39CE121AC', '012', '阿尔及利亚', null, '99999', 'AEJLY', 'AERJILIYA', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('85F75D15E9A442C181BBC71BA63E26A5', '660', '安圭拉', null, '99999', 'AGL', 'ANGUILA', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('BB8428C4B833481DACF85E3B614E082D', '533', '阿鲁巴', null, '99999', 'ALB', 'ALUBA', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('2571FB2A238341FBB025C43A0D391E43', '031', '阿塞拜疆', null, '99999', 'ASBJ', 'ASAIBAIJIANG', 'SYS_COMMON_GJ', null, null, '20170630102225', '20170630102225', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('2610DBB7E87F48638C2382D6EC6CC6ED', '158', '台湾', null, '99999', 'TW', 'TAIWAN', 'SYS_COMMON_GJ', null, null, '20170630102225', '20170630102225', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8C35AD07F98C4951A1CEF7BC27C3FA69', '191', '克罗地亚', null, '99999', 'KLDY', 'KELUODIYA', 'SYS_COMMON_GJ', null, null, '20170630102225', '20170630102225', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('BF9A25927F484635B5931A4636BD9470', '203', '捷克', null, '99999', 'JK', 'JIEKE', 'SYS_COMMON_GJ', null, null, '20170630102225', '20170630102225', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6940F81A043B48FDB76DFFB7AE9EF987', '231', '埃塞俄比亚', null, '99999', 'ASEBY', 'AISAIEBIYA', 'SYS_COMMON_GJ', null, null, '20170630102225', '20170630102225', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('663D261936E941DE8F956E17A9C4ED94', '398', '哈萨克斯坦', null, '99999', 'HSKST', 'HASAKESITAN', 'SYS_COMMON_GJ', null, null, '20170630102225', '20170630102225', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FDCA509F42E741A1B9ADFB03929BB68B', '428', '拉脱维亚', null, '99999', 'LTWY', 'LATUOWEIYA', 'SYS_COMMON_GJ', null, null, '20170630102225', '20170630102225', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8BCCD13BDB5546B0A83E90F9059152A0', '417', '吉尔吉斯坦', null, '99999', 'JEJST', 'JIERJISITAN', 'SYS_COMMON_GJ', null, null, '20170630102225', '20170630102225', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7504D97AE4EB49E19234F0B6BF56B8D1', '807', '前南马其顿', null, '99999', 'QNMQD', 'QIANNANMAQIDUN', 'SYS_COMMON_GJ', null, null, '20170630102225', '20170630102225', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B0F4895FA9F34EF298966218483387C2', '584', '马绍尔群岛', null, '99999', 'MSEQD', 'MASHAOERQUNDAO', 'SYS_COMMON_GJ', null, null, '20170630102225', '20170630102225', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4B0206A702914BF8A08FED9AFF1B3E3E', '175', '马约特', null, '99999', 'MYT', 'MAYUETE', 'SYS_COMMON_GJ', null, null, '20170630102225', '20170630102225', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('56544E8B074E4223859B04A8580A1B5C', '583', '密克罗尼西亚联邦', null, '99999', 'MKLNXYLB', 'MIKELUONIXIYALIANBANG', 'SYS_COMMON_GJ', null, null, '20170630102225', '20170630102225', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E59D4A5AC61543A88E88E8EFEE29DBB8', '498', '摩尔多瓦', null, '99999', 'MEDW', 'MOERDUOWA', 'SYS_COMMON_GJ', null, null, '20170630102226', '20170630102226', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('626BD9D440EF472E990B22A0C5DB1B57', '530', '荷属安的列斯', null, '99999', 'HSADLS', 'HESHUANDELIESI', 'SYS_COMMON_GJ', null, null, '20170630102226', '20170630102226', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FB74B6D6E1EE4D62A79CDE95D3904B2A', '585', '帕劳', null, '99999', 'PL', 'PALAO', 'SYS_COMMON_GJ', null, null, '20170630102226', '20170630102226', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B98707B7D79E4BC2BB1F114A883C81B5', '275', '巴勒斯坦', null, '99999', 'BLST', 'BALESITAN', 'SYS_COMMON_GJ', null, null, '20170630102226', '20170630102226', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('2C5224D4D7D44359A589E65C2669214D', '591', '巴拿马', null, '99999', 'BNM', 'BANAMA', 'SYS_COMMON_GJ', null, null, '20170630102226', '20170630102226', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8D37776CDA294363B644D8D71DBA4558', '659', '圣基茨和尼维斯', null, '99999', 'SJCHNWS', 'SHENGJICIHENIWEISI', 'SYS_COMMON_GJ', null, null, '20170630102226', '20170630102226', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('327B19FC1212460D87F0178253678F4B', '703', '斯洛伐克', null, '99999', 'SLFK', 'SILUOFAKE', 'SYS_COMMON_GJ', null, null, '20170630102226', '20170630102226', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FDFBF519D56D461289ABC630283E13B4', '705', '斯洛文尼亚', null, '99999', 'SLWNY', 'SILUOWENNIYA', 'SYS_COMMON_GJ', null, null, '20170630102226', '20170630102226', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E84686D13F1342BBAAED46BF32DFC1AA', '239', '南乔治亚岛和南桑德韦奇岛', null, '99999', 'NQZYDHNSDWQD', 'NANQIAOZHIYADAOHENANSANGDEWEIQIDAO', 'SYS_COMMON_GJ', null, null, '20170630102226', '20170630102226', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E05B570D45514337975AFCBD546E2B51', '762', '塔吉克斯坦', null, '99999', 'TJKST', 'TAJIKESITAN', 'SYS_COMMON_GJ', null, null, '20170630102226', '20170630102226', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('977CA63616B8459DBB38751ECF72652D', '795', '土库曼斯坦', null, '99999', 'TKMST', 'TUKUMANSITAN', 'SYS_COMMON_GJ', null, null, '20170630102226', '20170630102226', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('761556F2BDFF4E07B160DFA96F5D6233', '581', '美国本土外小岛屿', null, '99999', 'MGBTWXDY', 'MEIGUOBENTUWAIXIAODAOYU', 'SYS_COMMON_GJ', null, null, '20170630102226', '20170630102226', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('2E9CC191A98C458BA6D93BE2F7499622', '860', '乌兹别克斯坦', null, '99999', 'WZBKST', 'WUZIBIEKESITAN', 'SYS_COMMON_GJ', null, null, '20170630102226', '20170630102226', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B5F8AE28657C498BB78D086651B3B4B2', '887', '也门', null, '99999', 'YM', 'YEMEN', 'SYS_COMMON_GJ', null, null, '20170630102227', '20170630102227', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6C17734E253D447386A37C76A5DA64C3', 'SYS_COMMON_GJ', '系统-公用-国籍', null, '100', 'GJ', 'GUOJI', 'SYS_COMMON_ZDLB', null, null, '20170630102227', '20181208132821', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4804A28CA43444EB9A9400AFBA499E34', '9', '其他', null, '99999', 'QT', 'QITA', 'SYS_COMMON_HYZK', null, null, '20170630142931', '20180620130449', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('94DC3D63AC294CBCADCD16663B13BAF0', '01', '汉族', null, '99999', 'HZ', 'HANZU', 'SYS_COMMON_MZ', null, null, '20170629215951', '20170629215951', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D061D09A615F4576B2338A68ACDB0B5D', '02', '蒙古族', null, '99999', 'MGZ', 'MENGGUZU', 'SYS_COMMON_MZ', null, null, '20170629215951', '20170629215951', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DC6E0D164A864859BD306AD0B54662C8', '03', '回族', null, '99999', 'HZ', 'HUIZU', 'SYS_COMMON_MZ', null, null, '20170629215951', '20170629215951', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('87D2651063974613B2DCF5969B919EDD', '04', '藏族', null, '99999', 'CZ', 'CANGZU', 'SYS_COMMON_MZ', null, null, '20170629215951', '20170629215951', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3912345C318443C6975CAAD4D44D9DD0', '05', '维吾尔族', null, '99999', 'WWEZ', 'WEIWUERZU', 'SYS_COMMON_MZ', null, null, '20170629215951', '20170629215951', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4ACF8F16D90C4914A96FBFE1BB8AC602', '06', '苗族', null, '99999', 'MZ', 'MIAOZU', 'SYS_COMMON_MZ', null, null, '20170629215951', '20170629215951', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('66A8AB4B51A34052BC50AE32BAD1E3CF', '07', '彝族', null, '99999', 'YZ', 'YIZU', 'SYS_COMMON_MZ', null, null, '20170629215951', '20170629215951', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('27BF2C32A5C943B28F6173C5991508CF', '08', '壮族', null, '99999', 'ZZ', 'ZHUANGZU', 'SYS_COMMON_MZ', null, null, '20170629215951', '20170629215951', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B33BB989BF934BA98CAB942BF6BB0298', '09', '布依族', null, '99999', 'BYZ', 'BUYIZU', 'SYS_COMMON_MZ', null, null, '20170629215951', '20170629215951', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('174BD44049764DE8B3582FAAD3427FBE', '10', '朝鲜族', null, '99999', 'CXZ', 'CHAOXIANZU', 'SYS_COMMON_MZ', null, null, '20170629215951', '20170629215951', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1032646D89214F99A4ED3F8314E38CB7', '11', '满族', null, '99999', 'MZ', 'MANZU', 'SYS_COMMON_MZ', null, null, '20170629215951', '20170629215951', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7630E8291B0C41169AA578F61BA5AFB3', '12', '侗族', null, '99999', 'DZ', 'DONGZU', 'SYS_COMMON_MZ', null, null, '20170629215951', '20170629215951', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C3D5DC241C4C4A39B0CF71ACA790DC7C', '13', '瑶族', null, '99999', 'YZ', 'YAOZU', 'SYS_COMMON_MZ', null, null, '20170629215951', '20170629215951', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('86CAC7511D654C69BB5EAF0EE93CEB93', '14', '白族', null, '99999', 'BZ', 'BAIZU', 'SYS_COMMON_MZ', null, null, '20170629215951', '20170629215951', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3D589261416A4974BBDF8D8D4A8E6170', '15', '土家族', null, '99999', 'TJZ', 'TUJIAZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('9F0A13F2B54C4DFB8476D923A8796086', '16', '哈尼族', null, '99999', 'HNZ', 'HANIZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('554AFB9FA9E54931979F184C564B2C42', '17', '哈萨克族', null, '99999', 'HSKZ', 'HASAKEZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('68329D1662124D47A08DCF94CA03FE90', '18', '傣族', null, '99999', 'DZ', 'DAIZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('96C50F69CF194B948E8145C7FC1DEEAA', '19', '黎族', null, '99999', 'LZ', 'LIZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1D14B9DABB424F9D95E36B6C1A28FAC7', '20', '傈僳族', null, '99999', 'LSZ', 'LISUZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FE1170B4723B439F8BB38C73A00E2151', '21', '佤族', null, '99999', 'WZ', 'WAZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('AD6B3F9BC6F04369BE9BCC77C212E916', '22', '畲族', null, '99999', 'SZ', 'SHEZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('08BF6E408EE445D1B0E7ADF935259E6E', '23', '高山族', null, '99999', 'GSZ', 'GAOSHANZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B13BF6D1257946ACB2E24BAEA8E169EA', '24', '拉祜族', null, '99999', 'LHZ', 'LAHUZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7769BF80D50342459CEBF40EED53B197', '25', '水族', null, '99999', 'SZ', 'SHUIZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('593C580DAD7647E69A49EB075DA0FE08', '26', '东乡族', null, '99999', 'DXZ', 'DONGXIANGZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('09DA436D565F4AF7B3DCE84F7484C584', '27', '纳西族', null, '99999', 'NXZ', 'NAXIZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('31444E32A7E845959C0FAC5FBF88F911', '28', '景颇族', null, '99999', 'JPZ', 'JINGPOZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('00E75C52FC3A44CC84825026F4253C85', '29', '柯尔克孜族', null, '99999', 'KEKZZ', 'KEERKEZIZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('41B488CBF3474402838E26995E5D28B3', '30', '土族', null, '99999', 'TZ', 'TUZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1D931484BDD64A6B902533A58A15FDC2', '31', '达翰尔族', null, '99999', 'DHEZ', 'DAHANERZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('BA6ACB86D6214F51B5DFDF590ED8672B', '32', '仫佬族', null, '99999', 'MLZ', 'MULAOZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('08A0B2BE27B04418BC9C189CD83794EB', '33', '羌族', null, '99999', 'QZ', 'QIANGZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('41972455BB6D483BBAB5E9F30AE72BB3', '34', '布朗族', null, '99999', 'BLZ', 'BULANGZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1F01D10072DA4C6B8BCE4FF66D3BC49C', '35', '撒拉族', null, '99999', 'SLZ', 'SALAZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3BA4101EF9DA4B70B1415602C6FDEF45', '36', '毛难族', null, '99999', 'MNZ', 'MAONANZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('853DB425815C477BA32C04200B710660', '37', '仡佬族', null, '99999', 'YLZ', 'YILAOZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C5F94B861D6143FD8E66A476A7D6D76E', '38', '锡伯族', null, '99999', 'XBZ', 'XIBOZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6E5C45669CD34360AB7B87258DB8B127', '39', '阿昌族', null, '99999', 'ACZ', 'ACHANGZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1DBC39716C134D1BB5CA4D4173AAF9FE', '40', '普米族', null, '99999', 'PMZ', 'PUMIZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('119DE840C5974441AC68B52A8D6905DF', '41', '塔吉克族', null, '99999', 'TJKZ', 'TAJIKEZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('981F4C506A0C4743AB1CD386AA8648EA', '42', '怒族', null, '99999', 'NZ', 'NUZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('9EC461B0989B421EBBF3EB1150E2579B', '43', '乌孜别克族', null, '99999', 'WZBKZ', 'WUZIBIEKEZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('34B3B75A866C401D8C4C49FFEA847731', '44', '俄罗斯族', null, '99999', 'ELSZ', 'ELUOSIZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('BC3DC6C1BB5046BC95D364DB22C9AF56', '45', '鄂温克族', null, '99999', 'EWKZ', 'EWENKEZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A6E51623E6B54CD38716E023812130C8', '46', '德昂族', null, '99999', 'DAZ', 'DEANGZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('CE93D63F64DA4428AC13B850A1B4720B', '47', '保安族', null, '99999', 'BAZ', 'BAOANZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('80C377CA625B4AD69121B8601D20F86C', '48', '裕固族', null, '99999', 'YGZ', 'YUGUZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('ED26DF0B7F884A84ADD8AC56D845E8F6', '49', '京族', null, '99999', 'JZ', 'JINGZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('9D2AA8A81F7C45B183B462DCEF7B503A', '50', '塔塔尔族', null, '99999', 'TTEZ', 'TATAERZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('709D22D494D14459B92A167607570AB6', '51', '独龙族', null, '99999', 'DLZ', 'DULONGZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DD1513E617D94D778FEAF07F82550E91', '52', '鄂伦春族', null, '99999', 'ELCZ', 'ELUNCHUNZU', 'SYS_COMMON_MZ', null, null, '20170629215952', '20170629215952', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('587ABB49EBCC4B69B4199EEFCBD63259', '188', '哥斯达黎加', null, '99999', 'GSDLJ', 'GESIDALIJIA', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F25FDD65853E46999D2A67922BB4C675', '308', '格林纳达', null, '99999', 'GLND', 'GELINNADA', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('CDF65405B423432E99550B1AE2B978A3', '304', '格陵兰', null, '99999', 'GLL', 'GELINGLAN', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('940E23F46B0540D0819E787640EDA97B', '192', '古巴', null, '99999', 'GB', 'GUBA', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FE0CB769508C43079170E47340C32A6A', '312', '瓜德罗普', null, '99999', 'GDLP', 'GUADELUOPU', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D5935E42C7CD4569A72905CBBEF82BCD', '316', '关岛', null, '99999', 'GD', 'GUANDAO', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F652CE83CF6C49798EB481131DA206C8', '328', '圭亚那', null, '99999', 'GYN', 'GUIYANA', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FF0EF829C6E3410B9A84D76C85F32181', '332', '海地', null, '99999', 'HD', 'HAIDI', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('48D332BACA2141AAB74B3830C3FB5FE6', '528', '荷兰', null, '99999', 'HL', 'HELAN', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('25061E3DB69840EEAD2BD699A1F6D7C6', '53', '赫哲族', null, '99999', 'HZZ', 'HEZHEZU', 'SYS_COMMON_MZ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4D12B689D3C64EF0944F49F8F0A0B9AE', '54', '门巴族', null, '99999', 'MBZ', 'MENBAZU', 'SYS_COMMON_MZ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('EFB246764FA24FA6900AE6E93F36E76A', '55', '珞巴族', null, '99999', 'LBZ', 'LUOBAZU', 'SYS_COMMON_MZ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('291EE66CBE86442EAC448C3C35C6FDB0', '56', '基诺族', null, '99999', 'JNZ', 'JINUOZU', 'SYS_COMMON_MZ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('88720F73CAA14959B2A6DCF4C29CA0A9', '98', '国外民族', null, '99999', 'GWMZ', 'GUOWAIMINZU', 'SYS_COMMON_MZ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('473DE179E099483492D0A8AA23675D67', '99', '其他', null, '99999', 'QT', 'QITA', 'SYS_COMMON_MZ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7570893105054A388261EBF41A932CB5', '156', '中国', null, '1', 'ZG', 'ZHONGGUO', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170630112958', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('12A10216A0AA49DA9A79360A32CB7FD8', '004', '阿富汗', null, '99999', 'AFH', 'AFUHAN', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('BFC1801F4F5642A0B564861E177CF2B2', '008', '阿尔巴尼亚', null, '99999', 'AEBNY', 'AERBANIYA', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0CF4F5E3FCC843A0AD6B0C91CFBA4829', '032', '阿根廷', null, '99999', 'AGT', 'AGENTING', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('AB1C1D2734C24AE29F4D07932A7C4D11', '056', '比利时', null, '99999', 'BLS', 'BILISHI', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C04A8AF3D1D941A1B35B96B957F4EE85', '076', '巴西', null, '99999', 'BX', 'BAXI', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0C17A27626A14272ABB7D19D0D144F2C', '104', '缅甸', null, '99999', 'MD', 'MIANDIAN', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8BBADCC3418548C5B411C95C6BBCAB57', '250', '法国', null, '99999', 'FG', 'FAGUO', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('EF67948EBC16446C93083FC01F49C65D', '344', '香港', null, '99999', 'XG', 'XIANGGANG', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('02821D4DCC0F457785C2A89FC33261E3', '356', '印度', null, '99999', 'YD', 'YINDU', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0B7773689865470DAD3D2DA21354E8F3', '392', '日本', null, '99999', 'RB', 'RIBEN', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E6964A3BA6824B278369E6A98A574C07', '408', '朝鲜', null, '99999', 'CX', 'CHAOXIAN', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('EC2828D4F0924A8E99C4D4440064751F', '410', '老挝', null, '99999', 'LW', 'LAOWO', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C320096998964F8C8FA538DFE3860EC3', '496', '蒙古', null, '99999', 'MG', 'MENGGU', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E8C507F21BD144AE9D5E0F02B08CF401', '586', '巴基斯坦', null, '99999', 'BJST', 'BAJISITAN', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DD7A6A04F9A44F468C64732213F9A308', '764', '泰国', null, '99999', 'TG', 'TAIGUO', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('288F44597862448DB686844F1B6136B8', '051', '亚美尼亚', null, '99999', 'YMNY', 'YAMEINIYA', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F2678BE8570E49C88D6ABDE2BEEE461D', '512', '阿曼', null, '99999', 'AM', 'AMAN', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6E94E311576249328E09AD13A5023B3A', '260', '法属南部领地', null, '99999', 'FSNBLD', 'FASHUNANBULINGDI', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('32E8CF7BF06948BC90E795D5DEF387DD', '372', '爱尔兰', null, '99999', 'AEL', 'AIERLAN', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('5C45968025AE4AD6B61CFF3980AE63D7', '020', '安道尔', null, '99999', 'ADE', 'ANDAOER', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('CD9F5FFE920B4BF5B9B39A028D4A3932', '024', '安哥拉', null, '99999', 'AGL', 'ANGELA', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('2316E78062054D43AC26AA311A5E1720', '028', '安提瓜和巴布利', null, '99999', 'ADGHBBL', 'ANDIGUAHEBABULI', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B99CB494D7AD4D12A2C109DEB5C49EC4', '040', '奥地利', null, '99999', 'ADL', 'AODILI', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('547D4F46DA274C2398E9045BD11B6635', '036', '澳大利亚', null, '99999', 'ADLY', 'AODALIYA', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E69437D4BE4B448EB784FD6B097344CD', '446', '澳门', null, '99999', 'AM', 'AOMEN', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E2CBCFD6E0E24ABEBB915B454E87999F', '052', '巴巴多斯', null, '99999', 'BBDS', 'BABADUOSI', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4D9D29D41FF94275BF5556C01751CE7D', '044', '巴哈马', null, '99999', 'BHM', 'BAHAMA', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('052101E16BBD4101A6E542653EF52CB7', '268', '格鲁吉亚', null, '99999', 'GLJY', 'GELUJIYA', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E8C70A5957E64ADFBA67CCA0C1638EA6', '048', '巴林', null, '99999', 'BL', 'BALIN', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C6A800B39A754E93A3D49DAA8738038D', '112', '白俄罗斯', null, '99999', 'BELS', 'BAIELUOSI', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6F56601C595B4A57A5634C6C273A2382', '060', '百慕大', null, '99999', 'BMD', 'BAIMUDA', 'SYS_COMMON_GJ', null, null, '20170629215953', '20170629215953', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('CBEFA9E55839415091E927EE5146E1C6', '100', '保加利亚', null, '99999', 'BJLY', 'BAOJIALIYA', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('77706E26AF6C4428BED85D849422E3EE', '204', '贝宁', null, '99999', 'BN', 'BEINING', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('CCD2438567F24F97B952A228E8B96D27', '352', '冰岛', null, '99999', 'BD', 'BINGDAO', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D0A2B7C1252F4CB18F50A23D246E3F66', '068', '玻利维亚', null, '99999', 'BLWY', 'BOLIWEIYA', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4FCBFA3E389B42679EA399CD3655BB65', '084', '伯利兹', null, '99999', 'BLZ', 'BOLIZI', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A3F8F63280AF46CAB5F847463059B218', '072', '博茨瓦纳', null, '99999', 'BCWN', 'BOCIWANA', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D14D61731267484ABFD899C290206C36', '064', '不丹', null, '99999', 'BD', 'BUDAN', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('372CBC12A1C5467DBFD870ED9D94AA0F', '108', '布隆迪', null, '99999', 'BLD', 'BULONGDI', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A56C530F0D884CDB9EB79CCBFD73CE85', '074', '布维岛', null, '99999', 'BWD', 'BUWEIDAO', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D0A4931D7CAD429F962323665DBB4831', '226', '赤道几内亚', null, '99999', 'CDJNY', 'CHIDAOJINEIYA', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DC0FFEF9E07A4278BAF309D97C844441', '208', '丹麦', null, '99999', 'DM', 'DANMAI', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('46E115E97E71407583188E1E14ED7C3B', '232', '厄立特里亚', null, '99999', 'ELTLY', 'ELITELIYA', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('767F6B5DAC2C4A6D8CBE16CFDA02C61A', '233', '爱沙尼亚', null, '99999', 'ASNY', 'AISHANIYA', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4C1B382D7E984442A0EF38C80BA2CC0E', '214', '多米尼加共和国', null, '99999', 'DMNJGHG', 'DUOMINIJIAGONGHEGUO', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8C7C6B8FBECD4BA2BA08C8E6475FDF42', '218', '厄瓜多尔', null, '99999', 'EGDE', 'EGUADUOER', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7DB21866264A4A258D3FFF23BAFD6B1C', '234', '法罗群岛', null, '99999', 'FLQD', 'FALUOQUNDAO', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('CEFFA1F69AEE454AB0EBB09ABC10290A', '258', '法属波利尼西亚', null, '99999', 'FSBLNXY', 'FASHUBOLINIXIYA', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A2772A14BC184686AC0093BE6EB6AAB9', '254', '法属圭亚那', null, '99999', 'FSGYN', 'FASHUGUIYANA', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4ABCA70696EC4D4CB6E85F87B5D6A90C', '242', '斐济', null, '99999', 'FJ', 'FEIJI', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('9065B79F285A430085ABC430CAC979D0', '246', '芬兰', null, '99999', 'FL', 'FENLAN', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C243BBBF0E474A44BE16D1FF0C4C8E0C', '132', '佛得角', null, '99999', 'FDJ', 'FODEJIAO', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FD10EF2C87B34BD79F7909AD97B1669E', '238', '福克兰群岛（马尔维纳斯）', null, '99999', 'FKLQD（MEWNS）', 'FUKELANQUNDAO（MAERWEINASI）', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E2FA55178CDE437EAC67E504C3A8B78F', '270', '冈比亚', null, '99999', 'GBY', 'GANGBIYA', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('5C84DB042A2C4E0EADBB6A8C9B510E11', '178', '刚果共和国', null, '99999', 'GGGHG', 'GANGGUOGONGHEGUO', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B6FB6BF3776840DAAE308A4052E5AE43', '414', '科威特', null, '99999', 'KWT', 'KEWEITE', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('5F62FA8458C84DB39304EFEEFB76EB5F', '166', '科科斯（基林）群岛', null, '99999', 'KKS（JL）QD', 'KEKESI（JILIN）QUNDAO', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('344F33D635F8436C882C0C3D84B9829B', '404', '肯尼亚', null, '99999', 'KNY', 'KENNIYA', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B2AED97A0DF442318AFA46102414DBCA', '184', '库克群岛', null, '99999', 'KKQD', 'KUKEQUNDAO', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4552942FEC61498882B201EE455A6CD8', '426', '莱索托', null, '99999', 'LST', 'LAISUOTUO', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A6963A60388B4EADA6C6FE34DA5AEF83', '422', '黎巴嫩', null, '99999', 'LBN', 'LIBANEN', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('570BCE32B0774858B935F36CBB5D385D', '430', '利比里亚', null, '99999', 'LBLY', 'LIBILIYA', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('87BB9C6600B24B079B07B00F1B9DF3C1', '434', '利比亚', null, '99999', 'LBY', 'LIBIYA', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('20ABB6CF9C04456B8578BEDAA677B8B9', '438', '列支敦士登', null, '99999', 'LZDSD', 'LIEZHIDUNSHIDENG', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FE98FB7A77514D74906950E8530AF7D1', '442', '卢森堡', null, '99999', 'LSB', 'LUSENBAO', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('22E54245FEC24DE8ABD6CF7BAFAC3B1C', '450', '马达加斯加', null, '99999', 'MDJSJ', 'MADAJIASIJIA', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('CA61E9EDA2E74B8A80C916C6D4F4AA84', '462', '马尔代夫', null, '99999', 'MEDF', 'MAERDAIFU', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A40B0CDFFB3742DEA413ED6FD599004D', '470', '马耳他', null, '99999', 'MET', 'MAERTA', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FDA1C09D93614BAE8FCFC076FD16EFCB', '454', '马拉维', null, '99999', 'MLW', 'MALAWEI', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F5AF1AFE94FC4F3DB54C8E437CB15917', '458', '马来西亚', null, '99999', 'MLXY', 'MALAIXIYA', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('37E9C2AE58F44A249FBE1D8DDE10A684', '466', '马里', null, '99999', 'ML', 'MALI', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F4F244EC8C294EAF9E5CC1693B38D900', '474', '马提尼克', null, '99999', 'MDNK', 'MADINIKE', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('26DE30DD52EB4999A2E4DDB130976465', '480', '毛里求斯', null, '99999', 'MLQS', 'MAOLIQIUSI', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('645BC87433E544C0A26072A8BE7D0110', '478', '毛里塔尼亚', null, '99999', 'MLTNY', 'MAOLITANIYA', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('075C178005314F9287EF954E636256EA', '016', '美属萨摩亚', null, '99999', 'MSSMY', 'MEISHUSAMOYA', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0059DCC4B40C4C05AD416AB103A75DD2', '500', '蒙特塞拉特', null, '99999', 'MTSLT', 'MENGTESAILATE', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('898AA3C39059450E823F416DF3684A79', '050', '孟加拉国', null, '99999', 'MJLG', 'MENGJIALAGUO', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C14EBFC19FD6430FB0FE4ABD39EAA63E', '492', '摩纳哥', null, '99999', 'MNG', 'MONAGE', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B6A1D3616D694A418E796595C5499BC5', '504', '摩洛哥', null, '99999', 'MLG', 'MOLUOGE', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B1975748A2614552BFE705869430642E', '508', '莫桑比克', null, '99999', 'MSBK', 'MOSANGBIKE', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3DA7D5FE3DEF4391A9DAF960B10F894F', '484', '墨西哥', null, '99999', 'MXG', 'MOXIGE', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E4BC433E27D84816A7771F0779383A53', '516', '纳米比亚', null, '99999', 'NMBY', 'NAMIBIYA', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('651E6C3CF6224E118468F7E0C4505961', '010', '南极洲', null, '99999', 'NJZ', 'NANJIZHOU', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('487C6A23C11C49B08168D260388233E6', '520', '瑙鲁', null, '99999', 'NL', 'NAOLU', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('68F409A45E284FE9A1729FD96B513822', '524', '尼泊尔', null, '99999', 'NBE', 'NIBOER', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('426C752B72E240A29BA7938BF887FF60', '558', '尼加拉瓜', null, '99999', 'NJLG', 'NIJIALAGUA', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B576B67FDD0B43C599C6100841B3AABF', '562', '尼日尔', null, '99999', 'NRE', 'NIRIER', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('99007D0343DC4D86A2CAADF476D6F10B', '566', '尼日利亚', null, '99999', 'NRLY', 'NIRILIYA', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('036FB913179A454A9395874B782D87D8', '222', '萨尔瓦多', null, '99999', 'SEWD', 'SAERWADUO', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4A1EF12AEEDA4B49AC272BF4EF99DAB8', '196', '塞浦路斯', null, '99999', 'SPLS', 'SAIPULUSI', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('256A5D592DE94B1BAD1FFC31DFDFA5EF', '162', '圣诞岛', null, '99999', 'SDD', 'SHENGDANDAO', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C6621F702AA64F1582BB55F83F909BC8', '144', '斯里兰卡', null, '99999', 'SLLK', 'SILILANKA', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('45D247366B854866992A66BF9C26A8E0', '090', '所罗门群岛', null, '99999', 'SLMQD', 'SUOLUOMENQUNDAO', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('675F30CC25A44CCCB3870701445A976C', '548', '瓦努阿图', null, '99999', 'WNAT', 'WANUATU', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4F2345B01AD54D2EB30C08B1B0F7505D', '320', '危地马拉', null, '99999', 'WDML', 'WEIDIMALA', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('375D08FB00EB4B589B5C6CD2497B406F', '096', '文莱', null, '99999', 'WL', 'WENLAI', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('29849B346CEB40EEA5A901E83CD74362', '300', '希腊', null, '99999', 'XL', 'XILA', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('2431D61C22CE4A12B996EF13F5CD1F8E', '384', '科特迪瓦', null, '99999', 'KTDW', 'KETEDIWA', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DF4A69BDFDAB4168B1E16870EA1D0BB0', '540', '新喀里多尼亚', null, '99999', 'XKLDNY', 'XINKALIDUONIYA', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DCED4F6113FD4201B158794B23FA0E4B', '580', '北马里亚纳', null, '99999', 'BMLYN', 'BEIMALIYANA', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('796289C43126401981521F8905B7E6F3', '348', '匈牙利', null, '99999', 'XYL', 'XIONGYALI', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('927FA8279D234BC0888508E0E6993077', '388', '牙买加', null, '99999', 'YMJ', 'YAMAIJIA', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A0C8EF6076F2448A8CCDF506BD52FBFF', '368', '伊拉克', null, '99999', 'YLK', 'YILAKE', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0BC073D623504016B15333D945E971C2', '364', '伊朗', null, '99999', 'YL', 'YILANG', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E3A32663515A4CE4991F25A7057A3603', '376', '以色列', null, '99999', 'YSL', 'YISELIE', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('35F2F596747B4ED381C771F8C0694F22', '380', '意大利', null, '99999', 'YDL', 'YIDALI', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('927D79F0BD9043ADA3DC8EB6F8656199', '360', '印度尼西亚', null, '99999', 'YDNXY', 'YINDUNIXIYA', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0B638C102F56422ABAAE853DFFD433CA', '092', '英属维尔京群岛', null, '99999', 'YSWEJQD', 'YINGSHUWEIERJINGQUNDAO', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('580BF016EB60418C93D674BAE3EFC9B3', '086', '英属印度洋领地', null, '99999', 'YSYDYLD', 'YINGSHUYINDUYANGLINGDI', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('9224C16636D04CDCBF94FB808AC466BB', '400', '约旦', null, '99999', 'YD', 'YUEDAN', 'SYS_COMMON_GJ', null, null, '20170629215956', '20170629215956', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8ABC38B5161E487BBE12E85890948FB0', 'sjdx.select.oracle', '/*
var whereStr = "";
var sszdlb = null;
 if(!isEmpty(kzxx.fields.sszzd)&&!isEmpty(obj[kzxx.fields.sszzd.zddm])){
     var value = obj[kzxx.fields.sszzd.zddm];
     if(su.endsWith(value, "%")&&su.startsWith(value, "%")){
       sszdlb = kzxx.fields.sszzd.zddm;
       if(!isEmpty(kzxx.fields.pyjp)){
            sszdlb = sszdlb+"||"+kzxx.fields.pyjp.zddm;
       }
       if(!isEmpty(kzxx.fields.pyqp)){
            sszdlb = sszdlb+"||"+kzxx.fields.pyqp.zddm;
       }
       if(!isEmpty(kzxx.fields.sszdlb)){
            sszdlb = sszdlb+"||"+kzxx.fields.sszdlb.zddm;
       }
       whereStr = whereStr + " and "+sszdlb+" like upper(#obj."+kzxx.fields.sszzd.zddm+"#)";
     }
 }
//循环生成字段
for(field in fieldList){
     if("99"==field.zdywlb||(sszdlb!=null&&kzxx.fields.sszzd.zddm==field.zddm)){
          //虚拟字段或搜索主字段
          continue;
     }
     if("dict"==field.kjlx&&field.zddx==''1''){
          //特殊处理的字段
          if(!isEmpty(obj[field.zddm])){
             var arr = su.split(obj[field.zddm], ",");
             var idx=0;
             for(var a in arr){
                     if(idx==0){
                       whereStr = whereStr + " and ("+field.zddm+" like ''%"+a+"%'' ";
                     }else{
                       whereStr = whereStr + " or "+field.zddm+" like ''%"+a+"%'' ";
                     }
                     idx=idx+1;
             }
             whereStr = whereStr + ")";
          }
     }else{
          //默认处理方式
          whereStr = whereStr + su.addInput(field.zddm,obj[field.zddm]);
     }
 }
 var orderBy = su.addPxField(sjdx.mrpx,obj);
 //要上天，逆天的操作
 //db.update(db.use(),"insert into test_sjgl_1(xm) select to_char(sysdate,''yyyymmddhh24miss'') from dual",null);
*/
select * from ${tableName} t where 1 = 1 ${whereStr} ${orderBy }', null, '99999', null, null, 'SYS_SJGL_APPCONFIG', null, null, '20181216190150', '20181219194739', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C48D0CD2967F403FA9928895750A781C', 'suggest', '建议框', null, '99999', 'JYK', 'JIANYIKUANG', 'SYS_SJGL_KJLX', null, null, '20181219153617', '20181219153617', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('AD67DC9934BA4D4FA4ED568114942FE9', 'json', 'JSON框', null, '99999', 'JSONK', 'JSONKUANG', 'SYS_SJGL_KJLX', null, null, '20181219153653', '20181219153653', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('CCE2C16EFC9F40EAB4686547E63734B6', 'file', '文件', null, '99999', 'WJ', 'WENJIAN', 'SYS_SJGL_KJLX', null, null, '20181219153719', '20181219153719', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D7F64657606A4E0C84EAE1FF92BEDD9C', 'h2', 'h2', null, '60', 'H2', 'H2', 'SYS_SJGL_DXZTLX', null, null, '20181219191835', '20181219191835', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FD7CCA37F4434691B07A513DD48287D8', '紧急', '紧急', null, '30', 'JJ', 'JINJI', 'SYS_COMMON_JJCD', null, null, '20171120171825', '20171120171825', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DE481EFF67884039840DB17520037EB1', 'SYS_COMMON_ORG', '系统-公用-机构', null, '70', 'XT-GY-JG', 'XITONG-GONGYONG-JIGOU', 'SYS_COMMON_ZDLB', null, 'select jgdm dm,jgmc as mc,px,jgjc||jgbm||jcjp as search_key from  sys_qx_jgxx org', '20171206193153', '20181221131215', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F0BA7C5A983541CCB7E6665A08A185E0', 'KHH', '高雄', null, '99999', 'GX', 'GAOXIONG', 'SYS_COMMON_JCDM', null, null, '20170814153453', '20170814174205', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D8B969EA00D54CADA69461CC505532CF', 'KHN', '南昌', null, '99999', 'NC', 'NANCHANG', 'SYS_COMMON_JCDM', null, null, '20170814153521', '20170814174205', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B44C7DA513B64B06A01DE35333628145', 'KMG', '昆明', null, '99999', 'KM', 'KUNMING', 'SYS_COMMON_JCDM', null, null, '20170814153538', '20170814174205', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1F0C30289EF841F8BD8A65B25B04BE2B', 'KNC', '吉安', null, '99999', 'JA', 'JIAN', 'SYS_COMMON_JCDM', null, null, '20170814153557', '20170814174205', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A79AC5D186D9422DBCB9F5B4C7492243', 'KOW', '赣州', null, '99999', 'GZ', 'GANZHOU', 'SYS_COMMON_JCDM', null, null, '20170814153617', '20170814174205', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('04BD4FACD6324225B6A4FAEDE75C035B', 'KRL', '库尔勒', null, '99999', 'KEL', 'KUERLE', 'SYS_COMMON_JCDM', null, null, '20170814153855', '20170814174205', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F84207E3F7834A70BD4AA9583BDE5A2D', 'KRY', '克拉玛依', null, '99999', 'KLMY', 'KELAMAYI', 'SYS_COMMON_JCDM', null, null, '20170814153913', '20170814174205', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('BFDA4862767A48C0B2DFB6158E986C3F', 'KWE', '贵阳', null, '99999', 'GY', 'GUIYANG', 'SYS_COMMON_JCDM', null, null, '20170814153932', '20170814174205', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('5BAB955D34A545598815C59405F3D6EE', 'KWL', '桂林', null, '99999', 'GL', 'GUILIN', 'SYS_COMMON_JCDM', null, null, '20170814153952', '20170814174205', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0212F86130A5403CAA7E1024995BE693', 'LHK', '光化', null, '99999', 'GH', 'GUANGHUA', 'SYS_COMMON_JCDM', null, null, '20170814154018', '20170814174205', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F16159430FF94242A00704249F73AB55', 'LHN', '梨山', null, '99999', 'LS', 'LISHAN', 'SYS_COMMON_JCDM', null, null, '20170814154037', '20170814174205', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('5928AC41C295431DBCC9872FF3E42362', 'LHW', '兰州', null, '99999', 'LZ', 'LANZHOU', 'SYS_COMMON_JCDM', null, null, '20170814154056', '20170814174205', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C2B71934BADD440E89518ACE3B4C0476', 'LIA', '梁平', null, '99999', 'LP', 'LIANGPING', 'SYS_COMMON_JCDM', null, null, '20170814154114', '20170814174205', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('018E529ECE0C4EC6A5CB9B9D713FE3C7', 'LYG', '连云港', null, '99999', 'LYG', 'LIANYUNGANG', 'SYS_COMMON_JCDM', null, null, '20170814154807', '20170814174317', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('9ED089DEAC0A4A9FB4A6A4CC819AAFD1', 'LJG', '丽江', null, '99999', 'LJ', 'LIJIANG', 'SYS_COMMON_JCDM', null, null, '20170814154158', '20170814174205', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FEC9E9A018434FE39FB07EC6970F0C94', 'LUM', '德宏芒市', null, '99999', 'DHMS', 'DEHONGMANGSHI', 'SYS_COMMON_JCDM', null, null, '20170814154222', '20170814174317', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0E94C266BB994AA9A637692A13D83B12', 'LUZ', '庐山', null, '99999', 'LS', 'LUSHAN', 'SYS_COMMON_JCDM', null, null, '20170814154238', '20170814174317', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4B1DDC0F2BAF46E087D3A60C767A8A82', 'LXA', '拉萨', null, '99999', 'LS', 'LASA', 'SYS_COMMON_JCDM', null, null, '20170814154256', '20170814174317', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('01BCEF0147934675827F60EF99CA726B', 'LXI', '林西', null, '99999', 'LX', 'LINXI', 'SYS_COMMON_JCDM', null, null, '20170814154312', '20170814174317', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3AEBC540A8954767B400865164D3AEEB', 'LYI', '临沂', null, '99999', 'LY', 'LINYI', 'SYS_COMMON_JCDM', null, null, '20170814154822', '20170814174317', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('239186DFCC014691AF0CF7F951D2A564', 'LYA', '洛阳', null, '99999', 'LY', 'LUOYANG', 'SYS_COMMON_JCDM', null, null, '20170814154749', '20170814174317', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8DEB7A75803241F996EE356A93684765', 'LZD', '兰州东', null, '99999', 'LZD', 'LANZHOUDONG', 'SYS_COMMON_JCDM', null, null, '20170814154847', '20170814174317', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('09945006A82C46239C1A4A022BBAA48F', 'LZH', '柳州', null, '99999', 'LZ', 'LIUZHOU', 'SYS_COMMON_JCDM', null, null, '20170814154906', '20170814174317', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('32AE92479F3248BFAA580364209265DA', 'LZO', '泸州', null, '99999', 'LZ', 'LUZHOU', 'SYS_COMMON_JCDM', null, null, '20170814154923', '20170814174317', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3054204E2A1F48DFB91DD0B60CFA301E', 'MDG', '牡丹江', null, '99999', 'MDJ', 'MUDANJIANG', 'SYS_COMMON_JCDM', null, null, '20170814154938', '20170814174317', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7AF8ACD381E74AA6B626CBA1295CC542', 'MIG', '绵阳', null, '99999', 'MY', 'MIANYANG', 'SYS_COMMON_JCDM', null, null, '20170814154954', '20170814174317', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C5E11F647D924D8C8B543AF72D5122F6', 'MXZ', '梅县', null, '99999', 'MX', 'MEIXIAN', 'SYS_COMMON_JCDM', null, null, '20170814155011', '20170814174317', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D89D29F2AD2A4437B5BA84FF668A4B2E', 'MZG', '马公', null, '99999', 'MG', 'MAGONG', 'SYS_COMMON_JCDM', null, null, '20170814155041', '20170814174317', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('BE9044A138604BA2B1E3F29C4065AAED', 'NAO', '南充', null, '99999', 'NC', 'NANCHONG', 'SYS_COMMON_JCDM', null, null, '20170814155059', '20170814174317', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('60724377F8354DD5A893395BDEFFDC96', 'NDG', '齐齐哈尔', null, '99999', 'QQHE', 'QIQIHAER', 'SYS_COMMON_JCDM', null, null, '20170814155114', '20170814174427', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7C4B3B6C52EF415A8DA38522B4F7F9CD', 'NGB', '宁波', null, '99999', 'NB', 'NINGBO', 'SYS_COMMON_JCDM', null, null, '20170814155130', '20170814174427', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('34A10B48B2C747B1BAA0C6AFC0FD1376', 'NKG', '南京', null, '99999', 'NJ', 'NANJING', 'SYS_COMMON_JCDM', null, null, '20170814155149', '20170814174427', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('26CD5988587D4D688377896E1D2EBB6D', 'NNG', '南宁', null, '99999', 'NN', 'NANNING', 'SYS_COMMON_JCDM', null, null, '20170814155204', '20170814174427', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('30764F25931A44959FD9CDE33E34C4E7', 'NNY', '南阳', null, '99999', 'NY', 'NANYANG', 'SYS_COMMON_JCDM', null, null, '20170814155653', '20170814174427', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('147EA167F5CF483FAAA72204DFDC4E42', 'PEK', '北京', null, '99999', 'BJ', 'BEIJING', 'SYS_COMMON_JCDM', null, null, '20170814155709', '20170814174427', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('9DE4E466FF72484CB23A0553E6186A8F', 'PVG', '上海浦东', null, '99999', 'SHPD', 'SHANGHAIPUDONG', 'SYS_COMMON_JCDM', null, null, '20170814155729', '20170814174427', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0882E487CAF34C199726855E4D6DA452', 'SHA', '上海', null, '99999', 'SH', 'SHANGHAI', 'SYS_COMMON_JCDM', null, null, '20170814155749', '20170814174427', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('349CAAC5B2FD4B28BB95C49433341280', 'SHE', '沈阳', null, '99999', 'SY', 'SHENYANG', 'SYS_COMMON_JCDM', null, null, '20170814155805', '20170814174427', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E61E6CCCFAF34CE8BC6A93C3D37E38A4', 'HFE', '合肥', null, '99999', 'HF', 'HEFEI', 'SYS_COMMON_JCDM', null, null, '20170814152644', '20170814173939', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3CEE7D7A15874B20874E8526A6C95A89', 'HGH', '杭州', null, '99999', 'HZ', 'HANGZHOU', 'SYS_COMMON_JCDM', null, null, '20170814152705', '20170814173939', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('479E6C336879442682845494E8598047', 'HHA', '长沙', null, '99999', 'CS', 'CHANGSHA', 'SYS_COMMON_JCDM', null, null, '20170814152722', '20170814173939', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A1A404EAF0FC4A5EBA6A21A272C18BBC', 'HKG', '香港', null, '99999', 'XG', 'XIANGGANG', 'SYS_COMMON_JCDM', null, null, '20170814152739', '20170814173939', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6EF4899A6EC54DDDBBE1B098F99307D1', 'HLD', '海拉尔', null, '99999', 'HLE', 'HAILAER', 'SYS_COMMON_JCDM', null, null, '20170814152757', '20170814173939', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DE7FA3CD4AB342A8B23B9674913A5772', 'HLH', '乌兰浩特', null, '99999', 'WLHT', 'WULANHAOTE', 'SYS_COMMON_JCDM', null, null, '20170814152815', '20170814173939', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('802F806FBAD741148B1AAA783DFF9DCB', 'HMI', '哈密', null, '99999', 'HM', 'HAMI', 'SYS_COMMON_JCDM', null, null, '20170814152835', '20170814173939', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('CE49DF66E98D4C24990E731E955B9DC6', 'HNY', '衡阳', null, '99999', 'HY', 'HENGYANG', 'SYS_COMMON_JCDM', null, null, '20170814152854', '20170814173939', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DA49C75188054F68912A9C28CC328AA2', 'HRB', '哈尔滨', null, '99999', 'HEB', 'HAERBIN', 'SYS_COMMON_JCDM', null, null, '20170814152918', '20170814173939', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A1DED583A56E47CE9B74318259F990BB', 'HSN', '舟山', null, '99999', 'ZS', 'ZHOUSHAN', 'SYS_COMMON_JCDM', null, null, '20170814152935', '20170814173939', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DE7E0A82662F482AA6A6480826AD83EA', 'HTN', '和田', null, '99999', 'HT', 'HETIAN', 'SYS_COMMON_JCDM', null, null, '20170814152950', '20170814174047', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('216C35104C514C42855F6538D8AFC04E', 'HYN', 'HYN', null, '99999', 'HYN', 'HYN', 'SYS_COMMON_JCDM', null, null, '20170814153015', '20170814174047', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('2F9E5B5CEF7141D9A60CC88FC734E440', 'HZG', '汉中', null, '99999', 'HZ', 'HANZHONG', 'SYS_COMMON_JCDM', null, null, '20170814153033', '20170814174047', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B31BEC165FDF49C4AED5AFA784F1C16F', 'INC', '银川', null, '99999', 'YC', 'YINCHUAN', 'SYS_COMMON_JCDM', null, null, '20170814153057', '20170814174047', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F65E954A188843929B3E97E9A14D78BE', 'IQM', '且末', null, '99999', 'QM', 'QIEMO', 'SYS_COMMON_JCDM', null, null, '20170814153120', '20170814174048', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('CCAA094746FE4D0DBF10D55264C25360', 'IQN', '庆阳', null, '99999', 'QY', 'QINGYANG', 'SYS_COMMON_JCDM', null, null, '20170814153137', '20170814174048', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3EE651852951477A82BBEB49915DCCE8', 'JDZ', '景德镇', null, '99999', 'JDZ', 'JINGDEZHEN', 'SYS_COMMON_JCDM', null, null, '20170814153154', '20170814174048', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('9F9EC1DA813141B99D15CCDC9E8C038C', 'JGN', '嘉峪关', null, '99999', 'JYG', 'JIAYUGUAN', 'SYS_COMMON_JCDM', null, null, '20170814153212', '20170814174048', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4B3B0EA7D337454E9A514B17407E40E5', 'JHG', '景洪', null, '99999', 'JH', 'JINGHONG', 'SYS_COMMON_JCDM', null, null, '20170814153229', '20170814174048', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('079FA5B4FEC24C1E980440C0D08281F0', 'JIL', '吉林', null, '99999', 'JL', 'JILIN', 'SYS_COMMON_JCDM', null, null, '20170814153245', '20170814174048', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0883D8F61A6D4C9DB539BF376820519B', 'JCGA_JCYG_WHCD', '机场公安-机场员工-文化程度', '小学、初中、高中、中专及中职、大专及高职、本科、研究生', '99999', 'JCGA-JCYG-WHCD', 'JICHANGGONGAN-JICHANGYUANGONG-WENHUACHENGDU', 'SYS_COMMON_ZDLB', null, null, '20181205144750', '20181205144750', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('043CEC4B5B324DF58A3CD503E2BBA45D', '05', '小学', null, '10', 'XX', 'XIAOXUE', 'JCGA_JCYG_WHCD', null, null, '20181205144823', '20181205144823', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0B8D6023B0CF48319A290FCAA9B2014E', '04', '初中', null, '20', 'CZ', 'CHUZHONG', 'JCGA_JCYG_WHCD', null, null, '20181205144857', '20181205144857', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('5E4AC3B22CC9456D83D328E8A116834D', '03', '高中', null, '99999', 'GZ', 'GAOZHONG', 'JCGA_JCYG_WHCD', null, null, '20181205144941', '20181205144941', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('2748418583E34574B5515644FE3D4281', '06', '中专及中职', null, '99999', 'ZZJZZ', 'ZHONGZHUANJIZHONGZHI', 'JCGA_JCYG_WHCD', null, null, '20181205145030', '20181205145030', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('20AF621A75EB45CEA9485BDBA21106FD', '07', '大专及高职', null, '99999', 'DZJGZ', 'DAZHUANJIGAOZHI', 'JCGA_JCYG_WHCD', null, null, '20181205145047', '20181205145047', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('58B8ACA53E904D6995A37A9F6DBB8CB1', '08', '本科', null, '99999', 'BK', 'BENKE', 'JCGA_JCYG_WHCD', null, null, '20181205145109', '20181205145109', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F19D0725C6AC45EC8D0B801674933DC7', '09', '研究生', null, '99999', 'YJS', 'YANJIUSHENG', 'JCGA_JCYG_WHCD', null, null, '20181205145127', '20181205145127', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DA56059C51454230ACC438B2CE15FAAE', 'SYS_COMMON_APPCONFIG', '系统-公用-应用配置', null, '200', 'XT-GY-YYPZ', 'XITONG-GONGYONG-YINGYONGPEIZHI', 'SYS_COMMON_ZDLB', null, null, '20181205153655', '20181208135447', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F040755ED3AB4E6CBAED7A2A8E538400', 'JCGA_JCYG_APPCONFIG', '机场公安-机场员工-应用配置', null, '99999', 'JCGA-JCYG-YYPZ', 'JICHANGGONGAN-JICHANGYUANGONG-YINGYONGPEIZHI', 'SYS_COMMON_ZDLB', null, null, '20181205153750', '20181205153750', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('76A77FD6CAFE4872B8939D64B9DC47A9', 'jcyg.heards', '单  位,部  门,重点要害部位,员工姓名,性别,年龄,出生日期,身份证件类型,身份证件号码,民  族,政治面貌,文化程度,家庭电话,办公电话,手  机,QQ号码,MSN登录名,籍  贯,户籍地址,现住地址,职  务,用工性质,工作岗位,到单位时间,技术职称,执业许可证名称,执业许可证编号,是否已办理隔离区通行证件,已办理隔离区通行证件类型,考试成绩,关系,姓名,性别,身份证件类型,身份证件号码,户籍所在地,现住址,联系电话,备注,关系,姓名,性别,身份证件类型,身份证件号码,户籍所在地,现住址,联系电话,备注,关系,姓名,性别,身份证件类型,身份证件号码,户籍所在地,现住址,联系电话,备注,关系,姓名,性别,身份证件类型,身份证件号码,户籍所在地,现住址,联系电话,备注,关系,姓名,性别,身份证件类型,身份证件号码,户籍所在地,现住址,联系电话,备注', null, '99999', 'D  W,B  M,ZDYHBW,YGXM,XB,NL,CSRQ,SFZJLX,SFZJHM,M  Z,ZZMM,WHCD,JTDH,BGDH,S  J,QQHM,MSNDLM,J  G,HJDZ,XZDZ,Z  W,YGXZ,GZGW,DDWSJ,JSZC,ZYXKZMC,ZYXKZBH,SFYBLGLQTXZJ,YBLGLQTXZJLX,KSCJ,GX,XM,XB,SFZJLX,SFZJHM,HJSZD,XZZ,LXDH,BZ,GX,XM,XB,SFZJLX,SFZJHM,HJSZD,XZZ,LXDH,BZ,GX,XM,XB,SFZJLX,SFZJHM,HJSZD,XZZ,LXDH,BZ,GX,XM,XB,SFZJLX,SFZJHM,HJSZD,XZZ,LXDH,BZ,GX,XM,XB,SFZJLX,SFZJHM,HJSZD,XZZ,LXDH,BZ', 'DAN  WEI,BU  MEN,ZHONGDIANYAOHAIBUWEI,YUANGONGXINGMING,XINGBIE,NIANLING,CHUSHENGRIQI,SHENFENZHENGJIANLEIXING,SHENFENZHENGJIANHAOMA,MIN  ZU,ZHENGZHIMIANMAO,WENHUACHENGDU,JIATINGDIANHUA,BANGONGDIANHUA,SHOU  JI,QQHAOMA,MSNDENGLUMING,JI  GUAN,HUJIDIZHI,XIANZHUDIZHI,ZHI  WU,YONGGONGXINGZHI,GONGZUOGANGWEI,DAODANWEISHIJIAN,JISHUZHICHENG,ZHIYEXUKEZHENGMINGCHENG,ZHIYEXUKEZHENGBIANHAO,SHIFOUYIBANLIGELIQUTONGXINGZHENGJIAN,YIBANLIGELIQUTONGXINGZHENGJIANLEIXING,KAOSHICHENGJI,GUANXI,XINGMING,XINGBIE,SHENFENZHENGJIANLEIXING,SHENFENZHENGJIANHAOMA,HUJISUOZAIDI,XIANZHUZHI,LIANXIDIANHUA,BEIZHU,GUANXI,XINGMING,XINGBIE,SHENFENZHENGJIANLEIXING,SHENFENZHENGJIANHAOMA,HUJISUOZAIDI,XIANZHUZHI,LIANXIDIANHUA,BEIZHU,GUANXI,XINGMING,XINGBIE,SHENFENZHENGJIANLEIXING,SHENFENZHENGJIANHAOMA,HUJISUOZAIDI,XIANZHUZHI,LIANXIDIANHUA,BEIZHU,GUANXI,XINGMING,XINGBIE,SHENFENZHENGJIANLEIXING,SHENFENZHENGJIANHAOMA,HUJISUOZAIDI,XIANZHUZHI,LIANXIDIANHUA,BEIZHU,GUANXI,XINGMING,XINGBIE,SHENFENZHENGJIANLEIXING,SHENFENZHENGJIANHAOMA,HUJISUOZAIDI,XIANZHUZHI,LIANXIDIANHUA,BEIZHU', 'JCGA_JCYG_APPCONFIG', null, null, '20181205154015', '20181205154015', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C29FAE0817DE47F99454186DF7421F38', 'jcyg.fields', 'dw,bm,cdyhbw,ygxm,xb,nl,csrq,zjlx,gmsfhm,mz,zzmm,whcd,jtdh,bgdh,sj,qq,msn,jg,hjdz,xzdz,zw,ygxz,gwgz,dbdwsj,jszc,zyxkzmc,zyxkzbh,kzqtxz,kzqtxzlx,kscj', null, '99999', 'DW,BM,CDYHBW,YGXM,XB,NL,CSRQ,ZJLX,GMSFHM,MZ,ZZMM,WHCD,JTDH,BGDH,SJ,QQ,MSN,JG,HJDZ,XZDZ,ZW,YGXZ,GWGZ,DBDWSJ,JSZC,ZYXKZMC,ZYXKZBH,KZQTXZ,KZQTXZLX,KSCJ', 'DW,BM,CDYHBW,YGXM,XB,NL,CSRQ,ZJLX,GMSFHM,MZ,ZZMM,WHCD,JTDH,BGDH,SJ,QQ,MSN,JG,HJDZ,XZDZ,ZW,YGXZ,GWGZ,DBDWSJ,JSZC,ZYXKZMC,ZYXKZBH,KZQTXZ,KZQTXZLX,KSCJ', 'JCGA_JCYG_APPCONFIG', null, null, '20181205154050', '20181205154050', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F4032892DC1B439297062DAFAF59CB51', 'jcyg.rules', 'zd:SYS_COMMON_ORG:false,length:50,null,length:50,zd:XB,number:100,date:YYYYMMDD,zd:JCGA_JCYG_ZJLX,sfzh,zd:SJZD_MZ,zd:SYS_COMMON_ZZMM,zd:JCGA_JCYG_WHCD,length:20,length:20,length:20,length:20,length:20,zd:SYS_COMMON_JG:false,length:100,length:100,length:100,length:100,length:20,date:YYYYMMDD,length:100,length:100,length:100,notNull;mustBe:否;zd:LJPD,null,number:100', null, '99999', 'ZD:SYS_COMMON_ORG:FALSE,LENGTH:50,NULL,LENGTH:50,ZD:XB,NUMBER:100,DATE:YYYYMMDD,ZD:JCGA_JCYG_ZJLX,SFZH,ZD:SJZD_MZ,ZD:SYS_COMMON_ZZMM,ZD:JCGA_JCYG_WHCD,LENGTH:20,LENGTH:20,LENGTH:20,LENGTH:20,LENGTH:20,ZD:SYS_COMMON_JG:FALSE,LENGTH:100,LENGTH:100,LENGTH:100,LENGTH:100,LENGTH:20,DATE:YYYYMMDD,LENGTH:100,LENGTH:100,LENGTH:100,ZD:LJPD,NULL,NUMBER:100', 'ZD:SYS_COMMON_ORG:FALSE,LENGTH:50,NULL,LENGTH:50,ZD:XB,NUMBER:100,DATE:YYYYMMDD,ZD:JCGA_JCYG_ZJLX,SFZH,ZD:SJZD_MZ,ZD:SYS_COMMON_ZZMM,ZD:JCGA_JCYG_WHCD,LENGTH:20,LENGTH:20,LENGTH:20,LENGTH:20,LENGTH:20,ZD:SYS_COMMON_JG:FALSE,LENGTH:100,LENGTH:100,LENGTH:100,LENGTH:100,LENGTH:20,DATE:YYYYMMDD,LENGTH:100,LENGTH:100,LENGTH:100,ZD:LJPD,NULL,NUMBER:100', 'JCGA_JCYG_APPCONFIG', null, null, '20181205154117', '20181205154117', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0AA7988DB34F4265A1BE78477EB39957', 'jcyg.shgx.fields', 'shgx,xm,xb,zjlx,zjhm,hjdz,xzdz,lxdh,bz', null, '99999', 'SHGX,XM,XB,ZJLX,ZJHM,HJDZ,XZDZ,LXDH,BZ', 'SHGX,XM,XB,ZJLX,ZJHM,HJDZ,XZDZ,LXDH,BZ', 'JCGA_JCYG_APPCONFIG', null, null, '20181205154142', '20181205154142', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('AAE275FBAB2E4ACA91AA919A387F5E68', 'jcyg.shgx.rules', 'zd:JCGA_JCYG_SHGX1,length:50,zd:XB,zd:JCGA_JCYG_ZJLX,sfzh,length:100,length:100,length:20,length:500', null, '99999', 'ZD:JCGA_JCYG_SHGX1,LENGTH:50,ZD:XB,ZD:JCGA_JCYG_ZJLX,SFZH,LENGTH:100,LENGTH:100,LENGTH:20,LENGTH:500', 'ZD:JCGA_JCYG_SHGX1,LENGTH:50,ZD:XB,ZD:JCGA_JCYG_ZJLX,SFZH,LENGTH:100,LENGTH:100,LENGTH:20,LENGTH:500', 'JCGA_JCYG_APPCONFIG', null, null, '20181205154205', '20181205154205', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D71A1AA61F714BBCB2F8201FD4672894', 'project.title', '开发者服务平台', null, '99999', 'KFZFWPT', 'KAIFAZHEFUWUPINGTAI', 'SYS_COMMON_APPCONFIG', null, null, '20181207145206', '20181207145206', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4289C25710364439B63F085E235689D8', 'SYS_FILE_SCLB', '系统-文件-上传类别', null, '99999', 'XT-WJ-SCLB', 'XITONG-WENJIAN-SHANGCHUANLEIBIE', 'SYS_COMMON_ZDLB', null, null, '20181207205856', '20181208132935', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('96CC669E9EF04EC7BE790797700D28DF', 'LOCAL', '本地', null, '10', 'BD', 'BENDI', 'SYS_FILE_SCLB', null, null, '20181207210025', '20181207210131', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1F53B9500EC14FF9BAD1E91653A8060F', 'FASTDFS', 'FASTDFS', null, '99999', 'FASTDFS', 'FASTDFS', 'SYS_FILE_SCLB', null, null, '20181207210040', '20181207210040', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D4B7466D8B974EDBA26CD4F1E2466204', 'FTP', 'FTP', null, '20', 'FTP', 'FTP', 'SYS_FILE_SCLB', null, null, '20181207210052', '20181207210139', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B5CEF0FC56B941588A9B40536EAD56A9', 'JCGA_JCYG_DWLX', '机场公安-机场员工-单位类型', null, '99999', 'JCGA-JCYG-DWLX', 'JICHANGGONGAN-JICHANGYUANGONG-DANWEILEIXING', 'SYS_COMMON_ZDLB', null, null, '20180620190352', '20180620190352', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0E369823CC1A45E88ED6BE8E8F7DCBC0', '0', '否', null, '99999', 'F', 'FOU', 'JCGA_JCYG_DWLX', null, null, '20180620190433', '20180620190433', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1A41F9FBCEA944DF86C29584A6A7EED9', '1', '对口', null, '99999', 'DK', 'DUIKOU', 'JCGA_JCYG_DWLX', null, null, '20180620190454', '20180620190454', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C040935CBA6C42728E4BA7F61C95184A', '2', '外包', null, '99999', 'WB', 'WAIBAO', 'JCGA_JCYG_DWLX', null, null, '20180620190518', '20180620190518', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1AA83278EA774D9DB1F49903BB44BE60', 'JCGA_JCYG_ZJLX', '机场公安-机场员工-证件类型', null, '99999', 'JCGA-JCYG-ZJLX', 'JICHANGGONGAN-JICHANGYUANGONG-ZHENGJIANLEIXING', 'SYS_COMMON_ZDLB', null, null, '20180625141646', '20180625141646', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F4DAF349402B4E398DF7A81C0BC529D1', '11', '居民身份证', null, '99999', 'SFZ', 'SHENFENZHENG', 'JCGA_JCYG_ZJLX', null, null, '20180625141718', '20180625141718', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('16760CE2895148808FB51A9408298663', 'JCGA_JCYG_KZQTXZLX', '机场公安-机场员工-控制区通行证类型', null, '99999', 'JCGA-JCYG-KZQTXZLX', 'JICHANGGONGAN-JICHANGYUANGONG-KONGZHIQUTONGXINGZHENGLEIXING', 'SYS_COMMON_ZDLB', null, null, '20180625202149', '20180625202149', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0821E64BB2FC4289A1A651EC4CC3519D', '1', '长期', null, '99999', 'CQ', 'CHANGQI', 'JCGA_JCYG_KZQTXZLX', null, null, '20180625202212', '20180625202212', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1D087730B4C14FD88BC276D46D5F3B32', '2', '短期', null, '99999', 'DQ', 'DUANQI', 'JCGA_JCYG_KZQTXZLX', null, null, '20180625202230', '20180625202230', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('5F5A73B7A9E84D5AAF630EB72390C362', '3', '施工', null, '99999', 'SG', 'SHIGONG', 'JCGA_JCYG_KZQTXZLX', null, null, '20180625202247', '20180625202247', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1B1B5CD0B255482D9869BA1DDC8AA421', 'JCGA_JCYG_SHGX', '机场公安-机场员工-社会关系', null, '99999', 'JCGA-JCYG-SHGX', 'JICHANGGONGAN-JICHANGYUANGONG-SHEHUIGUANXI', 'SYS_COMMON_ZDLB', null, null, '20180627151849', '20180627151849', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3C801C1D523C4BA48821B5D1AF8A99CC', '1', '父亲', null, '99999', 'FQ', 'FUQIN', 'JCGA_JCYG_SHGX', null, null, '20180627151911', '20180627151911', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('EE6286BCBB86407EB0972D448468860A', '2', '母亲', null, '99999', 'MQ', 'MUQIN', 'JCGA_JCYG_SHGX', null, null, '20180627151928', '20180627151928', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('47189076309F4755A047AE3326BF1C15', '3', '配偶', null, '99999', 'PO', 'PEIOU', 'JCGA_JCYG_SHGX', null, null, '20180627151949', '20180627151949', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F2072B065032461C9AD1D338281A8AEE', '4', '子女', null, '99999', 'ZN1', 'ZINV1', 'JCGA_JCYG_SHGX', null, null, '20180627152015', '20180627152015', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3863E2D45E864E32BB98FB4A5EA547AD', 'sjdx.fzzd.oracle', 'insert into sys_sjgl_sjzd
  (yxx,
   px,
   kzxx,
   sjdx,
   zddm,
   zdmc,
   zdms,
   zdjp,
   zdqp,
   zdlx,
   zdcd,
   zdkd,
   zdgd,
   cxmrz,
   xzmrz,
   kjlx,
   zddx,
   zdfy,
   yxpx,
   lbzs,
   cxzs,
   xzzs,
   bjzs,
   xqzs,
   cxbt,
   bjbt,
   yxbj,
   zdzdlb,
   zdywlb,
   gshff,
   fgshff,
   szhd,
   zdts,
   hdyzgz,
   qdyzgz,
   style,
   cssl,
   qcbh,
   bzzd)
  select yxx,
         px,
         kzxx,
         ''${newSjdx.id}'' as sjdx,
         zddm,
         zdmc,
         zdms,
         zdjp,
         zdqp,
         zdlx,
         zdcd,
         zdkd,
         zdgd,
         cxmrz,
         xzmrz,
         kjlx,
         zddx,
         zdfy,
         yxpx,
         lbzs,
         cxzs,
         xzzs,
         bjzs,
         xqzs,
         cxbt,
         bjbt,
         yxbj,
         zdzdlb,
         zdywlb,
         gshff,
         fgshff,
         szhd,
         zdts,
         hdyzgz,
         qdyzgz,
         style,
         cssl,
         qcbh,
         bzzd
    from sys_sjgl_sjzd t
   where t.sjdx = #oldSjdxId#
        /*if(has(mrzd)&&mrzd==''1''){*/
     and zddm in (''dxcz'')
  /*}*/
', '复制字段', '99999', null, null, 'SYS_SJGL_APPCONFIG', null, null, '20181218130733', '20181221100600', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7CDBA9C9F2994FECB0309F742A0CE80C', '0', '本人', null, '99999', 'BR', 'BENREN', 'JCGA_JCYG_SHGX', null, null, '20180627160426', '20180627160426', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4CAE6F99C1CF4B86B8D9BD97145A7376', 'SYS_SJGL_APPCONFIG', '系统-数据管理-应用配置', null, '99999', 'XT-SJGL-YYPZ', 'XITONG-SHUJUGUANLI-YINGYONGPEIZHI', 'SYS_COMMON_ZDLB', null, null, '20181207221956', '20181208140137', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('25D593A6F40D449D80B6BC6ED5166B27', 'project.title', '数据管理平台', null, '99999', 'SJGLPT', 'SHUJUGUANLIPINGTAI', 'SYS_SJGL_APPCONFIG', null, null, '20181207222056', '20181207222056', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B426B30B07954A889CF5227BE4320CEE', 'JIU', '九江', null, '99999', 'JJ', 'JIUJIANG', 'SYS_COMMON_JCDM', null, null, '20170814153302', '20170814174048', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3572840DDBB54BA39C9B71B7E400FEF4', 'JJN', '泉州晋江', null, '99999', 'QZJJ', 'QUANZHOUJINJIANG', 'SYS_COMMON_JCDM', null, null, '20170814153319', '20170814174048', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C165959D8F534B678F7DCCC9C0FDE06B', 'JMU', '佳木斯', null, '99999', 'JMS', 'JIAMUSI', 'SYS_COMMON_JCDM', null, null, '20170814153340', '20170814174048', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('AE2A02397DF84C4D8FCE13745DEA79C1', 'JZH', '九寨沟', null, '99999', 'JZG', 'JIUZHAIGOU', 'SYS_COMMON_JCDM', null, null, '20170814153357', '20170814174048', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('274F75C2BABA49379706E47DB33C8FBA', 'KCA', '库车', null, '99999', 'KC', 'KUCHE', 'SYS_COMMON_JCDM', null, null, '20170814153414', '20170814174048', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6E1B1E1742DD451A8A2CB7851F49024E', 'KHG', '喀什', null, '99999', 'KS', 'KASHEN', 'SYS_COMMON_JCDM', null, null, '20170814153431', '20170814174205', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('90ABBF28C29A4A57BB213787BD8A80DF', 'JCGA_JCYG_SHGX1', '机场公安-机场员工-社会关系1', '不含本人', '99999', 'JCGA-JCYG-SHGX1', 'JICHANGGONGAN-JICHANGYUANGONG-SHEHUIGUANXI1', 'SYS_COMMON_ZDLB', null, 'select dm,mc,px,ms||jp||qp as search_key from sys_zd_tyzd where zdlb=''JCGA_JCYG_SHGX'' and isdel=''0'' and dm<>''0''', '20180630101347', '20180630101347', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B82FF11048304F65835578FA830594B0', 'project.title', '重庆机场用工人员管理系统', null, '99999', 'CQJCYGRYGLXT', 'CHONGQINGJICHANGYONGGONGRENYUANGUANLIXITONG', 'JCGA_JCYG_APPCONFIG', null, null, '20181207173127', '20181207173127', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('EC327D5B7BAD446CA687231AE8D86654', 'SYS_COMMON_ZZMM', '系统-公用-政治面貌', null, '100', 'XT-GY-ZZMM', 'XITONG-GONGYONG-ZHENGZHIMIANMAO', 'SYS_COMMON_ZDLB', null, null, '20180625164542', '20180625164542', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A0D3AAA2A08B442B9565A111371E6894', '1', '中共党员', null, '99999', 'ZGDY', 'ZHONGGONGDANGYUAN', 'SYS_COMMON_ZZMM', null, null, '20180625164609', '20180625164609', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('65695F2E6AD94053AFDE81F9F55370BF', '2', '民主党派', null, '99999', 'MZDP', 'MINZHUDANGPAI', 'SYS_COMMON_ZZMM', null, null, '20180625164638', '20180625164638', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C26FD3BB0706496A9F23A8437100CD2B', '3', '共青团员', null, '99999', 'GQTY', 'GONGQINGTUANYUAN', 'SYS_COMMON_ZZMM', null, null, '20180625164658', '20180625164658', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('BA9672FBD11F48CDB68F2A8E06BE7B93', '4', '群众', null, '99999', 'QZ', 'QUNZHONG', 'SYS_COMMON_ZZMM', null, null, '20180625164717', '20180625164717', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('14942EA73219491A8B44C89DB440DD35', 'SYS_COMMON_JG', '系统-公用-籍贯', null, '100', 'XT-GY-JG', 'XITONG-GONGYONG-JIGUAN', 'SYS_COMMON_ZDLB', null, null, '20180625165742', '20180625165742', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3F8790560EC74C52A11368A83DA05283', '110000', '北京', null, '99999', 'BJ', 'BEIJING', 'SYS_COMMON_JG', null, null, '20180625170020', '20180625170020', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('EB3BD7CD0FE84452A80ED732862A05E1', '500000', '重庆市', null, '99999', 'CQS', 'CHONGQINGSHI', 'SYS_COMMON_JG', null, null, '20180625170048', '20180625170048', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('504A8308770F45099F99507756D6541F', '500100', '重庆市市辖区', null, '99999', 'CQSSXQ', 'CHONGQINGSHISHIXIAQU', 'SYS_COMMON_JG', null, null, '20180625170118', '20180625170118', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('215E303366FD4405A8C801CD9EC70419', '500101', '重庆市万州区', null, '99999', 'CQSWZQ', 'CHONGQINGSHIWANZHOUQU', 'SYS_COMMON_JG', null, null, '20180625170202', '20180625170202', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('EE3187B646AC47DF8E2E3BDD941CD1DC', 'sjdx.insert.oracle', '/*
var insertf = "";
var values = "";
//循环生成字段
for(field in fieldList){
     if(su.isNotBlank(obj[field.zddm])){
          insertf = insertf+","+field.zddm;
          values = values+",#obj."+field.zddm+"#";
     }
 }
 if(!isEmpty(kzxx.fields.sszzd)&&!isEmpty(obj[kzxx.fields.sszzd.zddm])){
     //设置简拼和全拼
     if(!isEmpty(kzxx.fields.pyjp)){
          insertf = insertf+","+kzxx.fields.pyjp.zddm;
          values = values+",''"+su.getSimpleSpell(obj[kzxx.fields.sszzd.zddm])+"''";
     }
     if(!isEmpty(kzxx.fields.pyqp)){
          insertf = insertf+","+kzxx.fields.pyqp.zddm;
          values = values+",''"+su.getFullSpell(obj[kzxx.fields.sszzd.zddm])+"''";
     }
 }
 insertf = su.substring(insertf, 1);
 values = su.substring(values, 1);
*/
insert into ${tableName} (${insertf}) values (${values})', null, '99999', 'INSERT INTO ${TABLENAME}
  (
   /*
   //XHSCZD
   FOR(FIELD IN FIELDS){}
   */
   )
', 'INSERT INTO ${TABLENAME}
  (
   /*
   //XUNHUANSHENGCHENGZIDUAN
   FOR(FIELD IN FIELDS){}
   */
   )
', 'SYS_SJGL_APPCONFIG', null, null, '20181213112333', '20181219143625', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('AAD97546CDCD4EA7A2FB5FF461EB3B08', 'sjdx.update.oracle', '/*
var setf = "";
if(su.isNotBlank(sjdx.zlzd)){
    setf = setf+","+sjdx.zlzd+"=to_char(sysdate,''yyyymmddhh24miss'')";
}
var whereStr = sjdx.zjzd+"=#yobj."+sjdx.zjzd+"#";
//循环生成字段
for(field in fieldList){
     if(yobj[field.zddm]!=null&&field.zddm!=sjdx.zjzd){
          setf = setf+","+field.zddm+"=#yobj."+field.zddm+"#";
     }
 }
 if(!isEmpty(kzxx.fields.sszzd)&&!isEmpty(yobj[kzxx.fields.sszzd.zddm])){
     //设置简拼和全拼
     if(!isEmpty(kzxx.fields.pyjp)){
          setf = setf+","+kzxx.fields.pyjp.zddm+"=''"+su.getSimpleSpell(yobj[kzxx.fields.sszzd.zddm])+"''";
     }
     if(!isEmpty(kzxx.fields.pyqp)){
          setf = setf+","+kzxx.fields.pyqp.zddm+"=''"+su.getFullSpell(yobj[kzxx.fields.sszzd.zddm])+"''";
     }
 }
 setf = su.substring(setf, 1);
*/
update ${tableName} set ${setf} where ${whereStr}', null, '99999', null, null, 'SYS_SJGL_APPCONFIG', null, null, '20181213201559', '20181220214754', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A2301556CF9E47E7AE276995E546E1C5', 'SYS_SJGL_SJDX', '系统-数据管理-数据对象', null, '99999', 'XT-SJGL-SJDX', 'XITONG-SHUJUGUANLI-SHUJUDUIXIANG', 'SYS_COMMON_ZDLB', null, 'select t.id dm,t.dxmc mc,t.px,t.dxdm||t.dxms||t.dxjp||t.dxqp search_key from sys_sjgl_sjdx t', '20181213204151', '20181216132255', null, '0', null, '0');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D8308E0D3CCF4DA5B6A24208F38D68A9', 'sjdx.wlplsc.oracle', '/*
if(isEmpty(sjdx.yxxzd)){
*/
delete from ${tableName} where ${sjdx.zjzd} ${idsIn}
/*}else{*/
delete from ${tableName} where ${sjdx.zjzd} ${idsIn} and ${sjdx.yxxzd}=''0'' 
/*}*/', '物理删除，没有设置有效性字段则直接删除，否则只物理删除无效的', '99999', '/*
IF(ISEMPTY(SJDX.YXXZD)){
*/
DELETE FROM ${TABLENAME} WHERE ${SJDX.ZJZD} ${IDSIN}
/*}ELSE{*/
DELETE FROM ${TABLENAME} WHERE ${SJDX.ZJZD} ${IDSIN} AND ${SJDX.YXXZD}=''0'' 
/*}*/', '/*
IF(ISEMPTY(SJDX.YXXZD)){
*/
DELETE FROM ${TABLENAME} WHERE ${SJDX.ZJZD} ${IDSIN}
/*}ELSE{*/
DELETE FROM ${TABLENAME} WHERE ${SJDX.ZJZD} ${IDSIN} AND ${SJDX.YXXZD}=''0'' 
/*}*/', 'SYS_SJGL_APPCONFIG', null, null, '20181219103306', '20181219103717', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('55663D62C2E74B85970CB677435B1C1F', 'sjdx.wldelete.oracle', '/*
if(isEmpty(sjdx.yxxzd)){
*/
delete from ${tableName} where ${sjdx.zjzd} = #obj.${sjdx.zjzd}#
/*}else{*/
delete from ${tableName} where ${sjdx.zjzd} = #obj.${sjdx.zjzd}# and ${sjdx.yxxzd}=''0''
/*}*/', '物理删除，没有设置有效性字段则直接删除，否则只物理删除无效的', '99999', null, null, 'SYS_SJGL_APPCONFIG', null, null, '20181219103555', '20181219103703', null, '1', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('679183069ADC484E86857146540DA56B', 'SHP', '山海关', null, '99999', 'SHG', 'SHANHAIGUAN', 'SYS_COMMON_JCDM', null, null, '20170814155823', '20170814174427', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A2EE2E1B3EEC4004BC443FBA011BEE3B', 'SHS', '沙市', null, '99999', 'SS', 'SHASHI', 'SYS_COMMON_JCDM', null, null, '20170814155840', '20170814174427', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E651F9B7545641108FECAAB51823FF27', 'SIA', '西安', null, '99999', 'XA', 'XIAN', 'SYS_COMMON_JCDM', null, null, '20170814155857', '20170814174427', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FF13C563222847C9A9821D13C8512086', 'SIN', 'SINGAPORE', null, '99999', 'SINGAPORE', 'SINGAPORE', 'SYS_COMMON_JCDM', null, null, '20170814155921', '20170814174427', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7E3B0ED33C384784B461798E223D15A9', 'SJW', '石家庄', null, '99999', 'SJZ', 'SHIJIAZHUANG', 'SYS_COMMON_JCDM', null, null, '20170814155938', '20170814174427', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FBC10781E9B649479BA9AE3BB13CA66F', 'SWA', '汕头', null, '99999', 'ST', 'SHANTOU', 'SYS_COMMON_JCDM', null, null, '20170814155956', '20170814174427', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4D0599BD17FC414CB228B5D5853E371D', 'SXJ', '鄯善', null, '99999', 'SS', 'SHANSHAN', 'SYS_COMMON_JCDM', null, null, '20170814160010', '20170814174541', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('66CF0DF914FE4374AD2AC370B00D79EC', 'SYM', '思茅', null, '99999', 'SM', 'SIMAO', 'SYS_COMMON_JCDM', null, null, '20170814160031', '20170814174541', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('5B49FA6BD423452E84E63AF879B5A472', 'SYX', '三亚', null, '99999', 'SY', 'SANYA', 'SYS_COMMON_JCDM', null, null, '20170814160047', '20170814174541', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C74A801D4FB242A2A1CB7B5E2DC8C360', 'SZX', '深圳', null, '99999', 'SZ', 'SHENZHEN', 'SYS_COMMON_JCDM', null, null, '20170814160113', '20170814174541', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('928D52C84D0D44D498AEB73AA1BA72C4', 'TAO', '青岛', null, '99999', 'QD', 'QINGDAO', 'SYS_COMMON_JCDM', null, null, '20170814160145', '20170814174541', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DC11F22A453A4199A74F83A724297ABF', 'TEN', '铜仁', null, '99999', 'TR', 'TONGREN', 'SYS_COMMON_JCDM', null, null, '20170814160201', '20170814174541', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('621C7B491F454B9FBA7360298731C721', 'TGO', '通辽', null, '99999', 'TL', 'TONGLIAO', 'SYS_COMMON_JCDM', null, null, '20170814160219', '20170814174541', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('600C34D2320A4579AC546274F2B968D5', 'TNA', '济南', null, '99999', 'JN', 'JINAN', 'SYS_COMMON_JCDM', null, null, '20170814160237', '20170814174541', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('90646691000D43B193712059A9F0AEE5', 'TNN', '台南', null, '99999', 'TN', 'TAINAN', 'SYS_COMMON_JCDM', null, null, '20170814160255', '20170814174541', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('9A0E203F80A9405C9382094830D240F3', 'TPE', '台北', null, '99999', 'TB', 'TAIBEI', 'SYS_COMMON_JCDM', null, null, '20170814160314', '20170814174541', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('98C5076C7624465C94779CF8D4A625F5', 'TSA', '台北', null, '99999', 'TB', 'TAIBEI', 'SYS_COMMON_JCDM', null, null, '20170814160331', '20170814174541', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A8F2F0E0841E4504B719B93AC0FD7B81', 'TSN', '天津', null, '99999', 'TJ', 'TIANJIN', 'SYS_COMMON_JCDM', null, null, '20170814162019', '20170814174541', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4B768285AE0C4ABCA7D34CFB5FF32D0C', 'TTT', '台东', null, '99999', 'TD', 'TAIDONG', 'SYS_COMMON_JCDM', null, null, '20170814162038', '20170814174541', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('09641B347475449CBB1F199927902B64', 'TXG', '台中', null, '99999', 'TZ', 'TAIZHONG', 'SYS_COMMON_JCDM', null, null, '20170814162057', '20170814174541', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('9D06083D0A0A4DBC82CB46D5681C21EE', 'TXN', '黄山', null, '99999', 'HS', 'HUANGSHAN', 'SYS_COMMON_JCDM', null, null, '20170814162116', '20170814174541', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E855C7F209F1459FB929BD8D515DF716', 'TYN', '太原', null, '99999', 'TY', 'TAIYUAN', 'SYS_COMMON_JCDM', null, null, '20170814162135', '20170814174711', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0401805AAEB64F3FA250C86DD003426E', 'URC', '乌鲁木齐', null, '99999', 'WLMQ', 'WULUMUQI', 'SYS_COMMON_JCDM', null, null, '20170814162153', '20170814174711', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('BA2D41BAF0B24CCE9CE8070A1AFE3812', 'UYN', '榆林', null, '99999', 'YL', 'YULIN', 'SYS_COMMON_JCDM', null, null, '20170814162209', '20170814174711', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('EAB8C10C8D5442658685965B5B8C8FF7', 'WJD', '武汉', null, '99999', 'WH', 'WUHAN', 'SYS_COMMON_JCDM', null, null, '20170814162225', '20170814174711', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D931839E4933427C98C9BAB5B7D9DBE9', 'WNZ', '温州', null, '99999', 'WZ', 'WENZHOU', 'SYS_COMMON_JCDM', null, null, '20170814162241', '20170814174711', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('34F6338DF60C499EA3BB49DF392EC8DA', 'WUH', '武汉', null, '99999', 'WH', 'WUHAN', 'SYS_COMMON_JCDM', null, null, '20170814162314', '20170814174711', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D42053E9D83F4E58B2237C22E7B32EE8', 'WUS', '武夷山', null, '99999', 'WYS', 'WUYISHAN', 'SYS_COMMON_JCDM', null, null, '20170814162331', '20170814174711', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7BD3B6F6B1F3473EA059008779C09E9D', 'WUZ', '梧州', null, '99999', 'WZ', 'WUZHOU', 'SYS_COMMON_JCDM', null, null, '20170814162349', '20170814174711', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1D5D170A3876447B88470E80192E37B3', 'WXN', '万州', null, '99999', 'WZ', 'WANZHOU', 'SYS_COMMON_JCDM', null, null, '20170814162406', '20170814174711', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('926BD3196BE54BF9B129500478977C4C', 'XEN', '兴城', null, '99999', 'XC', 'XINGCHENG', 'SYS_COMMON_JCDM', null, null, '20170814162423', '20170814174711', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('46EFE58366084DEB9112E93036ACABFD', 'XFN', '襄樊', null, '99999', 'XF', 'XIANGFAN', 'SYS_COMMON_JCDM', null, null, '20170814162441', '20170814174711', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6C3AFE7E87C64A0B90305EB147F57C8F', 'XIC', '西昌', null, '99999', 'XC', 'XICHANG', 'SYS_COMMON_JCDM', null, null, '20170814162510', '20170814174711', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4010E120D5FC4577B606A680AF72F8B5', 'XIL', '锡林浩特', null, '99999', 'XLHT', 'XILINHAOTE', 'SYS_COMMON_JCDM', null, null, '20170814162530', '20170814174711', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('290FBA6F013B4C05ADF9A0716CCFE5A2', 'XIN', '兴宁', null, '99999', 'XN', 'XINGNING', 'SYS_COMMON_JCDM', null, null, '20170814162547', '20170814174711', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('2514E983D174466484C511E2EE2996A9', 'XIQ', '西安', null, '99999', 'XA', 'XIAN', 'SYS_COMMON_JCDM', null, null, '20170814162612', '20170814174711', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3E5DF29E87FC4060AD4F5C3B5F8957E3', 'XIY', '西安', null, '99999', 'XA', 'XIAN', 'SYS_COMMON_JCDM', null, null, '20170814162658', '20170814174834', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('027A9C2F4A2F4EA8BBCB3E72E93B5FE8', 'XMN', '厦门', null, '99999', 'XM', 'XIAMEN', 'SYS_COMMON_JCDM', null, null, '20170814162714', '20170814174834', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1DEDD2D75F4B40ABB07EE0D82C122220', 'XNN', '西宁', null, '99999', 'XN', 'XINING', 'SYS_COMMON_JCDM', null, null, '20170814162732', '20170814174834', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D883205BC3644C44ADA85061DB7917B7', 'XUZ', '徐州', null, '99999', 'XZ', 'XUZHOU', 'SYS_COMMON_JCDM', null, null, '20170814162749', '20170814174834', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8781EBF2E16D4FDCBBAC28C1279ABD7D', 'YBP', '宜宾', null, '99999', 'YB', 'YIBIN', 'SYS_COMMON_JCDM', null, null, '20170814162823', '20170814174834', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D238A258491B44D694837CAA0ACF2C77', 'YIH', '宜昌', null, '99999', 'YC', 'YICHANG', 'SYS_COMMON_JCDM', null, null, '20170814162844', '20170814174834', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4FB56B8E5C0540168EAA4F847CEBA281', 'YIN', '伊宁', null, '99999', 'YN', 'YINING', 'SYS_COMMON_JCDM', null, null, '20170814162903', '20170814174834', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('28ED36C654D14196BF6ECEC3A30BE4A2', 'YIW', '义乌', null, '99999', 'YW', 'YIWU', 'SYS_COMMON_JCDM', null, null, '20170814162919', '20170814174834', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B49BB14EEB8A4FE181CE2FC4C1A8F3DC', 'YLN', '依兰', null, '99999', 'YL', 'YILAN', 'SYS_COMMON_JCDM', null, null, '20170814162934', '20170814174834', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E1D09CB4599E42C687D9C3F0CA1FCDD2', 'YNJ', '延吉', null, '99999', 'YJ', 'YANJI', 'SYS_COMMON_JCDM', null, null, '20170814163142', '20170814174834', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('713BAFA0DA8049329782337B25CB9306', 'YNT', '烟台', null, '99999', 'YT', 'YANTAI', 'SYS_COMMON_JCDM', null, null, '20170814163200', '20170814174834', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('9B212EE604674872AFCC390EA7896796', 'YUA', '元谋', null, '99999', 'YM', 'YUANMOU', 'SYS_COMMON_JCDM', null, null, '20170814163214', '20170814174834', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3CF618A5BE164F369751EE35A976D479', 'ZAT', '昭通', null, '99999', 'ZT', 'ZHAOTONG', 'SYS_COMMON_JCDM', null, null, '20170814163231', '20170814174834', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('17700093F2FC41239F274EBC652B9D9B', 'ZGC', '兰州', null, '99999', 'LZ', 'LANZHOU', 'SYS_COMMON_JCDM', null, null, '20170814163245', '20170814174834', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F1C08252B8B24D688826F9BF057689B5', 'ZHA', '湛江', null, '99999', 'ZJ', 'ZHANJIANG', 'SYS_COMMON_JCDM', null, null, '20170814163301', '20170814174834', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C216A1A3EA63471399D9BC4265576F7E', 'ZUH', '珠海', null, '99999', 'ZH', 'ZHUHAI', 'SYS_COMMON_JCDM', null, null, '20170814163317', '20170814174850', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F1647F7E038E4BBF8D14369B753F8078', 'ZYI', '遵义', null, '99999', 'ZY', 'ZUNYI', 'SYS_COMMON_JCDM', null, null, '20170814163333', '20170814174850', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F253F5A2459E4D87B1911032D13DD2C4', 'JZ_JJZD_CLLX', '警种-交警-车辆类型', null, '99999', 'JZ-JJ-CLLX', 'JINGZHONG-JIAOJING-CHELIANGLEIXING', 'SYS_COMMON_ZDLB', null, null, '20170817150513', '20181208135853', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F3F6AF4889744E0C96A87F4D49348D71', '01', '大型汽车', null, '99999', 'DXQC', 'DAXINGQICHE', 'JZ_JJZD_CLLX', null, null, '20170817151018', '20170817151018', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6894E7E4E9B84167B5C6D0D0A086131E', '02', '小型汽车', null, '99999', 'XXQC', 'XIAOXINGQICHE', 'JZ_JJZD_CLLX', null, null, '20170817151041', '20170817151041', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4999CBF4887646DB850B46C3039ADFC7', '03', '使馆汽车', null, '99999', 'SGQC', 'SHIGUANQICHE', 'JZ_JJZD_CLLX', null, null, '20170817151111', '20170817151111', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D26E9E7BCE73402D89A204E702BE1C7C', '04', '领馆汽车', null, '99999', 'LGQC', 'LINGGUANQICHE', 'JZ_JJZD_CLLX', null, null, '20170817151138', '20170817151138', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FBA94E8916C246759AD2E741C037BFC6', '05', '境外汽车', null, '99999', 'JWQC', 'JINGWAIQICHE', 'JZ_JJZD_CLLX', null, null, '20170817151149', '20170817151211', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C2B3F5489C39421686A6A306B050F51C', '06', '外籍汽车', null, '99999', 'WJQC', 'WAIJIQICHE', 'JZ_JJZD_CLLX', null, null, '20170817151236', '20170817151236', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('CFE154A9E86E41A79E19164BB6EA0DF2', '07', '普通摩托车', null, '99999', 'PTMTC', 'PUTONGMOTUOCHE', 'JZ_JJZD_CLLX', null, null, '20170817151255', '20170817151255', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('03E43534AF7B4E82A079BE10FA882CCB', '08', '轻便摩托车', null, '99999', 'QBMTC', 'QINGBIANMOTUOCHE', 'JZ_JJZD_CLLX', null, null, '20170817151311', '20170817151311', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B193A3D2312B4AD1B7A5EB8B2921567B', '09', '使馆摩托车', null, '99999', 'SGMTC', 'SHIGUANMOTUOCHE', 'JZ_JJZD_CLLX', null, null, '20170817151325', '20170817151325', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4F6BA6C9AB7B4C53840F658E246AF561', '10', '领馆摩托车', null, '99999', 'LGMTC', 'LINGGUANMOTUOCHE', 'JZ_JJZD_CLLX', null, null, '20170817151347', '20170817151347', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('368ABF998AA549A8A4867F1712619FB9', '11', '境外摩托车', null, '99999', 'JWMTC', 'JINGWAIMOTUOCHE', 'JZ_JJZD_CLLX', null, null, '20170817151407', '20170817151407', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('03DB3EEC2BB840C5A6FDBA105C88FF79', '12', '外籍摩托车', null, '99999', 'WJMTC', 'WAIJIMOTUOCHE', 'JZ_JJZD_CLLX', null, null, '20170817151511', '20170817151511', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('01DE6A618E124FD5BBB385E4592C3706', '13', '低速车', null, '99999', 'DSC', 'DISUCHE', 'JZ_JJZD_CLLX', null, null, '20170817151531', '20170817151531', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('16B26488BF994ED5A277BFFC8A1CC724', '14', '拖拉机', null, '99999', 'TLJ', 'TUOLAJI', 'JZ_JJZD_CLLX', null, null, '20170817151544', '20170817151544', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('2EC8839E30B64174BACFFB7D93E7E9F6', '15', '挂车', null, '99999', 'GC', 'GUACHE', 'JZ_JJZD_CLLX', null, null, '20170817151558', '20170817151558', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F7D7BD4C926B49D1A576936AD755EABB', '16', '教练汽车', null, '99999', 'JLQC', 'JIAOLIANQICHE', 'JZ_JJZD_CLLX', null, null, '20170817151611', '20170817151611', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E4A7F8BF64EE45C3B9E944820A73D4AD', '17', '教练摩托车', null, '99999', 'JLMTC', 'JIAOLIANMOTUOCHE', 'JZ_JJZD_CLLX', null, null, '20170817151705', '20170817151705', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('2A468C5D4E20455A8026F86E99C3304C', '18', '试验汽车', null, '99999', 'SYQC', 'SHIYANQICHE', 'JZ_JJZD_CLLX', null, null, '20170817151726', '20170817151726', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0E81064318204597823F88379FB0CA1F', '19', '试验摩托车', null, '99999', 'SYMTC', 'SHIYANMOTUOCHE', 'JZ_JJZD_CLLX', null, null, '20170817151740', '20170817151740', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('920129DCF1E345FAA86D32FEB99C9AE2', '20', '临时入境汽车', null, '99999', 'LSRJQC', 'LINSHIRUJINGQICHE', 'JZ_JJZD_CLLX', null, null, '20170817151751', '20170817151858', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F3E09CD4AB074DD38B977ACAF67127B4', '21', '临时入境摩托车', null, '99999', 'LSRJMTC', 'LINSHIRUJINGMOTUOCHE', 'JZ_JJZD_CLLX', null, null, '20170817151807', '20170817151807', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('5BE84AAD3DD246CB9A156FB5D0CFCEBC', '22', '临时行驶车', null, '99999', 'LSXSC', 'LINSHIXINGSHICHE', 'JZ_JJZD_CLLX', null, null, '20170817151819', '20170817151819', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FAC9F3B9691F42DF8FDB3D29B19BFD3B', '23', '警用汽车', null, '99999', 'JYQC', 'JINGYONGQICHE', 'JZ_JJZD_CLLX', null, null, '20170817151835', '20170817151835', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3C16CF2B712C4E2B96F254B242BECF0B', 'SYS_COMMON_JCDM', '系统-公用-机场代码', null, '100', 'JCDM', 'JICHANGDAIMA', 'SYS_COMMON_ZDLB', null, null, '20170814120134', '20181208133224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A763BE62A41D4E4E9CBAB5880BE38F75', 'AAT', '阿勒泰', null, '99999', 'ALT', 'ALETAI', 'SYS_COMMON_JCDM', null, null, '20170814141550', '20170814173444', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('588A9E6937A54578A33BA4FEDC76E4E6', 'AKA', '安康', null, '99999', 'AK', 'ANKANG', 'SYS_COMMON_JCDM', null, null, '20170814141624', '20170814173444', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('65591C10B01C4E1AAB02CC5C731F41B9', 'AKU ', '阿克苏', null, '99999', 'AKS', 'AKESU', 'SYS_COMMON_JCDM', null, null, '20170814141651', '20170814173444', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('5794D0F00F8044FEADE8737D2929D48D', 'AQG', '安庆', null, '99999', 'AQ', 'ANQING', 'SYS_COMMON_JCDM', null, null, '20170814141739', '20170814173444', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('366AC889E5924AACB418A1DED0B33A85', 'AYN', '安阳', null, '99999', 'AY', 'ANYANG', 'SYS_COMMON_JCDM', null, null, '20170814141804', '20170814173444', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('916835C6D07244419ADF14E0110DF9FE', 'BAV', '包头', null, '99999', 'BT', 'BAOTOU', 'SYS_COMMON_JCDM', null, null, '20170814141831', '20170814173444', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7E05A81EB16541E4AD6BE428202E9EAA', 'BHY', '北海', null, '99999', 'BH', 'BEIHAI', 'SYS_COMMON_JCDM', null, null, '20170814141921', '20170814173554', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('70BACBDC93544F1383FE1277C6452FCD', 'BSD', '保山', null, '99999', 'BS', 'BAOSHAN', 'SYS_COMMON_JCDM', null, null, '20170814150904', '20170814173554', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4F731C571E524EA9811356928A27DD03', 'C17', 'CHINA', null, '99999', 'CHINA', 'CHINA', 'SYS_COMMON_JCDM', null, null, '20170814150920', '20170814173554', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4BF1E52ED6EE4579BF417F4A9008FF4B', 'CAN', '广州', null, '99999', 'GZ', 'GUANGZHOU', 'SYS_COMMON_JCDM', null, null, '20170814150942', '20170814173554', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E31C3BCB8AC24E3A97B1C77C806C3FE9', 'CGD', '常德', null, '99999', 'CD', 'CHANGDE', 'SYS_COMMON_JCDM', null, null, '20170814151000', '20170814173554', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DE5AF32A40034D46832CB7D0ACCBAD34', 'CGO', '郑州', null, '99999', 'ZZ', 'ZHENGZHOU', 'SYS_COMMON_JCDM', null, null, '20170814151024', '20170814173554', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('CA3D210859E74EA9BE0F2E9DDB845C38', 'CGQ', '长春', null, '99999', 'CC', 'CHANGCHUN', 'SYS_COMMON_JCDM', null, null, '20170814151045', '20170814173555', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('BD6949D772314E45B8A110DD4462E13D', 'CHG', '朝阳', null, '99999', 'CY', 'CHAOYANG', 'SYS_COMMON_JCDM', null, null, '20170814151108', '20170814173555', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FFD31E5789CA41249F8CF38F1049B7F6', 'CHW', '酒泉', null, '99999', 'JQ', 'JIUQUAN', 'SYS_COMMON_JCDM', null, null, '20170814151131', '20170814173555', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('89A214B4D6B949D98D41469595356B74', 'CIF', '赤峰', null, '99999', 'CF', 'CHIFENG', 'SYS_COMMON_JCDM', null, null, '20170814151217', '20170814173555', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1AB9E9450B354BDAAF90B0E99349D0D0', 'CIH', '长治', null, '99999', 'CZ', 'CHANGZHI', 'SYS_COMMON_JCDM', null, null, '20170814151252', '20170814173555', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0F479A51772F41F28A73497D8ED7319B', 'CKG', '重庆', null, '99999', 'CQ', 'CHONGQING', 'SYS_COMMON_JCDM', null, null, '20170814151311', '20170814173555', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('841F0E9B84AD4A41861E3988895A02B0', 'CNI', '长海', null, '99999', 'CH', 'CHANGHAI', 'SYS_COMMON_JCDM', null, null, '20170814151331', '20170814173555', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7B9ED564D2E046788D71D9CAA24D3A81', 'CSX', '长沙', null, '99999', 'CS', 'CHANGSHA', 'SYS_COMMON_JCDM', null, null, '20170814151356', '20170814173555', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6B33F7561C2F4714A29D0050A68FD2F5', 'CTU', '成都', null, '99999', 'CD', 'CHENGDU', 'SYS_COMMON_JCDM', null, null, '20170814151415', '20170814173555', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('66B8DDAEFC21424DBD825E8F22EE7357', 'CZX', '常州', null, '99999', 'CZ', 'CHANGZHOU', 'SYS_COMMON_JCDM', null, null, '20170814151437', '20170814173703', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('02EDE0A96DC74616BE0599F53CF7C229', 'DAT', '大同', null, '99999', 'DT', 'DATONG', 'SYS_COMMON_JCDM', null, null, '20170814151456', '20170814173703', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1A6336F6570A45CD891D8CBF5DDBC66B', 'DAX', '达县', null, '99999', 'DX', 'DAXIAN', 'SYS_COMMON_JCDM', null, null, '20170814151517', '20170814173703', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1E6A24B213CD4A34B3BA34F95E64E4B7', 'DDG', '丹东', null, '99999', 'DD', 'DANDONG', 'SYS_COMMON_JCDM', null, null, '20170814151537', '20170814173703', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8F447B93A07C4775A3CD510C2728546B', 'DIG', '迪庆香格里拉', null, '99999', 'DQXGLL', 'DIQINGXIANGGELILA', 'SYS_COMMON_JCDM', null, null, '20170814151603', '20170814173703', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C552C84B8F98432FB2F46FDAF279AFF5', 'DLC', '大连', null, '99999', 'DL', 'DALIAN', 'SYS_COMMON_JCDM', null, null, '20170814151622', '20170814173703', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('10D22A462B394DF7AEAB209CAB8ED0C5', 'DNH', '敦煌', null, '99999', 'DH', 'DUNHUANG', 'SYS_COMMON_JCDM', null, null, '20170814151639', '20170814173703', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('627B5C8C3E60422FB72F7C9588970622', 'DSN', '东胜', null, '99999', 'DS', 'DONGSHENG', 'SYS_COMMON_JCDM', null, null, '20170814151658', '20170814173703', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D6B57494BF48420697DB5AECFA5A42CA', 'DYG', '张家界', null, '99999', 'ZJJ', 'ZHANGJIAJIE', 'SYS_COMMON_JCDM', null, null, '20170814151716', '20170814173703', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6887AC93DDCE4FF6B26E6E372168EDF0', 'DZU', '大足', null, '99999', 'DZ', 'DAZU', 'SYS_COMMON_JCDM', null, null, '20170814151735', '20170814173704', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F0A5B6FF7DB9433FBB67495CDB24B0CB', 'ENH', '恩施', null, '99999', 'ES', 'ENSHI', 'SYS_COMMON_JCDM', null, null, '20170814151804', '20170814173704', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('94D4D1AD173C4A178765B1021474BD51', 'ENY', '延安', null, '99999', 'YA', 'YANAN', 'SYS_COMMON_JCDM', null, null, '20170814151824', '20170814173704', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('98123B302D35423EBFCBD4032D92EBCA', 'FOC', '福州', null, '99999', 'FZ', 'FUZHOU', 'SYS_COMMON_JCDM', null, null, '20170814151842', '20170814173704', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('EF0640A49056439695F95A329875D80B', 'FUG', '阜阳', null, '99999', 'FY', 'FUYANG', 'SYS_COMMON_JCDM', null, null, '20170814151859', '20170814173704', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8EEB843B8B7043B0BA0572ECE0614353', 'FYN', '富蕴', null, '99999', 'FY', 'FUYUN', 'SYS_COMMON_JCDM', null, null, '20170814151921', '20170814173704', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B621B952469246F99BBEF44B2A746299', 'GHN', '广汉', null, '99999', 'GH', 'GUANGHAN', 'SYS_COMMON_JCDM', null, null, '20170814152505', '20170814173939', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('AF431A46BDF04B6EAA7CED1B62E543EB', 'GOQ', '格尔木', null, '99999', 'GEM', 'GEERMU', 'SYS_COMMON_JCDM', null, null, '20170814152524', '20170814173939', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7232AFD750C243EBAF3F0120A525494F', 'HAK', '海口', null, '99999', 'HK', 'HAIKOU', 'SYS_COMMON_JCDM', null, null, '20170814152542', '20170814173939', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7640CC9675FE4FCAB8917E1199ED65CA', 'HEK', '黑河', null, '99999', 'HH', 'HEIHE', 'SYS_COMMON_JCDM', null, null, '20170814152603', '20170814173939', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C4729E5CF2DA45049E40BDA6C312686F', 'HET', '呼和浩特', null, '99999', 'HHHT', 'HUHEHAOTE', 'SYS_COMMON_JCDM', null, null, '20170814152623', '20170814173939', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D4F13A49A44F47439D6389E363AC3F60', '334', '赫德岛和麦克唐纳岛', null, '99999', 'HDDHMKTND', 'HEDEDAOHEMAIKETANGNADAO', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D0A9CA73E80648ABB03CC5C039473CD2', '340', '洪都拉斯', null, '99999', 'HDLS', 'HONGDOULASI', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170630104437', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('5DDFF4CE62404425B3A8505A0F72363C', '296', '基里巴斯', null, '99999', 'JLBS', 'JILIBASI', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F6E4B75BC2984AD5B78CC90CD8522377', '262', '吉布提', null, '99999', 'JBD', 'JIBUDI', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0C122B229ED74A7E9571EB6B42F6A5BB', '324', '几内亚', null, '99999', 'JNY', 'JINEIYA', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('5DB5C08C580843E7985B87F6995A77C9', '124', '加拿大', null, '99999', 'JND', 'JIANADA', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('9B9E1B50A16647AD94F4690BC3A4F608', '288', '加纳', null, '99999', 'JN', 'JIANA', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('1956DBC448CE45DD813C65377974FCE9', '266', '加蓬', null, '99999', 'JP', 'JIAPENG', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3A9D1A94DC624B5995C62C5AF2A83664', '116', '柬埔寨', null, '99999', 'JPZ', 'JIANPUZHAI', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7D4C1505EF9849DD994241CAA0CD9200', '120', '喀麦隆', null, '99999', 'KML', 'KAMAILONG', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FC363909303B4DFCB45D9BE781E4C685', '136', '开曼群岛', null, '99999', 'KMQD', 'KAIMANQUNDAO', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3B7DD1CA8DE54247B339A3ACE0DE8D22', '440', '立陶宛', null, '99999', 'LTW', 'LITAOWAN', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('69B680666C5E4E8BA7A78387081452F6', '174', '科摩罗', null, '99999', 'KML', 'KEMOLUO', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('5D4D6BDAA3EC4885ADBA18C87DFE67ED', '02', '业务对象', null, '99999', 'YWDX', 'YEWUDUIXIANG', 'SYS_SJGL_DXLB', null, null, '20181210133321', '20181210133321', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('057E5B051E4A402DB4D162D8D06D66B3', 'sjdx.dis.oracle', 'select a.column_name as zddm,
       a.comments    as zdms,
       c.data_type   as zdlx,
       c.data_length as zdcd
  from all_col_comments a
  left join all_tab_columns c
    on a.table_name = c.table_name
   and a.owner = c.owner
   and a.column_name = c.column_name
   and a.owner = c.owner
 where a.table_name = ''${tableName}''
      /* if(!isEmpty(owner)){*/
   and a.owner = ''${owner}''
/* }*/
', '数据对象-默认导入sql-oracle', '99999', null, null, 'SYS_SJGL_APPCONFIG', null, null, '20181210165142', '20181210172245', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('0A2ACB8F9FC44E5AA2496062008B8D95', 'sjdx.dis.postgresql', 'select t.col_name as zddm,
       z.zdms as zdms,
       t.col_type as zdlx,
       case
         when t.col_len is not null then
          t.col_len
         else
          t.col_prec
       end as zdcd
  from (select aa.*, bb.zdms
          from (select a.ordinal_position         as col_num,
                       a.column_name              as col_name,
                       a.data_type                as col_type,
                       a.character_maximum_length as col_len,
                       a.numeric_precision        as col_prec
                  from information_schema.columns a
                 where a.table_name = ''${tableName}''
                      /* if(!isEmpty(owner)){*/
                   and table_schema = ''${owner}''
                /* }*/
                ) as aa
          left join (select objsubid, description as zdms
                      from pg_description
                     where objoid = (select relid
                                       from pg_stat_all_tables
                                      where relname = ''${tableName}''
                                           /* if(!isEmpty(owner)){*/
                                        and schemaname = ''${owner}''
                                     /* }*/
                                     )) as bb
            on aa.col_num = bb.objsubid
         order by aa.col_num) t
  left join (select attr.attname as zddm,
                    col_description(attr.attrelid, attr.attnum) as zdms
               from pg_attribute attr
               left join pg_class clazz
                 on attr.attrelid = clazz.oid
               left join pg_type c
                 on attr.attrelid = c.oid
              where clazz.relname = ''${tableName}''
                and attr.attnum > 0) z
    on t.col_name = z.zddm
', null, '99999', null, null, 'SYS_SJGL_APPCONFIG', null, null, '20181210170248', '20181210172504', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D0D2F4F09A3442A2B9C4AFF705965A2F', '760', '叙利亚', null, '99999', 'XLY', 'XULIYA', 'SYS_COMMON_GJ', null, null, '20170630102224', '20170630102224', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7C09A87FED9340428271C3D37A6A46C3', '212', '多米尼克', null, '99999', 'DMNK', 'DUOMINIKE', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6479B6820B214B6E99ED0B78035C1DB5', '336', '梵蒂冈', null, '99999', 'FDG', 'FANDIGANG', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A0D1EE9FB74B4D05BD3DB0FCC99142DC', '170', '哥伦比亚', null, '99999', 'GLBY', 'GELUNBIYA', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A5194F03AAEA494BABB9784BD08F3316', 'sjdx.plsc.oracle', '/*if(isEmpty(sjdx.yxxzd)){*/
delete from ${tableName} where ${sjdx.zjzd} ${idsIn}
/*}else{*/
update ${tableName} set ${sjdx.yxxzd}=''0'' where ${sjdx.zjzd} ${idsIn}
/*}*/', '支持逻辑删除，没有设置有效性字段则直接删除，否则更新有效性字段', '99999', '/*IF(ISEMPTY(SJDX.YXXZD)){*/
DELETE FROM ${TABLENAME} WHERE ${SJDX.ZJZD} ${IDSIN}
/*}ELSE{*/
UPDATE ${TABLENAME} SET ${SJDX.YXXZD}=''0'' WHERE ${SJDX.ZJZD} ${IDSIN}
/*}*/', '/*IF(ISEMPTY(SJDX.YXXZD)){*/
DELETE FROM ${TABLENAME} WHERE ${SJDX.ZJZD} ${IDSIN}
/*}ELSE{*/
UPDATE ${TABLENAME} SET ${SJDX.YXXZD}=''0'' WHERE ${SJDX.ZJZD} ${IDSIN}
/*}*/', 'SYS_SJGL_APPCONFIG', null, null, '20181216195738', '20181219115348', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B166FB7807C443D9B0981DFCD4F3F153', '554', '新西兰', null, '99999', 'XXL', 'XINXILAN', 'SYS_COMMON_GJ', null, null, '20170629215954', '20170629215954', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8808415AC1754193B1036612908142E0', '276', '德国', null, '99999', 'DG', 'DEGUO', 'SYS_COMMON_GJ', null, null, '20170629215955', '20170629215955', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('16C936C316B448FC838932C393219856', 'SYS_SJGL_DXZY', '系统-数据管理-对象作用', null, '99999', 'XT-SJGL-DXZY', 'XITONG-SHUJUGUANLI-DUIXIANGZUOYONG', 'SYS_COMMON_ZDLB', null, null, '20181208143555', '20181208143555', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D245BCF4539C472484FB8B74FECCF6D3', '01', '增量导出', null, '99999', 'ZLDC', 'ZENGLIANGDAOCHU', 'SYS_SJGL_DXZY', null, null, '20181208143752', '20181208143800', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('6D4CC2D382F54870B28E342158361460', '02', '数据插入', null, '99999', 'SJCR', 'SHUJUCHARU', 'SYS_SJGL_DXZY', null, null, '20181208143822', '20181208143822', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('BE0AD78C6E5844778FB91CDBC487085D', '03', '数据更新', null, '99999', 'SJGX', 'SHUJUGENGXIN', 'SYS_SJGL_DXZY', null, null, '20181208143839', '20181208143839', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('2AAA6E2C895D449596F8F4FF7C64058F', '04', '页面查询', null, '99999', 'YMCX', 'YEMIANCHAXUN', 'SYS_SJGL_DXZY', null, null, '20181208143902', '20181208143902', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FDA45AA4F68D4F0AAAE2DF42765FFDD7', '05', '页面新增', null, '99999', 'YMXZ', 'YEMIANXINZENG', 'SYS_SJGL_DXZY', null, null, '20181208143922', '20181208143922', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('D6D5B717779C44B0868F5AED8623A553', '06', '页面修改', null, '99999', 'YMXG', 'YEMIANXIUGAI', 'SYS_SJGL_DXZY', null, null, '20181208143938', '20181208143938', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('580032D3EFC546068653F8BF998E366A', '07', '页面批量导入', null, '99999', 'YMPLDR', 'YEMIANPILIANGDAORU', 'SYS_SJGL_DXZY', null, null, '20181208144053', '20181208144053', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8BD43D3FD250471384373699BB2AE8ED', '08', '页面模板下载', null, '99999', 'YMMBXZ', 'YEMIANMOBANXIAZAI', 'SYS_SJGL_DXZY', null, null, '20181208144218', '20181208144230', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('EF98E95538D84F16AC4A028C23B497EF', '09', 'ftp共享', null, '99999', 'FTPGX', 'FTPGONGXIANG', 'SYS_SJGL_DXZY', null, null, '20181208144335', '20181208144335', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DDBD844D2CE64215BE9CBCFA04080B05', '11', '核查共享', null, '99999', 'HCGX', 'HECHAGONGXIANG', 'SYS_SJGL_DXZY', null, null, '20181208144411', '20181208144411', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C8FB1ACFBD754BBFB84424C6D8F7A3A4', '10', '接口共享', null, '99999', 'JKGX', 'JIEKOUGONGXIANG', 'SYS_SJGL_DXZY', null, null, '20181208144432', '20181208144432', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DBBA03CF177F44E0BDAC33673D5F5247', 'SYS_SJGL_KJLX', '系统-数据管理-控件类型', null, '99999', 'XT-SJGL-KJLX', 'XITONG-SHUJUGUANLI-KONGJIANLEIXING', 'SYS_COMMON_ZDLB', null, null, '20181208145438', '20181208145802', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('4BC7873433654047A7235EA81419E862', 'input', '输入框', null, '10', 'SRK', 'SHURUKUANG', 'SYS_SJGL_KJLX', null, null, '20181208145516', '20181208150339', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('2BBA10CD03144EE88F677299593247D5', 'time', '时间框', null, '20', 'SJK', 'SHIJIANKUANG', 'SYS_SJGL_KJLX', null, null, '20181208145608', '20181208150348', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('39E31939B2124D7B81F99F42749C4149', 'textarea', '大文本框', null, '30', 'DWBK', 'DAWENBENKUANG', 'SYS_SJGL_KJLX', null, null, '20181208145638', '20181208150357', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F4D9161E53194680B079AEDACB6E2D58', 'img', '图片', null, '99999', 'TP', 'TUPIAN', 'SYS_SJGL_KJLX', null, null, '20181208145836', '20181208150331', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FC0E714C100646728F6C873BEA48525A', 'SYS_SJGL_YZGZ', '系统-数据管理-验证规则', null, '99999', 'XT-SJGL-YZGZ', 'XITONG-SHUJUGUANLI-YANZHENGGUIZE', 'SYS_COMMON_ZDLB', null, null, '20181208151725', '20181208151725', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('340094D916DF429BB160DF03CAD881F0', 'dict', '字典框', null, '15', 'ZDK', 'ZIDIANKUANG', 'SYS_SJGL_KJLX', null, null, '20181208152740', '20181208152755', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E471FFE1F74E4F959C09A14553E01DE1', 'checkbox', '复选框', null, '25', 'FXK', 'FUXUANKUANG', 'SYS_SJGL_KJLX', null, null, '20181208153433', '20181208153433', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('9F08B0571501400E945C6F0DCFDAE2ED', 'SYS_SJGL_DXLB', '系统-数据管理-对象类别', null, '99999', 'XT-SJGL-DXLB', 'XITONG-SHUJUGUANLI-DUIXIANGLEIBIE', 'SYS_COMMON_ZDLB', null, null, '20181208182715', '20181208182715', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('38E035C80AF841CA82D5D4BFF5C453CC', '01', '系统对象', null, '99999', 'XTDX', 'XITONGDUIXIANG', 'SYS_SJGL_DXLB', null, null, '20181208182750', '20181208182750', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('7525B630EBB4478BAD3D30D27404BC3E', '03', '临时对象', null, '99999', 'LSDX', 'LINSHIDUIXIANG', 'SYS_SJGL_DXLB', null, null, '20181208182815', '20181210133335', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('C83A6048E5BB47C69A392722928171A8', 'SYS_SJGL_DXLX', '系统-数据管理-对象类型', null, '99999', 'XT-SJGL-DXLX', 'XITONG-SHUJUGUANLI-DUIXIANGLEIXING', 'SYS_COMMON_ZDLB', null, null, '20181208185016', '20181208185016', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('712263BB4B364034A03C5229D4A2C0F0', 'table', '数据库表', null, '10', 'SJKB', 'SHUJUKUBIAO', 'SYS_SJGL_DXLX', null, null, '20181208185050', '20181210132305', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('86D0731DE3DB4ED393E828173F8711F4', 'view', '数据库视图', null, '20', 'SJKST', 'SHUJUKUSHITU', 'SYS_SJGL_DXLX', null, null, '20181208185109', '20181210132316', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A7AA7645CE214E93BA648596635EA84E', 'txt', 'TXT文件', null, '99999', 'TXTWJ', 'TXTWENJIAN', 'SYS_SJGL_DXLX', null, null, '20181208185136', '20181208185136', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('94747526259B49DD943162AEC63357E0', 'excel', 'EXCEL文件', null, '99999', 'EXCELWJ', 'EXCELWENJIAN', 'SYS_SJGL_DXLX', null, null, '20181208185209', '20181208185209', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A9A3B4FE2C454002B10F1A1BF1FA824A', 'SYS_SJGL_DXZTLX', '系统-数据管理-对象载体类型', null, '99999', 'XT-SJGL-DXZTLX', 'XITONG-SHUJUGUANLI-DUIXIANGZAITILEIXING', 'SYS_COMMON_ZDLB', null, null, '20181208190042', '20181208190042', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('342AE1B02745486AB15218980B13DEBD', 'oracle', 'oracle', null, '10', 'ORACLE', 'ORACLE', 'SYS_SJGL_DXZTLX', null, null, '20181208190202', '20181208190610', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('36E125E5036E4FD28A887A0BB32F899B', 'postgresql', 'postgresql', null, '20', 'POSTGRESQL', 'POSTGRESQL', 'SYS_SJGL_DXZTLX', null, null, '20181208190220', '20181210163312', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('158A6BCB4C8F4B8BBFC2A1725FDE2D66', 'greenplum', 'greenplum', null, '30', 'GREENPLUM', 'GREENPLUM', 'SYS_SJGL_DXZTLX', null, null, '20181208190304', '20181210162847', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8E0FA632BCDF4127BD2AD6952A4B8683', 'mysql', 'mysql', null, '40', 'MYSQL', 'MYSQL', 'SYS_SJGL_DXZTLX', null, null, '20181208190328', '20181210162900', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A33B9D665C1341749A1B252FDDC4326D', 'bdwj', '本地文件', null, '99999', 'BDWJ', 'BENDIWENJIAN', 'SYS_SJGL_DXZTLX', null, null, '20181208190514', '20181208190536', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('A3B289785E434EAFB7192A4B2E2662F2', 'ftp', 'ftp文件', null, '50', 'FTPWJ', 'FTPWENJIAN', 'SYS_SJGL_DXZTLX', null, null, '20181208190556', '20181210162927', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('8D6C8039EDA64B428B85AA4623FD1F95', 'SYS_SJGL_FYTJXS', '系统-数据管理-分页统计形式', null, '99999', 'XT-SJGL-FYTJXS', 'XITONG-SHUJUGUANLI-FENYETONGJIXINGSHI', 'SYS_COMMON_ZDLB', null, null, '20181214201500', '20181214201500', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FA26794829884EB0BA5141E70131F092', '1', '默认形式', null, '99999', 'MRXS', 'MORENXINGSHI', 'SYS_SJGL_FYTJXS', null, null, '20181214201719', '20181214201719', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B40C682DFD4E4AC89F581C1BF7FE3F68', '2', '异步统计', null, '99999', 'YBTJ', 'YIBUTONGJI', 'SYS_SJGL_FYTJXS', null, null, '20181214201738', '20181214201738', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('93FB26212FBF40109EFC6824B537833F', '3', '默认不统计', null, '99999', 'MRBTJ', 'MORENBUTONGJI', 'SYS_SJGL_FYTJXS', null, null, '20181214201757', '20181214201757', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('DA2A658FBA7B45D5A7EB7441C9031780', 'SYS_SJGL_ZDYWLB', '系统-数据管理-字段业务类别', null, '99999', 'XT-SJGL-ZDYWLB', 'XITONG-SHUJUGUANLI-ZIDUANYEWULEIBIE', 'SYS_COMMON_ZDLB', null, null, '20181214210525', '20181214210525', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('62C86003EC68461FA33A08F0759CBE89', '99', '虚拟字段', null, '99999', 'XNZD', 'XUNIZIDUAN', 'SYS_SJGL_ZDYWLB', null, null, '20181214210609', '20181214210609', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('AA3227003AC745C69B9F9C8B6469DFF9', 'sjdx.delete.oracle', '/*
//支持逻辑删除，没有设置有效性字段则直接删除，否则更新有效性字段
if(isEmpty(sjdx.yxxzd)){
*/
delete from ${tableName} where ${sjdx.zjzd} = #obj.${sjdx.zjzd}#
/*}else{*/
update ${tableName} set ${sjdx.yxxzd}=''0'' where ${sjdx.zjzd} = #obj.${sjdx.zjzd}#
/*}*/', null, '99999', '/*IF(ISEMPTY(SJDX.YXXZD)){*/
DELETE FROM ${TABLENAME} WHERE ${SJDX.ZJZD} = #OBJ.${SJDX.ZJZD}#
/*}ELSE{*/
UPDATE ${TABLENAME} SET ${SJDX.YXXZD}=''0'' WHERE ${SJDX.ZJZD} = #OBJ.${SJDX.ZJZD}#
/*}*/', '/*IF(ISEMPTY(SJDX.YXXZD)){*/
DELETE FROM ${TABLENAME} WHERE ${SJDX.ZJZD} = #OBJ.${SJDX.ZJZD}#
/*}ELSE{*/
UPDATE ${TABLENAME} SET ${SJDX.YXXZD}=''0'' WHERE ${SJDX.ZJZD} = #OBJ.${SJDX.ZJZD}#
/*}*/', 'SYS_SJGL_APPCONFIG', null, null, '20181216231812', '20181218174805', null, '1', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('071BB94893194328B26065215F0AA3EF', 'SYS_COMMON_WHCD', '系统-公用-文化程度', null, '100', 'WHCD', 'WENHUACHENGDU', 'SYS_COMMON_ZDLB', null, null, '20170703111909', '20181208132905', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('3C2CA74F08274A16AEEADE3D0ABB6A26', '01', '大学以上', '大学以上', '99999', 'DXYS', 'DAXUEYISHANG', 'SYS_COMMON_WHCD', null, null, '20170703112007', '20170703112410', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('B6F84262590E457FB6CB85E5C587A396', '03', '高中', '高中', '99999', 'GZ', 'GAOZHONG', 'SYS_COMMON_WHCD', null, null, '20170703112107', '20170703112418', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('E0F1C277AFE04BBAAF3C979DA84A5EA6', '04', '初中', '初中', '99999', 'CZ', 'CHUZHONG', 'SYS_COMMON_WHCD', null, null, '20170703112228', '20180620130450', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('F1F502ED182A45E2A4D8EFDC848CF425', '05', '小学', '小学', '99999', 'XX', 'XIAOXUE', 'SYS_COMMON_WHCD', null, null, '20170703112256', '20180620130450', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('215EBE2D8DE149AC8EC75FF60AE53202', '02', '大学肄业，大学在校', '大学肄业，大学在校', '99999', 'DXYY，DXZX', 'DAXUEYIYE，DAXUEZAIXIAO', 'SYS_COMMON_WHCD', null, null, '20170703112900', '20180620130450', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('FDBF9C63CCCE4EAEA0A58BBC865201B8', 'SYS_COMMON_JJCD', '系统-公用-紧急程度', null, '100', 'JJCD', 'JINJICHENGDU', 'SYS_COMMON_ZDLB', null, null, '20171120171652', '20181208133354', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('05AACB73F9FD4A258A5CB2DE970DAE90', '一般', '一般', null, '10', 'YB', 'YIBAN', 'SYS_COMMON_JJCD', null, null, '20171120171722', '20171120171722', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('2085DC875EDF4ED2BA2C23EFCA7D98F6', '重要', '重要', null, '20', 'ZY', 'ZHONGYAO', 'SYS_COMMON_JJCD', null, null, '20171120171745', '20171120171745', null, '0', null, '1');
INSERT INTO "SJSJ"."SYS_ZD_TYZD" VALUES ('BFBD123FCC5F4B5CA420A4E1D0CA8BBB', 'test', 'test', null, '99999', 'TEST', 'TEST', null, null, null, '20171117115250', '20171117115250', null, '0', null, '1');

-- ----------------------------
-- Indexes structure for table SYS_FILE_RECORD
-- ----------------------------

-- ----------------------------
-- Checks structure for table SYS_FILE_RECORD
-- ----------------------------
ALTER TABLE "SJSJ"."SYS_FILE_RECORD" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SJSJ"."SYS_FILE_RECORD" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SJSJ"."SYS_FILE_RECORD" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SJSJ"."SYS_FILE_RECORD" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_FILE_RECORD
-- ----------------------------
ALTER TABLE "SJSJ"."SYS_FILE_RECORD" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SYS_LOG_FWZR
-- ----------------------------

-- ----------------------------
-- Checks structure for table SYS_LOG_FWZR
-- ----------------------------
ALTER TABLE "SJSJ"."SYS_LOG_FWZR" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SJSJ"."SYS_LOG_FWZR" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_LOG_FWZR
-- ----------------------------
ALTER TABLE "SJSJ"."SYS_LOG_FWZR" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SYS_QX_JGXX
-- ----------------------------
CREATE UNIQUE INDEX "SJSJ"."IDX_SYS_QX_JGXX_JGDM"
ON "SJSJ"."SYS_QX_JGXX" ("JGDM" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table SYS_QX_JGXX
-- ----------------------------
ALTER TABLE "SJSJ"."SYS_QX_JGXX" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SJSJ"."SYS_QX_JGXX" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_QX_JGXX
-- ----------------------------
ALTER TABLE "SJSJ"."SYS_QX_JGXX" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SYS_QX_YHXX
-- ----------------------------
CREATE UNIQUE INDEX "SJSJ"."IDX_SYS_QX_YHXX_YHDM"
ON "SJSJ"."SYS_QX_YHXX" ("YHDM" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table SYS_QX_YHXX
-- ----------------------------
ALTER TABLE "SJSJ"."SYS_QX_YHXX" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SJSJ"."SYS_QX_YHXX" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_QX_YHXX
-- ----------------------------
ALTER TABLE "SJSJ"."SYS_QX_YHXX" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SYS_SJGL_SJDX
-- ----------------------------
CREATE UNIQUE INDEX "SJSJ"."IDX_SYS_SJGL_SJDX"
ON "SJSJ"."SYS_SJGL_SJDX" ("DXDM" ASC)
LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table SYS_SJGL_SJDX
-- ----------------------------
ALTER TABLE "SJSJ"."SYS_SJGL_SJDX" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SJSJ"."SYS_SJGL_SJDX" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_SJGL_SJDX
-- ----------------------------
ALTER TABLE "SJSJ"."SYS_SJGL_SJDX" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SYS_SJGL_SJZD
-- ----------------------------

-- ----------------------------
-- Checks structure for table SYS_SJGL_SJZD
-- ----------------------------
ALTER TABLE "SJSJ"."SYS_SJGL_SJZD" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SJSJ"."SYS_SJGL_SJZD" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_SJGL_SJZD
-- ----------------------------
ALTER TABLE "SJSJ"."SYS_SJGL_SJZD" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SYS_SJGL_YHZDY
-- ----------------------------

-- ----------------------------
-- Checks structure for table SYS_SJGL_YHZDY
-- ----------------------------
ALTER TABLE "SJSJ"."SYS_SJGL_YHZDY" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SJSJ"."SYS_SJGL_YHZDY" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_SJGL_YHZDY
-- ----------------------------
ALTER TABLE "SJSJ"."SYS_SJGL_YHZDY" ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SYS_ZD_TYZD
-- ----------------------------

-- ----------------------------
-- Checks structure for table SYS_ZD_TYZD
-- ----------------------------
ALTER TABLE "SJSJ"."SYS_ZD_TYZD" ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "SJSJ"."SYS_ZD_TYZD" ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_ZD_TYZD
-- ----------------------------
ALTER TABLE "SJSJ"."SYS_ZD_TYZD" ADD PRIMARY KEY ("ID");
