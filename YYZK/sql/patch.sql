ALTER TABLE dbo.t_organization ADD
	fgroups int NULL
ALTER TABLE t_admin ADD
	isdel int NULL
--Ϊ�б깫˾������Ŀ���id
alter table t_win_company add sectionid bigint null	
--Ϊ������ֹ�˾������Ŀ���id
alter table t_pm_competitor add sectionid bigint null
---������ֱ��������Ŀ���ID
update t_pm_competitor set t_pm_competitor.sectionid =	t_pm_section.sectionid from t_pm_competitor,t_pm_section  where t_pm_competitor.pmid = t_pm_section.pmid
---���б깫˾���������Ŀ���ID
update t_win_company set t_win_company.sectionid =	t_pm_section.sectionid from t_win_company,t_pm_section  where t_win_company.pmid = t_pm_section.pmid
--����Ŀ��������Ǩ�Ƶ���α���
insert into t_pm_section ( pmid ,               
   deviceid ,
   planamount ,
   code,
   amount,
   analyze,
   notes,
   lastmanageremp,
   lastdate,
   bistatus,
   finterid,
   plandate,
   engineer,
   manager,
   proxy)  select pmid ,               
   deviceid ,
   planamount ,
   code,
   amount,
   analyze,
   notes,
   lastmanageremp,
   lastdate,
   bistatus,
   finterid,
   plandate,
   engineer,
   manger,
   proxy from t_pm
   
   ------客户评分表加
   alter table t_surveys add fscore  decimal(20,10)  null,
   fdate                datetime null,
   femp                 bigint null,
   fdescribe            nvarchar(200) null
   ------
   alter table t_surveys_entry add finnerid bigint null,
   notes nvarchar(200) null
   ------客户评分表加评分次数
   alter table t_surveys add ftimes int default 0
   ------系统用户表
   alter table t_admin add areaid bigint,provinceid bigint
   alter table t_admin add emptype int
   ------部门表
   alter table t_department add fitemid bigint,fnumber nvarchar(50),fname nvarchar(50),iserp int
   ------区域表
   alter table t_area add fitemid bigint
   alter table t_area add fnumber nvarchar(50)
   ------省份表
   alter table t_province add fitemid bigint
   alter table t_province add fnumber nvarchar(50)
   ------客户表
   alter table t_organization add ismanual int ,isdel int,createdate datetime
   ------营销产品类别
   alter table t_salestype add fclass int
   
    ------begin add for 修改订单表 at 20150504 by tianliyuan
   alter table t_order add 
   pL3000ListPrice	decimal(20, 10)	NULL
   pL4200ListPrice	decimal(20, 10)	NULL,
   sSV3500ListPrice	decimal(20, 10)	NULL,
   sPL2000ListPrice	decimal(20, 10)	NULL,

   salemethod	    nvarchar(50)	NULL,
   nostraightcoeff	decimal(20, 10)	NULL,
   rmTotal	nvarchar(100)	NULL,
   billWriterName nvarchar(50) NULL,
   containProductType nvarchar(50) NULL
   
    ------end add for 修改订单表 at 20150504 by tianliyuan

   ------begin add for 修改订单关联产品表 at 20150504 by tianliyuan
   alter table t_product add 
   formatno         nvarchar(200)   NULL,
   servicecharge	decimal(20, 10)	NULL,
   listprice	decimal(20, 10)	NULL,
   balanceprice	decimal(20, 10)	NULL
   
    ------end add for 修改订单关联产品表 at 20150504 by tianliyuan

