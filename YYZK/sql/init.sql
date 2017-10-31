--同步常洲帐套客户信息
insert into t_organization (fname,fnumber,fitemid,isvalid)
select fname,fnumber,fitemid,1 from ck3.ais20120813194456.dbo.t_organization cko where  not exists
(select * from t_organization o where cko.fitemid=o.fitemid)
------更新客户表销售录入员
update t_organization set adminid=t.adminid from (
select distinct fcustid,fempid,adminid from CZK33.AIS20120813194456.dbo.seorder seorder,
(select fitemid,adminid from CZK33.AIS20120813194456.dbo.t_emp t_emp,t_admin where t_emp.fname=t_admin.adminname) b
where seorder.fempid=b.fitemid ) t where t_organization.fitemid=t.fcustid
---初始化客户评分表
INSERT INTO [TerrenceCRM].[dbo].[t_customer_score]([finnerid], [customername], 
[payterms], [amount], [stanamount], [saleval], [retamount], [lurkamount], [notes], [average], [flevel], [fyear], [closestatus])
select finnerid,fname,'',0,0,0,0,0,'',0,0,datename(yyyy,getdate()),0 from t_organization 
where not exists(select * from t_customer_score where t_organization.finnerid=t_customer_score.finnerid 
and t_customer_score.fyear=datename(yyyy,getdate()))

update t_customer_score set amount=a.ftotalamount from (select fcontractname,sum(ftotalamount) ftotalamount from  t_rpcontract where datename(yyyy,fdate) between datename(yyyy,dateadd(yyyy,-3,getdate())) and datename(yyyy,dateadd(yyyy,-1,getdate()))
group by fcontractname) a where t_customer_score.customername=a.fcontractname and t_customer_score.fyear=datename(yyyy,getdate())

insert into t_grade_wight(gwid,gradeitem,weight) values(1,'评分',10);
insert into t_grade_wight(gwid,gradeitem,weight) values(2,'信任度',15);
insert into t_grade_wight(gwid,gradeitem,weight) values(3,'PL品牌认可程度',10);
insert into t_grade_wight(gwid,gradeitem,weight) values(4,'特瑞斯认可',10);
insert into t_grade_wight(gwid,gradeitem,weight) values(5,'价格评标方法',5);
insert into t_grade_wight(gwid,gradeitem,weight) values(6,'合同付款条件',5);
insert into t_grade_wight(gwid,gradeitem,weight) values(7,'合同执行情况',5);
insert into t_grade_wight(gwid,gradeitem,weight) values(8,'合同额评分',5);
insert into t_grade_wight(gwid,gradeitem,weight) values(9,'标准产品合同额评分',5);
insert into t_grade_wight(gwid,gradeitem,weight) values(10,'销售额评分',10);
insert into t_grade_wight(gwid,gradeitem,weight) values(11,'回款额评分',10);
insert into t_grade_wight(gwid,gradeitem,weight) values(12,'潜在合同额',10);

insert into t_authority (authoritykey,authorityname,url,position) 
values ('ROLE_DEPART_LIST','部门管理','/depart/*',4)
insert into t_authority (authoritykey,authorityname,url,position) 
values ('ROLE_AREA_LIST','区域管理','/area/*',5)
insert into t_authority (authoritykey,authorityname,url,position) 
values ('ROLE_PROVINCE_LIST','省份管理','/province/*',6)
insert into t_authority (authoritykey,authorityname,url,position) 
values ('ROLE_DUTY_LIST','职务管理','/duty/*',7)
insert into t_authority (authoritykey,authorityname,url,position) 
values ('ROLE_BLOC_LIST','集团管理','/bloc/*',8)
insert into t_authority (authoritykey,authorityname,url,position) 
values ('ROLE_ORGANIZATION_LIST','客户管理','/organization/*',9)
insert into t_authority (authoritykey,authorityname,url,position) 
values ('ROLE_PROJ_LIST','项目管理','/proj/*',10)
insert into t_authority (authoritykey,authorityname,url,position) 
values ('ROLE_DEPT_PROJ_LIST','项目部查看项目','/proj/*',11)
insert into t_authority (authoritykey,authorityname,url,position) 
values ('ROLE_SDARI_MANAGER','设计院管理','/proj/*',12)
insert into t_authority (authoritykey,authorityname,url,position) 
values ('ROLE_COMPETITOR_MANAGER','竞争对手管理','/proj/*',13)
insert into t_authority (authoritykey,authorityname,url,position) 
values ('ROLE_DEVICE_MANAGER','关键设备管理','/proj/*',14)
insert into t_authority (authoritykey,authorityname,url,position) 
values ('ROLE_SORTCODE_MANAGER','代码表管理','/sortcode/*',15)

insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_MAIN','项目管理','/main.htm',16,NULL,NULL,0)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_FORDER','订单系统','/forder.htm',17,NULL,NULL,0)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_SYSDATE','系统管理','/sysdate.htm',18,NULL,NULL,0)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_EXPORT_ORGANIZATION','导出评分客户','/export/*',19,9,'项目系统',2)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_GRADE','评分管理','/GRADE',20,16,NULL,1)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_GRADE_WEIGHT','评分权重管理','/evaluate/weight-list.htm',21,20,'评分管理',2)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_GRADE_LEVEL','评分等级管理','/evaluate/grades-list.htm',22,20,'评分管理',2)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_GRADE_AMOUNT','客户年额度管理','/evaluate/amount-list.htm',23,20,'评分管理',2)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_GRADE_MANAGER','年度评分管理','/evaluate/surveys-list.htm',24,20,'评分管理',2)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_GRADE_REPORT','年度评分报表','/evaluate/score-list.htm',25,20,'评分管理',2)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_STATISTICS','统计系统','/statistics.htm',26,NULL,NULL,0)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_PERFORMANCE','销售业绩','/statistic/performance.htm',27,26,'统计系统',1)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_TALLY','结算总表','/statistic/tallylist.htm',28,26,'统计系统',1)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_ORDER_MANAGER','订单管理','',29,17,'订单系统',1)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_BASEORDER_EDIT','添加订单','/',30,29,'订单管理',2)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_SYSORDER_EDIT','系统订单添加','/order/sysorder-edit.htm',31,39,'订单管理',3)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_TALLY_BLANCE','结算','/performance/performance!balance.htm',32,28,'结算总表',3)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_PROJECT_SYS','项目管理系统','/proinfo.htm',35,NULL,NULL,0)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_PROJECT_LIST','项目列表','/projectinfo/projectlist.htm',36,35,'项目管理系统',1)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_PROJECT_STRUCTURE','结构型式列表','/projectinfo/structurelist.htm',37,35,'项目管理系统',1)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_PROJECT_BASEITEM','物料管理','/projectinfo/proitemlist.htm',38,35,'项目管理系统',1)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_SYSORDER_LIST','系统订单','order/sysorder-list.htm',39,30,'订单管理',2)
insert into t_authority (authoritykey,authorityname,url,position,parentid,parentname,flevel) 
values ('ROLE_ORDER_LIST','标准订单','order/standardorder-list.htm',40,30,'订单管理',2)





