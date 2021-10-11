USE aili_prod_img;
DROP TABLE IF EXISTS ods_tc_billingreceivables;
CREATE TABLE ods_tc_billingreceivables (
  `id` string COMMENT '主键###_1',
  `houseId` string COMMENT '项目ID###_2',
  `yardId` string COMMENT 'pws下车场ID###_3',
  `yardName` string COMMENT 'pws下车场名称###_4',
  `monthCardId` string COMMENT '月卡id###_5',
  `platform` tinyint COMMENT '数据来源0:pws1:APP2:微信公众号3:微信小程序 4:岗亭端###_6',
  `billingState` tinyint COMMENT '费用类型0新增1延期2：岗亭线下临停现金 3：岗亭临停线上支付 ###_7',
  `startDate` date COMMENT '开始日期###_8',
  `endDate` date COMMENT '结束日期###_9',
  `price` double COMMENT '单价###_10',
  `number` int COMMENT '计费月数###_11',
  `yearMonth` int COMMENT '计费年月(yyyyMM)###_12',
  `subjectsId` int COMMENT '收费科目主键###_13',
  `subjectsName` string COMMENT '科目名称###_14',
  `propertyId` string COMMENT '关联房间ID###_15',
  `propertyName` string COMMENT '关联房间名称###_16',
  `customerName` string COMMENT '房间下的客户名称###_17',
  `amountReceivable` double COMMENT '应收金额###_18',
  `amountReal` double COMMENT '实收金额###_19',
  `yhAmount` double COMMENT '优惠金额###_20',
  `invoiceState` tinyint COMMENT '发票状态:0未开票 1已开票 2待开票###_21',
  `state` tinyint COMMENT '0已开收款单 1未开收款单###_22',
  `active` tinyint COMMENT '1:正常;0:锁定;-1:删除###_24',
  `createPerson` string COMMENT '创建人###_25',
  `createTime` timestamp COMMENT '创建时间###_26',
  `remark` string COMMENT '备注###_27',
  `updatePerson` string COMMENT '最后更新人###_28',
  `updateTime` timestamp COMMENT '最后更新时间###_29',
  `orderId` string COMMENT '停收费对应云平台订单id###_30',
  `carNo` string COMMENT '收费对应车辆车牌号###_31',
  `deleteTcFeeCause` string COMMENT '停车删费原因###_32',
  `changeTcFeeReason` string COMMENT '停车删费原因###_33'
) COMMENT '停车应收表'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t' 
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/ods/ods_tc_billingreceivables/';


DROP TABLE IF EXISTS ods_tc_openbilling;
CREATE TABLE ods_tc_openbilling (
  `id` string COMMENT '主键###_1',
  `houseId` string COMMENT '项目ID###_2',
  `monthCardId` string COMMENT '月卡id###_3',
  `platform` tinyint COMMENT '数据来源0:pws1:APP2:微信公众号3:微信小程序 4:岗亭端###_4',
  `billingState` tinyint COMMENT '费用类型0新增1延期 2岗亭临停线下缴费,3 岗亭临停线上支付###_5',
  `startDate` date COMMENT '开始日期###_6',
  `endDate` date COMMENT '结束日期###_7',
  `price` double COMMENT '单价###_8',
  `number` double COMMENT '计费月数###_9',
  `yearMonth` int COMMENT '计费年月(yyyyMM)###_10',
  `subjectsId` int COMMENT '收费科目主键###_11',
  `subjectsName` string COMMENT '科目名称###_12',
  `billingReceivablesId` string COMMENT '对应应收ID###_13',
  `propertyId` string COMMENT '关联房间ID###_14',
  `propertyName` string COMMENT '关联房间名称###_15',
  `parkingId` string COMMENT '关联车位ID###_16',
  `customerId` string COMMENT '客户ID###_17',
  `customerName` string COMMENT '客户名称###_18',
  `amountReceivable` double COMMENT '应收金额###_19',
  `amountReal` double COMMENT '实收金额###_20',
  `yardId` string COMMENT 'pws下车场ID###_22',
  `yardName` string COMMENT 'pws下车场名称###_23',
  `tcyYardId` string COMMENT '停车云平台车场id###_24',
  `tcyYardName` string COMMENT '办理月卡所在车场crm名称###_25',
  `skdNo` string COMMENT '收款单单号###_26',
  `userId` string COMMENT '收款人id###_27',
  `userName` string COMMENT '收款人名称###_28',
  `collectionDate` date COMMENT '收款日期###_29',
  `collectionTime` timestamp COMMENT '收款时间###_30',
  `invoiceState` tinyint COMMENT '发票状态:0未开票 1已开票 2待开票###_31',
  `deliverId` string COMMENT '交款单ID###_32',
  `auditState` tinyint COMMENT '审核状态：0未审核 1已审核###_33',
  `auditDate` timestamp COMMENT '审核时间###_34',
  `auditId` string COMMENT '审核人ID###_35',
  `auditName` string COMMENT '审核人###_36',
  `preferentialId` string COMMENT '优惠政策ID###_37',
  `preferentialName` string COMMENT '优惠政策名称###_38',
  `yhMoney` double COMMENT '优惠金额###_39',
  `carNo` string COMMENT '月卡主车牌号/临停线上收费车牌号###_40',
  `zlMoney` double COMMENT '找零金额###_41',
  `active` tinyint COMMENT '1:正常;0:锁定;-1:删除###_42',
  `createPerson` string COMMENT '创建人###_43',
  `createTime` timestamp COMMENT '创建时间###_44',
  `remark` string COMMENT '备注###_45',
  `updatePerson` string COMMENT '最后更新人###_46',
  `updateTime` timestamp COMMENT '最后更新时间###_47',
  `orderId` string COMMENT '临停收费对应云平台订单id###_48'
) COMMENT '停车实收表'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t' 
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/ods/ods_tc_openbilling/';