------begin add for 修改 产品历史表  ,系统订单 ,系统历史at 20150514 by tianliyuan
   alter table t_product_history add 
   servicecharge	decimal(20, 10)	NULL,
   listprice	decimal(20, 10)	NULL,
   balanceprice	decimal(20, 10)	NULL
  
   
   alter table t_sysorder add
   disCoefficient  decimal (10, 5) NULL,
	dealerName   nvarchar (100) NULL,
	 pL3000Count   int  NULL,
	 pL3000Unit   decimal (20, 10) NULL,
	 pL4200Count   int  NULL,
	 pL4200Unit   decimal (20, 10) NULL,
	 sSV3500Count   int  NULL,
	 sSV3500Unit   decimal (20, 10) NULL,
	 sPL2000Count   int  NULL,
	 sPL2000Unit   decimal (20, 10) NULL,
	 pL3000ListPrice   decimal (20, 10) NULL,
	 pL4200ListPrice   decimal (20, 10) NULL,
	 sSV3500ListPrice   decimal (20, 10) NULL,
	 sPL2000ListPrice   decimal (20, 10) NULL,
	 containProductType nvarchar(50) NULL
	 
	 alter table t_sysorder_history add
     disCoefficient  decimal (10, 5) NULL,
	 dealerName   nvarchar (100) NULL,
	 pL3000Count   int  NULL,
	 pL3000Unit   decimal (20, 10) NULL,
	 pL4200Count   int  NULL,
	 pL4200Unit   decimal (20, 10) NULL,
	 sSV3500Count   int  NULL,
	 sSV3500Unit   decimal (20, 10) NULL,
	 sPL2000Count   int  NULL,
	 sPL2000Unit   decimal (20, 10) NULL,
	 pL3000ListPrice   decimal (20, 10) NULL,
	 pL4200ListPrice   decimal (20, 10) NULL,
	 sSV3500ListPrice   decimal (20, 10) NULL,
	 sPL2000ListPrice   decimal (20, 10) NULL
	 
 ------end add for 修改产品历史,系统订单 ,系统历史表 at 20150514 by tianliyuan


   
   alter table t_pdbase add pmsalesratio decimal(10,4)
   alter table t_admin add amanagerid bigint,amanagername nvarchar(50)
   alter table t_pdbase add companyratio decimal(10,4)
   ---增加签约指标，与超额奖基数
   alter table t_pdbase add kpis decimal(20,10)
   alter table t_pdbase add fbase decimal(10,4)
 -----------------begin add for 修改  订单,系统订单,产品表,产品历史表  at 20150514 by tianliyuan  
   
   /****** Object:  Default [DF_t_order_pL3000Count]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_order] ADD  CONSTRAINT [DF_t_order_pL3000Count]  DEFAULT ((0)) FOR [pL3000Count]
GO
/****** Object:  Default [DF_t_order_pL3000Unit]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_order] ADD  CONSTRAINT [DF_t_order_pL3000Unit]  DEFAULT ((0)) FOR [pL3000Unit]
GO
/****** Object:  Default [DF_t_order_pL4200Count]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_order] ADD  CONSTRAINT [DF_t_order_pL4200Count]  DEFAULT ((0)) FOR [pL4200Count]
GO
/****** Object:  Default [DF_t_order_pL4200Unit]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_order] ADD  CONSTRAINT [DF_t_order_pL4200Unit]  DEFAULT ((0)) FOR [pL4200Unit]
GO
/****** Object:  Default [DF_t_order_sSV3500Count]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_order] ADD  CONSTRAINT [DF_t_order_sSV3500Count]  DEFAULT ((0)) FOR [sSV3500Count]
GO
/****** Object:  Default [DF_t_order_sSV3500Unit]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_order] ADD  CONSTRAINT [DF_t_order_sSV3500Unit]  DEFAULT ((0)) FOR [sSV3500Unit]
GO
/****** Object:  Default [DF_t_order_sPL2000Count]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_order] ADD  CONSTRAINT [DF_t_order_sPL2000Count]  DEFAULT ((0)) FOR [sPL2000Count]
GO
/****** Object:  Default [DF_t_order_sPL2000Unit]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_order] ADD  CONSTRAINT [DF_t_order_sPL2000Unit]  DEFAULT ((0)) FOR [sPL2000Unit]
GO

/****** Object:  Default [DF_t_order_pL3000ListPrice]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_order] ADD  CONSTRAINT [DF_t_order_pL3000ListPrice]  DEFAULT ((0)) FOR [pL3000ListPrice]
GO
/****** Object:  Default [DF_t_order_pL4200ListPrice]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_order] ADD  CONSTRAINT [DF_t_order_pL4200ListPrice]  DEFAULT ((0)) FOR [pL4200ListPrice]
GO
/****** Object:  Default [DF_t_order_sSV3500ListPrice]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_order] ADD  CONSTRAINT [DF_t_order_sSV3500ListPrice]  DEFAULT ((0)) FOR [sSV3500ListPrice]
GO
/****** Object:  Default [DF_t_order_sPL2000ListPrice]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_order] ADD  CONSTRAINT [DF_t_order_sPL2000ListPrice]  DEFAULT ((0)) FOR [sPL2000ListPrice]
GO

/****** Object:  Default [DF_t_sysorder_pL3000Count]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_sysorder] ADD  CONSTRAINT [DF_t_sysorder_pL3000Count]  DEFAULT ((0)) FOR [pL3000Count]
GO
/****** Object:  Default [DF_t_sysorder_pL3000Unit]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_sysorder] ADD  CONSTRAINT [DF_t_sysorder_pL3000Unit]  DEFAULT ((0)) FOR [pL3000Unit]
GO
/****** Object:  Default [DF_t_sysorder_pL4200Count]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_sysorder] ADD  CONSTRAINT [DF_t_sysorder_pL4200Count]  DEFAULT ((0)) FOR [pL4200Count]
GO
/****** Object:  Default [DF_t_sysorder_pL4200Unit]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_sysorder] ADD  CONSTRAINT [DF_t_sysorder_pL4200Unit]  DEFAULT ((0)) FOR [pL4200Unit]
GO
/****** Object:  Default [DF_t_sysorder_sSV3500Count]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_sysorder] ADD  CONSTRAINT [DF_t_sysorder_sSV3500Count]  DEFAULT ((0)) FOR [sSV3500Count]
GO
/****** Object:  Default [DF_t_sysorder_sSV3500Unit]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_sysorder] ADD  CONSTRAINT [DF_t_sysorder_sSV3500Unit]  DEFAULT ((0)) FOR [sSV3500Unit]
GO
/****** Object:  Default [DF_t_sysorder_sPL2000Count]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_sysorder] ADD  CONSTRAINT [DF_t_sysorder_sPL2000Count]  DEFAULT ((0)) FOR [sPL2000Count]
GO
/****** Object:  Default [DF_t_sysorder_sPL2000Unit]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_sysorder] ADD  CONSTRAINT [DF_t_sysorder_sPL2000Unit]  DEFAULT ((0)) FOR [sPL2000Unit]
GO
/****** Object:  Default [DF_t_sysorder_pL3000ListPrice]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_sysorder] ADD  CONSTRAINT [DF_t_sysorder_pL3000ListPrice]  DEFAULT ((0)) FOR [pL3000ListPrice]
GO
/****** Object:  Default [DF_t_sysorder_pL4200ListPrice]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_sysorder] ADD  CONSTRAINT [DF_t_sysorder_pL4200ListPrice]  DEFAULT ((0)) FOR [pL4200ListPrice]
GO
/****** Object:  Default [DF_t_sysorder_sSV3500ListPrice]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_sysorder] ADD  CONSTRAINT [DF_t_sysorder_sSV3500ListPrice]  DEFAULT ((0)) FOR [sSV3500ListPrice]
GO
/****** Object:  Default [DF_t_sysorder_sPL2000ListPrice]    Script Date: 05/15/2015 11:24:06 ******/
ALTER TABLE [dbo].[t_sysorder] ADD  CONSTRAINT [DF_t_sysorder_sPL2000ListPrice]  DEFAULT ((0)) FOR [sPL2000ListPrice]
GO