insert into t_role_authority(roleid,authorityid) values(1,4);
insert into t_role_authority(roleid,authorityid) values(1,5);
insert into t_role_authority(roleid,authorityid) values(1,6);
insert into t_role_authority(roleid,authorityid) values(1,7);
insert into t_role_authority(roleid,authorityid) values(1,8);
insert into t_role_authority(roleid,authorityid) values(1,9);
insert into t_role_authority(roleid,authorityid) values(1,10);
insert into t_role_authority(roleid,authorityid) values(1,11);
insert into t_role_authority(roleid,authorityid) values(1,12);
insert into t_role_authority(roleid,authorityid) values(1,13);
insert into t_role_authority(roleid,authorityid) values(1,14);
insert into t_role_authority(roleid,authorityid) values(1,15);
insert into t_role_authority(roleid,authorityid) values(1,16);
insert into t_role_authority(roleid,authorityid) values(1,17);
insert into t_role_authority(roleid,authorityid) values(1,18);
insert into t_role_authority(roleid,authorityid) values(1,19);
insert into t_role_authority(roleid,authorityid) values(1,20);
insert into t_role_authority(roleid,authorityid) values(1,21);
insert into t_role_authority(roleid,authorityid) values(1,22);
insert into t_role_authority(roleid,authorityid) values(1,23);
insert into t_role_authority(roleid,authorityid) values(1,24);
insert into t_role_authority(roleid,authorityid) values(1,25);
insert into t_role_authority(roleid,authorityid) values(1,26);
insert into t_role_authority(roleid,authorityid) values(1,27);
insert into t_role_authority(roleid,authorityid) values(1,28);
insert into t_role_authority(roleid,authorityid) values(1,29);
insert into t_role_authority(roleid,authorityid) values(1,30);
insert into t_role_authority(roleid,authorityid) values(1,31);
insert into t_role_authority(roleid,authorityid) values(1,32);
insert into t_role_authority(roleid,authorityid) values(1,33);
insert into t_role_authority(roleid,authorityid) values(1,34);
insert into t_role_authority(roleid,authorityid) values(1,35);
insert into t_role_authority(roleid,authorityid) values(1,36);
insert into t_role_authority(roleid,authorityid) values(1,37);
insert into t_role_authority(roleid,authorityid) values(1,38);
insert into t_role_authority(roleid,authorityid) values(1,39);

/*===========触发器===当t_orggrantgroup插入数据时自动插入t_admin_orggroup不存在的组名 和管理员id=======*/
CREATE TRIGGER admin_admin_orggroup
ON t_orggrantgroup  
FOR INSERT
AS
BEGIN 
DECLARE @adminid bigint,@groupid  bigint
SELECT @adminid=adminid FROM t_admin  where  t_admin.type = 1 

select  @groupid = groupid  from inserted 
if  not exists ( 
select groupid from t_admin_orggroup where groupid  = @groupid
 )
INSERT INTO t_admin_orggroup (adminid,groupid)  values(@adminid,@groupid)              
END 
---t_orggrantgroup添加新客户组时触发添加管理员客户权限组数据
create trigger add_admin_orggroup on t_orggrantgroup
after insert
as 
begin
 declare @groupid bigint
 select @groupid=groupid from inserted 
 insert into t_admin_orggroup select @groupid,adminid from t_admin where type=1
end

--t_orggrantgroup删除，触发删除用户客户权限组数据
create trigger del_admin_orggroup on t_orggrantgroup
for delete
as
 declare @groupid bigint
 select @groupid=groupid from deleted 
delete from  t_admin_orggroup where groupid=@groupid
/*==============================================================*/
/*******************************更改客户被选中的次数*********************************/
 update t_organization set fgroups = groups.ids  from t_organization as org
 left join  (select COUNT(id)as ids,finnerid from t_org_orggorup group by finnerid) as groups
 on  org.finnerid = groups.finnerid
      
--------同步k3数据
--------同步部门
insert into t_department(teamname,teamsuperior,teamlevel,superiorname,fitemid,fnumber,iserp)     
select FName,19,2,'特瑞斯总公司',FItemID,FNumber,1 from erp.dbo.t_department a 
where FName is not null and FDeleted=0  and not exists (select * from t_department b where a.fname=b.teamname)

update t_department set fitemid=erp.dbo.t_department.FItemID ,iserp=1 from erp.dbo.t_department where t_department.teamname=erp.dbo.t_department.FName
-------

insert into t_province(provincename,fitemid,fnumber)
select FName,FItemID,fnumber from erp.dbo.t_Item where FItemClassID=3013
and not exists (select * from t_province where erp.dbo.t_Item.FName=t_province.provincename)
update t_province set fitemid=a.FItemID,fnumber=a.FNumber from erp.dbo.t_Item a where t_province.provincename=a.FName and a.FItemClassID=3013

insert into t_area(areaname,fitemid,fnumber)
select FName,FItemID,FNumber from erp.dbo.t_Item where FItemClassID=2 and fparentid=1944
and not exists (select * from t_area where erp.dbo.t_Item.FName=t_area.areaname and FItemClassID=2 and fparentid=1944)
 
 ------begin add for 订单编号自动生成来源表 at 20150504 by tianliyuan
INSERT t_icbillno ( [fbillname], [fpreletter], [fcurno], [flength], [fday]) 
VALUES ( N'销售部标准订单', N'YX', 0, 4, '2015')
 ------end add for 订单编号自动生成来源表 at 20150504 by tianliyuan
----------销售产品类别（用时需修改链接的K3数据库）
create procedure pro_synERPSalesType
as
set xact_abort ON
begin TRANSACTION
begin
insert into t_salestype (fname,fitemid,fnumber)
select fname,fitemid,fnumber from K33.AIS20120813194456.dbo.t_item as k3titem
where k3titem.fitemclassid = 3010 and k3titem.fname  not in (select fname from t_salestype)

update t_salestype set t_salestype.fname = kitem.fname,t_salestype.fnumber=kitem.fnumber from (
select fname,fnumber,fitemid from K33.AIS20120813194456.dbo.t_item itemk3 where itemk3.fitemclassid = 3010 ) kitem 
where kitem.fitemid = t_salestype.fitemid

end
COMMIT TRANSACTION
------------------------------部门同步----------------------------------
drop procedure pro_syncDepartmentERPData
create procedure pro_syncDepartmentERPData
as 
set xact_abort ON
begin TRANSACTION 
begin

insert into t_department (teamname,fitemid,fnumber,fname,iserp) 
 select fname,fitemid,fnumber,fname,1 from  K33.AIS20120813194456.dbo.t_department  department
where department.fname not in ( select teamname from t_department ) 

update t_department  set 
t_department.teamname=k3dept.fname,t_department.fitemid=k3dept.fitemid,t_department.fnumber=k3dept.fnumber,t_department.fname =k3dept.fname2,t_department.iserp = 1
from ( select fname,fitemid,fnumber,fname fname2 from  K33.AIS20120813194456.dbo.t_department  department ) k3dept
where k3dept.fname not in ( select teamname from t_department ) 

end
COMMIT TRANSACTION

---------------------------------------------------------------------------
drop procedure pro_provinceERPData
create procedure pro_provinceERPData-------------省份同步
as
set xact_abort ON
begin TRANSACTION --开启事务
begin

insert into t_province (provincename,fitemid,fnumber) 
select fname,fitemid,fnumber from K33.AIS20120813194456.dbo.t_item as itemK3 
where itemK3.fname not in (select provincename from t_province) and  itemK3.fitemclassid = 3013 and itemK3.fitemid not in ( select fitemid from t_province )

update t_province set t_province.provincename=kitem.fname,t_province.fitemid=kitem.fitemid,t_province.fnumber=kitem.fnumber from (
	select fname,fitemid,fnumber,fitemclassid from K33.AIS20120813194456.dbo.t_item  as itemK3 where  itemK3.fitemclassid =3013
) kitem where t_province.provincename = kitem.fname

end
COMMIT TRANSACTION --提交事务
------------------------------------------------------------------------------
drop procedure pro_synAreaErpData
create procedure pro_synAreaErpData--------------------------同步erp区域
as
set xact_abort ON
begin TRANSACTION
begin
insert into t_area (areaname,fitemid,fnumber) select item.fname,item.fitemid,item.fnumber from  K33.AIS20120813194456.dbo.t_item as item 
where item.fname not in ( select areaname from t_area ) and item.fitemclassid=3011

