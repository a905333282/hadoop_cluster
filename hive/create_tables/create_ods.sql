CREATE TABLE ods_fee_advance (
  `id` string COMMENT '主键###_1',
  `hid` string COMMENT '楼盘ID###_2',
  `bid` string COMMENT '楼栋ID###_3',
  `propertyId` string COMMENT '房间ID###_4',
  `advanceAmount` double COMMENT '预存剩余金额###_5',
  `subjectsId` int COMMENT '收费科目主键(含内置科目:开收款单时转存金额)###_6',
  `subjectsName` string COMMENT '科目名称###_7',
  `active` tinyint COMMENT '1:正常;0:锁定;-1:删除###_8',
  `createPerson` string COMMENT '创建人###_9',
  `createTime` timestamp COMMENT '创建时间###_10',
  `remark` string COMMENT '备注###_11',
  `updatePerson` string COMMENT '最后更新人###_12',
  `updateTime` timestamp COMMENT '最后更新时间###_13'
) COMMENT '预存主表_86'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t' 
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/ods/ods_fee_advance/';


CREATE TABLE ods_fee_billchangerecord (
  `id` string COMMENT '主键###_1',
  `billingreceivablesId` string COMMENT '应收ID###_2',
  `price` double COMMENT '单价###_3',
  `money` double COMMENT '应收金额###_4',
  `collectionDate` date COMMENT '收款终止日期###_5',
  `reason` string COMMENT '改费原因###_6',
  `active` tinyint COMMENT '1:正常;0:锁定;-1:删除###_7',
  `createPerson` string COMMENT '创建人###_8',
  `createTime` timestamp COMMENT '创建时间###_9',
  `remark` string COMMENT '备注###_10',
  `updatePerson` string COMMENT '最后更新人###_11',
  `updateTime` timestamp COMMENT '最后更新时间###_12',
  `startDate` timestamp COMMENT '费用开始日期###_13',
  `endDate` timestamp COMMENT '费用结束日期###_14',
  `yearMonth` string COMMENT '计费年月###_15'
) COMMENT '预存主表_86'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t' 
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/ods/ods_fee_billchangerecord/';


CREATE TABLE ods_fee_billingreceivables(
  `id` string COMMENT '主键###_1',
  `hid` string COMMENT '项目ID###_2',
  `bid` string COMMENT '楼栋ID###_3',
  `propertyId` string COMMENT '房间ID###_4',
  `propertyName` string COMMENT '房间名称###_5',
  `khName` string COMMENT '客户名称###_6',
  `amountReal` double COMMENT '实收金额###_7',
  `yhAmount` double COMMENT '优惠金额###_8',
  `amountReceivable` double COMMENT '应收金额###_9',
  `amountRecord` double COMMENT '应计金额：原始应收金额(不会改变)###_10',
  `rstate` tinyint COMMENT '0应收与实收相等 1不相等###_11',
  `state` tinyint COMMENT '0已开收款单 1未开收款单###_12',
  `billingState` tinyint COMMENT '标识：1其他 2预存 3押金###_13',
  `startDate` date COMMENT '开始日期###_14',
  `endDate` date COMMENT '结束日期###_15',
  `collectionEndDate` date COMMENT '收款截止日期###_16',
  `lastReading` double COMMENT '上次读数###_17',
  `reading` double COMMENT '本次读数###_18',
  `thisyl` double COMMENT '本次用量###_19',
  `number` double COMMENT '计费数量：收费标准公式计算出来的值###_20',
  `price` double COMMENT '单价###_21',
  `yearMonth` int COMMENT '计费年月(yyyyMM)###_22',
  `subjectsId` int COMMENT '收费科目主键###_23',
  `propertySubjectsId` string COMMENT '房间收费标准主键###_24',
  `subjectName` string COMMENT '科目名称###_25',
  `contractId` string COMMENT '租赁合同ID或房间客户ID###_26',
  `feeType` tinyint COMMENT '费用类别:1计租方式产生费用租金费用;2优惠政策产生费用;3租赁保证金产生费用;4管理费用产生费用;5是营业额的费用;6临时添加;7导入;8滞纳金###_27',
  `isChaiFei` tinyint COMMENT '是否拆分费用 0未拆分 1拆分###_28',
  `invoiceState` tinyint COMMENT '发票状态:0未开票 1已开票 2待开票###_29',
  `propertyAddress` string COMMENT '房间地址###_30',
  `demolitionFeeCause` string COMMENT '拆费原因###_31',
  `deleteFeeCause` string COMMENT '删费原因###_32',
  `auditState` tinyint COMMENT '审核状态：0未审核 1审核中2已审核###_33',
  `auditDate` timestamp COMMENT '审核时间###_34',
  `auditId` string COMMENT '审核人ID###_35',
  `auditName` string COMMENT '审核人###_36',
  `active` tinyint COMMENT '1:正常;0:锁定;-1:删除###_37',
  `createPerson` string COMMENT '创建人###_38',
  `createTime` timestamp COMMENT '创建时间###_39',
  `remark` string COMMENT '备注###_40',
  `updatePerson` string COMMENT '最后更新人###_41',
  `lastWarnTime` date COMMENT '上次岗位预警的时间###_42',
  `lastTenantWarnTime` date COMMENT '上次租户预警的时间###_43',
  `updateTime` timestamp COMMENT '最后更新时间###_44',
  `zkmlAmount` double COMMENT '折后抹零金额###_45',
  `badState` tinyint COMMENT '1:欠费 2:坏账 ###_46'
) COMMENT '预存主表_86'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t' 
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/ods/ods_fee_billingreceivables/';