/****** Object:  Default [DF_t_product_servicecharge]    Script Date: 05/22/2015 14:13:49 ******/
ALTER TABLE [dbo].[t_product] ADD  CONSTRAINT [DF_t_product_servicecharge]  DEFAULT ((0)) FOR [servicecharge]
GO
/****** Object:  Default [DF_t_product_listprice]    Script Date: 05/22/2015 14:13:49 ******/
ALTER TABLE [dbo].[t_product] ADD  CONSTRAINT [DF_t_product_listprice]  DEFAULT ((0)) FOR [listprice]
GO
/****** Object:  Default [DF_t_product_balanceprice]    Script Date: 05/22/2015 14:13:49 ******/
ALTER TABLE [dbo].[t_product] ADD  CONSTRAINT [DF_t_product_balanceprice]  DEFAULT ((0)) FOR [balanceprice]
GO
/****** Object:  Default [DF_t_product_history_servicecharge]    Script Date: 05/22/2015 14:13:49 ******/
ALTER TABLE [dbo].[t_product_history] ADD  CONSTRAINT [DF_t_product_history_servicecharge]  DEFAULT ((0)) FOR [servicecharge]
GO
/****** Object:  Default [DF_t_product_history_listprice]    Script Date: 05/22/2015 14:13:49 ******/
ALTER TABLE [dbo].[t_product_history] ADD  CONSTRAINT [DF_t_product_history_listprice]  DEFAULT ((0)) FOR [listprice]
GO
/****** Object:  Default [DF_t_product_history_balanceprice]    Script Date: 05/22/2015 14:13:49 ******/
ALTER TABLE [dbo].[t_product_history] ADD  CONSTRAINT [DF_t_product_history_balanceprice]  DEFAULT ((0)) FOR [balanceprice]
GO