update t_area set t_area.areaname=kitem.fname,t_area.fitemid=kitem.fitemid,t_area.fnumber=kitem.fnumber from (
 select fname,fitemid,fnumber,fitemclassid from  K33.AIS20120813194456.dbo.t_item kkitem where kkitem.fitemclassid=3011 
) kitem where  t_area.areaname = kitem.fname

end
COMMIT TRANSACTION

-------------------------------------------------------------------------------
--------------------计量单位
create procedure pro_measureunitERP
as
set xact_abort ON
begin TRANSACTION
begin
insert into t_measureunit 
(fmeasureunitid,funitgroupid,fnumber,fauxclass,fname,fconversation,fcoefficient,fprecision,fbrno,fitemid,fparentid,fdeleted,
fshortnumber,foperdate,fscale,fstandard,fcontrol,fsystemtype,uuid,fnameen,fnameenplu)
 select  fmeasureunitid,funitgroupid,fnumber,fauxclass,fname,fconversation,fcoefficient,fprecision,fbrno,fitemid,fparentid,fdeleted,
 fshortnumber,foperdate,fscale,fstandard,fcontrol,fsystemtype,uuid,fnameen,fnameenplu from K33.AIS20120813194456.dbo.t_measureunit  k3unit where k3unit.fname not in ( select fname  from t_measureunit)
end
COMMIT TRANSACTION

--------------------------------------------------------------------------------
----------更新表t_itemclass
create procedure pro_ItemClassErpData
as
set xact_abort ON
begin TRANSACTION
begin
insert into t_itemclass (fitemclassid,fnumber,fname,fsqltablename) select fitemclassid,fnumber,fname,fsqltablename from K33.AIS20150105220243.dbo.t_itemclass as itemK3
where itemK3.fitemclassid not in ( select fitemclassid from t_itemclass )
update  t_itemclass set t_itemclass.fitemclassid=K3itemclass.fitemclassid,t_itemclass.fnumber=K3itemclass.fnumber,
t_itemclass.fname=K3itemclass.fname,t_itemclass.fsqltablename=K3itemclass.fsqltablename from 
( select fitemclassid,fnumber,fname,fsqltablename from K33.AIS20150105220243.dbo.t_itemclass ) K3itemclass
where t_itemclass.fitemclassid = K3itemclass.fitemclassid
end
COMMIT TRANSACTION
----------------------------------------------------------------------------------
-----------------更新表t_bitem
create procedure pro_ItemK3ErpData
as
set xact_abort ON
begin TRANSACTION
begin
insert into t_bitem (fitemid,fitemclassid,fnumber,fname,funused,ffullnumber,fdeleted,fshortnumber,ffullname,flevel,fdetail,fparentid)
 select fitemid,fitemclassid,fnumber,fname,funused,ffullnumber,fdeleted,fshortnumber,ffullname,flevel,fdetail,fparentid from K33.AIS20150721084948.dbo.t_item as itemK3
where itemK3.fitemid not in ( select fitemid from t_bitem )
update  t_bitem set t_bitem.fitemid=itemK3up.fitemid,t_bitem.fitemclassid=itemK3up.fitemclassid,t_bitem.fnumber=itemK3up.fnumber,
t_bitem.fname=itemK3up.fname,t_bitem.funused=itemK3up.funused,
t_bitem.ffullnumber=itemK3up.ffullnumber,t_bitem.fdeleted=itemK3up.fdeleted,t_bitem.fshortnumber=itemK3up.fshortnumber,
t_bitem.ffullname=itemK3up.ffullname,t_bitem.flevel=itemK3up.flevel,t_bitem.fdetail=itemK3up.fdetail,t_bitem.fparentid = itemK3up.fparentid
from  ( select fitemid,fitemclassid,fnumber,fname,funused,ffullnumber,fdeleted,fshortnumber,ffullname,flevel,fdetail,fparentid from K33.AIS20150721084948.dbo.t_item ) itemK3up
where t_bitem.fitemid = itemK3up.fitemid
end
COMMIT TRANSACTION


---------------------------------------------------------------------------------

-------------------更新表t_icitemstandard 
insert into t_icitemstandard (fitemid,fstandardcost,fstandardmanhour,fstdpayrate,fchgfeerate,fstdfixfeerate,
foutmachfee,fpiecerate,fstdbatchqty,fpovacctid,fpivacctid,fmcvacctid,fpcvacctid,fslacctid,
fcavacctid,fcbappendrate,fcbappendproject,fcostbomid,fcbrouting,foutmachfeeproject)
 select fitemid,fstandardcost,fstandardmanhour,fstdpayrate,fchgfeerate,fstdfixfeerate,
foutmachfee,fpiecerate,fstdbatchqty,fpovacctid,fpivacctid,fmcvacctid,fpcvacctid,fslacctid,fcavacctid,fcbappendrate,fcbappendproject,
fcostbomid,fcbrouting,foutmachfeeproject from K33.AIS20150105220243.dbo.t_icitemstandard as icitemstandard
where icitemstandard.fitemid not in ( select fitemid from t_icitemstandard )

update  t_icitemstandard set t_icitemstandard.fitemid=itemstandK3.fitemid,t_icitemstandard.fstandardcost=itemstandK3.fstandardcost,
t_icitemstandard.fstandardmanhour=itemstandK3.fstandardmanhour,
t_icitemstandard.fstdpayrate=itemstandK3.fstdpayrate,t_icitemstandard.fchgfeerate=itemstandK3.fchgfeerate,
t_icitemstandard.fstdfixfeerate=itemstandK3.fstdfixfeerate,t_icitemstandard.foutmachfee=itemstandK3.foutmachfee,t_icitemstandard.fpiecerate=itemstandK3.fpiecerate,
t_icitemstandard.fstdbatchqty=itemstandK3.fstdbatchqty,t_icitemstandard.fpovacctid=itemstandK3.fpovacctid,t_icitemstandard.fpivacctid=itemstandK3.fpivacctid,
t_icitemstandard.fmcvacctid=itemstandK3.fmcvacctid,t_icitemstandard.fpcvacctid=itemstandK3.fpcvacctid,t_icitemstandard.fslacctid=itemstandK3.fslacctid,
t_icitemstandard.fcavacctid=itemstandK3.fcavacctid,t_icitemstandard.fcbappendrate=itemstandK3.fcbappendrate,t_icitemstandard.fcbappendproject=itemstandK3.fcbappendproject,
t_icitemstandard.fcostbomid=itemstandK3.fcostbomid,t_icitemstandard.fcbrouting=itemstandK3.fcbrouting,t_icitemstandard.foutmachfeeproject=itemstandK3.foutmachfeeproject
from  ( select fitemid,fstandardcost,fstandardmanhour,fstdpayrate,fchgfeerate,fstdfixfeerate,
foutmachfee,fpiecerate,fstdbatchqty,fpovacctid,fpivacctid,fmcvacctid,fpcvacctid,fslacctid,
fcavacctid,fcbappendrate,fcbappendproject,fcostbomid,fcbrouting,foutmachfeeproject from K33.AIS20150105220243.dbo.t_icitemstandard ) itemstandK3
where t_icitemstandard.fitemid = itemstandK3.fitemid
-----------------------------------------------------------------------------