CREATE TABLE ods_fee_cunadvance (
  `id` string COMMENT '主键###_1',
  `skdId` string COMMENT '收款单ID###_2',
  `propertyId` string COMMENT '房间ID###_3',
  `cunAmount` double COMMENT '金额###_4',
  `subjectsId` int COMMENT '收费科目主键###_5',
  `subjectsName` string COMMENT '科目名称###_6',
  `sign` tinyint COMMENT '1预收费用 2转存费用###_7',
  `active` tinyint COMMENT '1:正常;0:锁定;-1:删除###_8',
  `createPerson` string COMMENT '创建人###_9',
  `createTime` timestamp COMMENT '创建时间###_10',
  `remark` string COMMENT '备注###_11',
  `updatePerson` string COMMENT '最后更新人###_12',
  `updateTime` timestamp COMMENT '最后更新时间###_13'
) COMMENT '预存存表_87'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t' 
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/ods/ods_fee_cunadvance/';


CREATE TABLE ods_fee_openbilling (
  `id` string COMMENT '主键###_1',
  `hid` string COMMENT '项目ID###_2',
  `bid` string COMMENT '楼栋ID###_3',
  `propertyId` string COMMENT '房间ID###_4',
  `skdId` string COMMENT '收款单ID###_5',
  `billingReceivablesId` string COMMENT '对应应收ID###_6',
  `amountReal` double COMMENT '实收金额###_7',
  `amountReceivable` double COMMENT '应收金额###_8',
  `subjectsId` int COMMENT '收费科目主键###_9',
  `subjectsName` string COMMENT '收费科目名称###_10',
  `yearMonth` int COMMENT '计费年月(yyyyMM)###_11',
  `hireName` string COMMENT '租户名称###_12',
  `ownerName` string COMMENT '业主名称###_13',
  `propertyAddress` string COMMENT '房间地址###_14',
  `propertyName` string COMMENT '房间名称###_15',
  `number` double COMMENT '计费数量：收费标准公式计算出来的值###_16',
  `paySort` tinyint COMMENT '收款方式标识：0代表优惠金额,1代表冲抵金额,2代表余额转存收取,3(包含3)以后代表页面选择的收款方式...依次顺延###_17',
  `price` double COMMENT '单价###_18',
  `payMethodId` string COMMENT '收款方式(0优惠政策中的优惠金额 1现金)###_19',
  `startDate` date COMMENT '开始日期###_20',
  `endDate` date COMMENT '结束日期###_21',
  `lastReading` double COMMENT '上次读数###_22',
  `reading` double COMMENT '本次读数###_23',
  `thisyl` double COMMENT '本次用量###_24',
  `subjectIdsAdvanceId` int COMMENT '冲抵科目id###_25',
  `active` tinyint COMMENT '1:正常;0:锁定;-1:删除###_26',
  `createPerson` string COMMENT '创建人###_27',
  `createTime` timestamp COMMENT '创建时间###_28',
  `remark` string COMMENT '备注###_29',
  `updatePerson` string COMMENT '最后更新人###_30',
  `updateTime` timestamp COMMENT '最后更新时间###_31',
  `yfpayableId` string COMMENT '应付押金抵应收,应付ID###_32',
  `cdkmAmount` double COMMENT '冲抵科目余额###_33',
  `drawMoney` double COMMENT '取表金额###_34'
) COMMENT '实收明细表_293'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t' 
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/ods/ods_fee_openbilling/';