-----------------end add for 修改  订单,系统订单,产品表,产品历史表  at 20150514 by tianliyuan


 ------begin add for 修改订单表 at 20150526 by tianliyuan
   alter table t_order add 
   orderChecker	    nvarchar(50)	NULL,---订单审核人
   orderApprover	nvarchar(50)	NULL ---订单审批人
 ------end add for 修改订单表 at 20150526 by tianliyuan  
   -----增加同步到k3的折扣率

   alter table t_product add fdiscountrate decimal(20,10)
-------------------------------------------------------------
alter table t_bitem alter column fnumber nvarchar(80)
alter table t_bitem alter column fname nvarchar(200)
alter table t_bitem alter column ffullnumber nvarchar(80)
alter table t_bitem alter column ffullname nvarchar(200)

-------------------------------------------------------------------------
   
   
------begin add for 修改产品表,产品历史表  at 20150528 by tianliyuan
   alter table t_product alter column productName nvarchar(200)
   
   alter table t_product_history alter column productName nvarchar(200)
   
   alter table t_product add 
   measureunitname	    nvarchar(20)			 NULL,  ---计量单位名
   materialname	        nvarchar(200)			 NULL,   ---材质名
   balancefee 			decimal(20, 10)	         NULL  ---结算金额
   ALTER TABLE [dbo].[t_product] ADD  CONSTRAINT [DF_t_product_fdiscountrate]  DEFAULT ((0)) FOR [fdiscountrate]
   GO
   ALTER TABLE [dbo].[t_product] ADD  CONSTRAINT [DF_t_product_balancefee]  DEFAULT ((0)) FOR [balancefee]
   GO
   alter table t_product_history add 
   measureunitname	    nvarchar(20)	NULL,			---计量单位名
   materialname	        nvarchar(200)	NULL 			---材质名
   
------end add for 修改产品表,产品历史表    at 20150528 by tianliyuan 
------begin add for 修改标准订单表  at 20150528 by tianliyuan
   

   alter table t_order add 
   pdfFilePath	            nvarchar(20)	NULL,---PDF附件地址
   orderCloseUserId	        bigint	        NULL   ---   订单关闭人id
   
------end add for 修改标准订单表    at 20150528 by tianliyuan 
   
alter table t_admin add teamseq bigint   

------begin add for 修改标准订单表  at 20150528 by tianliyuan
alter table t_order add 
   operatorrate         decimal(10,4)      NULL,  ---非直销业务费系数
   isyearlycontract	    bit	         NULL,  ---是否是年度合同
   orderChecker2	    nvarchar(50)	NULL  ---第二个订单审核人
ALTER TABLE t_order ADD  CONSTRAINT [DF_t_order_operatorrate]  DEFAULT ((1)) FOR [operatorrate]
GO
ALTER TABLE t_order ADD  CONSTRAINT [DF_t_order_isyearlycontract]  DEFAULT ((0)) FOR [isyearlycontract]
GO
------end add for 修改标准订单表  at 20150528 by tianliyuan

------begin add for 修改产品历史表  at 20150609 by tianliyuan
alter table t_product_history add 
   fdiscountrate         decimal(20, 10)             NULL,  ---折扣率
   balancefee	         decimal(20, 10)	         NULL,  ---结算金额
   ALTER TABLE [dbo].[t_product_history] ADD  CONSTRAINT [DF_t_product_history_fdiscountrate]  DEFAULT ((0)) FOR [fdiscountrate]
   GO
   ALTER TABLE [dbo].[t_product_history] ADD  CONSTRAINT [DF_t_product_history_balancefee]  DEFAULT ((0)) FOR [balancefee]
   GO
-----end add for    修改产品历史表  at 20150609 by tianliyuan