-----begin add for    初始化职务表 at 20150619 by tianliyuan
SET IDENTITY_INSERT [dbo].[t_duty] ON
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (11, N'区域销售经理', 0, -1, N'', 9, NULL, NULL, NULL, N'QYXSJL')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (18, N'销售经理', 0, -1, N'', 9, NULL, NULL, NULL, N'XSJL')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (19, N'销售工程师', 0, -1, N'', 9, NULL, NULL, NULL, N'XSGCS')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (20, N'销售助理工程师', 0, -1, N'', 9, NULL, NULL, NULL, N'XSZLGCS')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (21, N'市场工程师', 0, -1, N'', 10, NULL, NULL, NULL, N'SCGCS')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (22, N'项目工程师', 0, -1, N'', 11, NULL, NULL, NULL, N'XMGCS')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (23, N'项目助理工程师', 0, -1, N'', 11, NULL, NULL, NULL, N'XMZLGCS')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (24, N'设计工程师', 0, -1, N'', 17, NULL, NULL, NULL, N'SJGCS')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (25, N'技术员', 0, -1, N'', 17, NULL, NULL, NULL, N'JSY')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (26, N'自控工程师', 0, -1, N'', 13, NULL, NULL, NULL, N'ZKGCS')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (27, N'售后服务顾问', 0, -1, N'', 15, NULL, NULL, NULL, N'SHFWGW')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (28, N'售后服务工程师', 0, -1, N'', 15, NULL, NULL, NULL, N'SHFWGCS')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (29, N'售后服务助理', 0, -1, N'', 15, NULL, NULL, NULL, N'SHFWZL')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (30, N'售后内勤', 0, -1, N'', 15, NULL, NULL, NULL, N'SHNQ')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (31, N'订单工程师', 0, -1, N'', 14, NULL, NULL, NULL, N'DDGCS')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (32, N'订单管理员', 0, -1, N'', 14, NULL, NULL, NULL, N'DDGLY')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (33, N'物流专员', 0, -1, N'', 14, NULL, NULL, NULL, N'WLZY')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (35, N'副总经理', 0, -1, N'', 16, NULL, NULL, NULL, N'FZJL')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (36, N'经销商', 0, -1, N'', 16, NULL, NULL, NULL, N'JXS')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (37, N'部门经理', 0, -1, N'', 11, NULL, NULL, NULL, N'BMJL')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (38, N'总经理', 0, -1, N'', 19, NULL, NULL, NULL, N'ZJL')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (39, N'财务经理', 0, -1, N'财务经理', 34, NULL, NULL, NULL, N'CWJL')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (40, N'财务审核员', 0, -1, N'财务审核员', 34, NULL, NULL, NULL, N'CWSHY')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (41, N'售后服务部经理', 0, -1, N'售后服务部经理', 15, NULL, NULL, NULL, N'SHFWBJL')
INSERT [dbo].[t_duty] ([dutyid], [dutyname], [dutylevel], [parentid], [dutydescription], [teamid], [dutydept], [dutyorder], [parentname], [dutykey]) VALUES (42, N'订单管理部经理', 0, -1, N'订单管理部经理', 14, NULL, NULL, NULL, N'DDGLBJL')
SET IDENTITY_INSERT [dbo].[t_duty] OFF
-----end add for    初始化职务表 at 20150619 by tianliyuan

-----------------------产品类别表初始化
insert into t_pdcategory (cname,levels) values ('产品',0)
------------------------------------------------------------------
-------------同步汇率
drop procedure pro_ExchangerateentryErp
create procedure pro_ExchangerateentryErp
as
set xact_abort ON
begin TRANSACTION
begin
insert into t_ExchangeRateEntry(fid,fentryid,findex,fname,fnumber,fclasstypeid,fconversion,fcyfor,fcyto,fbegdate,fenddate
,fexchangerate,fexchangeratetype,fchkdate,fchkuserid,freverseexrate)
 select fid,fentryid,findex,fname,fnumber,fclasstypeid,fconversion,fcyfor,fcyto,fbegdate,fenddate
,fexchangerate,fexchangeratetype,fchkdate,fchkuserid,freverseexrate from K33.AIS20120813194456.dbo.t_ExchangeRateEntry k3rate
where not exists(select * from t_ExchangeRateEntry rate where k3rate.fid=rate.fid)

update t_ExchangeRateEntry set t_ExchangeRateEntry.fnumber=k3ere.fnumber,t_ExchangeRateEntry.fname=k3ere.fname,
t_ExchangeRateEntry.fbegdate=k3ere.fbegdate,t_ExchangeRateEntry.fenddate=k3ere.fenddate
,t_ExchangeRateEntry.fexchangerate=k3ere.fexchangerate
,t_ExchangeRateEntry.freverseexrate=k3ere.freverseexrate,t_ExchangeRateEntry.fexchangeratetype= k3ere.fexchangeratetype
from K33.AIS20120813194456.dbo.t_ExchangeRateEntry k3ere where t_ExchangeRateEntry.fid=k3ere.fid
end
COMMIT TRANSACTION

-------------------------------------同步物料开始---------------------------------------------------
------同步物料的所有的表

create procedure pro_finderpitemall
as
set xact_abort ON
begin TRANSACTION
begin
-----------------------------------------

insert into t_item (fitemid,fnumber,fname,fmodel,f_106,f_105,funitid)
select fitemid,fnumber,fname,fmodel,f_106,f_105,funitid from  K33.AIS20120813194456.dbo.t_icitem k3itemic
where k3itemic.fitemid not in ( select fitemid from t_item)

update t_item set t_item.fitemid=k3icitem.fitemid,t_item.fnumber=k3icitem.fnumber,t_item.fname=k3icitem.fname,t_item.fmodel=k3icitem.fmodel,
t_item.f_106=k3icitem.f_106,t_item.f_105=k3icitem.f_105,t_item.funitid=k3icitem.funitid 
from ( select fitemid,fnumber,fname,fmodel,f_106,f_105,funitid from K33.AIS20120813194456.dbo.t_icitem ) k3icitem
where k3icitem.fitemid = t_item.fitemid

----------------------------------------------
insert into t_icitemstandard (fitemid,fstandardcost,fstandardmanhour,fstdpayrate,fchgfeerate,fstdfixfeerate,
foutmachfee,fpiecerate,fstdbatchqty,fpovacctid,fpivacctid,fmcvacctid,fpcvacctid,fslacctid,
fcavacctid,fcbappendrate,fcbappendproject,fcostbomid,fcbrouting)
 select fitemid,fstandardcost,fstandardmanhour,fstdpayrate,fchgfeerate,fstdfixfeerate,
foutmachfee,fpiecerate,fstdbatchqty,fpovacctid,fpivacctid,fmcvacctid,fpcvacctid,fslacctid,fcavacctid,fcbappendrate,fcbappendproject,
fcostbomid,fcbrouting from K33.AIS20120813194456.dbo.t_icitemstandard as icitemstandard
where icitemstandard.fitemid not in ( select fitemid from t_icitemstandard )

update  t_icitemstandard set t_icitemstandard.fitemid=itemstandK3.fitemid,t_icitemstandard.fstandardcost=itemstandK3.fstandardcost,
t_icitemstandard.fstandardmanhour=itemstandK3.fstandardmanhour,
t_icitemstandard.fstdpayrate=itemstandK3.fstdpayrate,t_icitemstandard.fchgfeerate=itemstandK3.fchgfeerate,
t_icitemstandard.fstdfixfeerate=itemstandK3.fstdfixfeerate,t_icitemstandard.foutmachfee=itemstandK3.foutmachfee,


