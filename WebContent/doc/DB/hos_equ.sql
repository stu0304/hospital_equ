/*
Navicat MySQL Data Transfer

Source Server         : myserver
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : hos_equ

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-05-26 16:52:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `testtb`
-- ----------------------------
DROP TABLE IF EXISTS `testtb`;
CREATE TABLE `testtb` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testtb
-- ----------------------------
INSERT INTO `testtb` VALUES ('1', 'bb', '13');

-- ----------------------------
-- Table structure for `t_agency`
-- ----------------------------
DROP TABLE IF EXISTS `t_agency`;
CREATE TABLE `t_agency` (
  `t_agency_id` varchar(50) NOT NULL,
  `t_license` varchar(50) DEFAULT NULL,
  `t_permit_no` varchar(50) DEFAULT NULL,
  `t_agency_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_agency
-- ----------------------------
INSERT INTO `t_agency` VALUES ('3f62a5b4-eca1-4abd-ae14-f9fa532fe3e4', '3333', '222', '北京新希望健康仪器公司');
INSERT INTO `t_agency` VALUES ('8ed2d6d6-0698-40b1-8e85-a495d9d7fb13', '777', '66', '上海仪器器械管理公司');
INSERT INTO `t_agency` VALUES ('9b605fd4-1417-4ccc-9c32-33202abc66e7', '34323', '432', '天津宏达器械公司');
INSERT INTO `t_agency` VALUES ('a9cb2d0f-3da8-404b-92ca-9f703a1d4617', '222', '111', '天津健康体检仪器公司');

-- ----------------------------
-- Table structure for `t_attenchment`
-- ----------------------------
DROP TABLE IF EXISTS `t_attenchment`;
CREATE TABLE `t_attenchment` (
  `t_attid` varchar(50) NOT NULL,
  `t_id` varchar(50) DEFAULT NULL,
  `t_attname` varchar(100) DEFAULT NULL,
  `t_type` varchar(20) DEFAULT NULL,
  `t_atturl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`t_attid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_attenchment
-- ----------------------------
INSERT INTO `t_attenchment` VALUES ('46c51437-7a9c-4cea-bf92-706fd7ceabad', '8ed2d6d6-0698-40b1-8e85-a495d9d7fb13', '设备导入模板.xlsx', 'fujian', '/hospital/uploadFile\\');
INSERT INTO `t_attenchment` VALUES ('4a7491df-e371-426c-b32f-c3d582733247', '51662e65-99bf-40d0-a5c4-2d435f11f152', 'google.jpg', 'headicon', '/hospital/uploadFile\\');
INSERT INTO `t_attenchment` VALUES ('6e598a2c-c593-4a36-949c-3fa9fb6f31ec', '268f0018-36e1-4a4f-aad8-ce810932c3e5', '01300543111029143262054331837_s.jpg', 'shebei', '/hospital/uploadFile\\');
INSERT INTO `t_attenchment` VALUES ('8d35d905-0995-418e-973c-e696ca2aacdc', '8ed2d6d6-0698-40b1-8e85-a495d9d7fb13', 'ocp 5-19.docx', 'fujian', '/hospital/uploadFile\\');
INSERT INTO `t_attenchment` VALUES ('e60bc4b7-33e4-417b-bac1-93a9944e9e3a', '42855f07-b499-465d-8c40-49c702a32319', '', 'headicon', '/hospital/uploadFile\\');

-- ----------------------------
-- Table structure for `t_device`
-- ----------------------------
DROP TABLE IF EXISTS `t_device`;
CREATE TABLE `t_device` (
  `t_equip_id` varchar(50) NOT NULL,
  `t_agency_id` varchar(50) DEFAULT NULL,
  `t_dic_code` varchar(50) DEFAULT NULL,
  `t_device_name` varchar(50) DEFAULT NULL,
  `t_dtype` varchar(10) DEFAULT NULL,
  `t_factory` varchar(50) DEFAULT NULL,
  `t_dnumber` varchar(50) DEFAULT NULL,
  `t_buy_date` varchar(50) DEFAULT NULL,
  `t_check_date` varchar(50) DEFAULT NULL,
  `t_sid` varchar(50) DEFAULT NULL,
  `t_left_day` varchar(50) DEFAULT NULL,
  `t_check_circle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_equip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device
-- ----------------------------
INSERT INTO `t_device` VALUES ('086d0972-45af-49ec-a65d-aee0939e20e5', '9b605fd4-1417-4ccc-9c32-33202abc66e7', '75332473-cf66-4245-8882-85fa5bf75628', '电脑', null, null, '2', '2017-05-10', '2017-05-20', null, null, '30');
INSERT INTO `t_device` VALUES ('0d89d6d4-a1fd-4ec1-8c38-63c726cc31da', '8ed2d6d6-0698-40b1-8e85-a495d9d7fb13', '4', '临时起搏器', null, null, '5', '2017-01-04', '2017-05-26', null, null, '15');
INSERT INTO `t_device` VALUES ('0ee88724-8b97-47d0-bf0d-0c3ae0bc545d', '9b605fd4-1417-4ccc-9c32-33202abc66e7', '75332473-cf66-4245-8882-85fa5bf75628', '打印机', null, null, '1', '2017-05-13', '2017-05-20', null, null, '30');
INSERT INTO `t_device` VALUES ('122f5893-5653-4999-9689-9f7249d862bd', '9b605fd4-1417-4ccc-9c32-33202abc66e7', '7', '阿波罗低频共振', null, null, '10', '2017-02-23', '2017-05-26', null, null, '27');
INSERT INTO `t_device` VALUES ('1f850504-d6a6-4a42-b533-926dee0e016e', '9b605fd4-1417-4ccc-9c32-33202abc66e7', '7', '体外电场治疗仪', null, null, '10', '2016-06-22', '2017-05-26', null, null, '30');
INSERT INTO `t_device` VALUES ('2703b9d4-6199-483e-a678-e967f22caceb', 'a9cb2d0f-3da8-404b-92ca-9f703a1d4617', '5', '动脉造影', null, null, '15', '2016-05-12', '2017-05-26', null, null, '20');
INSERT INTO `t_device` VALUES ('2d6303b4-2fc1-45dd-865b-67e85eb040c2', '8ed2d6d6-0698-40b1-8e85-a495d9d7fb13', '3970fba9-fa82-4de6-b964-5c87ad5aaf6d', '电刀', null, null, '7', '2015-11-25', '2017-05-26', null, null, '15');
INSERT INTO `t_device` VALUES ('3743f0bf-429f-45fc-9ce0-10dac858c585', '8ed2d6d6-0698-40b1-8e85-a495d9d7fb13', '4', '临时起搏器', null, null, '5', '2017-03-08', '2017-05-20', null, null, '7');
INSERT INTO `t_device` VALUES ('3b22f684-0fcc-4a93-9442-ae9474669c40', '3f62a5b4-eca1-4abd-ae14-f9fa532fe3e4', '4', '除颤仪', null, null, '7', '2017-05-04', '2017-05-26', null, null, '30');
INSERT INTO `t_device` VALUES ('4d895a74-3ef7-4107-818c-9f0974e763d0', 'a9cb2d0f-3da8-404b-92ca-9f703a1d4617', '3970fba9-fa82-4de6-b964-5c87ad5aaf6d', '显微镜', null, null, '6', '2015-11-11', '2017-05-26', null, null, '10');
INSERT INTO `t_device` VALUES ('707fd145-56d9-4351-ab4d-ac9b4d43ddeb', '3f62a5b4-eca1-4abd-ae14-f9fa532fe3e4', '4', '呼吸机', null, null, '3', '2017-05-11', '2017-05-21', null, null, '7');
INSERT INTO `t_device` VALUES ('8119a099-63f0-4458-bbcb-12fc0e983362', '9b605fd4-1417-4ccc-9c32-33202abc66e7', '3970fba9-fa82-4de6-b964-5c87ad5aaf6d', '骨科牵引架', null, null, '8', '2016-07-21', '2017-05-26', null, null, '15');
INSERT INTO `t_device` VALUES ('87102f11-c3dd-4545-8fba-56a00467ddd3', '9b605fd4-1417-4ccc-9c32-33202abc66e7', '7', '骨盆测量器', null, null, '10', '2016-05-26', '2017-05-26', null, null, '28');
INSERT INTO `t_device` VALUES ('8b5f1b13-46cb-40ff-9dd5-81c6904bec8c', '8ed2d6d6-0698-40b1-8e85-a495d9d7fb13', '6', '五官科工作台', null, null, '7', '2017-03-11', '2017-05-23', null, null, '7');
INSERT INTO `t_device` VALUES ('95ae091a-c1d2-4b6f-9352-56ddedd84c92', '9b605fd4-1417-4ccc-9c32-33202abc66e7', '3970fba9-fa82-4de6-b964-5c87ad5aaf6d', '磨钻', null, null, '9', '2015-11-12', '2017-05-26', null, null, '18');
INSERT INTO `t_device` VALUES ('97832a50-7a6f-437a-b614-75460a3e60d1', 'a9cb2d0f-3da8-404b-92ca-9f703a1d4617', '6', '耳鼻喉科诊疗台', null, null, '7', '2016-09-07', '2017-05-18', null, null, '15');
INSERT INTO `t_device` VALUES ('a7767353-5c60-4168-be7f-43111af1331c', '3f62a5b4-eca1-4abd-ae14-f9fa532fe3e4', '4', '心电图仪器', null, null, '3', '2016-07-06', '2017-05-21', null, null, '15');
INSERT INTO `t_device` VALUES ('c01c2cc2-1c4d-4546-a60a-d9a2e8f35e49', '9b605fd4-1417-4ccc-9c32-33202abc66e7', '7', '腹腔镜', null, null, '8', '2017-03-08', '2017-05-26', null, null, '16');
INSERT INTO `t_device` VALUES ('c168eea6-72d0-4b75-9530-a9c8977fd180', '8ed2d6d6-0698-40b1-8e85-a495d9d7fb13', '6', '听觉脑干诱发电位仪', null, null, '5', '2016-11-24', '2017-05-21', null, null, '7');
INSERT INTO `t_device` VALUES ('d74e4fd1-6c51-448a-b5f4-28eeee87dcd2', '9b605fd4-1417-4ccc-9c32-33202abc66e7', '3970fba9-fa82-4de6-b964-5c87ad5aaf6d', 'C臂', null, null, '7', '2017-05-17', '2017-05-26', null, null, '18');
INSERT INTO `t_device` VALUES ('eb011c87-6784-4203-b3ff-5475d7cdc195', '8ed2d6d6-0698-40b1-8e85-a495d9d7fb13', '7', '碎颅器', null, null, '6', '2016-04-06', '2017-05-26', null, null, '18');
INSERT INTO `t_device` VALUES ('ecea62b9-ed70-43f4-8ed6-4e7d36d330af', '9b605fd4-1417-4ccc-9c32-33202abc66e7', '5', '心电图仪器', null, null, '3', '2017-03-18', '2017-05-21', null, null, '15');
INSERT INTO `t_device` VALUES ('efed0b54-b396-48df-abb0-4ecd65f54489', '9b605fd4-1417-4ccc-9c32-33202abc66e7', '6', '纯音测听仪', null, null, '3', '2016-09-16', '2017-05-26', null, null, '20');
INSERT INTO `t_device` VALUES ('f2ecaf60-4e0f-47cb-b1d4-69e037d86e14', '9b605fd4-1417-4ccc-9c32-33202abc66e7', '7', 'BBT自凝刀', null, null, '10', '2016-08-03', '2017-05-26', null, null, '27');
INSERT INTO `t_device` VALUES ('f61b78dc-496d-450f-8bff-a0747e8c3db9', '9b605fd4-1417-4ccc-9c32-33202abc66e7', '6', '声导抗设备', null, null, '5', '2016-12-15', '2017-05-20', null, null, '15');
INSERT INTO `t_device` VALUES ('f8476052-7be5-4e07-a2c0-197214cd1a0f', 'a9cb2d0f-3da8-404b-92ca-9f703a1d4617', '7', '宫腔镜', null, null, '6', '2017-04-18', '2017-05-26', null, null, '25');
INSERT INTO `t_device` VALUES ('fd11f955-178c-4926-ad60-6f7f0451acfb', '3f62a5b4-eca1-4abd-ae14-f9fa532fe3e4', '4', '心电监护仪', null, null, '3', '2017-05-04', '2017-05-23', null, null, '7');
INSERT INTO `t_device` VALUES ('fef26d12-ed52-44c3-9186-e8334605eae2', '3f62a5b4-eca1-4abd-ae14-f9fa532fe3e4', '4', '心脏彩超仪', null, null, '3', '2015-05-07', '2017-05-18', null, null, '15');

-- ----------------------------
-- Table structure for `t_dic_code`
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_code`;
CREATE TABLE `t_dic_code` (
  `t_dic_id` varchar(50) NOT NULL,
  `t_dic_code` varchar(50) DEFAULT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `t_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_dic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dic_code
-- ----------------------------
INSERT INTO `t_dic_code` VALUES ('1111', '1', '管理员', '权限');
INSERT INTO `t_dic_code` VALUES ('222', '2', '操作员', '权限');
INSERT INTO `t_dic_code` VALUES ('2447ce18-f83c-43aa-8614-53a7cb7fc319', 'abfa598e-4efa-457e-8756-1153c553595f', '超级管理员', '权限');
INSERT INTO `t_dic_code` VALUES ('333', '3', '维护人员', '权限');
INSERT INTO `t_dic_code` VALUES ('3446e3c8-04ba-4c45-893d-469d44da1adb', '8c2bfe38-3e9f-465a-9d7d-ea62d9a7c21d', '测试类型 5', '测试类型');
INSERT INTO `t_dic_code` VALUES ('3f62a5b4-eca1-4abd-ae14-f9fa532fe3e4', '3f62a5b4-eca1-4abd-ae14-f9fa532fe3e4', '北京新希望健康仪器公司', '供应商');
INSERT INTO `t_dic_code` VALUES ('4444', '4', '内科', '科室');
INSERT INTO `t_dic_code` VALUES ('5555', '5', '心肺科', '科室');
INSERT INTO `t_dic_code` VALUES ('6666', '6', '耳鼻喉科', '科室');
INSERT INTO `t_dic_code` VALUES ('777', '7', '妇科', '科室');
INSERT INTO `t_dic_code` VALUES ('79b423bf-2935-4c54-b37c-72c43d84fab8', '4b3e072d-386e-4f4c-b080-290b5c8610ab', '我的数据', '我的类型');
INSERT INTO `t_dic_code` VALUES ('806ea705-8337-4a25-a773-c2e5d14f2b99', '9509556b-399d-402c-9569-ba0009cf060c', '测试类型 9', '测试类型');
INSERT INTO `t_dic_code` VALUES ('821d0708-fc80-4d73-acd0-3b398453e55f', 'a371e023-2690-42ef-95b6-759d76f388b9', '测试类型 1', '测试类型');
INSERT INTO `t_dic_code` VALUES ('85c91114-4b96-4b92-9de3-b541c3ddbd87', '2f80513a-a845-4f44-8371-996abcb984f5', '测试类型 3', '测试类型');
INSERT INTO `t_dic_code` VALUES ('8ed2d6d6-0698-40b1-8e85-a495d9d7fb13', '8ed2d6d6-0698-40b1-8e85-a495d9d7fb13', '上海仪器器械管理公司', '供应商');
INSERT INTO `t_dic_code` VALUES ('9b605fd4-1417-4ccc-9c32-33202abc66e7', '9b605fd4-1417-4ccc-9c32-33202abc66e7', '天津宏达器械公司', '供应商');
INSERT INTO `t_dic_code` VALUES ('9da04847-9ed2-4439-a0b3-fbc773474210', '756d2b65-0394-48f6-94a7-042c173245d4', '测试类型 4', '测试类型');
INSERT INTO `t_dic_code` VALUES ('a9cb2d0f-3da8-404b-92ca-9f703a1d4617', 'a9cb2d0f-3da8-404b-92ca-9f703a1d4617', '天津健康体检仪器公司', '供应商');
INSERT INTO `t_dic_code` VALUES ('c298af35-2f75-4d89-8b4a-25e114b8ece5', 'f9b048c1-da02-426e-9ff1-ea5e90882638', '测试类型 7', '测试类型');
INSERT INTO `t_dic_code` VALUES ('c32c6226-1455-4e5b-a89b-a4982eee00b7', 'bca95675-caa8-4c03-87f8-a7c5a4af57b0', '测试类型 13', '测试类型');
INSERT INTO `t_dic_code` VALUES ('c7f5e962-a349-4243-95c6-036e8013fb47', '3f6d87fd-0323-4e53-9e59-88fedac8f977', '测试类型 12', '测试类型');
INSERT INTO `t_dic_code` VALUES ('c8a0e175-20c3-4716-a9df-beddd3447a17', '3970fba9-fa82-4de6-b964-5c87ad5aaf6d', '骨科', '科室');
INSERT INTO `t_dic_code` VALUES ('c9dfd4f8-02e2-43cd-8d2d-cf7fb0e35eba', 'ecfa3a4d-0794-4cc9-a759-8efbe2c8f021', '测试类型 8', '测试类型');
INSERT INTO `t_dic_code` VALUES ('cc5caa47-5957-47f6-ad56-2da3c210fc2f', '2ac898d7-e1ff-4980-8cb7-f9699867cabe', '测试类型 11', '测试类型');
INSERT INTO `t_dic_code` VALUES ('df3de294-240e-4f5c-9603-dd160b58b73c', 'ad98e196-e420-464c-94f1-3945c1d5567a', '测试类型 10', '测试类型');
INSERT INTO `t_dic_code` VALUES ('f363145d-9e34-4706-8151-fc737581c416', 'ab73d9c7-fb90-423d-a453-97fb335880e7', '测试类型 2', '测试类型');
INSERT INTO `t_dic_code` VALUES ('f422d023-5441-41a0-8930-5f92c257ff19', '12161188-ad5f-4ee2-9b82-c4f699e9a260', '测试类型 6', '测试类型');
INSERT INTO `t_dic_code` VALUES ('fc5cf596-cb4d-4be0-84b4-0e3815dc1c00', '75332473-cf66-4245-8882-85fa5bf75628', '财务科', '科室');

-- ----------------------------
-- Table structure for `t_equip_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_equip_log`;
CREATE TABLE `t_equip_log` (
  `t_log_id` varchar(50) NOT NULL,
  `t_preson_id` varchar(50) DEFAULT NULL,
  `t_equip_id` varchar(50) DEFAULT NULL,
  `t_log_addTime` varchar(30) DEFAULT NULL,
  `t_fix_content` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`t_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equip_log
-- ----------------------------
INSERT INTO `t_equip_log` VALUES ('0a266b8b-60a5-42a2-b3c9-e2b1db4a8799', '086aa83e-93fc-4d96-8258-edfa49647a4d', 'fd11f955-178c-4926-ad60-6f7f0451acfb', '2017-05-23', '维修成功');
INSERT INTO `t_equip_log` VALUES ('579dd175-d59a-4e66-b897-e5bd4d153941', '086aa83e-93fc-4d96-8258-edfa49647a4d', '8b5f1b13-46cb-40ff-9dd5-81c6904bec8c', '2017-05-23', '维修成功');
INSERT INTO `t_equip_log` VALUES ('74271de8-c986-454b-86ca-f8223d7fcf71', '086aa83e-93fc-4d96-8258-edfa49647a4d', '97832a50-7a6f-437a-b614-75460a3e60d1', '2017-05-18', '维修成功');
INSERT INTO `t_equip_log` VALUES ('74682511-d5f8-4e53-9d7e-d6687074c694', '086aa83e-93fc-4d96-8258-edfa49647a4d', 'f61b78dc-496d-450f-8bff-a0747e8c3db9', '2017-05-20', '维修成功');
INSERT INTO `t_equip_log` VALUES ('7ef6b9b3-a73e-4411-a246-25082bd36784', '086aa83e-93fc-4d96-8258-edfa49647a4d', 'c168eea6-72d0-4b75-9530-a9c8977fd180', '2017-05-21', '维修成功');
INSERT INTO `t_equip_log` VALUES ('bd74a3d8-79dc-4559-8be1-665bc9e3c672', '086aa83e-93fc-4d96-8258-edfa49647a4d', 'ecea62b9-ed70-43f4-8ed6-4e7d36d330af', '2017-05-21', '维修成功');
INSERT INTO `t_equip_log` VALUES ('c5dccbf2-4d17-4bf4-8a6f-54a615eb49e8', '086aa83e-93fc-4d96-8258-edfa49647a4d', '0ee88724-8b97-47d0-bf0d-0c3ae0bc545d', '2017-05-20', '');
INSERT INTO `t_equip_log` VALUES ('c8c7df8d-c642-4f29-944d-b576850953ff', '086aa83e-93fc-4d96-8258-edfa49647a4d', '3743f0bf-429f-45fc-9ce0-10dac858c585', '2017-05-20', '呵呵呵');
INSERT INTO `t_equip_log` VALUES ('e0e2a2da-0056-4ff1-9743-a50cab9b35c8', '086aa83e-93fc-4d96-8258-edfa49647a4d', '086d0972-45af-49ec-a65d-aee0939e20e5', '2017-05-20', '');
INSERT INTO `t_equip_log` VALUES ('f52c81fd-9402-4572-aeec-4bf42a2c86e8', '086aa83e-93fc-4d96-8258-edfa49647a4d', '707fd145-56d9-4351-ab4d-ac9b4d43ddeb', '2017-05-21', '维修成功');
INSERT INTO `t_equip_log` VALUES ('f62bf5f3-4f63-4dfc-be9d-93bfeaeb323f', '086aa83e-93fc-4d96-8258-edfa49647a4d', 'fef26d12-ed52-44c3-9186-e8334605eae2', '2017-05-18', '维修成功');

-- ----------------------------
-- Table structure for `t_person`
-- ----------------------------
DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person` (
  `t_preson_id` varchar(50) NOT NULL,
  `t_user_id` varchar(50) DEFAULT NULL,
  `t_dic_id` varchar(50) DEFAULT NULL,
  `t_gender` varchar(10) DEFAULT NULL,
  `t_mobile` varchar(20) DEFAULT NULL,
  `t_email` varchar(30) DEFAULT NULL,
  `t_cname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_preson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_person
-- ----------------------------
INSERT INTO `t_person` VALUES ('086aa83e-93fc-4d96-8258-edfa49647a4d', '5f184ae7-706b-4d35-8497-07f94ee004df', '4', '男', '135498382232', 'zhao@163.com', '赵小明');
INSERT INTO `t_person` VALUES ('42855f07-b499-465d-8c40-49c702a32319', '0e86711f-5890-45e4-a058-867ab523e77a', null, null, '1354645432', 'yang@163.com', null);
INSERT INTO `t_person` VALUES ('51662e65-99bf-40d0-a5c4-2d435f11f152', 'b5a6cf84-ef59-443c-bcc3-e11120093c96', '5', '男', '18766765453', 'wayne@gmail.com', '我是管理员123');
INSERT INTO `t_person` VALUES ('b5c20974-03ce-471e-90e9-cb8977f9941a', '5e29d82e-4bda-4946-b047-4987ac58d899', '5', '男', '13233454565', 'hanwang@163.com', '王先生');
INSERT INTO `t_person` VALUES ('c281777b-eb53-41f3-8782-68d35be2c789', 'ffeb1706-d9c2-4790-9320-13cc137e51b9', '4', '男', '13512345678', 'hanwang@163.com', '我是操作员');
INSERT INTO `t_person` VALUES ('de7a0eff-e0f0-44de-9d47-271ae27576e2', '40641e56-ed3f-42c4-a884-6d168bf44cc3', null, null, '13576879886', 'xiaowang@163.com', null);
INSERT INTO `t_person` VALUES ('fbccd370-7532-46e0-9fce-d7ceae1557bb', '3', '5', '男', '1359939343', 'haha@163.com', '哈哈3');

-- ----------------------------
-- Table structure for `t_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `t_user_id` varchar(50) NOT NULL,
  `t_user_name` varchar(50) DEFAULT NULL,
  `t_user_pwd` varchar(50) DEFAULT NULL,
  `t_role` varchar(30) DEFAULT NULL,
  `t_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`t_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('0e86711f-5890-45e4-a058-867ab523e77a', 'yangyanmeng', 'yangyanmeng', '1', '1');
INSERT INTO `t_sys_user` VALUES ('1', 'haha', '123', '3', '1');
INSERT INTO `t_sys_user` VALUES ('3', 'haha3', '00000000', '3', '1');
INSERT INTO `t_sys_user` VALUES ('40641e56-ed3f-42c4-a884-6d168bf44cc3', 'xiaowang', '123', '2', '1');
INSERT INTO `t_sys_user` VALUES ('5f184ae7-706b-4d35-8497-07f94ee004df', 'zhaopengxiang', 'zhaopengxiang', '1', '1');
INSERT INTO `t_sys_user` VALUES ('b5a6cf84-ef59-443c-bcc3-e11120093c96', 'admin', 'admin', '1', '1');
INSERT INTO `t_sys_user` VALUES ('ffeb1706-d9c2-4790-9320-13cc137e51b9', 'caozuo', '123', '3', '1');