CREATE TABLE ods_fee_propertysubjects (
  `id` string COMMENT '主键###_1',
  `subjectType` tinyint COMMENT '收费标准类型：1.周期性 2非周期性###_2',
  `subjectsId` int COMMENT '收费科目主键###_3',
  `propertyId` string COMMENT '房间主键###4_',
  `period` tinyint COMMENT '计费周期：0天 1月 3季 6半年 12年###_5',
  `price` double COMMENT '计费单价###_6',
  `decimalKeepDigits` tinyint COMMENT '小数保留位数###_7',
  `gzstate` tinyint COMMENT '费用生成方式:1按自然月 2按顺延###_8',
  `dateGz` tinyint COMMENT '计费年月生成方式：1开始日期 2结束日期 3开始日期前一个月 4开始日期后一个月 5结束日期前一个月 6结束日期后一个月###_9',
  `deleteFlag` tinyint COMMENT '状态：0表示正常,1表示已删除,2表示隐藏(预收)###_10',
  `isSharedFee` tinyint COMMENT '是否是公摊费: 1否 0是###_11',
  `isSign` tinyint COMMENT '内置数据：开始日期等于交房日期 1是 2否###_12',
  `hasLadderPrice` tinyint COMMENT '0没有 1有###_13',
  `wySign` string COMMENT '公式唯一标识码:先把公式两边去空格,然后计算出32位MD5值即可.主要用于快速统计出那些公式是相同的###_14',
  `sort` int COMMENT '排序###_15',
  `startDate` date COMMENT '开始日期###_16',
  `endDate` date COMMENT '结束日期###_17',
  `YFID` string COMMENT '退预收款对应科目ID,多个用逗号分割###_18',
  `format` string COMMENT '计费公式###_19',
  `feeStatisticalCategoryId` string COMMENT '关联统计类别主键###_20',
  `feeSubjectCategoryId` string COMMENT '关联科目类别主键###_21',
  `active` tinyint COMMENT '1:正常;0:锁定;-1:删除###_22',
  `createPerson` string COMMENT '创建人###_23',
  `createTime` timestamp COMMENT '创建时间###_24',
  `remark` string COMMENT '备注###_25',
  `updatePerson` string COMMENT '最后更新人###_26',
  `updateTime` timestamp COMMENT '最后更新时间###_27'
) COMMENT '房间收费标准_82'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t' 
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/ods/ods_fee_propertysubjects/';


CREATE TABLE ods_fee_quadvance (
  `id` string COMMENT '主键###_1',
  `sfkdId` string COMMENT '收付款单ID###_2',
  `sign` tinyint COMMENT '1冲抵 2退预收###_3',
  `propertyId` string COMMENT '房间ID###_4',
  `quAmount` double COMMENT '金额###_5',
  `subjectsId` int COMMENT '收费科目主键###_6',
  `subjectsName` string COMMENT '科目名称###_7',
  `active` tinyint COMMENT '1:正常;0:锁定;-1:删除###_8',
  `createPerson` string COMMENT '创建人###_9',
  `createTime` timestamp COMMENT '创建时间###_10',
  `remark` string COMMENT '备注###_11',
  `updatePerson` string COMMENT '最后更新人###_12',
  `updateTime` timestamp COMMENT '最后更新时间###_13'
) COMMENT '预存取表_88'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t' 
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/ods/ods_fee_quadvance/';


CREATE TABLE ods_fee_skd (
  `id` string COMMENT '主键：存收款单号###_1',
  `hid` string COMMENT '项目id###_2',
  `bid` string COMMENT '楼栋id###_3',
  `propertyId` string COMMENT '房间ID###_4',
  `amountReceivable` double COMMENT '本次应收###_5',
  `amountReal` double COMMENT '本次实收###_6',
  `zcAmount` double COMMENT '转存金额###_7',
  `zlAmount` double COMMENT '找零金额###_8',
  `yhAmount` double COMMENT '优惠金额###_9',
  `preferentialId` string COMMENT '优惠政策ID###_10',
  `preferentialName` string COMMENT '优惠政策###_11',
  `paymentMethod` string COMMENT '收款方式拼接###_12',
  `customerName` string COMMENT '客户名称###_13',
  `customerId` string COMMENT '客户ID###_14',
  `collectionDate` date COMMENT '收款日期###_15',
  `collectionTime` timestamp COMMENT '收款时间###_16',
  `userId` string COMMENT '收款人ID###_17',
  `userName` string COMMENT '收款人###_18',
  `hcNO` string COMMENT '被红冲的收款单号###_19',
  `yuanSign` tinyint COMMENT '0收款单 1冲抵###_20',
  `hcstate` tinyint COMMENT '红冲状态：0未红冲，1已红冲###_21',
  `skdType` tinyint COMMENT '单据类型：0收款单 1冲抵 2红冲 3作废###_22',
  `invoiceState` tinyint COMMENT '发票状态:0未开票 1已开票 2待开票###_23',
  `deliverId` string COMMENT '交款单ID###_24',
  `auditState` tinyint COMMENT '审核状态：0未审核 1已审核###_25',
  `auditDate` timestamp COMMENT '审核时间###_26',
  `auditId` string COMMENT '审核人ID###_27',
  `auditName` string COMMENT '审核人###_28',
  `active` tinyint COMMENT '1:正常;0:锁定;-1:删除###_29',
  `createPerson` string COMMENT '创建人###_30',
  `createTime` timestamp COMMENT '创建时间###_31',
  `deleteCause` string COMMENT '作废原因###_32',
  `remark` string COMMENT '备注###_33',
  `updatePerson` string COMMENT '最后更新人###_34',
  `updateTime` timestamp COMMENT '最后更新时间###_35',
  `isSupplement` tinyint COMMENT '是否为补录单据:1是 0否###_36',
  `wfAuditState` tinyint COMMENT '流程审核状态：2审核中3审核结束###_37',
  `wxUserId` string COMMENT '审核人###_38'
) COMMENT '预存取表_88'
PARTITIONED BY (`dt` string)
row format delimited fields terminated by '\t' 
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/ods/ods_fee_skd/';