t_icitemstandard.fpiecerate=itemstandK3.fpiecerate,t_icitemstandard.fstdbatchqty=itemstandK3.fstdbatchqty,
t_icitemstandard.fpovacctid=itemstandK3.fpovacctid,t_icitemstandard.fpivacctid=itemstandK3.fpivacctid,
t_icitemstandard.fmcvacctid=itemstandK3.fmcvacctid,t_icitemstandard.fpcvacctid=itemstandK3.fpcvacctid,t_icitemstandard.fslacctid=itemstandK3.fslacctid,
t_icitemstandard.fcavacctid=itemstandK3.fcavacctid,t_icitemstandard.fcbappendrate=itemstandK3.fcbappendrate,t_icitemstandard.fcbappendproject=itemstandK3.fcbappendproject,
t_icitemstandard.fcostbomid=itemstandK3.fcostbomid,t_icitemstandard.fcbrouting=itemstandK3.fcbrouting
from  ( select fitemid,fstandardcost,fstandardmanhour,fstdpayrate,fchgfeerate,fstdfixfeerate,
foutmachfee,fpiecerate,fstdbatchqty,fpovacctid,fpivacctid,fmcvacctid,fpcvacctid,fslacctid,
fcavacctid,fcbappendrate,fcbappendproject,fcostbomid,fcbrouting from K33.AIS20120813194456.dbo.t_icitemstandard ) itemstandK3
where t_icitemstandard.fitemid = itemstandK3.fitemid
------------------------------------------------------------------
insert into t_icitemmaterial 
( fitemid,forderrector,fpohghprcmnytype,fpohighprice,fwwhghprc,fwwhghprcmnytype,fsolowprc,fsolowprcmnytype,flssale,fprofitrate,fsaleprice,
fbatchmanager,fiskfperiod,fkfperiod,ftrack,fplanprice,
fpricedecimal,facctid,fsaleacctid,fcostacctid,fapacctid,fgoodspec,fcostproject,flssnmanage,fstocktime,fbookplan,fbeforeexpire,ftaxrate,fadminacctid,
fnote,flsspecialtax,
fsohighlimit,fsolowlimit,foihighlimit,fdaysper,flastcheckdate,fcheckcycle,fcheckcycunit,fstockprice,fabccls,fbatchqty,fclass,
fcostdiffrate,fdepartment,fsaletaxacctid,
fcbbmstandardid,fcbrestore
) select fitemid,forderrector,fpohghprcmnytype,fpohighprice,fwwhghprc,fwwhghprcmnytype,fsolowprc,fsolowprcmnytype,fissale,fprofitrate,fsaleprice,fbatchmanager,
fiskfperiod,fkfperiod,ftrack,fplanprice,
fpricedecimal,facctid,fsaleacctid,fcostacctid,fapacctid,fgoodspec,fcostproject,fissnmanage,fstocktime,fbookplan,fbeforeexpire,ftaxrate,fadminacctid,fnote,fisspecialtax,
fsohighlimit,fsolowlimit,foihighlimit,fdaysper,flastcheckdate,fcheckcycle,fcheckcycunit,fstockprice,fabccls,fbatchqty,fclass,fcostdiffrate,fdepartment,fsaletaxacctid,
fcbbmstandardid,fcbrestore
from   K33.AIS20120813194456.dbo.t_icitemmaterial as itemmaterialK3 where itemmaterialK3.fitemid not in ( select fitemid from t_icitemmaterial )

update t_icitemmaterial set 
t_icitemmaterial.fitemid=k3icitemterial.fitemid,t_icitemmaterial.forderrector=k3icitemterial.forderrector,t_icitemmaterial.fpohghprcmnytype=k3icitemterial.fpohghprcmnytype,
t_icitemmaterial.fpohighprice=k3icitemterial.fpohighprice,t_icitemmaterial.fwwhghprc=k3icitemterial.fwwhghprc,t_icitemmaterial.fwwhghprcmnytype=k3icitemterial.fwwhghprcmnytype,
t_icitemmaterial.fsolowprc=k3icitemterial.fsolowprc,t_icitemmaterial.fsolowprcmnytype=k3icitemterial.fsolowprcmnytype,t_icitemmaterial.flssale=k3icitemterial.fissale,
t_icitemmaterial.fprofitrate=k3icitemterial.fprofitrate,t_icitemmaterial.fsaleprice=k3icitemterial.fsaleprice,t_icitemmaterial.fbatchmanager=k3icitemterial.fbatchmanager,
t_icitemmaterial.fiskfperiod=k3icitemterial.fiskfperiod,t_icitemmaterial.fkfperiod=k3icitemterial.fkfperiod,t_icitemmaterial.ftrack=k3icitemterial.ftrack,
t_icitemmaterial.fplanprice=k3icitemterial.fplanprice,t_icitemmaterial.fpricedecimal=k3icitemterial.fpricedecimal,t_icitemmaterial.facctid=k3icitemterial.facctid,
t_icitemmaterial.fsaleacctid=k3icitemterial.fsaleacctid,t_icitemmaterial.fcostacctid=k3icitemterial.fcostacctid,t_icitemmaterial.fapacctid=k3icitemterial.fapacctid,
t_icitemmaterial.fgoodspec=k3icitemterial.fgoodspec,t_icitemmaterial.fcostproject=k3icitemterial.fcostproject,t_icitemmaterial.flssnmanage=k3icitemterial.fissnmanage,
t_icitemmaterial.fstocktime=k3icitemterial.fstocktime,t_icitemmaterial.fbookplan=k3icitemterial.fbookplan,t_icitemmaterial.fbeforeexpire=k3icitemterial.fbeforeexpire,
t_icitemmaterial.ftaxrate=k3icitemterial.ftaxrate,t_icitemmaterial.fadminacctid=k3icitemterial.fadminacctid,t_icitemmaterial.fnote=k3icitemterial.fnote,
t_icitemmaterial.flsspecialtax=k3icitemterial.fisspecialtax,t_icitemmaterial.fsohighlimit=k3icitemterial.fsohighlimit,t_icitemmaterial.fsolowlimit=k3icitemterial.fsolowlimit,
t_icitemmaterial.foihighlimit=k3icitemterial.foihighlimit,t_icitemmaterial.fdaysper=k3icitemterial.fdaysper,t_icitemmaterial.flastcheckdate=k3icitemterial.flastcheckdate,
t_icitemmaterial.fcheckcycle=k3icitemterial.fcheckcycle,t_icitemmaterial.fcheckcycunit=k3icitemterial.fcheckcycunit,t_icitemmaterial.fstockprice=k3icitemterial.fstockprice,
t_icitemmaterial.fabccls=k3icitemterial.fabccls,t_icitemmaterial.fbatchqty=k3icitemterial.fbatchqty,t_icitemmaterial.fclass=k3icitemterial.fclass,
t_icitemmaterial.fcostdiffrate=k3icitemterial.fcostdiffrate,t_icitemmaterial.fdepartment=k3icitemterial.fdepartment,t_icitemmaterial.fsaletaxacctid=k3icitemterial.fsaletaxacctid,
t_icitemmaterial.fcbbmstandardid=k3icitemterial.fcbbmstandardid,t_icitemmaterial.fcbrestore=k3icitemterial.fcbrestore

from ( select fitemid,forderrector,fpohghprcmnytype,fpohighprice,fwwhghprc,fwwhghprcmnytype,fsolowprc,fsolowprcmnytype,fissale,fprofitrate,fsaleprice,fbatchmanager,fiskfperiod,fkfperiod,
ftrack,fplanprice,fpricedecimal,facctid,fsaleacctid,fcostacctid,fapacctid,fgoodspec,fcostproject,fissnmanage,fstocktime,fbookplan,fbeforeexpire,ftaxrate,fadminacctid,
fnote,fisspecialtax,fsohighlimit,fsolowlimit,foihighlimit,fdaysper,flastcheckdate,fcheckcycle,fcheckcycunit,fstockprice,fabccls,fbatchqty,fclass,fcostdiffrate,fdepartment,
fsaletaxacctid,fcbbmstandardid,fcbrestore
from  K33.AIS20120813194456.dbo.t_icitemmaterial ) k3icitemterial where t_icitemmaterial.fitemid = k3icitemterial.fitemid