------begin add for 修改产品表,产品历史表 ,订单表  at 20150611 by tianliyuan
alter table t_sysorder add 
   operatorrate         decimal(10,4)      NULL , ---业务费系数
   isbill               int                NULL   ---是否已记账  

alter table t_sysorder_history add 
   operatorrate         decimal(10,4)      NULL , ---业务费系数
   isbill               int                NULL   ---是否已记账
ALTER TABLE t_sysorder ADD  CONSTRAINT [DF_t_sysorder_operatorrate]  DEFAULT ((1)) FOR [operatorrate]
GO
ALTER TABLE t_sysorder_history ADD  CONSTRAINT [DF_t_sysorder_history_operatorrate]  DEFAULT ((1)) FOR [operatorrate]
GO 
ALTER TABLE t_sysorder ADD  CONSTRAINT [DF_t_sysorder_disCoefficient]  DEFAULT ((1)) FOR [disCoefficient]
GO
ALTER TABLE t_sysorder_history ADD  CONSTRAINT [DF_t_sysorder_history_disCoefficient]  DEFAULT ((1)) FOR [disCoefficient]
GO
ALTER TABLE t_order ADD  CONSTRAINT [DF_t_order_nostraightcoeff]  DEFAULT ((1)) FOR [nostraightcoeff]
GO              
-----end add for    修改产品历史表  ,订单表at 20150611 by tianliyuan

-----begin add for    修改产品表,产品历史表,应收合同表,应收合同历史表 at 20150616 by tianliyuan
ALTER TABLE t_product ALTER COLUMN unitPrice decimal(20,10)
ALTER TABLE t_product_history ALTER COLUMN unitPrice decimal(20,10)

ALTER TABLE t_collectpay ALTER COLUMN shouldCollectFee decimal(20,10)
ALTER TABLE t_collectpay ALTER COLUMN shouldCollectFeeRm decimal(20,10)

ALTER TABLE t_collectpay_history ALTER COLUMN shouldCollectFee decimal(20,10)
ALTER TABLE t_collectpay_history ALTER COLUMN shouldCollectFeeRm decimal(20,10)
-----end add for   修改产品表,产品历史表,应收合同表,应收合同历史表at 20150616 by tianliyuan

-----begin add for    修改职务表 at 20150619 by tianliyuan
ALTER TABLE t_duty add 
            dutykey        nvarchar(200)	NULL  ---职务名对应的KEY
-----end add for      修改职务表at 20150619 by tianliyuan
-----物料表增加产品类别id
alter table t_item add categoryid bigint
-----系统订单表增加销售数据汇总标记
alter table t_sysorder add issummary Integer default 0

-----begin add for  修改产品表产品历史表 at 20150626 by tianliyuan
alter table t_product add 
   fbusinessdiscount         decimal(20, 10)      NULL,   ---折扣额(本位币)
   ftax                      decimal(20, 10)      NULL,   ---税额(本位币)  
   ftaxprice                 decimal(20, 10)      NULL,   ---含税单价(本位币)
   famountfor                decimal(20, 10)      NULL    ---金额(本位币) 
alter table t_product_history add 
   fbusinessdiscount         decimal(20, 10)      NULL,   ---折扣额(本位币)
   ftax                      decimal(20, 10)      NULL,   ---税额(本位币)  
   ftaxprice                 decimal(20, 10)      NULL,   ---含税单价(本位币)
   famountfor                decimal(20, 10)      NULL    ---金额(本位币) 

ALTER TABLE t_product ADD  CONSTRAINT [DF_t_product_fbusinessdiscount]  DEFAULT ((0)) FOR [fbusinessdiscount]
ALTER TABLE t_product ADD  CONSTRAINT [DF_t_product_ftax]  DEFAULT ((0)) FOR [ftax]
ALTER TABLE t_product ADD  CONSTRAINT [DF_t_product_ftaxprice]  DEFAULT ((0)) FOR [ftaxprice]
ALTER TABLE t_product ADD  CONSTRAINT [DF_t_product_famountfor]  DEFAULT ((0)) FOR [famountfor]