DROP TABLE IF EXISTS ods_tc_monthcard;
CREATE TABLE ods_tc_monthcard (
  `id` string COMMENT '主键###_1',
  `yardId` string COMMENT 'pws下车场ID###_2',
  `yardName` string COMMENT 'pws下车场名称###_3',
  `tcyYardId` string COMMENT '停车云平台车场id###_4',
  `tcyYardName` string COMMENT '办理月卡所在车场crm名称###_5',
  `cardTypeId` string COMMENT '月卡类型id###_6',
  `cardTypeName` string COMMENT '月卡类型名称###_7',
  `takeTime` date COMMENT '月卡生效日期###_8',
  `loseTime` date COMMENT '月卡失效日期###_9',
  `yqtakeTime` date COMMENT '月卡生效日期###_10',
  `yqloseTime` date COMMENT '月卡生效日期###_11',
  `totalamount` double COMMENT '总金额###_12',
  `propertyId` string COMMENT '办理月卡关联房间id###_13',
  `propertyName` string COMMENT '办理月卡关联房间名称###_14',
  `customerId` string COMMENT '办理月卡关联业主/租户/成员人id###_15',
  `customerName` string COMMENT '办理月卡关联业主/租户/成员人名称###_16',
  `parkingId` string COMMENT '办理月卡关联车位id###_17',
  `parkingName` string COMMENT '办理月卡关联车位名称###_18',
  `platform` tinyint COMMENT '办理月卡平台0:pws1:APP2:微信公众号3:微信小程序###_19',
  `type` tinyint COMMENT '月卡状态    0：正常  1：待付款  2：审核中  3：已拒绝  4：已过期  5：已失效 6：退卡###_20',
  `sign` tinyint COMMENT '办理月卡0：一卡一车1：一卡多车###_21',
  `auditState` tinyint COMMENT '车辆办理月卡得审核状态0通过1不通过2待审核###_22',
  `sort` int COMMENT '排列序号###_23',
  `state` int COMMENT '区分月卡/岗亭###_24',
  `propertyAddress` string COMMENT '房间地址###_25',
  `handleMobile` string COMMENT '办卡手机号###_26',
  `refuseReason` string COMMENT '拒绝原因###_27',
  `active` tinyint COMMENT '1:正常;0:锁定;-1:删除###_28',
  `createPerson` string COMMENT '创建人###_29',
  `createTime` timestamp COMMENT '创建时间###_30',
  `remark` string COMMENT '备注###_31',
  `updatePerson` string COMMENT '最后更新人###_32',
  `updateTime` timestamp COMMENT '最后更新时间###_33',
  `parkNum` int COMMENT '月卡车位数###_34',
  `detailTime` string COMMENT '详细时间###_35'
) COMMENT '月卡表'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t' 
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/ods/ods_tc_monthcard/';