----------------------------------------------------------------------------------------------
insert into t_base_icitementrance (fitemid,fnameen,fmodelen,fhsnumber,ffirstunit,fsecondunit,ffirstunitrate,fsecondunitrate,fismanage,fpacktype,flendecimal,
fcubagedecimal,fweightdecimal,fimposttaxrate,fconsumetaxrate,fmanagetype,fexportrate
)  select fitemid,fnameen,fmodelen,fhsnumber,ffirstunit,fsecondunit,ffirstunitrate,fsecondunitrate,fismanage,fpacktype,flendecimal,
fcubagedecimal,fweightdecimal,fimposttaxrate,fconsumetaxrate,fmanagetype,fexportrate from K33.AIS20120813194456.dbo.t_base_icitementrance baseitemtraK3
where baseitemtraK3.fitemid not in ( select fitemid from t_base_icitementrance)

update t_base_icitementrance set  t_base_icitementrance.fitemid=itemtranceK3.fitemid,t_base_icitementrance.fnameen=itemtranceK3.fnameen,t_base_icitementrance.fmodelen=itemtranceK3.fmodelen,
t_base_icitementrance.fhsnumber=itemtranceK3.fhsnumber,t_base_icitementrance.ffirstunit=itemtranceK3.ffirstunit,
t_base_icitementrance.fsecondunit=itemtranceK3.fsecondunit,t_base_icitementrance.ffirstunitrate=itemtranceK3.ffirstunitrate,t_base_icitementrance.fsecondunitrate=itemtranceK3.fsecondunitrate,
t_base_icitementrance.fismanage=itemtranceK3.fismanage,
t_base_icitementrance.fpacktype=itemtranceK3.fpacktype,t_base_icitementrance.flendecimal=itemtranceK3.flendecimal,
t_base_icitementrance.fcubagedecimal=itemtranceK3.fcubagedecimal,t_base_icitementrance.fweightdecimal=itemtranceK3.fweightdecimal,
t_base_icitementrance.fimposttaxrate=itemtranceK3.fimposttaxrate,t_base_icitementrance.fconsumetaxrate=itemtranceK3.fconsumetaxrate,
t_base_icitementrance.fmanagetype=itemtranceK3.fmanagetype,t_base_icitementrance.fexportrate=itemtranceK3.fexportrate from (
select fitemid,fnameen,fmodelen,fhsnumber,ffirstunit,fsecondunit,ffirstunitrate,fsecondunitrate,fismanage,fpacktype,flendecimal,
fcubagedecimal,fweightdecimal,fimposttaxrate,fconsumetaxrate,fmanagetype,fexportrate from K33.AIS20120813194456.dbo.t_base_icitementrance ) itemtranceK3
where t_base_icitementrance.fitemid = itemtranceK3.fitemid

------------------------------------------------------------------------------------------------
insert into t_icitemquality (fitemid,finspectionlevel,finspectionproject,fislistcontrol,fprochkmde,fwwchkmde,
fsochkmde,fwthdrwchkmde,fstkchkmde,fotherchkmde,fstkchkprd,fstkchkalrm,fidentifier
) select fitemid,finspectionlevel,finspectionproject,fislistcontrol,fprochkmde,fwwchkmde,
fsochkmde,fwthdrwchkmde,fstkchkmde,fotherchkmde,fstkchkprd,fstkchkalrm,fidentifier  from K33.AIS20120813194456.dbo.t_icitemquality itemqualityK3
where itemqualityK3.fitemid not in ( select fitemid from t_icitemquality )

update t_icitemquality set t_icitemquality.fitemid=qualityK3.fitemid,t_icitemquality.finspectionlevel=qualityK3.finspectionlevel,
t_icitemquality.finspectionproject=qualityK3.finspectionproject
,t_icitemquality.fislistcontrol=qualityK3.fislistcontrol,
t_icitemquality.fprochkmde=qualityK3.fprochkmde,t_icitemquality.fwwchkmde=qualityK3.fwwchkmde,
t_icitemquality.fsochkmde=qualityK3.fsochkmde,t_icitemquality.fwthdrwchkmde=qualityK3.fwthdrwchkmde,
t_icitemquality.fstkchkmde=qualityK3.fstkchkmde,t_icitemquality.fotherchkmde=qualityK3.fotherchkmde
,t_icitemquality.fstkchkprd=qualityK3.fstkchkprd,
t_icitemquality.fstkchkalrm=qualityK3.fstkchkalrm,t_icitemquality.fidentifier=qualityK3.fidentifier from (
select fitemid,finspectionlevel,finspectionproject,fislistcontrol,fprochkmde,fwwchkmde,
fsochkmde,fwthdrwchkmde,fstkchkmde,fotherchkmde,fstkchkprd,fstkchkalrm,fidentifier from K33.AIS20120813194456.dbo.t_icitemquality
) qualityK3 where t_icitemquality.fitemid = qualityK3.fitemid

-----------------------------------------------------------------------

insert into t_icitembase (fitemid,ferpclsid,funitid,funitgroupid,fdefaultloc,fspid,fsource,fqtydecimal,flowlimit,fhighlimit,fsecinv,fusestate,flsequipment,fequipmentnum,
flssparepart,ffullname,fsecunitid,fseccoefficient,fsecunitdecimal,falias,forderunitid,fsaleunitid,fstoreunitid,fproductunitid,
fapproveno,fauxclassid,ftypeid,fpredeadline,fserialclassid) select fitemid,ferpclsid,funitid,funitgroupid,fdefaultloc,fspid,fsource,fqtydecimal,
flowlimit,fhighlimit,fsecinv,fusestate,fisequipment,fequipmentnum,
fissparepart,ffullname,fsecunitid,fseccoefficient,fsecunitdecimal,falias,forderunitid,fsaleunitid,fstoreunitid,fproductunitid,
fapproveno,fauxclassid,ftypeid,fpredeadline,fserialclassid from K33.AIS20120813194456.dbo.t_icitembase itembaseK3 
where itembaseK3.fitemid  not in ( select fitemid from t_icitembase)


update t_icitembase set t_icitembase.fitemid=k3upitembase.fitemid,t_icitembase.ferpclsid=k3upitembase.ferpclsid,t_icitembase.funitid=k3upitembase.funitid,
t_icitembase.funitgroupid=k3upitembase.funitgroupid,
t_icitembase.fdefaultloc=k3upitembase.fdefaultloc,t_icitembase.fspid=k3upitembase.fspid,t_icitembase.fsource=k3upitembase.fsource,t_icitembase.fqtydecimal=k3upitembase.fqtydecimal,
t_icitembase.flowlimit=k3upitembase.flowlimit,
t_icitembase.fhighlimit=k3upitembase.fhighlimit,t_icitembase.fsecinv=k3upitembase.fsecinv,t_icitembase.fusestate=k3upitembase.fusestate,t_icitembase.flsequipment=k3upitembase.fisequipment,
t_icitembase.fequipmentnum=k3upitembase.fequipmentnum,t_icitembase.flssparepart=k3upitembase.fissparepart,t_icitembase.ffullname=k3upitembase.ffullname,
t_icitembase.fsecunitid=k3upitembase.fsecunitid,
t_icitembase.fseccoefficient=k3upitembase.fseccoefficient,t_icitembase.fsecunitdecimal=k3upitembase.fsecunitdecimal,
t_icitembase.falias=k3upitembase.falias,t_icitembase.forderunitid=k3upitembase.forderunitid,t_icitembase.fsaleunitid=k3upitembase.fsaleunitid,t_icitembase.fstoreunitid=k3upitembase.fstoreunitid,
t_icitembase.fproductunitid=k3upitembase.fproductunitid,t_icitembase.fapproveno=k3upitembase.fapproveno,t_icitembase.fauxclassid=k3upitembase.fauxclassid,t_icitembase.ftypeid=k3upitembase.ftypeid,
t_icitembase.fpredeadline=k3upitembase.fpredeadline,t_icitembase.fserialclassid=k3upitembase.fserialclassid from (
select fitemid,ferpclsid,funitid,funitgroupid,fdefaultloc,fspid,fsource,fqtydecimal,flowlimit,fhighlimit,fsecinv,fusestate,fisequipment,fequipmentnum,
fissparepart,ffullname,fsecunitid,fseccoefficient,fsecunitdecimal,falias,forderunitid,fsaleunitid,fstoreunitid,fproductunitid,
fapproveno,fauxclassid,ftypeid,fpredeadline,fserialclassid from K33.AIS20120813194456.dbo.t_icitembase )  k3upitembase
where k3upitembase.fitemid = t_icitembase.fitemid