ALTER TABLE t_product_history ADD  CONSTRAINT [DF_t_product_history_fbusinessdiscount]  DEFAULT ((0)) FOR [fbusinessdiscount]
ALTER TABLE t_product_history ADD  CONSTRAINT [DF_t_product_history_ftax]  DEFAULT ((0)) FOR [ftax]
ALTER TABLE t_product_history ADD  CONSTRAINT [DF_t_product_history_ftaxprice]  DEFAULT ((0)) FOR [ftaxprice]
ALTER TABLE t_product_history ADD  CONSTRAINT [DF_t_product_history_famountfor]  DEFAULT ((0)) FOR [famountfor]
-----end add for    修改产品表产品历史表 at 20150626 by tianliyuan
----用户表增加销售经理
alter table t_admin add salemid bigint,salemname nvarchar(50)
----销售季度节算表增加归属操作员
alter table t_performance add operator bigint
----用户表增加是否销售组织成员字段
alter table t_admin add isstruct int default 0

-----begin add for  修改应收款表 at 20150729 by tianliyuan
alter table t_rp_bill add
fempname             nvarchar(50)         null,---业务员名
fcurempname          nvarchar(50)         null ---当前负责人名
-----end add for    修改应收款表 at 20150729 by tianliyuan


-----begin add for  修改core_menu_operate  at 2015-08-07 10:38:14 by 曹海峰
alter table core_menu_operate add
keywords             nvarchar(50)         null
-----end add for    修改应收款表 at 20150729 by tianliyuan
-----业绩结算表增加产品编码 翟
alter table t_performance add productcode nvarchar(200),productid bigint
-----物料表加父结点
alter table t_bitem add fparentid bigint,seq int
-----奖励政策基数表加PL基数
alter table t_pdbase add bratio decimal(10, 2)
-----应收款管理基表添加订单中产品的id
alter table t_receivable add productid bigint null
-----业绩结算加合同额,订单时间
alter table t_performance add contractamount decimal(20,4),forderdate datetime,productid bigint null 
-----业绩结算加 业绩奖励状态,业务费结算状态,超额奖奖励状态,业务费比例,业绩奖比例,超额奖比例
alter table t_performance add blancestatus int,outlaystatus int,ploroverstatus int,outlayrate decimal(5,2),blancerate decimal(5,2),overrate decimal(5,2),pratio decimal(5,2)

-----文件列表加 文件类型,厂家,有效期
alter table  t_project_files add filetype nvarchar(50),maker nvarchar(200),validityDate datetime

--规则表加 分隔符，显示顺序，不显示itemids
alter table  t_item_rule add  sign nvarchar(10),showseq int ,hideitemids nvarchar(500)

--规则详细表中加不显示itemids，显示顺序
alter table  t_item_rule_detail add  delitemids nvarchar(500),seq int
--合同变更单中添加变更单文件、附录、上传者、上传时间、关联状态、关联人、关联时间
alter table  t_contractchange add  changeFile nvarchar(200) null,assitFile nvarchar(200) null,uploaderId bigint null,uploaderTime datetime null,relativerId bigint null,relativestatus int null,relativeTime datetime  null

--修改项目信息表主键名称和表名称（引入新的t_project_info表）
alter table t_project_info drop constraint PK_T_PROJECT_INFO
alter table t_project_info add constraint PK_T_PROJECT_INFO_OLD primary key(id)
EXEC sp_rename 't_project_info', 't_project_info_old'


-------------------------------------------------------------------------------------------------
create table t_prod_plan_detail (----------------计划明细表（保存下推采购申请单的数据的表）
   plandetailid         bigint               identity,--------id
   planid              bigint              null,
   itemcode             nvarchar(50)         null,-----------------------物料编码
   plannum              decimal(20,10)       null,-----------------------计划生产数量
   planenddate          datetime             null,-----------------------装配计划完成日期
   macenddate           datetime             null,-----------------------机加计划完成日期
   property             integer              null,-----------------------物料属性
   beforenum            decimal(20,10)       null,-----------------------修改前计划数量
   status               int                  null default 0,-------------单据状态0、未审核 1、已审核
   amount               decimal(20,10)       null,-----------------------总需求数
   youtput              decimal(20,10)       null,-----------------------年采购量
   ratio                decimal(10,3)        null,-----------------------采购系数
   cyclename            nvarchar(50)         null,-----------------------采购周期
   fqty                 decimal(20,10)       null,-----------------------库存量
   secinv               decimal(20,10)       null,-----------------------安全库存
   makingnums           decimal(20,10)       null,-----------------------在制品量
   existednums          decimal(20,10)       null,-----------------------已有需求量
   innum                decimal(20,10)       null,-----------------------下单数量
   bompushid            bigint               null,-----------------------BomPushid
   planednum            decimal(20,10)       null,-----------------------已有计划量
   tasknum              decimal(20,10)       null,-----------------------下推装配单数量
   pushnum		decimal(20,10)		 null default 0,---------已下推数量
   isclose		int		 null default 0,---------关闭状态：0、未关1、已关
   sourceid		bigint               null-------------------------源单id
   constraint PK_T_PROD_PLAN_DETAIL primary key (plandetailid)
   
)