DROP TABLE IF EXISTS ods_tc_monthcard_car;
CREATE TABLE ods_tc_monthcard_car (
  `id` string COMMENT '主键###_1',
  `monthCardId` string COMMENT '月卡id###_2',
  `carNo` string COMMENT '车牌号###_3',
  `carId` string COMMENT '办理月卡主卡车牌号对应车辆资料id###_4',
  `type` tinyint COMMENT '月卡主卡副卡type值0主卡###_5',
  `vlfront` string COMMENT '办理月卡车行驶证主页###_6',
  `vlContrary` string COMMENT '办理月卡车行驶证副页###_7',
  `pic` string COMMENT '办理月卡车辆照片###_8',
  `parkingId` string COMMENT '关联车位id###_9',
  `parkingName` string COMMENT '关联车位名称###_10',
  `remark` string COMMENT '备注###_11'
) COMMENT '月卡表'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t' 
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/ods/ods_tc_monthcard_car/';


DROP TABLE IF EXISTS ods_tc_monthcardtype;
CREATE TABLE ods_tc_monthcardtype (
  `id` string COMMENT '主键###_1',
  `yardId` string COMMENT 'pws下车场ID###_2',
  `yardName` string COMMENT 'pws下车场名称###_3',
  `tcyyardId` string COMMENT '停车云平台车场id###_4',
  `cardTypeId` string COMMENT '对应车场编号下的月卡类型id###_5',
  `cardTypeName` string COMMENT '对应车场编号下的月卡类型名称###_6',
  `explains` string COMMENT '对应月卡权限说明 ###_7',
  `subjectsId` int COMMENT '对应pws收费科目主键###_8',
  `subjectsName` string COMMENT '对应pws收费科目名称###_9',
  `price` double COMMENT '月卡单价###_10',
  `code` string COMMENT '车辆类型code###_11',
  `auditState` tinyint COMMENT '线上办理月卡0审核1通过2不允许###_12',
  `freeType` tinyint COMMENT '月卡类型区分0：月租车；1：临时车；2：免费车###_13'
) COMMENT '月卡类型表'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t' 
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/ods/ods_tc_monthcardtype/';


DROP TABLE IF EXISTS ods_tc_openbilling_paymentmethod;
CREATE TABLE ods_tc_openbilling_paymentmethod (
  `id` string COMMENT '主键###_1',
  `openbillingId` string COMMENT '实收id主键###_2',
  `paymentMethodId` string COMMENT '收款方式id###_3',
  `paymentMethodName` string COMMENT '收款方式名称###_4',
  `money` double COMMENT '收款方式对应金额###_5',
  `sort` tinyint COMMENT '收款方式排序###_6'
) COMMENT '停车实收收款方式表'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t' 
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/ods/ods_tc_openbilling_paymentmethod/';


DROP TABLE IF EXISTS ods_tc_operationrecord;
CREATE TABLE ods_tc_operationrecord (
  `id` string COMMENT '主键###_1',
  `monthCardId` string COMMENT '月卡id###_2',
  `cardUserName` string COMMENT '办理月卡人姓名###_3',
  `cardNos` string COMMENT '办理月卡车牌号###_4',
  `yardId` string COMMENT 'pws下车场ID###_5',
  `yardName` string COMMENT 'pws下车场名称###_6',
  `cardTypeId` string COMMENT '月卡类型id###_7',
  `cardTypeName` string COMMENT '月卡类型名称###_8',
  `platform` tinyint COMMENT '操作端0:pws 1:APP 2:微信公众号 3:微信小程序###_9',
  `operationUserId` string COMMENT '操作人ID###_10',
  `operationUserName` string COMMENT '操作人名称###_11',
  `operationTime` timestamp COMMENT '操作时间###_12',
  `type` tinyint COMMENT '操作内容0.新增1.延期2.操作一卡多车3.线上申请4.审批拒绝5.审批通过6.删除月卡7.月卡退卡8.临时停车10.重新办理###_13',
  `number` int COMMENT '月数###_14',
  `takeTime` date COMMENT '生效日期###_15',
  `loseTime` date COMMENT '失效日期###_16',
  `tktakeTime` date COMMENT '退卡专用生效时间###_17',
  `tkloseTime` date COMMENT '退卡专用失效时间###_18',
  `billingreceivablesId` string COMMENT '应收Id###_19'
) COMMENT '操作记录表'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t' 
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/ods/ods_tc_operationrecord/';