------------------------------------------------------------------------

insert into t_icitemplan (fitemid,fplantrategy,fordertrategy,fleadtime,ffixleadtime,ftotaltqq,fqtymin,fqtymax,fcuunitid,forderinterval,fbatchappendqty,
forderpoint,fbatfixeconomy,fbatchangeeconomy,frequirepoint,fplanpoint,fdefaultroutingid,fdefaultworktypeid,fproductprincipal,fdailyconsume,fmrpcon,fplanner,
fputinteger,finhighlimit,finlowlimit,flowestbomcode,fmrporder,fischarsourceitem,fcharsourceitemid,fplanmode,fctrltype,fctrlstraregy,fcontainername,fkanbancapability,
fisbackflush,fbackflushstockid,fbackflushspid
) select fitemid,fplantrategy,fordertrategy,fleadtime,ffixleadtime,ftotaltqq,fqtymin,fqtymax,fcuunitid,forderinterval,fbatchappendqty,
forderpoint,fbatfixeconomy,fbatchangeeconomy,frequirepoint,fplanpoint,fdefaultroutingid,fdefaultworktypeid,fproductprincipal,fdailyconsume,fmrpcon,fplanner,
fputinteger,finhighlimit,finlowlimit,flowestbomcode,fmrporder,fischarsourceitem,fcharsourceitemid,fplanmode,fctrltype,fctrlstraregy,fcontainername,fkanbancapability,
fisbackflush,fbackflushstockid,fbackflushspid from K33.AIS20120813194456.dbo.t_icitemplan k3itemplan
where k3itemplan.fitemid not in ( select fitemid from t_icitemplan )

update t_icitemplan set t_icitemplan.fitemid=planK3data.fitemid,t_icitemplan.fplantrategy=planK3data.fplantrategy,t_icitemplan.fordertrategy=planK3data.fordertrategy,
t_icitemplan.fleadtime=planK3data.fleadtime,t_icitemplan.ffixleadtime=planK3data.ffixleadtime,
t_icitemplan.ftotaltqq=planK3data.ftotaltqq,t_icitemplan.fqtymin=planK3data.fqtymin,t_icitemplan.fqtymax=planK3data.fqtymax,
t_icitemplan.fcuunitid=planK3data.fcuunitid,t_icitemplan.forderinterval=planK3data.forderinterval,t_icitemplan.fbatchappendqty=planK3data.fbatchappendqty,
t_icitemplan.forderpoint=planK3data.forderpoint,t_icitemplan.fbatfixeconomy=planK3data.fbatfixeconomy,t_icitemplan.fbatchangeeconomy=planK3data.fbatchangeeconomy,
t_icitemplan.frequirepoint=planK3data.frequirepoint,t_icitemplan.fplanpoint=planK3data.fplanpoint,t_icitemplan.fdefaultroutingid=planK3data.fdefaultroutingid,
t_icitemplan.fdefaultworktypeid=planK3data.fdefaultworktypeid,t_icitemplan.fproductprincipal=planK3data.fproductprincipal,t_icitemplan.fdailyconsume=planK3data.fdailyconsume,
t_icitemplan.fmrpcon=planK3data.fmrpcon,t_icitemplan.fplanner=planK3data.fplanner,
t_icitemplan.fputinteger=planK3data.fputinteger,t_icitemplan.finhighlimit=planK3data.finhighlimit,t_icitemplan.finlowlimit=planK3data.finlowlimit,
t_icitemplan.flowestbomcode=planK3data.flowestbomcode,t_icitemplan.fmrporder=planK3data.fmrporder,t_icitemplan.fischarsourceitem=planK3data.fischarsourceitem,
t_icitemplan.fcharsourceitemid=planK3data.fcharsourceitemid,t_icitemplan.fplanmode=planK3data.fplanmode,t_icitemplan.fctrltype=planK3data.fctrltype,
t_icitemplan.fctrlstraregy=planK3data.fctrlstraregy,t_icitemplan.fcontainername=planK3data.fcontainername,t_icitemplan.fkanbancapability=planK3data.fkanbancapability,
t_icitemplan.fisbackflush=planK3data.fisbackflush,t_icitemplan.fbackflushstockid=planK3data.fbackflushstockid,t_icitemplan.fbackflushspid=planK3data.fbackflushspid from ( select 

fitemid,fplantrategy,fordertrategy,fleadtime,ffixleadtime,ftotaltqq,fqtymin,fqtymax,fcuunitid,forderinterval,fbatchappendqty,
forderpoint,fbatfixeconomy,fbatchangeeconomy,frequirepoint,fplanpoint,fdefaultroutingid,fdefaultworktypeid,fproductprincipal,fdailyconsume,fmrpcon,fplanner,
fputinteger,finhighlimit,finlowlimit,flowestbomcode,fmrporder,fischarsourceitem,fcharsourceitemid,fplanmode,fctrltype,fctrlstraregy,fcontainername,fkanbancapability,
fisbackflush,fbackflushstockid,fbackflushspid from K33.AIS20120813194456.dbo.t_icitemplan) planK3data
where planK3data.fitemid = t_icitemplan.fitemid


--------------------------------------------------------------------

insert into t_icitemdesign (fitemid,fcharnumber,fiskeyitem,fmaund,fgrossweight,fnetweight,
fcubicmeasure,flength,fwidth,fheight,fsize,fversion)
select fitemid,fchartnumber,fiskeyitem,fmaund,fgrossweight,fnetweight,fcubicmeasure,
flength,fwidth,fheight,fsize,fversion from  K33.AIS20120813194456.dbo.t_icitemdesign designK3
where designK3.fitemid not in ( select fitemid from t_icitemdesign)

update t_icitemdesign set  t_icitemdesign.fitemid=k3itemdesign.fitemid,t_icitemdesign.fcharnumber=k3itemdesign.fchartnumber,t_icitemdesign.fiskeyitem=k3itemdesign.fiskeyitem,
t_icitemdesign.fmaund=k3itemdesign.fmaund,t_icitemdesign.fgrossweight=k3itemdesign.fgrossweight,t_icitemdesign.fnetweight=k3itemdesign.fnetweight,
t_icitemdesign.fcubicmeasure=k3itemdesign.fcubicmeasure,t_icitemdesign.flength=k3itemdesign.flength,t_icitemdesign.fwidth=k3itemdesign.fwidth,t_icitemdesign.fheight=k3itemdesign.fheight,
t_icitemdesign.fsize=k3itemdesign.fsize,t_icitemdesign.fversion=k3itemdesign.fversion from (
select fitemid,fchartnumber,fiskeyitem,fmaund,fgrossweight,fnetweight,
fcubicmeasure,flength,fwidth,fheight,fsize,fversion from K33.AIS20120813194456.dbo.t_icitemdesign ) k3itemdesign
where k3itemdesign.fitemid = t_icitemdesign.fitemid