-----------------------------------采购申请单表头 -------------------------------------------------
create table t_porequest (
   finterid             bigint               identity,
projectname               nvarchar(100)         null,---------------项目名称
   fbillerid            bigint               null,---------------制单人(下推人)
   userid            bigint               null,---------------申请人
   fbillno              nvarchar(50)         null,---------------单据编号
  choicebillno              nvarchar(50)         null,---------------选单号
   createdate           datetime             null,-------------------申请日期
   checkdate            datetime             null,-------------------审核日期
   fclosed              int                  null,-----------------关闭标志
   fstatus              int                  null,------------------审核标志
   fsource              int                  null,-----------------单据来源
   fdeptid              bigint               null,----------------使用部门
   checkid              bigint               null,-----------------审核人
   bomPushid            bigint               null,------------------备注
   fcomment             nvarchar(300)        null,---------------------bomPushid
   fsourcebillno          char(10)             null,-------------------源单单号
   rejectedwhy		 nvarchar(300)	    NULL------------驳回原因
 businesstype            bigint               null,---------------业务类型
 businessname            nvarchar(50)               null,---------------业务类型名称
   constraint PK_T_POREQUEST primary key (finterid)
)

----------------------------------------------------------------------------------------
----------------------采购申请单明细（与北京的有所不同，根据常州ERP添加了些字段）----------------------------
create table t_porequestentry (
   poid                 bigint               identity,
   inventoryid          bigint               null,-------------库存id
   finterid             bigint               null,--------------------申请单内码
   itemcode             nvarchar(50)         null,------------物料编码
   itemname             nvarchar(50)         null,-----------名称
   itemmode             nvarchar(50)         null,------------规格型号
   amount               decimal(20,10)       null,-------------采购数量
   createdate           datetime             null,-----------------创建日期(接单日期)
   startdate            datetime             null,------------------下单日期
   rta                  datetime             null,----------------到货时间
   ata                  datetime             null,----------------建议采购日期
   status               int                  null,--------------------采购状态 0、未采购1、采购中 2、完成
   issend               int                  null,-----------------是否发送邮件
   unitname             nvarchar(50)         null,------------------单位
   fbillno              nvarchar(50)         null,--------------------源单单号
   bompushid            bigint               null,---------------bomPushid
   fmrpclosed           int                  null,------------------行关闭
   fcomment             nvarchar(200)        null,-----------------备注(用途)
   ispush               int                  null,---------------是否已下推
   supplyid             bigint               null,---------------供应商
   empid                bigint               null,----------------负责人
   deptid               bigint               null,----------------使用部门
   f101                nvarchar(100)        null,----------------执行标准
   f102                nvarchar(100)        null,------------------材质
 use               nvarchar(100)        null,------------------用途
   putstore             int                  null,--------------入库状态
   ordernumber		nvarchar(100)        null,----------------------制令号
   newordernumber	nvarchar(100)        null,----------------------制令号NEW
   ordernumcomment	nvarchar(100)        null,----------------------备注制令号
   userbom              nvarchar(100)        null,---------------------用户BOM
    standardweight     decimal(20,10)       null,------------------------标准单重
    weight     decimal(20,10)       null,------------------------单重
   totaldweight     decimal(20,10)       null,------------------------总重
   departdata     decimal(20,10)       null,------------------------技术部数据
   measurement     decimal(20,10)       null,------------------------计量量
   totalmeasurement     decimal(20,10)       null------------------------总计量量
   conversionrate     decimal(20,10)       null------------------------换算率
   constraint PK_T_POREQUESTENTRY primary key (poid)
)
-------------------------------------------------------------------------------------------------------