----------------------------------------------------------------------

-----t_icitemcustom表的crm中有几个字段在ERP没找到对应的值

insert into t_icitemcustom (fitemid,f_104,f_105,f_106,f_107,f_108) 
select fitemid,f_104,f_105,f_106,f_107,f_108 
from K33.AIS20120813194456.dbo.t_icitemcustom customK3
where customK3.fitemid not in ( select fitemid from t_icitemcustom )

update t_icitemcustom set t_icitemcustom.fitemid=k3tiemcustom.fitemid,t_icitemcustom.f_104=k3tiemcustom.f_104,t_icitemcustom.f_105=k3tiemcustom.f_105,
t_icitemcustom.f_106=k3tiemcustom.f_106,
t_icitemcustom.f_107=k3tiemcustom.f_107,
t_icitemcustom.f_108=k3tiemcustom.f_108
from ( select fitemid,f_104,f_105,f_106,f_107,f_108 
from K33.AIS20120813194456.dbo.t_icitemcustom) k3tiemcustom
where k3tiemcustom.fitemid = t_icitemcustom.fitemid

end 
COMMIT TRANSACTION

-------------------------------同步物料结束----------------------------------------

--------创建视图t_icitem

create view t_icitem 
as
select 
t0.fitemid,t0.fnumber,t0.fname,t0.fmodel,t0.fdeleted,
t1.fstandardcost,t1.fstandardmanhour,t1.fstdpayrate,t1.fchgfeerate,t1.fstdfixfeerate,
t1.foutmachfee,t1.fpiecerate,t1.fstdbatchqty,t1.fpovacctid,t1.fpivacctid,t1.fmcvacctid,t1.fpcvacctid,t1.fslacctid,
t1.fcavacctid,t1.fcbappendrate,t1.fcbappendproject,t1.fcostbomid,t1.fcbrouting,t1.foutmachfeeproject,
t2.forderrector,t2.fpohghprcmnytype,t2.fpohighprice,t2.fwwhghprc,t2.fwwhghprcmnytype,t2.fsolowprc,t2.fsolowprcmnytype,t2.flssale,
t2.fprofitrate,t2.fsaleprice,t2.fbatchmanager,t2.fiskfperiod,
t2.fkfperiod,t2.ftrack,t2.fplanprice,
t2.fpricedecimal,t2.facctid,t2.fsaleacctid,t2.fcostacctid,t2.fapacctid,t2.fgoodspec,t2.fcostproject,t2.flssnmanage,t2.fstocktime,t2.fbookplan,
t2.fbeforeexpire,t2.ftaxrate,t2.fadminacctid,t2.fnote,t2.flsspecialtax,
t2.fsohighlimit,t2.fsolowlimit,t2.foihighlimit,t2.fdaysper,t2.flastcheckdate,t2.fcheckcycle,t2.fcheckcycunit,t2.fstockprice,t2.fabccls,
t2.fbatchqty,t2.fclass,t2.fcostdiffrate,t2.fdepartment,t2.fsaletaxacctid,
t2.fcbbmstandardid,t2.fcbrestore,t2.fpickhighlimit,t2.fpicklowlimit,
t3.fnameen,t3.fmodelen,t3.fhsnumber,t3.ffirstunit,t3.fsecondunit,t3.ffirstunitrate,t3.fsecondunitrate,t3.fismanage,t3.fpacktype,
t3.flendecimal,t3.fcubagedecimal,t3.fweightdecimal,t3.fimposttaxrate,t3.fconsumetaxrate,t3.fmanagetype,t3.fexportrate,
t4.finspectionlevel,t4.finspectionproject,t4.fislistcontrol,t4.fprochkmde,t4.fwwchkmde,
t4.fsochkmde,t4.fwthdrwchkmde,t4.fstkchkmde,t4.fotherchkmde,t4.fstkchkprd,t4.fstkchkalrm,t4.fidentifier,
t5.ferpclsid,t5.funitid,t5.funitgroupid,t5.fdefaultloc,t5.fspid,t5.fsource,t5.fqtydecimal,t5.flowlimit,t5.fhighlimit,t5.fsecinv,t5.fusestate,
t5.flsequipment,t5.fequipmentnum,
t5.flssparepart,t5.ffullname,t5.fsecunitid,t5.fseccoefficient,t5.fsecunitdecimal,t5.falias,t5.forderunitid,t5.fsaleunitid,t5.fstoreunitid,
t5.fproductunitid,t5.fapproveno,t5.fauxclassid,t5.ftypeid,t5.fpredeadline,t5.fserialclassid,
t6.fplantrategy,t6.fordertrategy,t6.fleadtime,t6.ffixleadtime,t6.ftotaltqq,t6.fqtymin,t6.fqtymax,t6.fcuunitid,t6.forderinterval,t6.fbatchappendqty,
t6.forderpoint,t6.fbatfixeconomy,t6.fbatchangeeconomy,t6.frequirepoint,t6.fplanpoint,t6.fdefaultroutingid,t6.fdefaultworktypeid,t6.fproductprincipal,t6.fdailyconsume,t6.fmrpcon,t6.fplanner,
t6.fputinteger,t6.finhighlimit,t6.finlowlimit,t6.flowestbomcode,t6.fmrporder,t6.fischarsourceitem,t6.fcharsourceitemid,t6.fplanmode,
t6.fctrltype,t6.fctrlstraregy,t6.fcontainername,t6.fkanbancapability,
t6.fisbackflush,t6.fbackflushstockid,t6.fbackflushspid,
t7.fcharnumber,t7.fiskeyitem,t7.fmaund,t7.fgrossweight,t7.fnetweight,
t7.fcubicmeasure,t7.flength,t7.fwidth,t7.fheight,t7.fsize,t7.fversion,
t8.f_104,t8.f_105,t8.f_106,t8.f_107,t8.f_108
from 
t_item as t0 left join t_icitemstandard as t1 on t0.fitemid = t1.fitemid
left join t_icitemmaterial as t2 on   t0.fitemid = t2.fitemid
left join t_base_icitementrance as t3 on t0.fitemid = t3.fitemid
left join t_icitemquality as t4 on t0.fitemid = t4.fitemid
left join t_icitembase as t5 on t0.fitemid = t5.fitemid
left join t_icitemplan as t6 on t0.fitemid = t6.fitemid
left join t_icitemdesign as t7 on t0.fitemid = t7.fitemid
left join t_icitemcustom as t8 on t0.fitemid = t8.fitemid

-------------------------------------------------------------------------AIS20150630131026
----同步客户信息
create procedure pro_syncERPData
as
set xact_abort ON
begin TRANSACTION --开启事务
begin

insert into t_organization (fname,fitemid,fnumber,ismanual) 
select fname,fitemid,fnumber,1 from K33.AIS20120813194456.dbo.t_organization as K3organization 

where K3organization.fname not in (select fname from t_organization)

update t_organization set t_organization.fname=orgnitionK3.fname,t_organization.fitemid=orgnitionK3.fitemid,t_organization.fnumber=orgnitionK3.fnumber 
from ( select fname,fitemid,fnumber from  K33.AIS20120813194456.dbo.t_organization ) orgnitionK3
where orgnitionK3.fitemid = t_organization.fitemid
end
COMMIT TRANSACTION --提交事务

--------------------------------------------------------------------

