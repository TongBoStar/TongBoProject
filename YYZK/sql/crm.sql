/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2000                    */
/* Created on:     2015/8/26 13:11:54                           */
/*==============================================================*/


if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_admin') and o.name = 'FK_T_ADMIN_REFERENCE_T_DUTY')
alter table t_admin
   drop constraint FK_T_ADMIN_REFERENCE_T_DUTY
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_admin') and o.name = 'FK_T_ADMIN_REFERENCE_T_AREA')
alter table t_admin
   drop constraint FK_T_ADMIN_REFERENCE_T_AREA
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_admin') and o.name = 'FK_T_ADMIN_REFERENCE_T_PROVIN')
alter table t_admin
   drop constraint FK_T_ADMIN_REFERENCE_T_PROVIN
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_admin_orggroup') and o.name = 'FK_T_ADMIN__REFERENCE_T_ORGGRA')
alter table t_admin_orggroup
   drop constraint FK_T_ADMIN__REFERENCE_T_ORGGRA
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_admin_orggroup') and o.name = 'FK_T_ADMIN__REFERENCE_T_ADMIN')
alter table t_admin_orggroup
   drop constraint FK_T_ADMIN__REFERENCE_T_ADMIN
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_admin_province') and o.name = 'FK_T_ADMIN__REFERENCE_T_PROVIN')
alter table t_admin_province
   drop constraint FK_T_ADMIN__REFERENCE_T_PROVIN
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_admin_province') and o.name = 'FK_T_ADMIN__REFERENCE_T_ADMIN_PROVINCE')
alter table t_admin_province
   drop constraint FK_T_ADMIN__REFERENCE_T_ADMIN_PROVINCE
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_admin_province') and o.name = 'FK_T_ADMIN__REFERENCE_T_AREA')
alter table t_admin_province
   drop constraint FK_T_ADMIN__REFERENCE_T_AREA
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_area') and o.name = 'FK_T_AREA_REFERENCE_T_ADMIN')
alter table t_area
   drop constraint FK_T_AREA_REFERENCE_T_ADMIN
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_bitem') and o.name = 'FK_T_BITEM_REFERENCE_T_ITEMCL')
alter table t_bitem
   drop constraint FK_T_BITEM_REFERENCE_T_ITEMCL
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_cdepartment') and o.name = 'FK_T_CDEPAR_REFERENCE_T_ORGANI')
alter table t_cdepartment
   drop constraint FK_T_CDEPAR_REFERENCE_T_ORGANI
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_crm_contact') and o.name = 'FK_T_CRM_CO_REFERENCE_T_ORGANI')
alter table t_crm_contact
   drop constraint FK_T_CRM_CO_REFERENCE_T_ORGANI
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_crm_contact') and o.name = 'FK_T_CRM_CO_REFERENCE_T_CDEPAR')
alter table t_crm_contact
   drop constraint FK_T_CRM_CO_REFERENCE_T_CDEPAR
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_customer_score') and o.name = 'FK_T_CUSTOM_REFERENCE_T_AREA')
alter table t_customer_score
   drop constraint FK_T_CUSTOM_REFERENCE_T_AREA
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_customer_score') and o.name = 'FK_T_CUSTOM_REFERENCE_T_PROVIN')
alter table t_customer_score
   drop constraint FK_T_CUSTOM_REFERENCE_T_PROVIN
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_customer_score') and o.name = 'FK_T_CUSTOM_REFERENCE_T_ORGANI')
alter table t_customer_score
   drop constraint FK_T_CUSTOM_REFERENCE_T_ORGANI
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_customer_score') and o.name = 'FK_T_CUSTOM_REFERENCE_T_BLOC')
alter table t_customer_score
   drop constraint FK_T_CUSTOM_REFERENCE_T_BLOC
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_department') and o.name = 'FK_T_DEPART_REFERENCE_T_ADMIN')
alter table t_department
   drop constraint FK_T_DEPART_REFERENCE_T_ADMIN
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_duty') and o.name = 'FK_T_DUTY_REFERENCE_T_DEPART')
alter table t_duty
   drop constraint FK_T_DUTY_REFERENCE_T_DEPART
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_duty_organ') and o.name = 'FK_T_DUTY_O_REFERENCE_T_DUTY')
alter table t_duty_organ
   drop constraint FK_T_DUTY_O_REFERENCE_T_DUTY
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_duty_organ') and o.name = 'FK_T_DUTY_O_REFERENCE_T_ORGANI')
alter table t_duty_organ
   drop constraint FK_T_DUTY_O_REFERENCE_T_ORGANI
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_employee') and o.name = 'FK_T_EMPLOY_REFERENCE_T_TEAM')
alter table t_employee
   drop constraint FK_T_EMPLOY_REFERENCE_T_TEAM
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_employee') and o.name = 'FK_T_EMPLOY_REFERENCE_T_DUTY')
alter table t_employee
   drop constraint FK_T_EMPLOY_REFERENCE_T_DUTY
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_employee') and o.name = 'FK_T_EMPLOY_REFERENCE_T_DEPART')
alter table t_employee
   drop constraint FK_T_EMPLOY_REFERENCE_T_DEPART
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_enduser') and o.name = 'FK_T_ENDUSE_REFERENCE_T_AREA')
alter table t_enduser
   drop constraint FK_T_ENDUSE_REFERENCE_T_AREA
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_enduser') and o.name = 'FK_T_ENDUSE_REFERENCE_T_CDEPAR')
alter table t_enduser
   drop constraint FK_T_ENDUSE_REFERENCE_T_CDEPAR
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_enduser') and o.name = 'FK_T_ENDUSE_REFERENCE_T_PROVIN')
alter table t_enduser
   drop constraint FK_T_ENDUSE_REFERENCE_T_PROVIN
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_fielddescription') and o.name = 'FK_T_FIELDD_REFERENCE_T_TABLED')
alter table t_fielddescription
   drop constraint FK_T_FIELDD_REFERENCE_T_TABLED
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_forderinstock') and o.name = 'FK_T_FORDER_REFERENCE_T_RECEIVSTOCK')
alter table t_forderinstock
   drop constraint FK_T_FORDER_REFERENCE_T_RECEIVSTOCK
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_forderinvoice') and o.name = 'FK_T_FORDER_REFERENCE_T_RECEIV_INVOICE')
alter table t_forderinvoice
   drop constraint FK_T_FORDER_REFERENCE_T_RECEIV_INVOICE
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_forderrefund') and o.name = 'FK_T_FORDER_REFERENCE_T_RECEIV_REFUND')
alter table t_forderrefund
   drop constraint FK_T_FORDER_REFERENCE_T_RECEIV_REFUND
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_fordersend') and o.name = 'FK_T_FORDER_REFERENCE_T_RECEIV')
alter table t_fordersend
   drop constraint FK_T_FORDER_REFERENCE_T_RECEIV
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_item') and o.name = 'FK_T_ITEM_REFERENCE_T_PDCATE')
alter table t_item
   drop constraint FK_T_ITEM_REFERENCE_T_PDCATE
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_item_rule') and o.name = 'FK_T_ITEM_R_REFERENCE_T_BITEM')
alter table t_item_rule
   drop constraint FK_T_ITEM_R_REFERENCE_T_BITEM
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_item_rule_detail') and o.name = 'FK_T_ITEM_R_REFERENCE_T_ITEM_R')
alter table t_item_rule_detail
   drop constraint FK_T_ITEM_R_REFERENCE_T_ITEM_R
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_item_rule_detail') and o.name = 'FK_T_ITEM_R_REFERENCE_T_BITEM_RULE')
alter table t_item_rule_detail
   drop constraint FK_T_ITEM_R_REFERENCE_T_BITEM_RULE
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_org_orggorup') and o.name = 'FK_T_ORG_OR_REFERENCE_T_ORGGRA')
alter table t_org_orggorup
   drop constraint FK_T_ORG_OR_REFERENCE_T_ORGGRA
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_org_orggorup') and o.name = 'FK_T_ORG_OR_REFERENCE_T_ORGANI')
alter table t_org_orggorup
   drop constraint FK_T_ORG_OR_REFERENCE_T_ORGANI
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_organization') and o.name = 'FK_T_ORGANI_REFERENCE_T_AREA')
alter table t_organization
   drop constraint FK_T_ORGANI_REFERENCE_T_AREA
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_organization') and o.name = 'FK_T_ORGANI_REFERENCE_T_PROVIN')
alter table t_organization
   drop constraint FK_T_ORGANI_REFERENCE_T_PROVIN
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_organization') and o.name = 'FK_T_ORGANI_REFERENCE_T_BLOC')
alter table t_organization
   drop constraint FK_T_ORGANI_REFERENCE_T_BLOC
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_pdbase') and o.name = 'FK_T_PDBASE_REFERENCE_T_SALEST')
alter table t_pdbase
   drop constraint FK_T_PDBASE_REFERENCE_T_SALEST
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_pdbase') and o.name = 'FK_T_PDBASE_REFERENCE_T_PROVIN')
alter table t_pdbase
   drop constraint FK_T_PDBASE_REFERENCE_T_PROVIN
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_pdbase') and o.name = 'FK_T_PDBASE_REFERENCE_T_ADMIN')
alter table t_pdbase
   drop constraint FK_T_PDBASE_REFERENCE_T_ADMIN
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_per_fee') and o.name = 'FK_T_PER_FE_REFERENCE_T_RP_BIL')
alter table t_per_fee
   drop constraint FK_T_PER_FE_REFERENCE_T_RP_BIL
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_performance') and o.name = 'FK_T_PERFOR_REFERENCE_T_PRODUC')
alter table t_performance
   drop constraint FK_T_PERFOR_REFERENCE_T_PRODUC
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_pm') and o.name = 'FK_T_PM_REFERENCE_T_KEY_DE')
alter table t_pm
   drop constraint FK_T_PM_REFERENCE_T_KEY_DE
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_pm') and o.name = 'FK_T_PM_REFERENCE_T_SDARI_')
alter table t_pm
   drop constraint FK_T_PM_REFERENCE_T_SDARI_
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_pm') and o.name = 'FK_T_PM_REFERENCE_T_SDARI')
alter table t_pm
   drop constraint FK_T_PM_REFERENCE_T_SDARI
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_pm') and o.name = 'FK_T_PM_REFERENCE_T_ORGANI')
alter table t_pm
   drop constraint FK_T_PM_REFERENCE_T_ORGANI
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_pm_competitor') and o.name = 'FK_T_PM_COM_REFERENCE_T_PM')
alter table t_pm_competitor
   drop constraint FK_T_PM_COM_REFERENCE_T_PM
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_pm_competitor') and o.name = 'FK_T_PM_COM_REFERENCE_T_COMPET')
alter table t_pm_competitor
   drop constraint FK_T_PM_COM_REFERENCE_T_COMPET
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_pm_competitor') and o.name = 'FK_T_PM_COM_REFERENCE_T_PM_SEC')
alter table t_pm_competitor
   drop constraint FK_T_PM_COM_REFERENCE_T_PM_SEC
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_pm_section') and o.name = 'FK_T_PM_SEC_REFERENCE_T_PM')
alter table t_pm_section
   drop constraint FK_T_PM_SEC_REFERENCE_T_PM
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_pm_section') and o.name = 'FK_T_PM_SEC_REFERENCE_T_KEY_DE')
alter table t_pm_section
   drop constraint FK_T_PM_SEC_REFERENCE_T_KEY_DE
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_productpl') and o.name = 'FK_T_PRODUC_REFERENCE_T_PRODUC')
alter table t_productpl
   drop constraint FK_T_PRODUC_REFERENCE_T_PRODUC
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_project_bom') and o.name = 'FK_T_PROJEC_REFERENCE_T_PROJEC')
alter table t_project_bom
   drop constraint FK_T_PROJEC_REFERENCE_T_PROJEC
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_province') and o.name = 'FK_T_PROVIN_REFERENCE_T_AREA')
alter table t_province
   drop constraint FK_T_PROVIN_REFERENCE_T_AREA
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_rece_pl') and o.name = 'FK_T_RECE_P_REFERENCE_T_RECEIV')
alter table t_rece_pl
   drop constraint FK_T_RECE_P_REFERENCE_T_RECEIV
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_rp_exchange') and o.name = 'FK_T_RP_EXC_REFERENCE_T_RP_NEW')
alter table t_rp_exchange
   drop constraint FK_T_RP_EXC_REFERENCE_T_RP_NEW
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_sdari_engineer') and o.name = 'FK_T_SDARI__REFERENCE_T_SDARI')
alter table t_sdari_engineer
   drop constraint FK_T_SDARI__REFERENCE_T_SDARI
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_sortcodesec') and o.name = 'FK_T_SORTCO_REFERENCE_T_SORTCO')
alter table t_sortcodesec
   drop constraint FK_T_SORTCO_REFERENCE_T_SORTCO
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_surveys') and o.name = 'FK_T_SURVEY_REFERENCE_T_ORGANI')
alter table t_surveys
   drop constraint FK_T_SURVEY_REFERENCE_T_ORGANI
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_surveys') and o.name = 'FK_T_SURVEY_REFERENCE_T_GRADES')
alter table t_surveys
   drop constraint FK_T_SURVEY_REFERENCE_T_GRADES
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_surveys_entry') and o.name = 'FK_T_SURVEY_REFERENCE_T_SURVEY')
alter table t_surveys_entry
   drop constraint FK_T_SURVEY_REFERENCE_T_SURVEY
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_surveys_entry') and o.name = 'FK_T_SURVEY_REFERENCE_T_GRADE_')
alter table t_surveys_entry
   drop constraint FK_T_SURVEY_REFERENCE_T_GRADE_
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_surveys_entry') and o.name = 'FK_T_SURVEY_REFERENCE_T_ORGANI_entry')
alter table t_surveys_entry
   drop constraint FK_T_SURVEY_REFERENCE_T_ORGANI_entry
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_team') and o.name = 'FK_T_TEAM_REFERENCE_T_DEPART')
alter table t_team
   drop constraint FK_T_TEAM_REFERENCE_T_DEPART
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_team') and o.name = 'FK_T_TEAM_REFERENCE_T_ADMIN')
alter table t_team
   drop constraint FK_T_TEAM_REFERENCE_T_ADMIN
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_win_company') and o.name = 'FK_T_WIN_CO_REFERENCE_T_PM')
alter table t_win_company
   drop constraint FK_T_WIN_CO_REFERENCE_T_PM
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_win_company') and o.name = 'FK_T_WIN_CO_REFERENCE_T_COMPET')
alter table t_win_company
   drop constraint FK_T_WIN_CO_REFERENCE_T_COMPET
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('t_win_company') and o.name = 'FK_T_WIN_CO_REFERENCE_T_PM_SEC')
alter table t_win_company
   drop constraint FK_T_WIN_CO_REFERENCE_T_PM_SEC
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.contractreview')
            and   type = 'U')
   drop table dbo.contractreview
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_admin')
            and   type = 'U')
   drop table t_admin
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_admin_orggroup')
            and   type = 'U')
   drop table t_admin_orggroup
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_admin_province')
            and   type = 'U')
   drop table t_admin_province
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_admin_role')
            and   type = 'U')
   drop table t_admin_role
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_agents')
            and   type = 'U')
   drop table t_agents
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_approve_msg')
            and   type = 'U')
   drop table t_approve_msg
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_area')
            and   type = 'U')
   drop table t_area
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_authority')
            and   type = 'U')
   drop table t_authority
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_base_icitementrance')
            and   type = 'U')
   drop table t_base_icitementrance
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_bitem')
            and   type = 'U')
   drop table t_bitem
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_bloc')
            and   type = 'U')
   drop table t_bloc
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_cdepartment')
            and   type = 'U')
   drop table t_cdepartment
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_checkorder')
            and   type = 'U')
   drop table t_checkorder
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_collectpay')
            and   type = 'U')
   drop table dbo.t_collectpay
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_collectpay_history')
            and   type = 'U')
   drop table dbo.t_collectpay_history
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_competitor')
            and   type = 'U')
   drop table t_competitor
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_contractchange')
            and   type = 'U')
   drop table dbo.t_contractchange
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_creviewexinfo')
            and   type = 'U')
   drop table dbo.t_creviewexinfo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_crm_contact')
            and   type = 'U')
   drop table t_crm_contact
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_customer_score')
            and   type = 'U')
   drop table t_customer_score
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_department')
            and   type = 'U')
   drop table t_department
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_duty')
            and   type = 'U')
   drop table t_duty
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_duty_organ')
            and   type = 'U')
   drop table t_duty_organ
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_employee')
            and   type = 'U')
   drop table t_employee
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_enduser')
            and   type = 'U')
   drop table t_enduser
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_eu')
            and   type = 'U')
   drop table t_eu
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_exchangerateentry')
            and   type = 'U')
   drop table t_exchangerateentry
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_fielddescription')
            and   type = 'U')
   drop table t_fielddescription
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_forderinstock')
            and   type = 'U')
   drop table t_forderinstock
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_forderinvoice')
            and   type = 'U')
   drop table t_forderinvoice
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_forderrefund')
            and   type = 'U')
   drop table t_forderrefund
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_fordersend')
            and   type = 'U')
   drop table t_fordersend
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_grade_wight')
            and   type = 'U')
   drop table t_grade_wight
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_grades')
            and   type = 'U')
   drop table t_grades
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_icitembase')
            and   type = 'U')
   drop table t_icitembase
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_icitemcustom')
            and   type = 'U')
   drop table t_icitemcustom
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_icitemdesign')
            and   type = 'U')
   drop table t_icitemdesign
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_icitemmaterial')
            and   type = 'U')
   drop table t_icitemmaterial
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_icitemplan')
            and   type = 'U')
   drop table t_icitemplan
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_icitemquality')
            and   type = 'U')
   drop table t_icitemquality
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_icitemstandard')
            and   type = 'U')
   drop table t_icitemstandard
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_item')
            and   type = 'U')
   drop table t_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_item_rule')
            and   type = 'U')
   drop table t_item_rule
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_item_rule_detail')
            and   type = 'U')
   drop table t_item_rule_detail
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_itemclass')
            and   type = 'U')
   drop table t_itemclass
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_key_device')
            and   type = 'U')
   drop table t_key_device
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_mail_msg')
            and   type = 'U')
   drop table t_mail_msg
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_measureunit')
            and   type = 'U')
   drop table t_measureunit
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_order')
            and   type = 'U')
   drop table dbo.t_order
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_org_orggorup')
            and   type = 'U')
   drop table t_org_orggorup
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_organization')
            and   type = 'U')
   drop table t_organization
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_orggrantgroup')
            and   type = 'U')
   drop table t_orggrantgroup
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_outlaypay')
            and   type = 'U')
   drop table t_outlaypay
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_pdbase')
            and   type = 'U')
   drop table t_pdbase
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_pdcategory')
            and   type = 'U')
   drop table t_pdcategory
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_pdparameter')
            and   type = 'U')
   drop table t_pdparameter
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_per_fee')
            and   type = 'U')
   drop table t_per_fee
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_performance')
            and   type = 'U')
   drop table t_performance
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_performance_detail')
            and   type = 'U')
   drop table t_performance_detail
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_pl')
            and   type = 'U')
   drop table t_pl
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_plratio')
            and   type = 'U')
   drop table t_plratio
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_pm')
            and   type = 'U')
   drop table t_pm
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_pm_competitor')
            and   type = 'U')
   drop table t_pm_competitor
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_pm_section')
            and   type = 'U')
   drop table t_pm_section
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_pro_item')
            and   type = 'U')
   drop table t_pro_item
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_product')
            and   type = 'U')
   drop table dbo.t_product
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_product_history')
            and   type = 'U')
   drop table dbo.t_product_history
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_productpl')
            and   type = 'U')
   drop table t_productpl
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_productpl_history')
            and   type = 'U')
   drop table t_productpl_history
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_project_bom')
            and   type = 'U')
   drop table t_project_bom
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_project_info')
            and   type = 'U')
   drop table t_project_info
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_province')
            and   type = 'U')
   drop table t_province
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_questionandreply')
            and   type = 'U')
   drop table dbo.t_questionandreply
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_rece_pl')
            and   type = 'U')
   drop table t_rece_pl
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_receivable')
            and   type = 'U')
   drop table t_receivable
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_rewardnotes')
            and   type = 'U')
   drop table t_rewardnotes
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_role')
            and   type = 'U')
   drop table t_role
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_role_authority')
            and   type = 'U')
   drop table t_role_authority
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_rp_bill')
            and   type = 'U')
   drop table t_rp_bill
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_rp_exchange')
            and   type = 'U')
   drop table t_rp_exchange
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_rp_newreceivebill')
            and   type = 'U')
   drop table t_rp_newreceivebill
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_rpcontract')
            and   type = 'U')
   drop table t_rpcontract
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_rpcontractentry')
            and   type = 'U')
   drop table t_rpcontractentry
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_sale_ratio')
            and   type = 'U')
   drop table t_sale_ratio
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_salestype')
            and   type = 'U')
   drop table t_salestype
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_sdari')
            and   type = 'U')
   drop table t_sdari
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_sdari_engineer')
            and   type = 'U')
   drop table t_sdari_engineer
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_seorder')
            and   type = 'U')
   drop table t_seorder
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_seorderentry')
            and   type = 'U')
   drop table t_seorderentry
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_sortcodefir')
            and   type = 'U')
   drop table t_sortcodefir
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_sortcodesec')
            and   type = 'U')
   drop table t_sortcodesec
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_structure')
            and   type = 'U')
   drop table t_structure
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_summary')
            and   type = 'U')
   drop table t_summary
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_surveys')
            and   type = 'U')
   drop table t_surveys
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_surveys_entry')
            and   type = 'U')
   drop table t_surveys_entry
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_sysorder')
            and   type = 'U')
   drop table dbo.t_sysorder
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.t_sysorder_history')
            and   type = 'U')
   drop table dbo.t_sysorder_history
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_tabledescription')
            and   type = 'U')
   drop table t_tabledescription
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_team')
            and   type = 'U')
   drop table t_team
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_tecnorm')
            and   type = 'U')
   drop table t_tecnorm
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_win_company')
            and   type = 'U')
   drop table t_win_company
go

execute sp_revokedbaccess dbo
go

/*==============================================================*/
/* User: dbo                                                    */
/*==============================================================*/
execute sp_grantdbaccess dbo
go

/*==============================================================*/
/* Table: contractreview                                        */
/*==============================================================*/
create table dbo.contractreview (
   contractReviewId     bigint               not null,
   orderCode            varchar(50)          null,
   contractCode         varchar(50)          null,
   customerName         archar(50)           null,
   reviewType           varchar(3)           null,
   projectName          varchar(50)          null,
   contractFee          decimal(20,2)        null,
   salePrincipal        varchar(50)          null,
   salePrincipalId      bigint               null,
   saleManager          varchar(50)          null,
   saleManagerId        bigint               null,
   saleStatus           int                  null,
   saleAdvice           varchar(500)         null,
   financeManager       varchar(50)          null,
   financeManagerId     bigint               null,
   financeStatus        int                  null,
   financeAdvice        varchar(500)         null,
   customerServiceManager varchar(50)          null,
   customerServiceManagerId bigint               null,
   customerServiceStatus int                  null,
   customerServiceAdvice varchar(500)         null,
   materialControlManager varchar(50)          null,
   materialControlManagerId bigint               null,
   materialControlStatus int                  null,
   materialControlAdvice varchar(500)         null,
   makeManager          varchar(50)          null,
   makeManagerId        bigint               null,
   makeStatus           int                  null,
   makeAdvice           varchar(500)         null,
   purchaseManager      varchar(50)          null,
   purchaseManagerId    bigint               null,
   purchaseStatus       int                  null,
   purchaseAdvice       varchar(500)         null,
   projectManager       varchar(50)          null,
   projectManagerId     bigint               null,
   projectStatus        int                  null,
   projectAdvice        varchar(500)         null,
   projectSupporter     varchar(50)          null,
   projectSupporterId   bigint               null,
   projectSupporterStatus int                  null,
   projectSupporterAdvice varchar(500)         null,
   orderWorker          varchar(50)          null,
   orderWorkerId        bigint               null,
   orderWorkerStatus    int                  null,
   orderWorkerAdvice    varchar(500)         null,
   orderManager         varchar(50)          null,
   orderManagerId       bigint               null,
   orderManagerStatus   int                  null,
   orderManagerAdvice   varchar(500)         null,
   qualityManager       varchar(50)          null,
   qualityManagerId     bigint               null,
   qualityStatus        int                  null,
   qualityAdvice        varchar(500)         null,
   manager              varchar(50)          null,
   managerId            bigint               null,
   managerStatus        int                  null,
   managerAdvice        varchar(500)         null,
   examineTime          datetime             null,
   constraint PK_CONTRACTREVIEW primary key (contractReviewId)
)
go

execute sp_addextendedproperty 'MS_Description', 
   '合同评审表',
   'user', 'dbo', 'table', 'contractreview'
go

execute sp_addextendedproperty 'MS_Description', 
   '唯一标识ID',
   'user', 'dbo', 'table', 'contractreview', 'column', 'contractReviewId'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单编号',
   'user', 'dbo', 'table', 'contractreview', 'column', 'orderCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同编号',
   'user', 'dbo', 'table', 'contractreview', 'column', 'contractCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '客户名称',
   'user', 'dbo', 'table', 'contractreview', 'column', 'customerName'
go

execute sp_addextendedproperty 'MS_Description', 
   '评审方式',
   'user', 'dbo', 'table', 'contractreview', 'column', 'reviewType'
go

execute sp_addextendedproperty 'MS_Description', 
   '项目名称',
   'user', 'dbo', 'table', 'contractreview', 'column', 'projectName'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同金额',
   'user', 'dbo', 'table', 'contractreview', 'column', 'contractFee'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售部负责人',
   'user', 'dbo', 'table', 'contractreview', 'column', 'salePrincipal'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售负责人ID',
   'user', 'dbo', 'table', 'contractreview', 'column', 'salePrincipalId'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售部经理',
   'user', 'dbo', 'table', 'contractreview', 'column', 'saleManager'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售部经理ID',
   'user', 'dbo', 'table', 'contractreview', 'column', 'saleManagerId'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售部审核状态',
   'user', 'dbo', 'table', 'contractreview', 'column', 'saleStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售部审核意见',
   'user', 'dbo', 'table', 'contractreview', 'column', 'saleAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '财务部经理',
   'user', 'dbo', 'table', 'contractreview', 'column', 'financeManager'
go

execute sp_addextendedproperty 'MS_Description', 
   '财务部经理ID',
   'user', 'dbo', 'table', 'contractreview', 'column', 'financeManagerId'
go

execute sp_addextendedproperty 'MS_Description', 
   '财务部审核状态',
   'user', 'dbo', 'table', 'contractreview', 'column', 'financeStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   '财务部审核意见',
   'user', 'dbo', 'table', 'contractreview', 'column', 'financeAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '售后服务部经理',
   'user', 'dbo', 'table', 'contractreview', 'column', 'customerServiceManager'
go

execute sp_addextendedproperty 'MS_Description', 
   '售后服务部经理ID',
   'user', 'dbo', 'table', 'contractreview', 'column', 'customerServiceManagerId'
go

execute sp_addextendedproperty 'MS_Description', 
   '售后服务部审核状态',
   'user', 'dbo', 'table', 'contractreview', 'column', 'customerServiceStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   '售后服务部审核意见',
   'user', 'dbo', 'table', 'contractreview', 'column', 'customerServiceAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '计划物控部经理',
   'user', 'dbo', 'table', 'contractreview', 'column', 'materialControlManager'
go

execute sp_addextendedproperty 'MS_Description', 
   '计划物控部经理ID',
   'user', 'dbo', 'table', 'contractreview', 'column', 'materialControlManagerId'
go

execute sp_addextendedproperty 'MS_Description', 
   '计划物控部审核状态',
   'user', 'dbo', 'table', 'contractreview', 'column', 'materialControlStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   '计划物控部审核意见',
   'user', 'dbo', 'table', 'contractreview', 'column', 'materialControlAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '制造部经理',
   'user', 'dbo', 'table', 'contractreview', 'column', 'makeManager'
go

execute sp_addextendedproperty 'MS_Description', 
   '制造部经理ID',
   'user', 'dbo', 'table', 'contractreview', 'column', 'makeManagerId'
go

execute sp_addextendedproperty 'MS_Description', 
   '制造部审核状态',
   'user', 'dbo', 'table', 'contractreview', 'column', 'makeStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   '制造部审核意见',
   'user', 'dbo', 'table', 'contractreview', 'column', 'makeAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '采购部经理',
   'user', 'dbo', 'table', 'contractreview', 'column', 'purchaseManager'
go

execute sp_addextendedproperty 'MS_Description', 
   '采购部经理ID',
   'user', 'dbo', 'table', 'contractreview', 'column', 'purchaseManagerId'
go

execute sp_addextendedproperty 'MS_Description', 
   '采购部审核状态',
   'user', 'dbo', 'table', 'contractreview', 'column', 'purchaseStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   '采购部门审核意见',
   'user', 'dbo', 'table', 'contractreview', 'column', 'purchaseAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '项目部经理',
   'user', 'dbo', 'table', 'contractreview', 'column', 'projectManager'
go

execute sp_addextendedproperty 'MS_Description', 
   '项目部经理ID',
   'user', 'dbo', 'table', 'contractreview', 'column', 'projectManagerId'
go

execute sp_addextendedproperty 'MS_Description', 
   '项目部审核状态',
   'user', 'dbo', 'table', 'contractreview', 'column', 'projectStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   '项目部审核意见',
   'user', 'dbo', 'table', 'contractreview', 'column', 'projectAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '项目部技术支持',
   'user', 'dbo', 'table', 'contractreview', 'column', 'projectSupporter'
go

execute sp_addextendedproperty 'MS_Description', 
   '项目部技术支持ID',
   'user', 'dbo', 'table', 'contractreview', 'column', 'projectSupporterId'
go

execute sp_addextendedproperty 'MS_Description', 
   '项目部技术支持审核状态',
   'user', 'dbo', 'table', 'contractreview', 'column', 'projectSupporterStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   '项目部技术支持审核意见',
   'user', 'dbo', 'table', 'contractreview', 'column', 'projectSupporterAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单管理员',
   'user', 'dbo', 'table', 'contractreview', 'column', 'orderWorker'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单管理员ID',
   'user', 'dbo', 'table', 'contractreview', 'column', 'orderWorkerId'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单管理员审核状态',
   'user', 'dbo', 'table', 'contractreview', 'column', 'orderWorkerStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单管理员审核意见',
   'user', 'dbo', 'table', 'contractreview', 'column', 'orderWorkerAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单管理部经理',
   'user', 'dbo', 'table', 'contractreview', 'column', 'orderManager'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单管理部经理ID',
   'user', 'dbo', 'table', 'contractreview', 'column', 'orderManagerId'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单管理部审核状态',
   'user', 'dbo', 'table', 'contractreview', 'column', 'orderManagerStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单管理部审核意见',
   'user', 'dbo', 'table', 'contractreview', 'column', 'orderManagerAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '品管部经理',
   'user', 'dbo', 'table', 'contractreview', 'column', 'qualityManager'
go

execute sp_addextendedproperty 'MS_Description', 
   '品管部经理ID',
   'user', 'dbo', 'table', 'contractreview', 'column', 'qualityManagerId'
go

execute sp_addextendedproperty 'MS_Description', 
   '品管部经理审核状态',
   'user', 'dbo', 'table', 'contractreview', 'column', 'qualityStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   '品管部经理审核意见',
   'user', 'dbo', 'table', 'contractreview', 'column', 'qualityAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '副总',
   'user', 'dbo', 'table', 'contractreview', 'column', 'manager'
go

execute sp_addextendedproperty 'MS_Description', 
   '副总ID',
   'user', 'dbo', 'table', 'contractreview', 'column', 'managerId'
go

execute sp_addextendedproperty 'MS_Description', 
   '副总审核状态',
   'user', 'dbo', 'table', 'contractreview', 'column', 'managerStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   '副总审核意见',
   'user', 'dbo', 'table', 'contractreview', 'column', 'managerAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '审核时间',
   'user', 'dbo', 'table', 'contractreview', 'column', 'examineTime'
go

/*==============================================================*/
/* Table: t_admin                                               */
/*==============================================================*/
create table t_admin (
   adminId              bigint               identity,
   adminName            nvarchar(50)         null,
   loginName            nvarchar(20)         null,
   password             nvarchar(50)         null,
   createdTime          datetime             null,
   modifiedTime         datetime             null,
   lastLoginTime        datetime             null,
   status               bigint               null,
   teamid               bigint               null,
   type                 integer              null,
   email                nvarchar(100)        null,
   empcode              nvarchar(50)         null,
   dutyid               bigint               null,
   areaid               bigint               null,
   provinceid           bigint               null,
   emp_superior         bigint               null,
   superiorname         nvarchar(50)         null,
   emparea              bigint               null,
   empphone             nvarchar(50)         null,
   empvalid_tag         int                  null,
   flevel               int                  null,
   amanagerid           bigint               null,
   amanagername         nvarchar(50)         null,
   teamseq              bigint               null,
   salemid              bigint               null,
   salemname            nvarchar(50)         null,
   isstruct             int                  null default 0,
   constraint PK_T_ADMIN primary key (adminId)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '管理用户',
   'user', @CurrentUser, 'table', 't_admin'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'adminId',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'adminId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'adminName',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'adminName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'loginName',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'loginName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'password',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'password'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'createdTime',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'createdTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'modifiedTime',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'modifiedTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'lastLoginTime',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'lastLoginTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'status',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'status'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '部门',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'teamid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:管理员,2:超级用户,3:普通用户,4:经销商',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'type'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'email',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'email'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '员工编号',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'empcode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '职务',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'dutyid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'areaid',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'areaid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'provinceid',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'provinceid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级用户id',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'emp_superior'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级用户名',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'superiorname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户所属区域',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'emparea'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'empphone',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'empphone'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'empvalid_tag',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'empvalid_tag'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '级别',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'flevel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '区域经理',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'amanagerid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '区域经理名称',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'amanagername'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '班组',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'teamseq'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售经理id',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'salemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售经理名称',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'salemname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否归属销售组织结构',
   'user', @CurrentUser, 'table', 't_admin', 'column', 'isstruct'
go

/*==============================================================*/
/* Table: t_admin_orggroup                                      */
/*==============================================================*/
create table t_admin_orggroup (
   id                   bigint               identity,
   groupid              bigint               null,
   adminId              bigint               null,
   constraint PK_T_ADMIN_ORGGROUP primary key (id)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户，客户权限组关系表',
   'user', @CurrentUser, 'table', 't_admin_orggroup'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 't_admin_orggroup', 'column', 'id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'groupid',
   'user', @CurrentUser, 'table', 't_admin_orggroup', 'column', 'groupid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'adminId',
   'user', @CurrentUser, 'table', 't_admin_orggroup', 'column', 'adminId'
go

/*==============================================================*/
/* Table: t_admin_province                                      */
/*==============================================================*/
create table t_admin_province (
   apid                 bigint               identity,
   provinceid           bigint               null,
   adminid              bigint               null,
   areaid               bigint               null,
   fbratio              decimal(20,10)       null,
   bzratio              decimal(20,10)       null,
   mfbratio             decimal(20,10)       null,
   mbzratio             decimal(20,10)       null,
   constraint PK_T_ADMIN_PROVINCE primary key (apid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '系统用户省份关联',
   'user', @CurrentUser, 'table', 't_admin_province'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'apid',
   'user', @CurrentUser, 'table', 't_admin_province', 'column', 'apid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'provinceid',
   'user', @CurrentUser, 'table', 't_admin_province', 'column', 'provinceid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售员',
   'user', @CurrentUser, 'table', 't_admin_province', 'column', 'adminid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'areaid',
   'user', @CurrentUser, 'table', 't_admin_province', 'column', 'areaid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '非标比例',
   'user', @CurrentUser, 'table', 't_admin_province', 'column', 'fbratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '标准比例',
   'user', @CurrentUser, 'table', 't_admin_province', 'column', 'bzratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '管理者非标比例',
   'user', @CurrentUser, 'table', 't_admin_province', 'column', 'mfbratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '管理者标准比例',
   'user', @CurrentUser, 'table', 't_admin_province', 'column', 'mbzratio'
go

/*==============================================================*/
/* Table: t_admin_role                                          */
/*==============================================================*/
create table t_admin_role (
   id                   bigint               identity,
   adminId              bigint               null,
   roleId               bigint               null,
   constraint PK_T_ADMIN_ROLE primary key (id)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   't_admin_role',
   'user', @CurrentUser, 'table', 't_admin_role'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 't_admin_role', 'column', 'id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'adminId',
   'user', @CurrentUser, 'table', 't_admin_role', 'column', 'adminId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'roleId',
   'user', @CurrentUser, 'table', 't_admin_role', 'column', 'roleId'
go

/*==============================================================*/
/* Table: t_agents                                              */
/*==============================================================*/
create table t_agents (
   aid                  bigint               identity,
   fyear                nvarchar(10)         null,
   adminid              bigint               null,
   provinceid           bigint               null,
   fagent               bigint               null,
   fbase                decimal(10,4)        null,
   fbonus1              decimal(10,4)        null,
   fbusiness1           decimal(10,4)        null,
   fbonus2              decimal(10,4)        null,
   fbusiness2           decimal(10,4)        null,
   constraint PK_T_AGENTS primary key (aid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '代理商比例设置',
   'user', @CurrentUser, 'table', 't_agents'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'aid',
   'user', @CurrentUser, 'table', 't_agents', 'column', 'aid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '年',
   'user', @CurrentUser, 'table', 't_agents', 'column', 'fyear'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售负责人',
   'user', @CurrentUser, 'table', 't_agents', 'column', 'adminid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '省份',
   'user', @CurrentUser, 'table', 't_agents', 'column', 'provinceid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '代理商',
   'user', @CurrentUser, 'table', 't_agents', 'column', 'fagent'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '折扣基数',
   'user', @CurrentUser, 'table', 't_agents', 'column', 'fbase'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '折扣基数以下奖励比例',
   'user', @CurrentUser, 'table', 't_agents', 'column', 'fbonus1'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '折扣基数以下业务费比例',
   'user', @CurrentUser, 'table', 't_agents', 'column', 'fbusiness1'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '折扣基数以上奖励比例',
   'user', @CurrentUser, 'table', 't_agents', 'column', 'fbonus2'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '折扣基数以上业务费比例',
   'user', @CurrentUser, 'table', 't_agents', 'column', 'fbusiness2'
go

/*==============================================================*/
/* Table: t_approve_msg                                         */
/*==============================================================*/
create table t_approve_msg (
   id                   bigint               identity,
   billType             int                  null,
   billId               bigint               null,
   optType              int                  null,
   approveContent       nvarchar(500)        null,
   approver             nvarchar(30)         null,
   approverTime         datetime             null,
   constraint PK_T_APPROVE_MSG primary key (id)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '单据审批意见表',
   'user', @CurrentUser, 'table', 't_approve_msg'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 't_approve_msg', 'column', 'id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1标准订单2系统订单',
   'user', @CurrentUser, 'table', 't_approve_msg', 'column', 'billType'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '单据ID',
   'user', @CurrentUser, 'table', 't_approve_msg', 'column', 'billId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1审核2驳回',
   'user', @CurrentUser, 'table', 't_approve_msg', 'column', 'optType'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '批复内容',
   'user', @CurrentUser, 'table', 't_approve_msg', 'column', 'approveContent'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '审批人',
   'user', @CurrentUser, 'table', 't_approve_msg', 'column', 'approver'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '审批时间',
   'user', @CurrentUser, 'table', 't_approve_msg', 'column', 'approverTime'
go

/*==============================================================*/
/* Table: t_area                                                */
/*==============================================================*/
create table t_area (
   areaid               bigint               identity,
   areaname             nvarchar(50)         null,
   adminid              bigint               null,
   fitemid              bigint               null,
   fnumber              nvarchar(50)         null,
   constraint PK_T_AREA primary key (areaid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '区域表',
   'user', @CurrentUser, 'table', 't_area'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'areaid',
   'user', @CurrentUser, 'table', 't_area', 'column', 'areaid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '大区名称',
   'user', @CurrentUser, 'table', 't_area', 'column', 'areaname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '区域负责人',
   'user', @CurrentUser, 'table', 't_area', 'column', 'adminid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'erp区域id',
   'user', @CurrentUser, 'table', 't_area', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'erp编号',
   'user', @CurrentUser, 'table', 't_area', 'column', 'fnumber'
go

/*==============================================================*/
/* Table: t_authority                                           */
/*==============================================================*/
create table t_authority (
   authorityId          bigint               identity,
   authorityKey         nvarchar(100)        null,
   authorityName        nvarchar(100)        null,
   url                  nvarchar(255)        null,
   position             bigint               null,
   parentid             bigint               null,
   parentname           nvarchar(100)        null,
   flevel               int                  null,
   fsort                int                  null,
   constraint PK_T_AUTHORITY primary key (authorityId)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   't_authority',
   'user', @CurrentUser, 'table', 't_authority'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'authorityId',
   'user', @CurrentUser, 'table', 't_authority', 'column', 'authorityId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'authorityKey',
   'user', @CurrentUser, 'table', 't_authority', 'column', 'authorityKey'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'authorityName',
   'user', @CurrentUser, 'table', 't_authority', 'column', 'authorityName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'url',
   'user', @CurrentUser, 'table', 't_authority', 'column', 'url'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'position',
   'user', @CurrentUser, 'table', 't_authority', 'column', 'position'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'parentid',
   'user', @CurrentUser, 'table', 't_authority', 'column', 'parentid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'parentname',
   'user', @CurrentUser, 'table', 't_authority', 'column', 'parentname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '层级',
   'user', @CurrentUser, 'table', 't_authority', 'column', 'flevel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fsort',
   'user', @CurrentUser, 'table', 't_authority', 'column', 'fsort'
go

/*==============================================================*/
/* Table: t_base_icitementrance                                 */
/*==============================================================*/
create table t_base_icitementrance (
   fitemid              bigint               not null,
   fnameen              nvarchar(255)        null,
   fmodelen             nvarchar(255)        null,
   fhsnumber            integer              null,
   ffirstunit           nvarchar(255)        null,
   fsecondunit          nvarchar(255)        null,
   ffirstunitrate       decimal(20,10)       null,
   fsecondunitrate      decimal(20,10)       null,
   fismanage            bit                  null,
   fpacktype            integer              null,
   flendecimal          integer              null,
   fcubagedecimal       integer              null,
   fweightdecimal       integer              null,
   fimposttaxrate       decimal(20,10)       null,
   fconsumetaxrate      decimal(20,10)       null,
   fmanagetype          integer              null,
   fexportrate          decimal(20,10)       null,
   constraint PK_T_BASE_ICITEMENTRANCE primary key (fitemid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料进出口信息表',
   'user', @CurrentUser, 'table', 't_base_icitementrance'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fitemid',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fnameen',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'fnameen'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fmodelen',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'fmodelen'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fhsnumber',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'fhsnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ffirstunit',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'ffirstunit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fsecondunit',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'fsecondunit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ffirstunitrate',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'ffirstunitrate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fsecondunitrate',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'fsecondunitrate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fismanage',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'fismanage'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fpacktype',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'fpacktype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'flendecimal',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'flendecimal'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcubagedecimal',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'fcubagedecimal'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fweightdecimal',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'fweightdecimal'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fimposttaxrate',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'fimposttaxrate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fconsumetaxrate',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'fconsumetaxrate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fmanagetype',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'fmanagetype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fexportrate',
   'user', @CurrentUser, 'table', 't_base_icitementrance', 'column', 'fexportrate'
go

/*==============================================================*/
/* Table: t_bitem                                               */
/*==============================================================*/
create table t_bitem (
   fitemid              bigint               not null,
   fitemclassid         bigint               null,
   fnumber              nvarchar(50)         null,
   fname                nvarchar(80)         null,
   funused              integer              null,
   ffullnumber          nvarchar(50)         null,
   fdeleted             integer              null,
   fshortnumber         nvarchar(80)         null,
   ffullname            nvarchar(80)         null,
   flevel               integer              null,
   fdetail              integer              null,
   fparentid            bigint               null,
   seq                  integer              null,
   constraint PK_T_BITEM primary key (fitemid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   't_bitem',
   'user', @CurrentUser, 'table', 't_bitem'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fitemid',
   'user', @CurrentUser, 'table', 't_bitem', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fitemclassid',
   'user', @CurrentUser, 'table', 't_bitem', 'column', 'fitemclassid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '编码',
   'user', @CurrentUser, 'table', 't_bitem', 'column', 'fnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '名称',
   'user', @CurrentUser, 'table', 't_bitem', 'column', 'fname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否使用',
   'user', @CurrentUser, 'table', 't_bitem', 'column', 'funused'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料长编码',
   'user', @CurrentUser, 'table', 't_bitem', 'column', 'ffullnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除',
   'user', @CurrentUser, 'table', 't_bitem', 'column', 'fdeleted'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料短编码',
   'user', @CurrentUser, 'table', 't_bitem', 'column', 'fshortnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料全名',
   'user', @CurrentUser, 'table', 't_bitem', 'column', 'ffullname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '级别',
   'user', @CurrentUser, 'table', 't_bitem', 'column', 'flevel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否明细',
   'user', @CurrentUser, 'table', 't_bitem', 'column', 'fdetail'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fparentid',
   'user', @CurrentUser, 'table', 't_bitem', 'column', 'fparentid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '序号',
   'user', @CurrentUser, 'table', 't_bitem', 'column', 'seq'
go

/*==============================================================*/
/* Table: t_bloc                                                */
/*==============================================================*/
create table t_bloc (
   blocid               bigint               identity,
   blocname             nvarchar(50)         null,
   constraint PK_T_BLOC primary key (blocid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '集团表',
   'user', @CurrentUser, 'table', 't_bloc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'blocid',
   'user', @CurrentUser, 'table', 't_bloc', 'column', 'blocid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'blocname',
   'user', @CurrentUser, 'table', 't_bloc', 'column', 'blocname'
go

/*==============================================================*/
/* Table: t_cdepartment                                         */
/*==============================================================*/
create table t_cdepartment (
   departid             bigint               identity,
   finnerid             bigint               null,
   departname           nvarchar(100)        null,
   constraint PK_T_CDEPARTMENT primary key (departid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '客户部门表',
   'user', @CurrentUser, 'table', 't_cdepartment'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'departid',
   'user', @CurrentUser, 'table', 't_cdepartment', 'column', 'departid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'finnerid',
   'user', @CurrentUser, 'table', 't_cdepartment', 'column', 'finnerid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '部门名称',
   'user', @CurrentUser, 'table', 't_cdepartment', 'column', 'departname'
go

/*==============================================================*/
/* Table: t_checkorder                                          */
/*==============================================================*/
create table t_checkorder (
   checkid              bigint               identity,
   pdtype               nvarchar(10)         null,
   foperator            nvarchar(10)         null,
   fmount               decimal(20,10)       null,
   duty1                nvarchar(50)         null,
   duty2                bigint               null,
   duty3                bigint               null,
   notes                nvarchar(200)        null,
   createdate           datetime             null,
   adminid              bigint               null,
   constraint PK_T_CHECKORDER primary key (checkid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售订单审核流程',
   'user', @CurrentUser, 'table', 't_checkorder'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '审核id',
   'user', @CurrentUser, 'table', 't_checkorder', 'column', 'checkid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '产品类别',
   'user', @CurrentUser, 'table', 't_checkorder', 'column', 'pdtype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '运算符号',
   'user', @CurrentUser, 'table', 't_checkorder', 'column', 'foperator'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同额',
   'user', @CurrentUser, 'table', 't_checkorder', 'column', 'fmount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '一级审核人职务为两个，与的关系',
   'user', @CurrentUser, 'table', 't_checkorder', 'column', 'duty1'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '二级审核人职务一',
   'user', @CurrentUser, 'table', 't_checkorder', 'column', 'duty2'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '二级审批人职务二',
   'user', @CurrentUser, 'table', 't_checkorder', 'column', 'duty3'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 't_checkorder', 'column', 'notes'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 't_checkorder', 'column', 'createdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', @CurrentUser, 'table', 't_checkorder', 'column', 'adminid'
go

/*==============================================================*/
/* Table: t_collectpay                                          */
/*==============================================================*/
create table dbo.t_collectpay (
   collectPayId         bigint               identity,
   orderCode            nvarchar(50)         not null,
   planCollectTime      date                 null,
   shouldCollectTime    date                 null,
   shouldCollectFee     decimal(20, 10)      null,
   shouldCollectFeeRm   decimal(20, 10)      null,
   collectPayVersion    varchar(6)           null,
   collectPayType       varchar(50)          null,
   guaranteeLetterType  varchar(50)          null,
   guaranteeLetterStart date                 null,
   guaranteeLetterEnd   date                 null,
   payFee               numeric(18,6)        null,
   payFeeRM             numeric(18,6)        null,
   constraint PK_T_COLLECTPAY primary key (collectPayId)
         on "PRIMARY"
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   't_collectpay',
   'user', 'dbo', 'table', 't_collectpay'
go

execute sp_addextendedproperty 'MS_Description', 
   'collectPayId',
   'user', 'dbo', 'table', 't_collectpay', 'column', 'collectPayId'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单编号',
   'user', 'dbo', 'table', 't_collectpay', 'column', 'orderCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '计划收款时间',
   'user', 'dbo', 'table', 't_collectpay', 'column', 'planCollectTime'
go

execute sp_addextendedproperty 'MS_Description', 
   '应收款时间',
   'user', 'dbo', 'table', 't_collectpay', 'column', 'shouldCollectTime'
go

execute sp_addextendedproperty 'MS_Description', 
   '应收款金额',
   'user', 'dbo', 'table', 't_collectpay', 'column', 'shouldCollectFee'
go

execute sp_addextendedproperty 'MS_Description', 
   '应收款金额(本位币)',
   'user', 'dbo', 'table', 't_collectpay', 'column', 'shouldCollectFeeRm'
go

execute sp_addextendedproperty 'MS_Description', 
   '版本号',
   'user', 'dbo', 'table', 't_collectpay', 'column', 'collectPayVersion'
go

execute sp_addextendedproperty 'MS_Description', 
   '收款方式',
   'user', 'dbo', 'table', 't_collectpay', 'column', 'collectPayType'
go

execute sp_addextendedproperty 'MS_Description', 
   '保函种类',
   'user', 'dbo', 'table', 't_collectpay', 'column', 'guaranteeLetterType'
go

execute sp_addextendedproperty 'MS_Description', 
   '保函起始时间',
   'user', 'dbo', 'table', 't_collectpay', 'column', 'guaranteeLetterStart'
go

execute sp_addextendedproperty 'MS_Description', 
   '保函结束时间',
   'user', 'dbo', 'table', 't_collectpay', 'column', 'guaranteeLetterEnd'
go

execute sp_addextendedproperty 'MS_Description', 
   '正常收款总额(原币)',
   'user', 'dbo', 'table', 't_collectpay', 'column', 'payFee'
go

execute sp_addextendedproperty 'MS_Description', 
   '正常收款总额(本位币)',
   'user', 'dbo', 'table', 't_collectpay', 'column', 'payFeeRM'
go

/*==============================================================*/
/* Table: t_collectpay_history                                  */
/*==============================================================*/
create table dbo.t_collectpay_history (
   collectPayId         bigint               identity,
   orderCode            nvarchar(50)         not null,
   planCollectTime      date                 null,
   shouldCollectTime    date                 null,
   shouldCollectFee     decimal(20, 10)      null,
   shouldCollectFeeRm   decimal(20, 10)      null,
   collectPayVersion    varchar(6)           null,
   collectPayType       varchar(50)          null,
   guaranteeLetterType  varchar(50)          null,
   guaranteeLetterStart date                 null,
   guaranteeLetterEnd   date                 null,
   payFee               numeric(18,6)        null,
   payFeeRM             numeric(18,6)        null,
   constraint PK_T_COLLECTPAY_HISTORY primary key (collectPayId)
         on "PRIMARY"
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   't_collectpay_history',
   'user', 'dbo', 'table', 't_collectpay_history'
go

execute sp_addextendedproperty 'MS_Description', 
   'collectPayId',
   'user', 'dbo', 'table', 't_collectpay_history', 'column', 'collectPayId'
go

execute sp_addextendedproperty 'MS_Description', 
   'orderCode',
   'user', 'dbo', 'table', 't_collectpay_history', 'column', 'orderCode'
go

execute sp_addextendedproperty 'MS_Description', 
   'planCollectTime',
   'user', 'dbo', 'table', 't_collectpay_history', 'column', 'planCollectTime'
go

execute sp_addextendedproperty 'MS_Description', 
   'shouldCollectTime',
   'user', 'dbo', 'table', 't_collectpay_history', 'column', 'shouldCollectTime'
go

execute sp_addextendedproperty 'MS_Description', 
   'shouldCollectFee',
   'user', 'dbo', 'table', 't_collectpay_history', 'column', 'shouldCollectFee'
go

execute sp_addextendedproperty 'MS_Description', 
   'shouldCollectFeeRm',
   'user', 'dbo', 'table', 't_collectpay_history', 'column', 'shouldCollectFeeRm'
go

execute sp_addextendedproperty 'MS_Description', 
   'collectPayVersion',
   'user', 'dbo', 'table', 't_collectpay_history', 'column', 'collectPayVersion'
go

execute sp_addextendedproperty 'MS_Description', 
   'collectPayType',
   'user', 'dbo', 'table', 't_collectpay_history', 'column', 'collectPayType'
go

execute sp_addextendedproperty 'MS_Description', 
   'guaranteeLetterType',
   'user', 'dbo', 'table', 't_collectpay_history', 'column', 'guaranteeLetterType'
go

execute sp_addextendedproperty 'MS_Description', 
   'guaranteeLetterStart',
   'user', 'dbo', 'table', 't_collectpay_history', 'column', 'guaranteeLetterStart'
go

execute sp_addextendedproperty 'MS_Description', 
   'guaranteeLetterEnd',
   'user', 'dbo', 'table', 't_collectpay_history', 'column', 'guaranteeLetterEnd'
go

execute sp_addextendedproperty 'MS_Description', 
   'payFee',
   'user', 'dbo', 'table', 't_collectpay_history', 'column', 'payFee'
go

execute sp_addextendedproperty 'MS_Description', 
   'payFeeRM',
   'user', 'dbo', 'table', 't_collectpay_history', 'column', 'payFeeRM'
go

/*==============================================================*/
/* Table: t_competitor                                          */
/*==============================================================*/
create table t_competitor (
   competitorid         bigint               identity,
   fname                nvarchar(50)         null,
   shortname            nvarchar(50)         null,
   constraint PK_T_COMPETITOR primary key (competitorid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '竞争对手',
   'user', @CurrentUser, 'table', 't_competitor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'competitorid',
   'user', @CurrentUser, 'table', 't_competitor', 'column', 'competitorid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '对手名称',
   'user', @CurrentUser, 'table', 't_competitor', 'column', 'fname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '简称',
   'user', @CurrentUser, 'table', 't_competitor', 'column', 'shortname'
go

/*==============================================================*/
/* Table: t_contractchange                                      */
/*==============================================================*/
create table dbo.t_contractchange (
   contractChangeId     bigint               identity,
   orderCode            varchar(50)          not null,
   contractCode         varchar(50)          not null,
   contractName         varchar(50)          null,
   blongFile            varchar(200)         null,
   contractUser         varchar(50)          null,
   contractUserId       bigint               null,
   contractChangeTime   date                 null,
   orderGoodsCompany    varchar(50)          null,
   changeContent        varchar(1000)        null,
   changeReason         varchar(500)         null,
   customAdvice         varchar(500)         null,
   marketManagerAdvice  varchar(500)         null,
   marketManagerName    varchar(50)          null,
   marketManagerId      bigint               null,
   examineTime          date                 null,
   contractChangeStatus int                  null,
   examineAdvice        varchar(500)         null
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   '合同变更单',
   'user', 'dbo', 'table', 't_contractchange'
go

execute sp_addextendedproperty 'MS_Description', 
   'contractChangeId',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'contractChangeId'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单编码',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'orderCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同编号',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'contractCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同名称',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'contractName'
go

execute sp_addextendedproperty 'MS_Description', 
   '所附资料',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'blongFile'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同负责人',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'contractUser'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同负责人Id',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'contractUserId'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同变更单制单日期',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'contractChangeTime'
go

execute sp_addextendedproperty 'MS_Description', 
   '订货方',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'orderGoodsCompany'
go

execute sp_addextendedproperty 'MS_Description', 
   '变更内容',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'changeContent'
go

execute sp_addextendedproperty 'MS_Description', 
   '变更原因',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'changeReason'
go

execute sp_addextendedproperty 'MS_Description', 
   '客户意见',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'customAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售部主观意见',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'marketManagerAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售部主管名',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'marketManagerName'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售部主管ID',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'marketManagerId'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售部主管审核时间',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'examineTime'
go

execute sp_addextendedproperty 'MS_Description', 
   '变更单状态',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'contractChangeStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   '审核意见',
   'user', 'dbo', 'table', 't_contractchange', 'column', 'examineAdvice'
go

/*==============================================================*/
/* Table: t_creviewexinfo                                       */
/*==============================================================*/
create table dbo.t_creviewexinfo (
   examineInfoId        bigint               not null,
   orderCode            varchar(20)          null,
   userName             varchar(50)          null,
   userId               bigint               null,
   department           varchar(50)          null,
   departmentId         bigint               null,
   roleName             varchar(20)          null,
   examineAdvice        varchar(500)         null,
   examineStatus        varchar(1)           null,
   examineTime          datetime             null,
   contractReviewId     bigint               null,
   constraint PK_T_CREVIEWEXINFO primary key (examineInfoId)
)
go

execute sp_addextendedproperty 'MS_Description', 
   '合同评审审核信息列表',
   'user', 'dbo', 'table', 't_creviewexinfo'
go

execute sp_addextendedproperty 'MS_Description', 
   '唯一标识ID',
   'user', 'dbo', 'table', 't_creviewexinfo', 'column', 'examineInfoId'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单编号',
   'user', 'dbo', 'table', 't_creviewexinfo', 'column', 'orderCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '指定审核人',
   'user', 'dbo', 'table', 't_creviewexinfo', 'column', 'userName'
go

execute sp_addextendedproperty 'MS_Description', 
   '指定审核人ID',
   'user', 'dbo', 'table', 't_creviewexinfo', 'column', 'userId'
go

execute sp_addextendedproperty 'MS_Description', 
   '所属部门',
   'user', 'dbo', 'table', 't_creviewexinfo', 'column', 'department'
go

execute sp_addextendedproperty 'MS_Description', 
   '所属部门ID',
   'user', 'dbo', 'table', 't_creviewexinfo', 'column', 'departmentId'
go

execute sp_addextendedproperty 'MS_Description', 
   '角色名称',
   'user', 'dbo', 'table', 't_creviewexinfo', 'column', 'roleName'
go

execute sp_addextendedproperty 'MS_Description', 
   '审核意见',
   'user', 'dbo', 'table', 't_creviewexinfo', 'column', 'examineAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '审核状态',
   'user', 'dbo', 'table', 't_creviewexinfo', 'column', 'examineStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   '审核时间',
   'user', 'dbo', 'table', 't_creviewexinfo', 'column', 'examineTime'
go

execute sp_addextendedproperty 'MS_Description', 
   '评审单ID',
   'user', 'dbo', 'table', 't_creviewexinfo', 'column', 'contractReviewId'
go

/*==============================================================*/
/* Table: t_crm_contact                                         */
/*==============================================================*/
create table t_crm_contact (
   contactid            bigint               identity,
   finnerid             bigint               null,
   departid             bigint               null,
   contactname          nvarchar(50)         null,
   telphone             nvarchar(50)         null,
   mobile               nvarchar(50)         null,
   email                nvarchar(100)        null,
   constraint PK_T_CRM_CONTACT primary key (contactid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '客户联系人表',
   'user', @CurrentUser, 'table', 't_crm_contact'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'contactid',
   'user', @CurrentUser, 'table', 't_crm_contact', 'column', 'contactid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'finnerid',
   'user', @CurrentUser, 'table', 't_crm_contact', 'column', 'finnerid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'departid',
   'user', @CurrentUser, 'table', 't_crm_contact', 'column', 'departid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'contactname',
   'user', @CurrentUser, 'table', 't_crm_contact', 'column', 'contactname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '电话',
   'user', @CurrentUser, 'table', 't_crm_contact', 'column', 'telphone'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '手机',
   'user', @CurrentUser, 'table', 't_crm_contact', 'column', 'mobile'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'email',
   'user', @CurrentUser, 'table', 't_crm_contact', 'column', 'email'
go

/*==============================================================*/
/* Table: t_customer_score                                      */
/*==============================================================*/
create table t_customer_score (
   yscoreid             bigint               identity,
   areaid               bigint               null,
   provinceid           bigint               null,
   blocid               bigint               null,
   finnerid             bigint               null,
   customername         nvarchar(100)        null,
   gwid1                bigint               null default 1,
   contacts             integer              null,
   contactlimit         integer              null,
   gwid2                bigint               null default 2,
   gwid3                bigint               null default 3,
   gwid4                bigint               null default 4,
   gwid5                bigint               null default 5,
   payterms             text                 null,
   gwid6                bigint               null default 6,
   gwid7                integer              null default 7,
   amount               decimal(20,10)       null,
   gwid8                bigint               null default 8,
   stanamount           decimal(20,10)       null,
   gwid9                bigint               null default 9,
   saleval              decimal(20,10)       null,
   gwid10               bigint               null default 10,
   retamount            decimal(20,10)       null,
   gwid11               bigint               null default 11,
   lurkamount           decimal(20,10)       null,
   gwid12               bigint               null default 12,
   notes                text                 null,
   average              decimal(10,2)        null,
   flevel               nvarchar(50)         null,
   fyear                nvarchar(50)         null,
   closestatus          int                  null,
   constraint PK_T_CUSTOMER_SCORE primary key (yscoreid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '客户评分总表',
   'user', @CurrentUser, 'table', 't_customer_score'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'yscoreid',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'yscoreid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'areaid',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'areaid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'provinceid',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'provinceid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'blocid',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'blocid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'finnerid',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'finnerid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'customername',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'customername'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '集团评分',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'gwid1'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '联系人数量',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'contacts'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '联系人上限',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'contactlimit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '信任度',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'gwid2'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL品牌认可度',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'gwid3'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '特瑞斯认可',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'gwid4'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '价格评标方法',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'gwid5'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同付款条件',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'payterms'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同付款条件评分',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'gwid6'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:一般，2:良好,3:较差',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'gwid7'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同金额',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'amount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同金额评分',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'gwid8'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '标准产品合同额',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'stanamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '标准产品合同额评分',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'gwid9'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售额',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'saleval'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售额评分',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'gwid10'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '回款额',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'retamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '回款额评分',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'gwid11'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '潜在合同额',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'lurkamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '潜在合同额评分',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'gwid12'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '其它',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'notes'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '综合得分',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'average'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '评级',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'flevel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '年',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'fyear'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '关闭状态',
   'user', @CurrentUser, 'table', 't_customer_score', 'column', 'closestatus'
go

/*==============================================================*/
/* Table: t_department                                          */
/*==============================================================*/
create table t_department (
   teamid               bigint               identity,
   adminId              bigint               null,
   teamname             nvarchar(50)         null,
   teamsuperior         bigint               null,
   superiorname         nvarchar(50)         null,
   teamlevel            int                  null,
   teamorder            int                  null,
   fitemid              bigint               null,
   fnumber              nvarchar(50)         null,
   fname                nvarchar(50)         null,
   iserp                int                  null,
   constraint PK_T_DEPARTMENT primary key (teamid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '部门',
   'user', @CurrentUser, 'table', 't_department'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'teamid',
   'user', @CurrentUser, 'table', 't_department', 'column', 'teamid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'adminId',
   'user', @CurrentUser, 'table', 't_department', 'column', 'adminId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'teamname',
   'user', @CurrentUser, 'table', 't_department', 'column', 'teamname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级部门',
   'user', @CurrentUser, 'table', 't_department', 'column', 'teamsuperior'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级部门名称',
   'user', @CurrentUser, 'table', 't_department', 'column', 'superiorname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '部门级别',
   'user', @CurrentUser, 'table', 't_department', 'column', 'teamlevel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'teamorder',
   'user', @CurrentUser, 'table', 't_department', 'column', 'teamorder'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'erpid',
   'user', @CurrentUser, 'table', 't_department', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'erp编号',
   'user', @CurrentUser, 'table', 't_department', 'column', 'fnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'erp名称',
   'user', @CurrentUser, 'table', 't_department', 'column', 'fname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0:否，1：是',
   'user', @CurrentUser, 'table', 't_department', 'column', 'iserp'
go

/*==============================================================*/
/* Table: t_duty                                                */
/*==============================================================*/
create table t_duty (
   dutyid               bigint               identity,
   dutyname             nvarchar(50)         null,
   dutylevel            int                  null,
   parentid             bigint               null,
   parentname           nvarchar(50)         null,
   dutydescription      nvarchar(200)        null,
   teamid               bigint               null,
   dutydept             bigint               null,
   dutyorder            integer              null,
   dutykey              nvarchar(200)        null,
   constraint PK_T_DUTY primary key (dutyid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '职务表',
   'user', @CurrentUser, 'table', 't_duty'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'dutyid',
   'user', @CurrentUser, 'table', 't_duty', 'column', 'dutyid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '名称',
   'user', @CurrentUser, 'table', 't_duty', 'column', 'dutyname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '职等',
   'user', @CurrentUser, 'table', 't_duty', 'column', 'dutylevel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级职务',
   'user', @CurrentUser, 'table', 't_duty', 'column', 'parentid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级职务名称',
   'user', @CurrentUser, 'table', 't_duty', 'column', 'parentname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '说明',
   'user', @CurrentUser, 'table', 't_duty', 'column', 'dutydescription'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '部门班组',
   'user', @CurrentUser, 'table', 't_duty', 'column', 'teamid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '职务部门',
   'user', @CurrentUser, 'table', 't_duty', 'column', 'dutydept'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'dutyorder',
   'user', @CurrentUser, 'table', 't_duty', 'column', 'dutyorder'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '职务对应的KEY',
   'user', @CurrentUser, 'table', 't_duty', 'column', 'dutykey'
go

/*==============================================================*/
/* Table: t_duty_organ                                          */
/*==============================================================*/
create table t_duty_organ (
   id                   bigint               identity,
   dutyid               bigint               null,
   finnerid             bigint               null,
   constraint PK_T_DUTY_ORGAN primary key (id)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '职务客户关系',
   'user', @CurrentUser, 'table', 't_duty_organ'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 't_duty_organ', 'column', 'id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'dutyid',
   'user', @CurrentUser, 'table', 't_duty_organ', 'column', 'dutyid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'finnerid',
   'user', @CurrentUser, 'table', 't_duty_organ', 'column', 'finnerid'
go

/*==============================================================*/
/* Table: t_employee                                            */
/*==============================================================*/
create table t_employee (
   employeeid           bigint               identity,
   teamseq              bigint               null,
   dutyid               bigint               null,
   teamid               bigint               null,
   employeename         nvarchar(50)         null,
   femail               nvarchar(100)        null,
   empphoto             nvarchar(200)        null,
   superior             bigint               null,
   fmanager             bigint               null,
   flevels              integer              null,
   constraint PK_T_EMPLOYEE primary key (employeeid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '职员表',
   'user', @CurrentUser, 'table', 't_employee'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'employeeid',
   'user', @CurrentUser, 'table', 't_employee', 'column', 'employeeid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '班组id',
   'user', @CurrentUser, 'table', 't_employee', 'column', 'teamseq'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'dutyid',
   'user', @CurrentUser, 'table', 't_employee', 'column', 'dutyid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'teamid',
   'user', @CurrentUser, 'table', 't_employee', 'column', 'teamid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'employeename',
   'user', @CurrentUser, 'table', 't_employee', 'column', 'employeename'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'femail',
   'user', @CurrentUser, 'table', 't_employee', 'column', 'femail'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'empphoto',
   'user', @CurrentUser, 'table', 't_employee', 'column', 'empphoto'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级',
   'user', @CurrentUser, 'table', 't_employee', 'column', 'superior'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '区域经理',
   'user', @CurrentUser, 'table', 't_employee', 'column', 'fmanager'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '级别',
   'user', @CurrentUser, 'table', 't_employee', 'column', 'flevels'
go

/*==============================================================*/
/* Table: t_enduser                                             */
/*==============================================================*/
create table t_enduser (
   enduserid            bigint               not null,
   areaid               bigint               null,
   departid             bigint               null,
   provinceid           bigint               null,
   fname                nvarchar(255)        null,
   condition            nvarchar(255)        null,
   constraint PK_T_ENDUSER primary key (enduserid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最终用户表',
   'user', @CurrentUser, 'table', 't_enduser'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'enduserid',
   'user', @CurrentUser, 'table', 't_enduser', 'column', 'enduserid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'areaid',
   'user', @CurrentUser, 'table', 't_enduser', 'column', 'areaid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'departid',
   'user', @CurrentUser, 'table', 't_enduser', 'column', 'departid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'provinceid',
   'user', @CurrentUser, 'table', 't_enduser', 'column', 'provinceid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fname',
   'user', @CurrentUser, 'table', 't_enduser', 'column', 'fname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同条件',
   'user', @CurrentUser, 'table', 't_enduser', 'column', 'condition'
go

/*==============================================================*/
/* Table: t_eu                                                  */
/*==============================================================*/
create table t_eu (
   euid                 bigint               identity,
   fitemid              bigint               null,
   enduser              nvarchar(255)        null,
   constraint PK_T_EU primary key (euid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最终用户表关系表',
   'user', @CurrentUser, 'table', 't_eu'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'euid',
   'user', @CurrentUser, 'table', 't_eu', 'column', 'euid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '客户id',
   'user', @CurrentUser, 'table', 't_eu', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最终用户名称',
   'user', @CurrentUser, 'table', 't_eu', 'column', 'enduser'
go

/*==============================================================*/
/* Table: t_exchangerateentry                                   */
/*==============================================================*/
create table t_exchangerateentry (
   fentryid             int                  not null,
   fid                  int                  identity,
   findex               int                  null,
   fname                nvarchar(200)        null,
   fnumber              nvarchar(200)        null,
   fclasstypeid         int                  null,
   fconversion          int                  null,
   fcyfor               int                  null,
   fcyto                int                  null,
   fbegdate             datetime             null,
   fenddate             datetime             null,
   fexchangerate        decimal(20,10)       null,
   fexchangeratetype    int                  null,
   fchkdate             datetime             null,
   fchkuserid           int                  null,
   freverseexrate       decimal(20,10)       null,
   constraint PK_T_EXCHANGERATEENTRY primary key (fentryid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '汇率表',
   'user', @CurrentUser, 'table', 't_exchangerateentry'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fentryid',
   'user', @CurrentUser, 'table', 't_exchangerateentry', 'column', 'fentryid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '内码',
   'user', @CurrentUser, 'table', 't_exchangerateentry', 'column', 'fid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'findex',
   'user', @CurrentUser, 'table', 't_exchangerateentry', 'column', 'findex'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '名称',
   'user', @CurrentUser, 'table', 't_exchangerateentry', 'column', 'fname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '代码',
   'user', @CurrentUser, 'table', 't_exchangerateentry', 'column', 'fnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fclasstypeid',
   'user', @CurrentUser, 'table', 't_exchangerateentry', 'column', 'fclasstypeid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fconversion',
   'user', @CurrentUser, 'table', 't_exchangerateentry', 'column', 'fconversion'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcyfor',
   'user', @CurrentUser, 'table', 't_exchangerateentry', 'column', 'fcyfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '币别内码',
   'user', @CurrentUser, 'table', 't_exchangerateentry', 'column', 'fcyto'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '生效日期',
   'user', @CurrentUser, 'table', 't_exchangerateentry', 'column', 'fbegdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '失效日期',
   'user', @CurrentUser, 'table', 't_exchangerateentry', 'column', 'fenddate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '汇率',
   'user', @CurrentUser, 'table', 't_exchangerateentry', 'column', 'fexchangerate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '汇率类型',
   'user', @CurrentUser, 'table', 't_exchangerateentry', 'column', 'fexchangeratetype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '审核日期',
   'user', @CurrentUser, 'table', 't_exchangerateentry', 'column', 'fchkdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '审核人',
   'user', @CurrentUser, 'table', 't_exchangerateentry', 'column', 'fchkuserid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'freverseexrate',
   'user', @CurrentUser, 'table', 't_exchangerateentry', 'column', 'freverseexrate'
go

/*==============================================================*/
/* Table: t_fielddescription                                    */
/*==============================================================*/
create table t_fielddescription (
   fieldid              bigint               identity,
   ftableid             bigint               null,
   ffieldname           nvarchar(50)         null,
   ffieldnote           nvarchar(200)        null,
   fdescription         nvarchar(200)        null,
   ffieldtype           nvarchar(50)         null,
   ftablename           nvarchar(50)         null,
   fmustinput           int                  null,
   ffilter              int                  null,
   fseqno               int                  null,
   constraint PK_T_FIELDDESCRIPTION primary key (fieldid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字段描述表',
   'user', @CurrentUser, 'table', 't_fielddescription'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fieldid',
   'user', @CurrentUser, 'table', 't_fielddescription', 'column', 'fieldid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '表id',
   'user', @CurrentUser, 'table', 't_fielddescription', 'column', 'ftableid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字段名',
   'user', @CurrentUser, 'table', 't_fielddescription', 'column', 'ffieldname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字段描述',
   'user', @CurrentUser, 'table', 't_fielddescription', 'column', 'ffieldnote'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 't_fielddescription', 'column', 'fdescription'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字段类型',
   'user', @CurrentUser, 'table', 't_fielddescription', 'column', 'ffieldtype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '表名',
   'user', @CurrentUser, 'table', 't_fielddescription', 'column', 'ftablename'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0:否，1：是',
   'user', @CurrentUser, 'table', 't_fielddescription', 'column', 'fmustinput'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0：否，1：是',
   'user', @CurrentUser, 'table', 't_fielddescription', 'column', 'ffilter'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '顺序号',
   'user', @CurrentUser, 'table', 't_fielddescription', 'column', 'fseqno'
go

/*==============================================================*/
/* Table: t_forderinstock                                       */
/*==============================================================*/
create table t_forderinstock (
   fentryid             bigint               identity,
   receivableid         bigint               null,
   forderno             nvarchar(50)         null,
   fdate                nvarchar(20)         null,
   fnum                 decimal(20)          null,
   constraint PK_T_FORDERINSTOCK primary key (fentryid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单产品入库表',
   'user', @CurrentUser, 'table', 't_forderinstock'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fentryid',
   'user', @CurrentUser, 'table', 't_forderinstock', 'column', 'fentryid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'receivableid',
   'user', @CurrentUser, 'table', 't_forderinstock', 'column', 'receivableid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单号',
   'user', @CurrentUser, 'table', 't_forderinstock', 'column', 'forderno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '入库年月',
   'user', @CurrentUser, 'table', 't_forderinstock', 'column', 'fdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '入库数量',
   'user', @CurrentUser, 'table', 't_forderinstock', 'column', 'fnum'
go

/*==============================================================*/
/* Table: t_forderinvoice                                       */
/*==============================================================*/
create table t_forderinvoice (
   invoiceid            bigint               identity,
   receivableid         bigint               null,
   fdate                nvarchar(20)         null,
   famount              decimal(20,4)        null,
   finvoiceno           nvarchar(100)        null,
   forderno             nvarchar(50)         null,
   constraint PK_T_FORDERINVOICE primary key (invoiceid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单产品开票',
   'user', @CurrentUser, 'table', 't_forderinvoice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'invoiceid',
   'user', @CurrentUser, 'table', 't_forderinvoice', 'column', 'invoiceid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'receivableid',
   'user', @CurrentUser, 'table', 't_forderinvoice', 'column', 'receivableid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '开票时间',
   'user', @CurrentUser, 'table', 't_forderinvoice', 'column', 'fdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '开票金额',
   'user', @CurrentUser, 'table', 't_forderinvoice', 'column', 'famount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '发票号',
   'user', @CurrentUser, 'table', 't_forderinvoice', 'column', 'finvoiceno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单号',
   'user', @CurrentUser, 'table', 't_forderinvoice', 'column', 'forderno'
go

/*==============================================================*/
/* Table: t_forderrefund                                        */
/*==============================================================*/
create table t_forderrefund (
   refundid             bigint               identity,
   receivableid         bigint               null,
   fdate                nvarchar(20)         null,
   famount              decimal(20,4)        null,
   forderno             nvarchar(50)         null,
   constraint PK_T_FORDERREFUND primary key (refundid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单产品回款',
   'user', @CurrentUser, 'table', 't_forderrefund'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'refundid',
   'user', @CurrentUser, 'table', 't_forderrefund', 'column', 'refundid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'receivableid',
   'user', @CurrentUser, 'table', 't_forderrefund', 'column', 'receivableid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '回款时间',
   'user', @CurrentUser, 'table', 't_forderrefund', 'column', 'fdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '回款金额',
   'user', @CurrentUser, 'table', 't_forderrefund', 'column', 'famount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单号',
   'user', @CurrentUser, 'table', 't_forderrefund', 'column', 'forderno'
go

/*==============================================================*/
/* Table: t_fordersend                                          */
/*==============================================================*/
create table t_fordersend (
   sendid               bigint               identity,
   receivableid         bigint               null,
   forderno             nvarchar(50)         null,
   fdate                nvarchar(20)         null,
   fnum                 decimal(20)          null,
   famount              decimal(20,4)        null,
   constraint PK_T_FORDERSEND primary key (sendid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单产品发货',
   'user', @CurrentUser, 'table', 't_fordersend'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'sendid',
   'user', @CurrentUser, 'table', 't_fordersend', 'column', 'sendid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'receivableid',
   'user', @CurrentUser, 'table', 't_fordersend', 'column', 'receivableid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单号',
   'user', @CurrentUser, 'table', 't_fordersend', 'column', 'forderno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '发货年月',
   'user', @CurrentUser, 'table', 't_fordersend', 'column', 'fdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '发货数量',
   'user', @CurrentUser, 'table', 't_fordersend', 'column', 'fnum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '发货金额',
   'user', @CurrentUser, 'table', 't_fordersend', 'column', 'famount'
go

/*==============================================================*/
/* Table: t_grade_wight                                         */
/*==============================================================*/
create table t_grade_wight (
   gwid                 bigint               not null,
   gradeitem            nvarchar(50)         null,
   weight               decimal(10,2)        null,
   notes                nvarchar(255)        null,
   constraint PK_T_GRADE_WIGHT primary key (gwid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '评分权重表',
   'user', @CurrentUser, 'table', 't_grade_wight'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'gwid',
   'user', @CurrentUser, 'table', 't_grade_wight', 'column', 'gwid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '评分(额度)项',
   'user', @CurrentUser, 'table', 't_grade_wight', 'column', 'gradeitem'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '权重',
   'user', @CurrentUser, 'table', 't_grade_wight', 'column', 'weight'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '评分条件',
   'user', @CurrentUser, 'table', 't_grade_wight', 'column', 'notes'
go

/*==============================================================*/
/* Table: t_grades                                              */
/*==============================================================*/
create table t_grades (
   flevelid             bigint               not null,
   flevel               nvarchar(50)         null,
   uplimit              decimal(10,2)        null,
   lowlimit             decimal(10,2)        null,
   femp                 bigint               null,
   fupdate              datetime             null,
   constraint PK_T_GRADES primary key (flevelid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '客户评分等级标准表',
   'user', @CurrentUser, 'table', 't_grades'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'flevelid',
   'user', @CurrentUser, 'table', 't_grades', 'column', 'flevelid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'flevel',
   'user', @CurrentUser, 'table', 't_grades', 'column', 'flevel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上限值',
   'user', @CurrentUser, 'table', 't_grades', 'column', 'uplimit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '下限值',
   'user', @CurrentUser, 'table', 't_grades', 'column', 'lowlimit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作者',
   'user', @CurrentUser, 'table', 't_grades', 'column', 'femp'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作时间',
   'user', @CurrentUser, 'table', 't_grades', 'column', 'fupdate'
go

/*==============================================================*/
/* Table: t_icitembase                                          */
/*==============================================================*/
create table t_icitembase (
   fitemid              bigint               not null,
   ferpclsid            int                  null,
   funitid              int                  null,
   funitgroupid         int                  null,
   fdefaultloc          int                  null,
   fspid                int                  null,
   fsource              int                  null,
   fqtydecimal          int                  null,
   flowlimit            decimal(20,10)       null,
   fhighlimit           decimal(20,10)       null,
   fsecinv              decimal(20,10)       null,
   fusestate            int                  null,
   flsequipment         bit                  null,
   fequipmentnum        nvarchar(80)         null,
   flssparepart         bit                  null,
   ffullname            nvarchar(200)        null,
   fsecunitid           int                  null,
   fseccoefficient      decimal(20,10)       null,
   fsecunitdecimal      int                  null,
   falias               nvarchar(80)         null,
   forderunitid         integer              null,
   fsaleunitid          integer              null,
   fstoreunitid         integer              null,
   fproductunitid       integer              null,
   fapproveno           nvarchar(80)         null,
   fauxclassid          integer              null,
   ftypeid              integer              null,
   fpredeadline         integer              null,
   fserialclassid       integer              null,
   constraint PK_T_ICITEMBASE primary key (fitemid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   't_icitembase',
   'user', @CurrentUser, 'table', 't_icitembase'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fitemid',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ferpclsid',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'ferpclsid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '单位内码',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'funitid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '单位组内码',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'funitgroupid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '缺省库房',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fdefaultloc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '缺省仓位',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fspid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '来源',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fsource'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '数量精度',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fqtydecimal'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最低存量',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'flowlimit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最高存量',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fhighlimit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '安全库存',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fsecinv'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '使用状态',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fusestate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'flsequipment',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'flsequipment'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fequipmentnum',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fequipmentnum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'flssparepart',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'flssparepart'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ffullname',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'ffullname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fsecunitid',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fsecunitid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fseccoefficient',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fseccoefficient'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fsecunitdecimal',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fsecunitdecimal'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '别名',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'falias'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '采购计量单位',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'forderunitid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售计量单位',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fsaleunitid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '库存计量单位',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fstoreunitid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fproductunitid',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fproductunitid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fapproveno',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fapproveno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料属性类别',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fauxclassid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料分类',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'ftypeid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fpredeadline',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fpredeadline'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fserialclassid',
   'user', @CurrentUser, 'table', 't_icitembase', 'column', 'fserialclassid'
go

/*==============================================================*/
/* Table: t_icitemcustom                                        */
/*==============================================================*/
create table t_icitemcustom (
   fitemid              bigint               not null,
   f_104                integer              null,
   f_105                integer              null,
   f_106                nvarchar(80)         null,
   f_107                nvarchar(80)         null,
   fotheraracctid       integer              null,
   fotherapacctid       integer              null,
   fpreapacctid         integer              null,
   fprearacctid         integer              null,
   f_108                decimal(20,10)       null,
   constraint PK_T_ICITEMCUSTOM primary key (fitemid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料自定义',
   'user', @CurrentUser, 'table', 't_icitemcustom'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fitemid',
   'user', @CurrentUser, 'table', 't_icitemcustom', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'f_104',
   'user', @CurrentUser, 'table', 't_icitemcustom', 'column', 'f_104'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'f_105',
   'user', @CurrentUser, 'table', 't_icitemcustom', 'column', 'f_105'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'f_106',
   'user', @CurrentUser, 'table', 't_icitemcustom', 'column', 'f_106'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'f_107',
   'user', @CurrentUser, 'table', 't_icitemcustom', 'column', 'f_107'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fotheraracctid',
   'user', @CurrentUser, 'table', 't_icitemcustom', 'column', 'fotheraracctid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fotherapacctid',
   'user', @CurrentUser, 'table', 't_icitemcustom', 'column', 'fotherapacctid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fpreapacctid',
   'user', @CurrentUser, 'table', 't_icitemcustom', 'column', 'fpreapacctid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fprearacctid',
   'user', @CurrentUser, 'table', 't_icitemcustom', 'column', 'fprearacctid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'f_108',
   'user', @CurrentUser, 'table', 't_icitemcustom', 'column', 'f_108'
go

/*==============================================================*/
/* Table: t_icitemdesign                                        */
/*==============================================================*/
create table t_icitemdesign (
   fitemid              bigint               not null,
   fcharnumber          nvarchar(255)        null,
   fiskeyitem           bit                  null,
   fmaund               int                  null,
   fgrossweight         decimal(20,10)       null,
   fnetweight           decimal(20,10)       null,
   fcubicmeasure        int                  null,
   flength              decimal(20,10)       null,
   fwidth               decimal(20,10)       null,
   fheight              decimal(20,10)       null,
   fsize                decimal(20,10)       null,
   fversion             nvarchar(50)         null,
   constraint PK_T_ICITEMDESIGN primary key (fitemid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料设计资料',
   'user', @CurrentUser, 'table', 't_icitemdesign'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fitemid',
   'user', @CurrentUser, 'table', 't_icitemdesign', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcharnumber',
   'user', @CurrentUser, 'table', 't_icitemdesign', 'column', 'fcharnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fiskeyitem',
   'user', @CurrentUser, 'table', 't_icitemdesign', 'column', 'fiskeyitem'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fmaund',
   'user', @CurrentUser, 'table', 't_icitemdesign', 'column', 'fmaund'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fgrossweight',
   'user', @CurrentUser, 'table', 't_icitemdesign', 'column', 'fgrossweight'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fnetweight',
   'user', @CurrentUser, 'table', 't_icitemdesign', 'column', 'fnetweight'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcubicmeasure',
   'user', @CurrentUser, 'table', 't_icitemdesign', 'column', 'fcubicmeasure'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'flength',
   'user', @CurrentUser, 'table', 't_icitemdesign', 'column', 'flength'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fwidth',
   'user', @CurrentUser, 'table', 't_icitemdesign', 'column', 'fwidth'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fheight',
   'user', @CurrentUser, 'table', 't_icitemdesign', 'column', 'fheight'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fsize',
   'user', @CurrentUser, 'table', 't_icitemdesign', 'column', 'fsize'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fversion',
   'user', @CurrentUser, 'table', 't_icitemdesign', 'column', 'fversion'
go

/*==============================================================*/
/* Table: t_icitemmaterial                                      */
/*==============================================================*/
create table t_icitemmaterial (
   fitemid              bigint               not null,
   forderrector         integer              null,
   fpohghprcmnytype     integer              null,
   fpohighprice         decimal(20,10)       null,
   fwwhghprc            decimal(20,10)       null,
   fwwhghprcmnytype     integer              null,
   fsolowprc            decimal(20,10)       null,
   fsolowprcmnytype     int                  null,
   flssale              bit                  null,
   fprofitrate          decimal(20,10)       null,
   fsaleprice           decimal(20,10)       null,
   fbatchmanager        bit                  null,
   fiskfperiod          bit                  null,
   fkfperiod            decimal(20,10)       null,
   ftrack               int                  null,
   fplanprice           decimal(20,10)       null,
   fpricedecimal        int                  null,
   facctid              int                  null,
   fsaleacctid          int                  null,
   fcostacctid          int                  null,
   fapacctid            int                  null,
   fgoodspec            int                  null,
   fcostproject         int                  null,
   flssnmanage          bit                  null,
   fstocktime           bit                  null,
   fbookplan            bit                  null,
   fbeforeexpire        int                  null,
   ftaxrate             int                  null,
   fadminacctid         int                  null,
   fnote                nvarchar(80)         null,
   flsspecialtax        bit                  null,
   fsohighlimit         decimal(20,10)       null,
   fsolowlimit          decimal(20,10)       null,
   foihighlimit         decimal(20,10)       null,
   fdaysper             int                  null,
   flastcheckdate       datetime             null,
   fcheckcycle          int                  null,
   fcheckcycunit        int                  null,
   fstockprice          int                  null,
   fabccls              varchar(6)           null,
   fbatchqty            decimal(20,10)       null,
   fclass               bit                  null,
   fcostdiffrate        decimal(20,10)       null,
   fdepartment          bigint               null,
   fsaletaxacctid       int                  null,
   fcbbmstandardid      int                  null,
   fcbrestore           int                  null,
   fpickhighlimit       decimal(20,10)       null,
   fpicklowlimit        decimal(20,10)       null,
   constraint PK_T_ICITEMMATERIAL primary key (fitemid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   't_icitemmaterial',
   'user', @CurrentUser, 'table', 't_icitemmaterial'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fitemid',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '采购负责人内码',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'forderrector'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '采购最高价币别',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fpohghprcmnytype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '采购最高价',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fpohighprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '委外加工最高价',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fwwhghprc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '委外加最高价币别',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fwwhghprcmnytype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售最低价',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fsolowprc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售最低价币别',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fsolowprcmnytype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'flssale',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'flssale'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fprofitrate',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fprofitrate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fsaleprice',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fsaleprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fbatchmanager',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fbatchmanager'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fiskfperiod',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fiskfperiod'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fkfperiod',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fkfperiod'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '计价方法',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'ftrack'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '计划单价',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fplanprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fpricedecimal',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fpricedecimal'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'facctid',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'facctid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fsaleacctid',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fsaleacctid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcostacctid',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fcostacctid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fapacctid',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fapacctid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fgoodspec',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fgoodspec'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcostproject',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fcostproject'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'flssnmanage',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'flssnmanage'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fstocktime',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fstocktime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fbookplan',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fbookplan'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fbeforeexpire',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fbeforeexpire'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ftaxrate',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'ftaxrate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fadminacctid',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fadminacctid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fnote',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fnote'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'flsspecialtax',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'flsspecialtax'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售超交比例',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fsohighlimit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售欠交比例',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fsolowlimit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '外购超收比例',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'foihighlimit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fdaysper',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fdaysper'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'flastcheckdate',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'flastcheckdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '盘点周期',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fcheckcycle'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '盘点周期单位',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fcheckcycunit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fstockprice',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fstockprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fabccls',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fabccls'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fbatchqty',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fbatchqty'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fclass',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fclass'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcostdiffrate',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fcostdiffrate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fdepartment',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fdepartment'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fsaletaxacctid',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fsaletaxacctid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcbbmstandardid',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fcbbmstandardid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcbrestore',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fcbrestore'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fpickhighlimit',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fpickhighlimit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fpicklowlimit',
   'user', @CurrentUser, 'table', 't_icitemmaterial', 'column', 'fpicklowlimit'
go

/*==============================================================*/
/* Table: t_icitemplan                                          */
/*==============================================================*/
create table t_icitemplan (
   fitemid              bigint               null,
   fplantrategy         integer              null,
   fordertrategy        integer              null,
   fleadtime            real                 null,
   ffixleadtime         real                 null,
   ftotaltqq            integer              null,
   fqtymin              decimal(20,10)       null,
   fqtymax              decimal(20,10)       null,
   fcuunitid            integer              null,
   forderinterval       integer              null,
   fbatchappendqty      decimal(20,10)       null,
   forderpoint          decimal(20,10)       null,
   fbatfixeconomy       decimal(20,10)       null,
   fbatchangeeconomy    decimal(20,10)       null,
   frequirepoint        integer              null,
   fplanpoint           integer              null,
   fdefaultroutingid    integer              null,
   fdefaultworktypeid   integer              null,
   fproductprincipal    integer              null,
   fdailyconsume        decimal(20,10)       null,
   fmrpcon              bit                  null,
   fplanner             integer              null,
   fputinteger          bit                  null,
   finhighlimit         decimal(20,10)       null,
   finlowlimit          decimal(20,10)       null,
   flowestbomcode       integer              null,
   fmrporder            bit                  null,
   fischarsourceitem    integer              null,
   fcharsourceitemid    integer              null,
   fplanmode            integer              null,
   fctrltype            integer              null,
   fctrlstraregy        integer              null,
   fcontainername       nvarchar(50)         null,
   fkanbancapability    integer              null,
   fisbackflush         integer              null,
   fbackflushstockid    integer              null,
   fbackflushspid       integer              null
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料计划资料',
   'user', @CurrentUser, 'table', 't_icitemplan'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fitemid',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fplantrategy',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fplantrategy'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fordertrategy',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fordertrategy'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fleadtime',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fleadtime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ffixleadtime',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'ffixleadtime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ftotaltqq',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'ftotaltqq'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fqtymin',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fqtymin'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fqtymax',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fqtymax'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcuunitid',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fcuunitid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'forderinterval',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'forderinterval'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fbatchappendqty',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fbatchappendqty'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'forderpoint',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'forderpoint'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fbatfixeconomy',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fbatfixeconomy'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fbatchangeeconomy',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fbatchangeeconomy'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'frequirepoint',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'frequirepoint'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fplanpoint',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fplanpoint'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fdefaultroutingid',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fdefaultroutingid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fdefaultworktypeid',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fdefaultworktypeid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fproductprincipal',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fproductprincipal'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fdailyconsume',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fdailyconsume'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fmrpcon',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fmrpcon'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fplanner',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fplanner'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fputinteger',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fputinteger'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'finhighlimit',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'finhighlimit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'finlowlimit',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'finlowlimit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'flowestbomcode',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'flowestbomcode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fmrporder',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fmrporder'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fischarsourceitem',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fischarsourceitem'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcharsourceitemid',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fcharsourceitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fplanmode',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fplanmode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fctrltype',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fctrltype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fctrlstraregy',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fctrlstraregy'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcontainername',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fcontainername'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fkanbancapability',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fkanbancapability'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fisbackflush',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fisbackflush'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fbackflushstockid',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fbackflushstockid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fbackflushspid',
   'user', @CurrentUser, 'table', 't_icitemplan', 'column', 'fbackflushspid'
go

/*==============================================================*/
/* Table: t_icitemquality                                       */
/*==============================================================*/
create table t_icitemquality (
   fitemid              bigint               not null,
   finspectionlevel     integer              null,
   finspectionproject   integer              null,
   fislistcontrol       integer              null,
   fprochkmde           integer              null,
   fwwchkmde            integer              null,
   fsochkmde            integer              null,
   fwthdrwchkmde        integer              null,
   fstkchkmde           integer              null,
   fotherchkmde         integer              null,
   fstkchkprd           integer              null,
   fstkchkalrm          integer              null,
   fidentifier          integer              null,
   constraint PK_T_ICITEMQUALITY primary key (fitemid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料质量资料',
   'user', @CurrentUser, 'table', 't_icitemquality'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fitemid',
   'user', @CurrentUser, 'table', 't_icitemquality', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'finspectionlevel',
   'user', @CurrentUser, 'table', 't_icitemquality', 'column', 'finspectionlevel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'finspectionproject',
   'user', @CurrentUser, 'table', 't_icitemquality', 'column', 'finspectionproject'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fislistcontrol',
   'user', @CurrentUser, 'table', 't_icitemquality', 'column', 'fislistcontrol'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fprochkmde',
   'user', @CurrentUser, 'table', 't_icitemquality', 'column', 'fprochkmde'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fwwchkmde',
   'user', @CurrentUser, 'table', 't_icitemquality', 'column', 'fwwchkmde'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fsochkmde',
   'user', @CurrentUser, 'table', 't_icitemquality', 'column', 'fsochkmde'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fwthdrwchkmde',
   'user', @CurrentUser, 'table', 't_icitemquality', 'column', 'fwthdrwchkmde'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fstkchkmde',
   'user', @CurrentUser, 'table', 't_icitemquality', 'column', 'fstkchkmde'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fotherchkmde',
   'user', @CurrentUser, 'table', 't_icitemquality', 'column', 'fotherchkmde'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fstkchkprd',
   'user', @CurrentUser, 'table', 't_icitemquality', 'column', 'fstkchkprd'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fstkchkalrm',
   'user', @CurrentUser, 'table', 't_icitemquality', 'column', 'fstkchkalrm'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fidentifier',
   'user', @CurrentUser, 'table', 't_icitemquality', 'column', 'fidentifier'
go

/*==============================================================*/
/* Table: t_icitemstandard                                      */
/*==============================================================*/
create table t_icitemstandard (
   fitemid              bigint               not null,
   fstandardcost        decimal(20,10)       null,
   fstandardmanhour     decimal(20,10)       null,
   fstdpayrate          decimal(20,10)       null,
   fchgfeerate          decimal(20,10)       null,
   fstdfixfeerate       decimal(20,10)       null,
   foutmachfee          decimal(20,10)       null,
   fpiecerate           decimal(20,10)       null,
   fstdbatchqty         decimal(20,10)       null,
   fpovacctid           integer              null,
   fpivacctid           integer              null,
   fmcvacctid           integer              null,
   fpcvacctid           integer              null,
   fslacctid            integer              null,
   fcavacctid           integer              null,
   fcbappendrate        decimal(20,10)       null,
   fcbappendproject     integer              null,
   fcostbomid           integer              null,
   fcbrouting           integer              null,
   foutmachfeeproject   integer              null,
   constraint PK_T_ICITEMSTANDARD primary key (fitemid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料标准表',
   'user', @CurrentUser, 'table', 't_icitemstandard'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fitemid',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fstandardcost',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fstandardcost'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fstandardmanhour',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fstandardmanhour'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fstdpayrate',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fstdpayrate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fchgfeerate',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fchgfeerate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fstdfixfeerate',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fstdfixfeerate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'foutmachfee',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'foutmachfee'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fpiecerate',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fpiecerate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fstdbatchqty',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fstdbatchqty'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fpovacctid',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fpovacctid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fpivacctid',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fpivacctid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fmcvacctid',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fmcvacctid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fpcvacctid',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fpcvacctid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fslacctid',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fslacctid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcavacctid',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fcavacctid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcbappendrate',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fcbappendrate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcbappendproject',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fcbappendproject'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcostbomid',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fcostbomid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcbrouting',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'fcbrouting'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'foutmachfeeproject',
   'user', @CurrentUser, 'table', 't_icitemstandard', 'column', 'foutmachfeeproject'
go

/*==============================================================*/
/* Table: t_item                                                */
/*==============================================================*/
create table t_item (
   fitemid              bigint               not null,
   categoryid           bigint               null,
   fnumber              nvarchar(100)        null,
   fname                nvarchar(100)        null,
   fmodel               nvarchar(100)        null,
   f_106                nvarchar(80)         null,
   f_105                nvarchar(80)         null,
   funitid              bigint               null,
   fusestate            int                  null,
   fsecinv              decimal(20,10)       null,
   forderprice          decimal(20,10)       null,
   fhighlimit           decimal(20,10)       null,
   fiskeyitem           int                  null,
   fdeleted             int                  null,
   ferpclsid            int                  null,
   fbatchmanager        int                  null,
   fissnmanage          int                  null,
   ftrack               int                  null,
   forderrector         bigint               null,
   fproductprincipal    int                  null,
   fshortnumber         nvarchar(100)        null,
   fparentid            bigint               null,
   constraint PK_T_ITEM primary key (fitemid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料表',
   'user', @CurrentUser, 'table', 't_item'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fitemid',
   'user', @CurrentUser, 'table', 't_item', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'categoryid',
   'user', @CurrentUser, 'table', 't_item', 'column', 'categoryid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料编号',
   'user', @CurrentUser, 'table', 't_item', 'column', 'fnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料名称',
   'user', @CurrentUser, 'table', 't_item', 'column', 'fname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '规格型号',
   'user', @CurrentUser, 'table', 't_item', 'column', 'fmodel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '执行标准',
   'user', @CurrentUser, 'table', 't_item', 'column', 'f_106'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '材质',
   'user', @CurrentUser, 'table', 't_item', 'column', 'f_105'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '单位内码',
   'user', @CurrentUser, 'table', 't_item', 'column', 'funitid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '使用状态',
   'user', @CurrentUser, 'table', 't_item', 'column', 'fusestate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '安全库存',
   'user', @CurrentUser, 'table', 't_item', 'column', 'fsecinv'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单单价',
   'user', @CurrentUser, 'table', 't_item', 'column', 'forderprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最高存量',
   'user', @CurrentUser, 'table', 't_item', 'column', 'fhighlimit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否关键件',
   'user', @CurrentUser, 'table', 't_item', 'column', 'fiskeyitem'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否禁用',
   'user', @CurrentUser, 'table', 't_item', 'column', 'fdeleted'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:外购,2:自制,3:委外加工,5:虚拟件',
   'user', @CurrentUser, 'table', 't_item', 'column', 'ferpclsid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否批次管理',
   'user', @CurrentUser, 'table', 't_item', 'column', 'fbatchmanager'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否序列号管理',
   'user', @CurrentUser, 'table', 't_item', 'column', 'fissnmanage'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '计价方法',
   'user', @CurrentUser, 'table', 't_item', 'column', 'ftrack'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '采购负责人',
   'user', @CurrentUser, 'table', 't_item', 'column', 'forderrector'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '生产负责人',
   'user', @CurrentUser, 'table', 't_item', 'column', 'fproductprincipal'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fshortnumber',
   'user', @CurrentUser, 'table', 't_item', 'column', 'fshortnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fparentid',
   'user', @CurrentUser, 'table', 't_item', 'column', 'fparentid'
go

/*==============================================================*/
/* Table: t_item_rule                                           */
/*==============================================================*/
create table t_item_rule (
   itemruleid           bigint               identity,
   fitemid              bigint               null,
   rulename             nvarchar(50)         null,
   seq                  int                  null,
   constraint PK_T_ITEM_RULE primary key (itemruleid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '代码规则表',
   'user', @CurrentUser, 'table', 't_item_rule'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'itemruleid',
   'user', @CurrentUser, 'table', 't_item_rule', 'column', 'itemruleid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fitemid',
   'user', @CurrentUser, 'table', 't_item_rule', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '名称',
   'user', @CurrentUser, 'table', 't_item_rule', 'column', 'rulename'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '顺序',
   'user', @CurrentUser, 'table', 't_item_rule', 'column', 'seq'
go

/*==============================================================*/
/* Table: t_item_rule_detail                                    */
/*==============================================================*/
create table t_item_rule_detail (
   detailid             bigint               identity,
   itemruleid           bigint               null,
   fitemid              bigint               null,
   fname                nvarchar(50)         null,
   fcode                nvarchar(50)         null,
   constraint PK_T_ITEM_RULE_DETAIL primary key (detailid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '代码规则明细',
   'user', @CurrentUser, 'table', 't_item_rule_detail'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'detailid',
   'user', @CurrentUser, 'table', 't_item_rule_detail', 'column', 'detailid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'itemruleid',
   'user', @CurrentUser, 'table', 't_item_rule_detail', 'column', 'itemruleid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fitemid',
   'user', @CurrentUser, 'table', 't_item_rule_detail', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '名称',
   'user', @CurrentUser, 'table', 't_item_rule_detail', 'column', 'fname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '编码',
   'user', @CurrentUser, 'table', 't_item_rule_detail', 'column', 'fcode'
go

/*==============================================================*/
/* Table: t_itemclass                                           */
/*==============================================================*/
create table t_itemclass (
   fitemclassid         bigint               not null,
   fnumber              nvarchar(50)         null,
   fname                nvarchar(80)         null,
   fsqltablename        nvarchar(50)         null,
   constraint PK_T_ITEMCLASS primary key (fitemclassid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   't_itemclass',
   'user', @CurrentUser, 'table', 't_itemclass'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fitemclassid',
   'user', @CurrentUser, 'table', 't_itemclass', 'column', 'fitemclassid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fnumber',
   'user', @CurrentUser, 'table', 't_itemclass', 'column', 'fnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fname',
   'user', @CurrentUser, 'table', 't_itemclass', 'column', 'fname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fsqltablename',
   'user', @CurrentUser, 'table', 't_itemclass', 'column', 'fsqltablename'
go

/*==============================================================*/
/* Table: t_key_device                                          */
/*==============================================================*/
create table t_key_device (
   deviceid             bigint               identity,
   devicename           nvarchar(50)         null,
   notes                nvarchar(100)        null,
   constraint PK_T_KEY_DEVICE primary key (deviceid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '关键设备',
   'user', @CurrentUser, 'table', 't_key_device'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'deviceid',
   'user', @CurrentUser, 'table', 't_key_device', 'column', 'deviceid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设备名称',
   'user', @CurrentUser, 'table', 't_key_device', 'column', 'devicename'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 't_key_device', 'column', 'notes'
go

/*==============================================================*/
/* Table: t_mail_msg                                            */
/*==============================================================*/
create table t_mail_msg (
   id                   bigint               identity,
   emailsubject         nvarchar(200)        null,
   emailfrom            nvarchar(200)        null,
   emailto              nvarchar(2000)       null,
   emailcc              nvarchar(2000)       null,
   mainbody             nvarchar(max)        null,
   creater              nvarchar(50)         null,
   creatertime          datetime             null,
   sender               nvarchar(50)         null,
   sendertime           datetime             null,
   billType             int                  null,
   billid               bigint               null,
   emailstatus          int                  null,
   attachpath           nvarchar(500)        null,
   Column_15            char(10)             null,
   constraint PK_T_MAIL_MSG primary key (id)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单邮件消息表',
   'user', @CurrentUser, 'table', 't_mail_msg'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 't_mail_msg', 'column', 'id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮件主题',
   'user', @CurrentUser, 'table', 't_mail_msg', 'column', 'emailsubject'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮件发送人',
   'user', @CurrentUser, 'table', 't_mail_msg', 'column', 'emailfrom'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮件收件人',
   'user', @CurrentUser, 'table', 't_mail_msg', 'column', 'emailto'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮件抄送人',
   'user', @CurrentUser, 'table', 't_mail_msg', 'column', 'emailcc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮件正文',
   'user', @CurrentUser, 'table', 't_mail_msg', 'column', 'mainbody'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮件创建人',
   'user', @CurrentUser, 'table', 't_mail_msg', 'column', 'creater'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮件创建时间',
   'user', @CurrentUser, 'table', 't_mail_msg', 'column', 'creatertime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮件被发送人',
   'user', @CurrentUser, 'table', 't_mail_msg', 'column', 'sender'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮件被发送时间',
   'user', @CurrentUser, 'table', 't_mail_msg', 'column', 'sendertime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮件关联单据类型',
   'user', @CurrentUser, 'table', 't_mail_msg', 'column', 'billType'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮件关联单据ID',
   'user', @CurrentUser, 'table', 't_mail_msg', 'column', 'billid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮件状态',
   'user', @CurrentUser, 'table', 't_mail_msg', 'column', 'emailstatus'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮件附件地址',
   'user', @CurrentUser, 'table', 't_mail_msg', 'column', 'attachpath'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Column_15',
   'user', @CurrentUser, 'table', 't_mail_msg', 'column', 'Column_15'
go

/*==============================================================*/
/* Table: t_measureunit                                         */
/*==============================================================*/
create table t_measureunit (
   fmeasureunitid       bigint               not null,
   funitgroupid         integer              null,
   fnumber              nvarchar(30)         null,
   fauxclass            nvarchar(80)         null,
   fname                nvarchar(80)         null,
   fconversation        integer              null,
   fcoefficient         decimal(20,10)       null,
   fprecision           integer              null,
   fbrno                nvarchar(10)         null,
   fitemid              integer              null,
   fparentid            integer              null,
   fdeleted             integer              null,
   fshortnumber         nvarchar(30)         null,
   foperdate            nvarchar(10)         null,
   fscale               decimal(20,10)       null,
   fstandard            integer              null,
   fcontrol             integer              null,
   fmodifytime          timestamp            null,
   fsystemtype          integer              null,
   uuid                 uniqueidentifier     null,
   fnameen              nvarchar(255)        null,
   fnameenplu           nvarchar(255)        null,
   constraint PK_T_MEASUREUNIT primary key (fmeasureunitid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '计量单位',
   'user', @CurrentUser, 'table', 't_measureunit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fmeasureunitid',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fmeasureunitid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'funitgroupid',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'funitgroupid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fnumber',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fauxclass',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fauxclass'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fname',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fconversation',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fconversation'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcoefficient',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fcoefficient'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fprecision',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fprecision'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fbrno',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fbrno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fitemid',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fparentid',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fparentid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fdeleted',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fdeleted'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fshortnumber',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fshortnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'foperdate',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'foperdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fscale',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fscale'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fstandard',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fstandard'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fcontrol',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fcontrol'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fmodifytime',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fmodifytime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fsystemtype',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fsystemtype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'uuid',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'uuid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fnameen',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fnameen'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fnameenplu',
   'user', @CurrentUser, 'table', 't_measureunit', 'column', 'fnameenplu'
go

/*==============================================================*/
/* Table: t_order                                               */
/*==============================================================*/
create table dbo.t_order (
   orderId              bigint               identity,
   orderCode            nvarchar(50)         not null,
   userName             varchar(50)          null,
   userId               bigint               null,
   orderTime            datetime             null,
   createdTime          datetime             null,
   orderCompanyName     nvarchar(500)        null,
   userCompanyName      nvarchar(500)        null,
   userCompanyAdress    nvarchar(500)        null,
   userCompanyPerson    nvarchar(30)         null,
   userCompanyPhone     nvarchar(500)        null,
   projectId            bigint               null,
   projectName          nvarchar(100)        null,
   bussinessType        nvarchar(50)         null,
   gasSource            nvarchar(100)        null,
   systemConsumer       nvarchar(500)        null,
   systemConsumerId     bigint               null,
   payType              nvarchar(100)        null,
   deliveryAdress       nvarchar(500)        null,
   freightSide          nvarchar(2)          null,
   transportType        nvarchar(3)          null,
   productPackage       nvarchar(2)          null,
   billUserId           bigint               null,
   billUserName         varchar(50)          null,
   otherNoticeThings    nvarchar(500)        null,
   marketManagerAdvice  nvarchar(500)        null,
   orderStatus          int                  null,
   printCount           int                  null,
   billType             int                  null,
   billTime             datetime             null,
   saleType             datetime             null,
   saleRange            nvarchar(100)        null,
   sourceOrderType      varchar(50)          null,
   digest               nvarchar(500)        null,
   pL3000Count          int                  null,
   pL3000Unit           decimal(20,10)       null,
   pL4200Count          int                  null,
   pL4200Unit           decimal(20,10)       null,
   sSV3500Count         int                  null,
   sSV3500Unit          decimal(20,10)       null,
   sPL2000Count         int                  null,
   sPL2000Unit          int                  null,
   plTotalFee           bigint               null,
   pL3000ListPrice      decimal(20,10)       null,
   pL4200ListPrice      decimal(20,10)       null,
   sSV3500ListPrice     decimal(20,10)       null,
   sPL2000ListPrice     decimal(20,10)       null,
   salemethod           nvarchar(50)         null,
   nostraightcoeff      decimal(20,10)       null,
   rmTotal              nvarchar(100)        null,
   billWriterName       nvarchar(50)         null,
   containProductType   nvarchar(50)         null,
   orderChecker         nvarchar(50)         null,
   orderApprover        nvarchar(50)         null,
   pdfFilePath          nvarchar(20)         null,
   orderCloseUserId     bigint               null,
   operatorrate         decimal(10,4)        null,
   isyearlycontract     bit                  null,
   orderChecker2        nvarchar(50)         null,
   constraint PK_T_ORDER primary key (orderId)
         on "PRIMARY"
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   't_order',
   'user', 'dbo', 'table', 't_order'
go

execute sp_addextendedproperty 'MS_Description', 
   'orderId',
   'user', 'dbo', 'table', 't_order', 'column', 'orderId'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单编号',
   'user', 'dbo', 'table', 't_order', 'column', 'orderCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '负责人名称',
   'user', 'dbo', 'table', 't_order', 'column', 'userName'
go

execute sp_addextendedproperty 'MS_Description', 
   '负责人ID',
   'user', 'dbo', 'table', 't_order', 'column', 'userId'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单时间',
   'user', 'dbo', 'table', 't_order', 'column', 'orderTime'
go

execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', 'dbo', 'table', 't_order', 'column', 'createdTime'
go

execute sp_addextendedproperty 'MS_Description', 
   '订货单位名称',
   'user', 'dbo', 'table', 't_order', 'column', 'orderCompanyName'
go

execute sp_addextendedproperty 'MS_Description', 
   '使用单位名称',
   'user', 'dbo', 'table', 't_order', 'column', 'userCompanyName'
go

execute sp_addextendedproperty 'MS_Description', 
   '使用单位地址',
   'user', 'dbo', 'table', 't_order', 'column', 'userCompanyAdress'
go

execute sp_addextendedproperty 'MS_Description', 
   '使用单位负责人',
   'user', 'dbo', 'table', 't_order', 'column', 'userCompanyPerson'
go

execute sp_addextendedproperty 'MS_Description', 
   '使用单位负责人联系方式',
   'user', 'dbo', 'table', 't_order', 'column', 'userCompanyPhone'
go

execute sp_addextendedproperty 'MS_Description', 
   '工程项目ID',
   'user', 'dbo', 'table', 't_order', 'column', 'projectId'
go

execute sp_addextendedproperty 'MS_Description', 
   '工程项目名称',
   'user', 'dbo', 'table', 't_order', 'column', 'projectName'
go

execute sp_addextendedproperty 'MS_Description', 
   '业务类型',
   'user', 'dbo', 'table', 't_order', 'column', 'bussinessType'
go

execute sp_addextendedproperty 'MS_Description', 
   '气源',
   'user', 'dbo', 'table', 't_order', 'column', 'gasSource'
go

execute sp_addextendedproperty 'MS_Description', 
   '体系客户',
   'user', 'dbo', 'table', 't_order', 'column', 'systemConsumer'
go

execute sp_addextendedproperty 'MS_Description', 
   '体系客户Id',
   'user', 'dbo', 'table', 't_order', 'column', 'systemConsumerId'
go

execute sp_addextendedproperty 'MS_Description', 
   '付费方式',
   'user', 'dbo', 'table', 't_order', 'column', 'payType'
go

execute sp_addextendedproperty 'MS_Description', 
   '交货地点',
   'user', 'dbo', 'table', 't_order', 'column', 'deliveryAdress'
go

execute sp_addextendedproperty 'MS_Description', 
   '运费承担方',
   'user', 'dbo', 'table', 't_order', 'column', 'freightSide'
go

execute sp_addextendedproperty 'MS_Description', 
   '运输方式',
   'user', 'dbo', 'table', 't_order', 'column', 'transportType'
go

execute sp_addextendedproperty 'MS_Description', 
   '产品包装',
   'user', 'dbo', 'table', 't_order', 'column', 'productPackage'
go

execute sp_addextendedproperty 'MS_Description', 
   '发票签收人ID',
   'user', 'dbo', 'table', 't_order', 'column', 'billUserId'
go

execute sp_addextendedproperty 'MS_Description', 
   '发票签收人名称',
   'user', 'dbo', 'table', 't_order', 'column', 'billUserName'
go

execute sp_addextendedproperty 'MS_Description', 
   '其他约定事项',
   'user', 'dbo', 'table', 't_order', 'column', 'otherNoticeThings'
go

execute sp_addextendedproperty 'MS_Description', 
   '营销部主管意见',
   'user', 'dbo', 'table', 't_order', 'column', 'marketManagerAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单状态',
   'user', 'dbo', 'table', 't_order', 'column', 'orderStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   '打印次数',
   'user', 'dbo', 'table', 't_order', 'column', 'printCount'
go

execute sp_addextendedproperty 'MS_Description', 
   '结算方式',
   'user', 'dbo', 'table', 't_order', 'column', 'billType'
go

execute sp_addextendedproperty 'MS_Description', 
   '结算时间',
   'user', 'dbo', 'table', 't_order', 'column', 'billTime'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售方式',
   'user', 'dbo', 'table', 't_order', 'column', 'saleType'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售范围',
   'user', 'dbo', 'table', 't_order', 'column', 'saleRange'
go

execute sp_addextendedproperty 'MS_Description', 
   '源单类型',
   'user', 'dbo', 'table', 't_order', 'column', 'sourceOrderType'
go

execute sp_addextendedproperty 'MS_Description', 
   '摘要',
   'user', 'dbo', 'table', 't_order', 'column', 'digest'
go

execute sp_addextendedproperty 'MS_Description', 
   'pL3000数量',
   'user', 'dbo', 'table', 't_order', 'column', 'pL3000Count'
go

execute sp_addextendedproperty 'MS_Description', 
   'pL3000单价',
   'user', 'dbo', 'table', 't_order', 'column', 'pL3000Unit'
go

execute sp_addextendedproperty 'MS_Description', 
   'pL4200数量',
   'user', 'dbo', 'table', 't_order', 'column', 'pL4200Count'
go

execute sp_addextendedproperty 'MS_Description', 
   'pL4200单价',
   'user', 'dbo', 'table', 't_order', 'column', 'pL4200Unit'
go

execute sp_addextendedproperty 'MS_Description', 
   'sSV3500数量',
   'user', 'dbo', 'table', 't_order', 'column', 'sSV3500Count'
go

execute sp_addextendedproperty 'MS_Description', 
   'sSV3500单价',
   'user', 'dbo', 'table', 't_order', 'column', 'sSV3500Unit'
go

execute sp_addextendedproperty 'MS_Description', 
   'sPL2000数量',
   'user', 'dbo', 'table', 't_order', 'column', 'sPL2000Count'
go

execute sp_addextendedproperty 'MS_Description', 
   'sPL2000单价',
   'user', 'dbo', 'table', 't_order', 'column', 'sPL2000Unit'
go

execute sp_addextendedproperty 'MS_Description', 
   '国产PL总计金额',
   'user', 'dbo', 'table', 't_order', 'column', 'plTotalFee'
go

execute sp_addextendedproperty 'MS_Description', 
   'pL3000列表价',
   'user', 'dbo', 'table', 't_order', 'column', 'pL3000ListPrice'
go

execute sp_addextendedproperty 'MS_Description', 
   'pL4200列表价',
   'user', 'dbo', 'table', 't_order', 'column', 'pL4200ListPrice'
go

execute sp_addextendedproperty 'MS_Description', 
   'sSV3500列表价',
   'user', 'dbo', 'table', 't_order', 'column', 'sSV3500ListPrice'
go

execute sp_addextendedproperty 'MS_Description', 
   'sPL2000列表价',
   'user', 'dbo', 'table', 't_order', 'column', 'sPL2000ListPrice'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售模式',
   'user', 'dbo', 'table', 't_order', 'column', 'salemethod'
go

execute sp_addextendedproperty 'MS_Description', 
   '非直销奖励系数',
   'user', 'dbo', 'table', 't_order', 'column', 'nostraightcoeff'
go

execute sp_addextendedproperty 'MS_Description', 
   '共计人民币(大写)',
   'user', 'dbo', 'table', 't_order', 'column', 'rmTotal'
go

execute sp_addextendedproperty 'MS_Description', 
   '发票签收人',
   'user', 'dbo', 'table', 't_order', 'column', 'billWriterName'
go

execute sp_addextendedproperty 'MS_Description', 
   '包含产品类型',
   'user', 'dbo', 'table', 't_order', 'column', 'containProductType'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单审核人',
   'user', 'dbo', 'table', 't_order', 'column', 'orderChecker'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单审批人',
   'user', 'dbo', 'table', 't_order', 'column', 'orderApprover'
go

execute sp_addextendedproperty 'MS_Description', 
   'PDF附件地址',
   'user', 'dbo', 'table', 't_order', 'column', 'pdfFilePath'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单关闭人id',
   'user', 'dbo', 'table', 't_order', 'column', 'orderCloseUserId'
go

execute sp_addextendedproperty 'MS_Description', 
   '非直销业务费系数',
   'user', 'dbo', 'table', 't_order', 'column', 'operatorrate'
go

execute sp_addextendedproperty 'MS_Description', 
   '是否是年度合同',
   'user', 'dbo', 'table', 't_order', 'column', 'isyearlycontract'
go

execute sp_addextendedproperty 'MS_Description', 
   '第二个订单审核人',
   'user', 'dbo', 'table', 't_order', 'column', 'orderChecker2'
go

/*==============================================================*/
/* Table: t_org_orggorup                                        */
/*==============================================================*/
create table t_org_orggorup (
   id                   bigint               not null,
   groupid              bigint               null,
   finnerid             bigint               null,
   constraint PK_T_ORG_ORGGORUP primary key (id)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '客户,客户分组关系表',
   'user', @CurrentUser, 'table', 't_org_orggorup'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 't_org_orggorup', 'column', 'id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'groupid',
   'user', @CurrentUser, 'table', 't_org_orggorup', 'column', 'groupid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'finnerid',
   'user', @CurrentUser, 'table', 't_org_orggorup', 'column', 'finnerid'
go

/*==============================================================*/
/* Table: t_organization                                        */
/*==============================================================*/
create table t_organization (
   finnerid             bigint               identity,
   blocid               bigint               null,
   areaid               bigint               null,
   provinceid           bigint               null,
   fname                nvarchar(100)        null,
   fitemid              bigint               null,
   isvalid              integer              null,
   fnumber              nvarchar(50)         null,
   uplimit              int                  null default 5,
   contracts            int                  null,
   notes                nvarchar(255)        null,
   condition            nvarchar(255)        null,
   ismanual             int                  null,
   isdel                int                  null,
   createdate           datetime             null,
   constraint PK_T_ORGANIZATION primary key (finnerid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '客户表',
   'user', @CurrentUser, 'table', 't_organization'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'finnerid',
   'user', @CurrentUser, 'table', 't_organization', 'column', 'finnerid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'blocid',
   'user', @CurrentUser, 'table', 't_organization', 'column', 'blocid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'areaid',
   'user', @CurrentUser, 'table', 't_organization', 'column', 'areaid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'provinceid',
   'user', @CurrentUser, 'table', 't_organization', 'column', 'provinceid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '客户名称',
   'user', @CurrentUser, 'table', 't_organization', 'column', 'fname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '常州客户id',
   'user', @CurrentUser, 'table', 't_organization', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:有效',
   'user', @CurrentUser, 'table', 't_organization', 'column', 'isvalid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fnumber',
   'user', @CurrentUser, 'table', 't_organization', 'column', 'fnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '联系人上限',
   'user', @CurrentUser, 'table', 't_organization', 'column', 'uplimit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '已有联系人数量',
   'user', @CurrentUser, 'table', 't_organization', 'column', 'contracts'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '评标说明',
   'user', @CurrentUser, 'table', 't_organization', 'column', 'notes'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同条件',
   'user', @CurrentUser, 'table', 't_organization', 'column', 'condition'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0：手工，1：自动k3同步',
   'user', @CurrentUser, 'table', 't_organization', 'column', 'ismanual'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0:未删除，1:已删除',
   'user', @CurrentUser, 'table', 't_organization', 'column', 'isdel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建日期',
   'user', @CurrentUser, 'table', 't_organization', 'column', 'createdate'
go

/*==============================================================*/
/* Table: t_orggrantgroup                                       */
/*==============================================================*/
create table t_orggrantgroup (
   groupid              bigint               identity,
   groupname            nvarchar(50)         null,
   notes                nvarchar(255)        null,
   constraint PK_T_ORGGRANTGROUP primary key (groupid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '客户权限分组',
   'user', @CurrentUser, 'table', 't_orggrantgroup'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'groupid',
   'user', @CurrentUser, 'table', 't_orggrantgroup', 'column', 'groupid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'groupname',
   'user', @CurrentUser, 'table', 't_orggrantgroup', 'column', 'groupname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 't_orggrantgroup', 'column', 'notes'
go

/*==============================================================*/
/* Table: t_outlaypay                                           */
/*==============================================================*/
create table t_outlaypay (
   payid                bigint               identity,
   paydate              datetime             null,
   famount              decimal(20,10)       null,
   signin               bigint               null,
   lister               bigint               null,
   fyear                nvarchar(10)         null,
   fquarter             nvarchar(2)          null,
   mmanager             bigint               null,
   fmanager             bigint               null,
   gmanager             bigint               null,
   constraint PK_T_OUTLAYPAY primary key (payid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业务费支付表',
   'user', @CurrentUser, 'table', 't_outlaypay'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'payid',
   'user', @CurrentUser, 'table', 't_outlaypay', 'column', 'payid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '支付日期',
   'user', @CurrentUser, 'table', 't_outlaypay', 'column', 'paydate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '金额',
   'user', @CurrentUser, 'table', 't_outlaypay', 'column', 'famount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '签收人',
   'user', @CurrentUser, 'table', 't_outlaypay', 'column', 'signin'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '制表人',
   'user', @CurrentUser, 'table', 't_outlaypay', 'column', 'lister'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '年',
   'user', @CurrentUser, 'table', 't_outlaypay', 'column', 'fyear'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '季度',
   'user', @CurrentUser, 'table', 't_outlaypay', 'column', 'fquarter'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '营销部经理',
   'user', @CurrentUser, 'table', 't_outlaypay', 'column', 'mmanager'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '财务部经理',
   'user', @CurrentUser, 'table', 't_outlaypay', 'column', 'fmanager'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '总经理',
   'user', @CurrentUser, 'table', 't_outlaypay', 'column', 'gmanager'
go

/*==============================================================*/
/* Table: t_pdbase                                              */
/*==============================================================*/
create table t_pdbase (
   pdbaseid             bigint               identity,
   fyear                nvarchar(20)         null,
   salestypename        nvarchar(10)         null,
   adminId              bigint               null,
   flevel               int                  null,
   minamount            decimal(20,10)       null,
   maxamount            decimal(20,10)       null,
   poc                  decimal(20,10)       null,
   rewards              decimal(20,10)       null,
   overratio1           decimal(20,10)       null,
   backratio            decimal(20,10)       null,
   blanckratio          decimal(20,10)       null,
   remainratio          decimal(20,10)       null,
   createdate           datetime             null,
   provinceid           bigint               null,
   pratio               decimal(20,10)       null,
   pmsalesratio         decimal(10,4)        null,
   pmanagerratio        decimal(20,10)       null,
   createemp            bigint               null,
   prebonus             decimal(20,10)       null,
   fullbonus            decimal(20,10)       null,
   frestrict            int                  null,
   pl3000               decimal(10,4)        null,
   pl4200               decimal(10,4)        null,
   ssv3500              decimal(10,4)        null,
   pl2000               decimal(10,4)        null,
   companyratio         decimal(10,4)        null,
   kpis                 decimal(20,10)       null,
   fbase                decimal(10,4)        null,
   bratio               decimal(10,2)        null,
   constraint PK_T_PDBASE primary key (pdbaseid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售员产品基数设置',
   'user', @CurrentUser, 'table', 't_pdbase'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'pdbaseid',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'pdbaseid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设定年',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'fyear'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '产品销售类别',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'salestypename'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售员',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'adminId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '基数档',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'flevel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '小基数金额',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'minamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '大基数金额',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'maxamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业务费比例',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'poc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '奖励比例',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'rewards'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '超额奖比例',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'overratio1'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '单比回款比例',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'backratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '单比回款结算比例',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'blanckratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '全额回款剩余结算比例',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'remainratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'createdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '省份',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'provinceid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '省内个人比例',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'pratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售经理比例',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'pmsalesratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '省内区域经理比例',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'pmanagerratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'createemp'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'LNG收到预付款奖励',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'prebonus'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'LNG全额回款奖励',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'fullbonus'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'LNG奖励限定台数',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'frestrict'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL3000比例',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'pl3000'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL4200比例',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'pl4200'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SSV3500比例',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'ssv3500'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL2000比例',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'pl2000'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '公司比例',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'companyratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售签约指标',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'kpis'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '超额奖基数',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'fbase'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL奖折扣基数',
   'user', @CurrentUser, 'table', 't_pdbase', 'column', 'bratio'
go

/*==============================================================*/
/* Table: t_pdcategory                                          */
/*==============================================================*/
create table t_pdcategory (
   categoryid           bigint               identity,
   cname                nvarchar(50)         null,
   parentid             bigint               null,
   parentname           char(10)             null,
   levels               integer              null,
   content              nvarchar(200)        null,
   ftypeid              bigint               null,
   ccode                nvarchar(50)         null,
   constraint PK_T_PDCATEGORY primary key (categoryid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '产品类别',
   'user', @CurrentUser, 'table', 't_pdcategory'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'categoryid',
   'user', @CurrentUser, 'table', 't_pdcategory', 'column', 'categoryid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '类别名称',
   'user', @CurrentUser, 'table', 't_pdcategory', 'column', 'cname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'parentid',
   'user', @CurrentUser, 'table', 't_pdcategory', 'column', 'parentid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'parentname',
   'user', @CurrentUser, 'table', 't_pdcategory', 'column', 'parentname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'levels',
   'user', @CurrentUser, 'table', 't_pdcategory', 'column', 'levels'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'content',
   'user', @CurrentUser, 'table', 't_pdcategory', 'column', 'content'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '类别分类',
   'user', @CurrentUser, 'table', 't_pdcategory', 'column', 'ftypeid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '类别代码',
   'user', @CurrentUser, 'table', 't_pdcategory', 'column', 'ccode'
go

/*==============================================================*/
/* Table: t_pdparameter                                         */
/*==============================================================*/
create table t_pdparameter (
   paramid              bigint               identity,
   flevels              int                  null,
   parametername        nvarchar(100)        null,
   fparentid            bigint               null,
   seqno                integer              null,
   fdescript            nvarchar(200)        null,
   parametercode        nvarchar(50)         null,
   isshow               integer              null default 1,
   constraint PK_T_PDPARAMETER primary key (paramid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '产品参数',
   'user', @CurrentUser, 'table', 't_pdparameter'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'paramid',
   'user', @CurrentUser, 'table', 't_pdparameter', 'column', 'paramid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '级别',
   'user', @CurrentUser, 'table', 't_pdparameter', 'column', 'flevels'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数名称',
   'user', @CurrentUser, 'table', 't_pdparameter', 'column', 'parametername'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '父ID',
   'user', @CurrentUser, 'table', 't_pdparameter', 'column', 'fparentid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '顺序号',
   'user', @CurrentUser, 'table', 't_pdparameter', 'column', 'seqno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '说明',
   'user', @CurrentUser, 'table', 't_pdparameter', 'column', 'fdescript'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数编号',
   'user', @CurrentUser, 'table', 't_pdparameter', 'column', 'parametercode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0:否，1：是',
   'user', @CurrentUser, 'table', 't_pdparameter', 'column', 'isshow'
go

/*==============================================================*/
/* Table: t_per_fee                                             */
/*==============================================================*/
create table t_per_fee (
   perid                bigint               identity,
   fbillid              bigint               null,
   fempid               bigint               null,
   femployee            bigint               null,
   famount              decimal(20,4)        null,
   fratio               decimal(10,2)        null,
   ispay                integer              null,
   constraint PK_T_PER_FEE primary key (perid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业绩奖明细',
   'user', @CurrentUser, 'table', 't_per_fee'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业绩id',
   'user', @CurrentUser, 'table', 't_per_fee', 'column', 'perid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '应收款ID',
   'user', @CurrentUser, 'table', 't_per_fee', 'column', 'fbillid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '被奖职员',
   'user', @CurrentUser, 'table', 't_per_fee', 'column', 'fempid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '归属业务员',
   'user', @CurrentUser, 'table', 't_per_fee', 'column', 'femployee'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '金额',
   'user', @CurrentUser, 'table', 't_per_fee', 'column', 'famount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '个人比例',
   'user', @CurrentUser, 'table', 't_per_fee', 'column', 'fratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0:未支付,1:已支付',
   'user', @CurrentUser, 'table', 't_per_fee', 'column', 'ispay'
go

/*==============================================================*/
/* Table: t_performance                                         */
/*==============================================================*/
create table t_performance (
   pid                  bigint               identity,
   productId            bigint               null,
   salesman             bigint               null,
   balanceprice         decimal(20,10)       null,
   listprice            decimal(20,10)       null,
   ordercode            nvarchar(50)         null,
   salestype            nvarchar(10)         null,
   provinceid           bigint               null,
   servicecharge        decimal(20,10)       null,
   outlay               decimal(20,10)       null,
   discountrate         decimal(20,10)       null,
   fbase                decimal(10,4)        null,
   createdate           datetime             null,
   fmodel               nvarchar(20)         null,
   fquarter             int                  null,
   fyear                nvarchar(10)         null,
   contractcode         nvarchar(50)         null,
   pdcount              decimal(20,10)       null,
   blancea              decimal(20,10)       null,
   blanceb              decimal(20,10)       null,
   blancec              decimal(20,10)       null,
   blanced              decimal(20,10)       null,
   blancee              decimal(20,10)       null,
   overb                decimal(20,10)       null,
   overc                decimal(20,10)       null,
   overd                decimal(20,10)       null,
   overe                decimal(20,10)       null,
   outlaya              decimal(20,10)       null,
   outlayb              decimal(20,10)       null,
   outlayc              decimal(20,10)       null,
   outlayd              decimal(20,10)       null,
   outlaye              decimal(20,10)       null,
   plbonus              decimal(20,10)       null,
   operator             bigint               null,
   forderdate           datetime             null,
   productcode          nvarchar(200)        null,
   contractamount       decimal(20,4)        null,
   blancestatus         int                  null,
   outlaystatus         int                  null,
   ploroverstatus       int                  null,
   outlayrate           decimal(5,2)         null,
   blancerate           decimal(5,2)         null,
   overrate             decimal(5,2)         null,
   pratio               decimal(5,2)         null,
   constraint PK_T_PERFORMANCE primary key (pid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售季度业绩结算表',
   'user', @CurrentUser, 'table', 't_performance'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'pid',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'pid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'productId',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'productId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售员',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'salesman'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结算总额',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'balanceprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '列表总额',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'listprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单号',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'ordercode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '产品类别',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'salestype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '省份',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'provinceid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '服务费',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'servicecharge'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业务费',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'outlay'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '拆扣率',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'discountrate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '基数',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'fbase'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建日期',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'createdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '经销/直销',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'fmodel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '季度',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'fquarter'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '年',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'fyear'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同号',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'contractcode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '数量（LNG）',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'pdcount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'A类业绩奖',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'blancea'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'B类业绩奖',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'blanceb'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'C类业绩奖',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'blancec'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'D类业绩奖',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'blanced'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'E类业绩奖',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'blancee'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'B类超额奖',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'overb'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'C类超额奖',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'overc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'D类超额奖',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'overd'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'E类超额奖',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'overe'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'A类业务费',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'outlaya'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'B类业务费',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'outlayb'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'C类业务费',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'outlayc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'D类业务费',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'outlayd'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'E类业务费',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'outlaye'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'pl奖',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'plbonus'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '归属业务员',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'operator'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单日期',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'forderdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '产品编码',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'productcode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同额',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'contractamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业绩奖状态',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'blancestatus'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业务费状态',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'outlaystatus'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'pl或者超额奖状态',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'ploroverstatus'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业务费比例',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'outlayrate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '奖励比例',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'blancerate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '超额奖比例',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'overrate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '个人比例',
   'user', @CurrentUser, 'table', 't_performance', 'column', 'pratio'
go

/*==============================================================*/
/* Table: t_performance_detail                                  */
/*==============================================================*/
create table t_performance_detail (
   detailid             bigint               not null,
   forderno             nvarchar(50)         null,
   fcontractno          nvarchar(50)         null,
   productid            bigint               null,
   refundid             bigint               null,
   achrewardtype        nvarchar(1)          null,
   achrewardamount      decmial(10,2)        null,
   excrewardtype        nvarchar(1)          null,
   excrewardamount      decmial(10,2)        null,
   servicefeetype       nvarchar(1)          null,
   servicefeeamount     decmial(10,2)        null,
   ispl                 int                  null,
   plamount             decmial(10,2)        null,
   isspecial            int                  null,
   specialamount        decmial(10,2)        null,
   isdebit              int                  null,
   debitamount          decmial(10,2)        null,
   salerid              bigint               null,
   belongsaleid         bigint               null,
   createtime           datetime             null,
   fyear                int                  null,
   fquarter             int                  null,
   constraint PK_T_PERFORMANCE_DETAIL primary key (detailid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '奖励明细表',
   'user', @CurrentUser, 'table', 't_performance_detail'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'detailid',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'detailid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单编号',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'forderno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同编号',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'fcontractno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '源单ID',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'productid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '回款单源单号',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'refundid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业绩奖类型',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'achrewardtype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业绩奖金额',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'achrewardamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '超额奖类型',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'excrewardtype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '超额奖金额',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'excrewardamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业务费类型',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'servicefeetype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业务费金额',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'servicefeeamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否有pl奖',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'ispl'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'pl奖金额',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'plamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否有特殊奖励',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'isspecial'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '特殊奖励金额',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'specialamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否有扣款',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'isdebit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '扣款金额',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'debitamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业务员',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'salerid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '归属业务员',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'belongsaleid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'createtime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '年',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'fyear'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '季度',
   'user', @CurrentUser, 'table', 't_performance_detail', 'column', 'fquarter'
go

/*==============================================================*/
/* Table: t_pl                                                  */
/*==============================================================*/
create table t_pl (
   plid                 bigint               identity,
   fyear                nvarchar(10)         null,
   fquarter             nvarchar(5)          null,
   ordercode            nvarchar(50)         null,
   adminid              bigint               null,
   pl3000               decimal(20,10)       null,
   pl4200               decimal(20,10)       null,
   ssv3500              decimal(20,10)       null,
   spl2000              decimal(20,10)       null,
   constraint PK_T_PL primary key (plid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL奖',
   'user', @CurrentUser, 'table', 't_pl'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'plid',
   'user', @CurrentUser, 'table', 't_pl', 'column', 'plid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '年',
   'user', @CurrentUser, 'table', 't_pl', 'column', 'fyear'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '季度',
   'user', @CurrentUser, 'table', 't_pl', 'column', 'fquarter'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单号',
   'user', @CurrentUser, 'table', 't_pl', 'column', 'ordercode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售员',
   'user', @CurrentUser, 'table', 't_pl', 'column', 'adminid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'pl3000',
   'user', @CurrentUser, 'table', 't_pl', 'column', 'pl3000'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'pl4200',
   'user', @CurrentUser, 'table', 't_pl', 'column', 'pl4200'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ssv3500',
   'user', @CurrentUser, 'table', 't_pl', 'column', 'ssv3500'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'spl2000',
   'user', @CurrentUser, 'table', 't_pl', 'column', 'spl2000'
go

/*==============================================================*/
/* Table: t_plratio                                             */
/*==============================================================*/
create table t_plratio (
   ratioid              bigint               identity,
   salesid              bigint               null,
   PL4200               decimal(20,10)       null,
   PL3000               decimal(20,10)       null,
   SSV3500              decimal(20,10)       null,
   PL2000               decimal(20,10)       null,
   bratio               decimal(10,4)        null,
   fyear                nvarchar(10)         null,
   selfratio            decimal(20,10)       null,
   salesmanagerratio    decimal(20,10)       null,
   regionmanagerratio   decimal(20,10)       null,
   companyratio         decimal(20,10)       null,
   constraint PK_T_PLRATIO primary key (ratioid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL奖比例设置',
   'user', @CurrentUser, 'table', 't_plratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ratioid',
   'user', @CurrentUser, 'table', 't_plratio', 'column', 'ratioid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售员',
   'user', @CurrentUser, 'table', 't_plratio', 'column', 'salesid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL4200',
   'user', @CurrentUser, 'table', 't_plratio', 'column', 'PL4200'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL3000',
   'user', @CurrentUser, 'table', 't_plratio', 'column', 'PL3000'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SSV3500',
   'user', @CurrentUser, 'table', 't_plratio', 'column', 'SSV3500'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL2000',
   'user', @CurrentUser, 'table', 't_plratio', 'column', 'PL2000'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '折扣比例基数',
   'user', @CurrentUser, 'table', 't_plratio', 'column', 'bratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '年',
   'user', @CurrentUser, 'table', 't_plratio', 'column', 'fyear'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '个人比例',
   'user', @CurrentUser, 'table', 't_plratio', 'column', 'selfratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售经理比例',
   'user', @CurrentUser, 'table', 't_plratio', 'column', 'salesmanagerratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '区域经理比例',
   'user', @CurrentUser, 'table', 't_plratio', 'column', 'regionmanagerratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '公司比例',
   'user', @CurrentUser, 'table', 't_plratio', 'column', 'companyratio'
go

/*==============================================================*/
/* Table: t_pm                                                  */
/*==============================================================*/
create table t_pm (
   pmid                 bigint               not null,
   deviceid             bigint               null,
   engineerid           bigint               null,
   finterid             bigint               null,
   finnerid             bigint               null,
   pmname               nvarchar(50)         null,
   manger               nvarchar(50)         null,
   planamount           decimal(20,10)       null,
   plandate             nvarchar(20)         null,
   amount               decimal(20,10)       null,
   engineer             bigint               null,
   code                 nvarchar(50)         null,
   analyze              nvarchar(300)        null,
   notes                nvarchar(300)        null,
   proxy                nvarchar(50)         null,
   createdate           nvarchar(50)         null,
   saleempid            bigint               null,
   saleemp              nvarchar(50)         null,
   lastmanageremp       nvarchar(50)         null,
   lastdate             datetime             null,
   createemp            bigint               null,
   bistatus             int                  null,
   prostatus            int                  null,
   constraint PK_T_PM primary key (pmid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目表',
   'user', @CurrentUser, 'table', 't_pm'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'pmid',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'pmid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '关键设备',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'deviceid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设计师',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'engineerid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设计院',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'finterid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '客户',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'finnerid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目名称',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'pmname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目负责人',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'manger'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '预计合同额',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'planamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '预计采购时间',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'plandate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '实际采购额',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'amount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目工程师',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'engineer'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '招标编号',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'code'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '投标分析',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'analyze'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注信息',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'notes'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '招标代理',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'proxy'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建日期',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'createdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售负责人id',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'saleempid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售负责人',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'saleemp'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后维护人',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'lastmanageremp'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后维护时间',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'lastdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '提交人',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'createemp'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0:未招标,1:已招标',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'bistatus'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0：未招标，1：已招标',
   'user', @CurrentUser, 'table', 't_pm', 'column', 'prostatus'
go

/*==============================================================*/
/* Table: t_pm_competitor                                       */
/*==============================================================*/
create table t_pm_competitor (
   pcid                 bigint               not null,
   pmid                 bigint               null,
   competitorid         bigint               null,
   sectionid            bigint               null,
   constraint PK_T_PM_COMPETITOR primary key (pcid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目竞争对手',
   'user', @CurrentUser, 'table', 't_pm_competitor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'pcid',
   'user', @CurrentUser, 'table', 't_pm_competitor', 'column', 'pcid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'pmid',
   'user', @CurrentUser, 'table', 't_pm_competitor', 'column', 'pmid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'competitorid',
   'user', @CurrentUser, 'table', 't_pm_competitor', 'column', 'competitorid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'sectionid',
   'user', @CurrentUser, 'table', 't_pm_competitor', 'column', 'sectionid'
go

/*==============================================================*/
/* Table: t_pm_section                                          */
/*==============================================================*/
create table t_pm_section (
   sectionid            bigint               identity,
   pmid                 bigint               null,
   deviceid             bigint               null,
   planamount           decimal(20,10)       null,
   code                 nvarchar(50)         null,
   amount               decimal(20,10)       null,
   analyze              nvarchar(300)        null,
   notes                nvarchar(300)        null,
   lastmanageremp       nvarchar(50)         null,
   lastdate             datetime             null,
   bistatus             int                  null,
   finterid             bigint               null,
   plandate             nvarchar(50)         null,
   engineer             bigint               null,
   manager              nvarchar(50)         null,
   proxy                nvarchar(50)         null,
   createdate           datetime             null default getdate(),
   sectionname          nvarchar(50)         null,
   constraint PK_T_PM_SECTION primary key (sectionid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目标段',
   'user', @CurrentUser, 'table', 't_pm_section'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'sectionid',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'sectionid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'pmid',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'pmid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '关键设备',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'deviceid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '预计合同金额',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'planamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '招标编码',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'code'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '实际采购金额',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'amount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '投标分析',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'analyze'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注信息',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'notes'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后维护人',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'lastmanageremp'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最后维护时间',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'lastdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '招标状态',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'bistatus'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设计师',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'finterid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '预计采购时间',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'plandate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目工程师',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'engineer'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目负责人',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'manager'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '招标代理',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'proxy'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'createdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '标段名',
   'user', @CurrentUser, 'table', 't_pm_section', 'column', 'sectionname'
go

/*==============================================================*/
/* Table: t_pro_item                                            */
/*==============================================================*/
create table t_pro_item (
   aid                  bigint               identity,
   fitemid              bigint               null,
   itemcode             nvarchar(100)        null,
   itemname             nvarchar(300)        null,
   fmode                nvarchar(200)        null,
   fdescript            nvarchar(500)        null,
   flevel               nvarchar(100)        null,
   fmaker               nvarchar(100)        null,
   srcarea              nvarchar(200)        null,
   buyamount            decimal(20,4)        null,
   avgamount            decimal(20,4)        null,
   rpamount             decimal(20,4)        null,
   costamount           decimal(20,4)        null,
   listamount           decimal(20,4)        null,
   fshortname           nvarchar(100)        null
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目物料表',
   'user', @CurrentUser, 'table', 't_pro_item'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '自增ID',
   'user', @CurrentUser, 'table', 't_pro_item', 'column', 'aid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料内码',
   'user', @CurrentUser, 'table', 't_pro_item', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料代码',
   'user', @CurrentUser, 'table', 't_pro_item', 'column', 'itemcode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料名称',
   'user', @CurrentUser, 'table', 't_pro_item', 'column', 'itemname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '规格型号',
   'user', @CurrentUser, 'table', 't_pro_item', 'column', 'fmode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '性能描述',
   'user', @CurrentUser, 'table', 't_pro_item', 'column', 'fdescript'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '压力等级',
   'user', @CurrentUser, 'table', 't_pro_item', 'column', 'flevel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '制造商',
   'user', @CurrentUser, 'table', 't_pro_item', 'column', 'fmaker'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '原产地',
   'user', @CurrentUser, 'table', 't_pro_item', 'column', 'srcarea'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最近采购价',
   'user', @CurrentUser, 'table', 't_pro_item', 'column', 'buyamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '三年的平均采购价',
   'user', @CurrentUser, 'table', 't_pro_item', 'column', 'avgamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参考价',
   'user', @CurrentUser, 'table', 't_pro_item', 'column', 'rpamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '指定成本价',
   'user', @CurrentUser, 'table', 't_pro_item', 'column', 'costamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '列表价',
   'user', @CurrentUser, 'table', 't_pro_item', 'column', 'listamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '制造商简称',
   'user', @CurrentUser, 'table', 't_pro_item', 'column', 'fshortname'
go

/*==============================================================*/
/* Table: t_product                                             */
/*==============================================================*/
create table dbo.t_product (
   productId            bigint               identity,
   productName          varchar(200)         null,
   orderCode            varchar(256)         not null,
   specifications       varchar(256)         null,
   productCount         decimal(20,10)       null,
   productType          varchar(50)          null,
   unitPrice            decimal(20,10)       null,
   discount             decimal(20,10)       null,
   totalFee             decimal(20,10)       null,
   deliveryTime         date                 null,
   productVersion       varchar(6)           null,
   baseUnitName         varchar(256)         null,
   baseUnitCount        int                  null,
   productUnit          varchar(50)          null,
   productCode          varchar(500)         null,
   productAssistCount   numdecimal(20,10)eric(18,6) null,
   unitRemoveTax        decimal(20,10)       null,
   convertRate          decimal(20,10)       null,
   taxRate              decimal(20,10)       null,
   discountRate         decimal(20,10)       null,
   factUnitPrice        decimal(20,10)       null,
   saleTax              decimal(20,10)       null,
   priceTaxTotal        decimal(20,10)       null,
   priceTaxTotalRM      decimal(20,10)       null,
   makeNumberCode       varchar(50)          null,
   taskCode             varchar(50)          null,
   referCount           decimal(20,10)       null,
   assistUnitReferCount decimal(20,10)       null,
   assistUnitOutHouseCount decimal(20,10)       null,
   outHouseCount        decimal(20,10)       null,
   customBOM            varchar(50)          null,
   costObj              varchar(50)          null,
   addOrDel             int                  null,
   lockHouseMark        int                  null,
   adviceDeliveryTime   date                 null,
   sourceOrderCode      varchar(50)          null,
   sourceOrderType      varchar(50)          null,
   sourceOrderInnerCode varchar(256)         null,
   sourceOrderSplit     varchar(50)          null,
   contactCode          varchar(50)          null,
   contactInnerCode     varchar(256)         null,
   contactSplit         varchar(50)          null,
   billCount            decimal(20,10)       null,
   customOrderCode      varchar(50)          null,
   assistCompanyBillCount decimal(20,10)       null,
   assistCompanyFitCount decimal(20,10)       null,
   orderTrNumber        int                  null,
   baseCompanyFitCount  decimal(20,10)       null,
   fitCount             decimal(20,10)       null,
   assistAttributeType  varchar(50)          null,
   markForMRP           varchar(50)          null,
   markIsForMRP         int                  null,
   collectPayReferFee   decimal(20,10)       null,
   qualityFeeRate       decimal(20,10)       null,
   qualityFee           decimal(20,10)       null,
   material             varchar(50)          null,
   outSaleName          varchar(50)          null,
   proProjectName       varchar(50)          null,
   assistAttribute      varchar(50)          null,
   excuteStandard       varchar(50)          null,
   assistUnit           varchar(50)          null,
   remarks              varchar(500)         null,
   formatno             nvarchar(200)        null,
   servicecharge        decimal(20,10)       null,
   listprice            decimal(20,10)       null,
   balanceprice         decimal(20,10)       null,
   salefee              decimal(20, 10)      null,
   fdiscountrate        decimal(20,10)       null,
   measureunitname      nvarchar(20)         null,
   materialname         nvarchar(200)        null,
   balancefee           decimal(20, 10)      null,
   fbusinessdiscount    decimal(20,10)       null,
   ftax                 decimal(20,10)       null,
   ftaxprice            decimal(20,10)       null,
   famountfor           decimal(20,10)       null,
   ispl                 int                  null,
   constraint PK_T_PRODUCT primary key (productId)
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   't_product',
   'user', 'dbo', 'table', 't_product'
go

execute sp_addextendedproperty 'MS_Description', 
   'productId',
   'user', 'dbo', 'table', 't_product', 'column', 'productId'
go

execute sp_addextendedproperty 'MS_Description', 
   '产品名称',
   'user', 'dbo', 'table', 't_product', 'column', 'productName'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单编号',
   'user', 'dbo', 'table', 't_product', 'column', 'orderCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '产品规格',
   'user', 'dbo', 'table', 't_product', 'column', 'specifications'
go

execute sp_addextendedproperty 'MS_Description', 
   '产品数量',
   'user', 'dbo', 'table', 't_product', 'column', 'productCount'
go

execute sp_addextendedproperty 'MS_Description', 
   '产品分类',
   'user', 'dbo', 'table', 't_product', 'column', 'productType'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售单价',
   'user', 'dbo', 'table', 't_product', 'column', 'unitPrice'
go

execute sp_addextendedproperty 'MS_Description', 
   '折扣',
   'user', 'dbo', 'table', 't_product', 'column', 'discount'
go

execute sp_addextendedproperty 'MS_Description', 
   '含税金额',
   'user', 'dbo', 'table', 't_product', 'column', 'totalFee'
go

execute sp_addextendedproperty 'MS_Description', 
   '交货时间',
   'user', 'dbo', 'table', 't_product', 'column', 'deliveryTime'
go

execute sp_addextendedproperty 'MS_Description', 
   '版本号',
   'user', 'dbo', 'table', 't_product', 'column', 'productVersion'
go

execute sp_addextendedproperty 'MS_Description', 
   '基本单位名称',
   'user', 'dbo', 'table', 't_product', 'column', 'baseUnitName'
go

execute sp_addextendedproperty 'MS_Description', 
   '基本单位数量',
   'user', 'dbo', 'table', 't_product', 'column', 'baseUnitCount'
go

execute sp_addextendedproperty 'MS_Description', 
   '单位',
   'user', 'dbo', 'table', 't_product', 'column', 'productUnit'
go

execute sp_addextendedproperty 'MS_Description', 
   '产品代码',
   'user', 'dbo', 'table', 't_product', 'column', 'productCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '辅助数量',
   'user', 'dbo', 'table', 't_product', 'column', 'productAssistCount'
go

execute sp_addextendedproperty 'MS_Description', 
   '单价(不含税)',
   'user', 'dbo', 'table', 't_product', 'column', 'unitRemoveTax'
go

execute sp_addextendedproperty 'MS_Description', 
   '换算率',
   'user', 'dbo', 'table', 't_product', 'column', 'convertRate'
go

execute sp_addextendedproperty 'MS_Description', 
   '税率',
   'user', 'dbo', 'table', 't_product', 'column', 'taxRate'
go

execute sp_addextendedproperty 'MS_Description', 
   '折扣率',
   'user', 'dbo', 'table', 't_product', 'column', 'discountRate'
go

execute sp_addextendedproperty 'MS_Description', 
   '实际含税单价',
   'user', 'dbo', 'table', 't_product', 'column', 'factUnitPrice'
go

execute sp_addextendedproperty 'MS_Description', 
   '销项税额',
   'user', 'dbo', 'table', 't_product', 'column', 'saleTax'
go

execute sp_addextendedproperty 'MS_Description', 
   '价税合计(合同额/销售金额)',
   'user', 'dbo', 'table', 't_product', 'column', 'priceTaxTotal'
go

execute sp_addextendedproperty 'MS_Description', 
   '价税合计(本位币)',
   'user', 'dbo', 'table', 't_product', 'column', 'priceTaxTotalRM'
go

execute sp_addextendedproperty 'MS_Description', 
   '制令号',
   'user', 'dbo', 'table', 't_product', 'column', 'makeNumberCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '任务单号',
   'user', 'dbo', 'table', 't_product', 'column', 'taskCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '关联数量',
   'user', 'dbo', 'table', 't_product', 'column', 'referCount'
go

execute sp_addextendedproperty 'MS_Description', 
   '辅助单位关联数量',
   'user', 'dbo', 'table', 't_product', 'column', 'assistUnitReferCount'
go

execute sp_addextendedproperty 'MS_Description', 
   '辅助单位出库数量',
   'user', 'dbo', 'table', 't_product', 'column', 'assistUnitOutHouseCount'
go

execute sp_addextendedproperty 'MS_Description', 
   '出库数量',
   'user', 'dbo', 'table', 't_product', 'column', 'outHouseCount'
go

execute sp_addextendedproperty 'MS_Description', 
   '客户BOM',
   'user', 'dbo', 'table', 't_product', 'column', 'customBOM'
go

execute sp_addextendedproperty 'MS_Description', 
   '成本对象',
   'user', 'dbo', 'table', 't_product', 'column', 'costObj'
go

execute sp_addextendedproperty 'MS_Description', 
   '是否冲减',
   'user', 'dbo', 'table', 't_product', 'column', 'addOrDel'
go

execute sp_addextendedproperty 'MS_Description', 
   '锁库标志',
   'user', 'dbo', 'table', 't_product', 'column', 'lockHouseMark'
go

execute sp_addextendedproperty 'MS_Description', 
   '建议交货日期',
   'user', 'dbo', 'table', 't_product', 'column', 'adviceDeliveryTime'
go

execute sp_addextendedproperty 'MS_Description', 
   '源单单号',
   'user', 'dbo', 'table', 't_product', 'column', 'sourceOrderCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '源单类型',
   'user', 'dbo', 'table', 't_product', 'column', 'sourceOrderType'
go

execute sp_addextendedproperty 'MS_Description', 
   '源单内码',
   'user', 'dbo', 'table', 't_product', 'column', 'sourceOrderInnerCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '源单分录',
   'user', 'dbo', 'table', 't_product', 'column', 'sourceOrderSplit'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同编码',
   'user', 'dbo', 'table', 't_product', 'column', 'contactCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同内码',
   'user', 'dbo', 'table', 't_product', 'column', 'contactInnerCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同分录',
   'user', 'dbo', 'table', 't_product', 'column', 'contactSplit'
go

execute sp_addextendedproperty 'MS_Description', 
   '开票数量',
   'user', 'dbo', 'table', 't_product', 'column', 'billCount'
go

execute sp_addextendedproperty 'MS_Description', 
   '客户订单号',
   'user', 'dbo', 'table', 't_product', 'column', 'customOrderCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '辅助单位开票数量',
   'user', 'dbo', 'table', 't_product', 'column', 'assistCompanyBillCount'
go

execute sp_addextendedproperty 'MS_Description', 
   '辅助单位组装数量',
   'user', 'dbo', 'table', 't_product', 'column', 'assistCompanyFitCount'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单行号',
   'user', 'dbo', 'table', 't_product', 'column', 'orderTrNumber'
go

execute sp_addextendedproperty 'MS_Description', 
   '基本单位组装数量',
   'user', 'dbo', 'table', 't_product', 'column', 'baseCompanyFitCount'
go

execute sp_addextendedproperty 'MS_Description', 
   '组装数量',
   'user', 'dbo', 'table', 't_product', 'column', 'fitCount'
go

execute sp_addextendedproperty 'MS_Description', 
   '辅助属性类别',
   'user', 'dbo', 'table', 't_product', 'column', 'assistAttributeType'
go

execute sp_addextendedproperty 'MS_Description', 
   'MRP计算标记',
   'user', 'dbo', 'table', 't_product', 'column', 'markForMRP'
go

execute sp_addextendedproperty 'MS_Description', 
   'MRP是否计算标记',
   'user', 'dbo', 'table', 't_product', 'column', 'markIsForMRP'
go

execute sp_addextendedproperty 'MS_Description', 
   '收款关联金额',
   'user', 'dbo', 'table', 't_product', 'column', 'collectPayReferFee'
go

execute sp_addextendedproperty 'MS_Description', 
   '质保金率(%)',
   'user', 'dbo', 'table', 't_product', 'column', 'qualityFeeRate'
go

execute sp_addextendedproperty 'MS_Description', 
   '质保金',
   'user', 'dbo', 'table', 't_product', 'column', 'qualityFee'
go

execute sp_addextendedproperty 'MS_Description', 
   '材质',
   'user', 'dbo', 'table', 't_product', 'column', 'material'
go

execute sp_addextendedproperty 'MS_Description', 
   '对外销售名称',
   'user', 'dbo', 'table', 't_product', 'column', 'outSaleName'
go

execute sp_addextendedproperty 'MS_Description', 
   '项目名称',
   'user', 'dbo', 'table', 't_product', 'column', 'proProjectName'
go

execute sp_addextendedproperty 'MS_Description', 
   '辅助属性',
   'user', 'dbo', 'table', 't_product', 'column', 'assistAttribute'
go

execute sp_addextendedproperty 'MS_Description', 
   '执行标准',
   'user', 'dbo', 'table', 't_product', 'column', 'excuteStandard'
go

execute sp_addextendedproperty 'MS_Description', 
   '辅助单位',
   'user', 'dbo', 'table', 't_product', 'column', 'assistUnit'
go

execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', 'dbo', 'table', 't_product', 'column', 'remarks'
go

execute sp_addextendedproperty 'MS_Description', 
   'formatno',
   'user', 'dbo', 'table', 't_product', 'column', 'formatno'
go

execute sp_addextendedproperty 'MS_Description', 
   '服务费',
   'user', 'dbo', 'table', 't_product', 'column', 'servicecharge'
go

execute sp_addextendedproperty 'MS_Description', 
   '列表价',
   'user', 'dbo', 'table', 't_product', 'column', 'listprice'
go

execute sp_addextendedproperty 'MS_Description', 
   '结算价',
   'user', 'dbo', 'table', 't_product', 'column', 'balanceprice'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售金额',
   'user', 'dbo', 'table', 't_product', 'column', 'salefee'
go

execute sp_addextendedproperty 'MS_Description', 
   'k3折扣率',
   'user', 'dbo', 'table', 't_product', 'column', 'fdiscountrate'
go

execute sp_addextendedproperty 'MS_Description', 
   '计量单位名',
   'user', 'dbo', 'table', 't_product', 'column', 'measureunitname'
go

execute sp_addextendedproperty 'MS_Description', 
   '材质名',
   'user', 'dbo', 'table', 't_product', 'column', 'materialname'
go

execute sp_addextendedproperty 'MS_Description', 
   '结算金额',
   'user', 'dbo', 'table', 't_product', 'column', 'balancefee'
go

execute sp_addextendedproperty 'MS_Description', 
   '折扣额(本位币)',
   'user', 'dbo', 'table', 't_product', 'column', 'fbusinessdiscount'
go

execute sp_addextendedproperty 'MS_Description', 
   '税额(本币)',
   'user', 'dbo', 'table', 't_product', 'column', 'ftax'
go

execute sp_addextendedproperty 'MS_Description', 
   '含税单价(本币)',
   'user', 'dbo', 'table', 't_product', 'column', 'ftaxprice'
go

execute sp_addextendedproperty 'MS_Description', 
   '金额(本币)',
   'user', 'dbo', 'table', 't_product', 'column', 'famountfor'
go

execute sp_addextendedproperty 'MS_Description', 
   '0:否，1：是',
   'user', 'dbo', 'table', 't_product', 'column', 'ispl'
go

/*==============================================================*/
/* Table: t_product_history                                     */
/*==============================================================*/
create table dbo.t_product_history (
   productId            bigint               identity,
   productName          varchar(200)         null,
   orderCode            varchar(256)         not null,
   specifications       varchar(256)         null,
   productCount         int                  null,
   productType          varchar(50)          null,
   unitPrice            bigint               null,
   discount             int                  null,
   totalFee             bigint               null,
   deliveryTime         date                 null,
   productVersion       varchar(6)           null,
   baseUnitName         varchar(256)         null,
   baseUnitCount        int                  null,
   productUnit          varchar(50)          null,
   productCode          varchar(500)         null,
   productAssistCount   numeric(18,16)       null,
   unitRemoveTax        numeric(18,6)        null,
   convertRate          numeric(18,6)        null,
   taxRate              numeric(18,6)        null,
   discountRate         numeric(18,6)        null,
   factUnitPrice        numeric(18,6)        null,
   saleTax              numeric(18,6)        null,
   priceTaxTotal        numeric(18,6)        null,
   makeNumberCode       varchar(50)          null,
   taskCode             varchar(50)          null,
   referCount           int                  null,
   assistUnitReferCount int                  null,
   assistUnitOutHouseCount int                  null,
   outHouseCount        int                  null,
   customBOM            varchar(50)          null,
   costObj              varchar(50)          null,
   addOrDel             int                  null,
   lockHouseMark        int                  null,
   adviceDeliveryTime   date                 null,
   sourceOrderCode      varchar(50)          null,
   sourceOrderType      varchar(50)          null,
   sourceOrderInnerCode varchar(256)         null,
   sourceOrderSplit     varchar(50)          null,
   contactCode          varchar(50)          null,
   contactInnerCode     varchar(256)         null,
   contactSplit         varchar(50)          null,
   billCount            int                  null,
   customOrderCode      varchar(50)          null,
   assistCompanyBillCount int                  null,
   assistCompanyFitCount int                  null,
   orderTrNumber        int                  null,
   baseCompanyFitCount  int                  null,
   fitCount             int                  null,
   assistAttributeType  varchar(50)          null,
   priceTaxTotalRM      numeric(18,6)        null,
   markForMRP           varchar(50)          null,
   markIsForMRP         int                  null,
   collectPayReferFee   bigint               null,
   qualityFeeRate       numeric(18,6)        null,
   qualityFee           numeric(18,6)        null,
   material             varchar(50)          null,
   outSaleName          varchar(50)          null,
   proProjectName       varchar(50)          null,
   assistAttribute      varchar(50)          null,
   excuteStandard       varchar(50)          null,
   assistUnit           varchar(50)          null,
   remarks              varchar(50)          null,
   servicecharge        decimal(20, 10)      null,
   listprice            decimal(20, 10)      null,
   balanceprice         decimal(20, 10)      null,
   salefee              decimal(20, 10)      null,
   measureunitname      nvarchar(20)         null,
   materialname         nvarchar(200)        null,
   fdiscountrate        decimal(20, 10)      null,
   balancefee           decimal(20, 10)      null,
   fbusinessdiscount    char(10)             null,
   ftax                 char(10)             null,
   ftaxprice            char(10)             null,
   famountfor           char(10)             null
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   't_product_history',
   'user', 'dbo', 'table', 't_product_history'
go

execute sp_addextendedproperty 'MS_Description', 
   'productId',
   'user', 'dbo', 'table', 't_product_history', 'column', 'productId'
go

execute sp_addextendedproperty 'MS_Description', 
   'productName',
   'user', 'dbo', 'table', 't_product_history', 'column', 'productName'
go

execute sp_addextendedproperty 'MS_Description', 
   'orderCode',
   'user', 'dbo', 'table', 't_product_history', 'column', 'orderCode'
go

execute sp_addextendedproperty 'MS_Description', 
   'specifications',
   'user', 'dbo', 'table', 't_product_history', 'column', 'specifications'
go

execute sp_addextendedproperty 'MS_Description', 
   'productCount',
   'user', 'dbo', 'table', 't_product_history', 'column', 'productCount'
go

execute sp_addextendedproperty 'MS_Description', 
   'productType',
   'user', 'dbo', 'table', 't_product_history', 'column', 'productType'
go

execute sp_addextendedproperty 'MS_Description', 
   'unitPrice',
   'user', 'dbo', 'table', 't_product_history', 'column', 'unitPrice'
go

execute sp_addextendedproperty 'MS_Description', 
   'discount',
   'user', 'dbo', 'table', 't_product_history', 'column', 'discount'
go

execute sp_addextendedproperty 'MS_Description', 
   'totalFee',
   'user', 'dbo', 'table', 't_product_history', 'column', 'totalFee'
go

execute sp_addextendedproperty 'MS_Description', 
   'deliveryTime',
   'user', 'dbo', 'table', 't_product_history', 'column', 'deliveryTime'
go

execute sp_addextendedproperty 'MS_Description', 
   'productVersion',
   'user', 'dbo', 'table', 't_product_history', 'column', 'productVersion'
go

execute sp_addextendedproperty 'MS_Description', 
   'baseUnitName',
   'user', 'dbo', 'table', 't_product_history', 'column', 'baseUnitName'
go

execute sp_addextendedproperty 'MS_Description', 
   'baseUnitCount',
   'user', 'dbo', 'table', 't_product_history', 'column', 'baseUnitCount'
go

execute sp_addextendedproperty 'MS_Description', 
   'productUnit',
   'user', 'dbo', 'table', 't_product_history', 'column', 'productUnit'
go

execute sp_addextendedproperty 'MS_Description', 
   'productCode',
   'user', 'dbo', 'table', 't_product_history', 'column', 'productCode'
go

execute sp_addextendedproperty 'MS_Description', 
   'productAssistCount',
   'user', 'dbo', 'table', 't_product_history', 'column', 'productAssistCount'
go

execute sp_addextendedproperty 'MS_Description', 
   'unitRemoveTax',
   'user', 'dbo', 'table', 't_product_history', 'column', 'unitRemoveTax'
go

execute sp_addextendedproperty 'MS_Description', 
   'convertRate',
   'user', 'dbo', 'table', 't_product_history', 'column', 'convertRate'
go

execute sp_addextendedproperty 'MS_Description', 
   'taxRate',
   'user', 'dbo', 'table', 't_product_history', 'column', 'taxRate'
go

execute sp_addextendedproperty 'MS_Description', 
   'discountRate',
   'user', 'dbo', 'table', 't_product_history', 'column', 'discountRate'
go

execute sp_addextendedproperty 'MS_Description', 
   'factUnitPrice',
   'user', 'dbo', 'table', 't_product_history', 'column', 'factUnitPrice'
go

execute sp_addextendedproperty 'MS_Description', 
   'saleTax',
   'user', 'dbo', 'table', 't_product_history', 'column', 'saleTax'
go

execute sp_addextendedproperty 'MS_Description', 
   'priceTaxTotal',
   'user', 'dbo', 'table', 't_product_history', 'column', 'priceTaxTotal'
go

execute sp_addextendedproperty 'MS_Description', 
   'makeNumberCode',
   'user', 'dbo', 'table', 't_product_history', 'column', 'makeNumberCode'
go

execute sp_addextendedproperty 'MS_Description', 
   'taskCode',
   'user', 'dbo', 'table', 't_product_history', 'column', 'taskCode'
go

execute sp_addextendedproperty 'MS_Description', 
   'referCount',
   'user', 'dbo', 'table', 't_product_history', 'column', 'referCount'
go

execute sp_addextendedproperty 'MS_Description', 
   'assistUnitReferCount',
   'user', 'dbo', 'table', 't_product_history', 'column', 'assistUnitReferCount'
go

execute sp_addextendedproperty 'MS_Description', 
   'assistUnitOutHouseCount',
   'user', 'dbo', 'table', 't_product_history', 'column', 'assistUnitOutHouseCount'
go

execute sp_addextendedproperty 'MS_Description', 
   'outHouseCount',
   'user', 'dbo', 'table', 't_product_history', 'column', 'outHouseCount'
go

execute sp_addextendedproperty 'MS_Description', 
   'customBOM',
   'user', 'dbo', 'table', 't_product_history', 'column', 'customBOM'
go

execute sp_addextendedproperty 'MS_Description', 
   'costObj',
   'user', 'dbo', 'table', 't_product_history', 'column', 'costObj'
go

execute sp_addextendedproperty 'MS_Description', 
   'addOrDel',
   'user', 'dbo', 'table', 't_product_history', 'column', 'addOrDel'
go

execute sp_addextendedproperty 'MS_Description', 
   'lockHouseMark',
   'user', 'dbo', 'table', 't_product_history', 'column', 'lockHouseMark'
go

execute sp_addextendedproperty 'MS_Description', 
   'adviceDeliveryTime',
   'user', 'dbo', 'table', 't_product_history', 'column', 'adviceDeliveryTime'
go

execute sp_addextendedproperty 'MS_Description', 
   'sourceOrderCode',
   'user', 'dbo', 'table', 't_product_history', 'column', 'sourceOrderCode'
go

execute sp_addextendedproperty 'MS_Description', 
   'sourceOrderType',
   'user', 'dbo', 'table', 't_product_history', 'column', 'sourceOrderType'
go

execute sp_addextendedproperty 'MS_Description', 
   'sourceOrderInnerCode',
   'user', 'dbo', 'table', 't_product_history', 'column', 'sourceOrderInnerCode'
go

execute sp_addextendedproperty 'MS_Description', 
   'sourceOrderSplit',
   'user', 'dbo', 'table', 't_product_history', 'column', 'sourceOrderSplit'
go

execute sp_addextendedproperty 'MS_Description', 
   'contactCode',
   'user', 'dbo', 'table', 't_product_history', 'column', 'contactCode'
go

execute sp_addextendedproperty 'MS_Description', 
   'contactInnerCode',
   'user', 'dbo', 'table', 't_product_history', 'column', 'contactInnerCode'
go

execute sp_addextendedproperty 'MS_Description', 
   'contactSplit',
   'user', 'dbo', 'table', 't_product_history', 'column', 'contactSplit'
go

execute sp_addextendedproperty 'MS_Description', 
   'billCount',
   'user', 'dbo', 'table', 't_product_history', 'column', 'billCount'
go

execute sp_addextendedproperty 'MS_Description', 
   'customOrderCode',
   'user', 'dbo', 'table', 't_product_history', 'column', 'customOrderCode'
go

execute sp_addextendedproperty 'MS_Description', 
   'assistCompanyBillCount',
   'user', 'dbo', 'table', 't_product_history', 'column', 'assistCompanyBillCount'
go

execute sp_addextendedproperty 'MS_Description', 
   'assistCompanyFitCount',
   'user', 'dbo', 'table', 't_product_history', 'column', 'assistCompanyFitCount'
go

execute sp_addextendedproperty 'MS_Description', 
   'orderTrNumber',
   'user', 'dbo', 'table', 't_product_history', 'column', 'orderTrNumber'
go

execute sp_addextendedproperty 'MS_Description', 
   'baseCompanyFitCount',
   'user', 'dbo', 'table', 't_product_history', 'column', 'baseCompanyFitCount'
go

execute sp_addextendedproperty 'MS_Description', 
   'fitCount',
   'user', 'dbo', 'table', 't_product_history', 'column', 'fitCount'
go

execute sp_addextendedproperty 'MS_Description', 
   'assistAttributeType',
   'user', 'dbo', 'table', 't_product_history', 'column', 'assistAttributeType'
go

execute sp_addextendedproperty 'MS_Description', 
   'priceTaxTotalRM',
   'user', 'dbo', 'table', 't_product_history', 'column', 'priceTaxTotalRM'
go

execute sp_addextendedproperty 'MS_Description', 
   'markForMRP',
   'user', 'dbo', 'table', 't_product_history', 'column', 'markForMRP'
go

execute sp_addextendedproperty 'MS_Description', 
   'markIsForMRP',
   'user', 'dbo', 'table', 't_product_history', 'column', 'markIsForMRP'
go

execute sp_addextendedproperty 'MS_Description', 
   'collectPayReferFee',
   'user', 'dbo', 'table', 't_product_history', 'column', 'collectPayReferFee'
go

execute sp_addextendedproperty 'MS_Description', 
   'qualityFeeRate',
   'user', 'dbo', 'table', 't_product_history', 'column', 'qualityFeeRate'
go

execute sp_addextendedproperty 'MS_Description', 
   'qualityFee',
   'user', 'dbo', 'table', 't_product_history', 'column', 'qualityFee'
go

execute sp_addextendedproperty 'MS_Description', 
   'material',
   'user', 'dbo', 'table', 't_product_history', 'column', 'material'
go

execute sp_addextendedproperty 'MS_Description', 
   'outSaleName',
   'user', 'dbo', 'table', 't_product_history', 'column', 'outSaleName'
go

execute sp_addextendedproperty 'MS_Description', 
   'proProjectName',
   'user', 'dbo', 'table', 't_product_history', 'column', 'proProjectName'
go

execute sp_addextendedproperty 'MS_Description', 
   'assistAttribute',
   'user', 'dbo', 'table', 't_product_history', 'column', 'assistAttribute'
go

execute sp_addextendedproperty 'MS_Description', 
   'excuteStandard',
   'user', 'dbo', 'table', 't_product_history', 'column', 'excuteStandard'
go

execute sp_addextendedproperty 'MS_Description', 
   'assistUnit',
   'user', 'dbo', 'table', 't_product_history', 'column', 'assistUnit'
go

execute sp_addextendedproperty 'MS_Description', 
   'remarks',
   'user', 'dbo', 'table', 't_product_history', 'column', 'remarks'
go

execute sp_addextendedproperty 'MS_Description', 
   'servicecharge',
   'user', 'dbo', 'table', 't_product_history', 'column', 'servicecharge'
go

execute sp_addextendedproperty 'MS_Description', 
   'listprice',
   'user', 'dbo', 'table', 't_product_history', 'column', 'listprice'
go

execute sp_addextendedproperty 'MS_Description', 
   'balanceprice',
   'user', 'dbo', 'table', 't_product_history', 'column', 'balanceprice'
go

execute sp_addextendedproperty 'MS_Description', 
   'salefee',
   'user', 'dbo', 'table', 't_product_history', 'column', 'salefee'
go

execute sp_addextendedproperty 'MS_Description', 
   '计量单位名',
   'user', 'dbo', 'table', 't_product_history', 'column', 'measureunitname'
go

execute sp_addextendedproperty 'MS_Description', 
   '材质名',
   'user', 'dbo', 'table', 't_product_history', 'column', 'materialname'
go

execute sp_addextendedproperty 'MS_Description', 
   '折扣率',
   'user', 'dbo', 'table', 't_product_history', 'column', 'fdiscountrate'
go

execute sp_addextendedproperty 'MS_Description', 
   '结算金额',
   'user', 'dbo', 'table', 't_product_history', 'column', 'balancefee'
go

execute sp_addextendedproperty 'MS_Description', 
   '折扣额(本位币)',
   'user', 'dbo', 'table', 't_product_history', 'column', 'fbusinessdiscount'
go

execute sp_addextendedproperty 'MS_Description', 
   '税额(本位币)',
   'user', 'dbo', 'table', 't_product_history', 'column', 'ftax'
go

execute sp_addextendedproperty 'MS_Description', 
   '含税单价(本位币)',
   'user', 'dbo', 'table', 't_product_history', 'column', 'ftaxprice'
go

execute sp_addextendedproperty 'MS_Description', 
   '金额(本位币)',
   'user', 'dbo', 'table', 't_product_history', 'column', 'famountfor'
go

/*==============================================================*/
/* Table: t_productpl                                           */
/*==============================================================*/
create table t_productpl (
   pdplid               bigint               identity,
   productId            bigint               null,
   fmodel               nvarchar(200)        null,
   fnum                 decimal(20)          null,
   fprice               decimal(20,4)        null,
   flistprice           decimal(20,4)        null,
   pl3000fmodel         nvarchar(200)        null,
   pl3000fnum           decimal(20)          null,
   pl3000fprice         decimal(20,4)        null,
   pl3000flistprice     decimal(20,4)        null,
   ssv3500fmodel        nvarchar(200)        null,
   ssv3500fnum          decimal(20)          null,
   ssv3500fprice        decimal(20,4)        null,
   ssv3500flistprice    decimal(20,4)        null,
   pl2000fmodel         nvarchar(200)        null,
   pl2000fnum           decimal(20)          null,
   pl2000fprice         decimal(20,4)        null,
   pl2000flistprice     decimal(20,4)        null,
   constraint PK_T_PRODUCTPL primary key (pdplid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单产品PL子表',
   'user', @CurrentUser, 'table', 't_productpl'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'pdplid',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'pdplid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'productId',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'productId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL4200规格型号',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'fmodel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL4200数量',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'fnum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL4200合同单价',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'fprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL4200列表单价',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'flistprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL3000型号',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'pl3000fmodel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL3000数量',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'pl3000fnum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL3000合同单价',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'pl3000fprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL3000列表单价',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'pl3000flistprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SSV3500型号',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'ssv3500fmodel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SSV3500数量',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'ssv3500fnum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SSV3500合同单价',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'ssv3500fprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SSV3500列表单价',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'ssv3500flistprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL2000型号',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'pl2000fmodel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL2000数量',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'pl2000fnum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL2000合同单价',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'pl2000fprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL2000列表单价',
   'user', @CurrentUser, 'table', 't_productpl', 'column', 'pl2000flistprice'
go

/*==============================================================*/
/* Table: t_productpl_history                                   */
/*==============================================================*/
create table t_productpl_history (
   pdplid               bigint               identity,
   productId            bigint               null,
   fmodel               nvarchar(200)        null,
   fnum                 decimal(20)          null,
   fprice               decimal(20,4)        null,
   flistprice           decimal(20,4)        null,
   pl3000fmodel         nvarchar(200)        null,
   pl3000fnum           decimal(20)          null,
   pl3000fprice         decimal(20,4)        null,
   pl3000flistprice     decimal(20,4)        null,
   ssv3500fmodel        nvarchar(200)        null,
   ssv3500fnum          decimal(20)          null,
   ssv3500fprice        decimal(20,4)        null,
   ssv3500flistprice    decimal(20,4)        null,
   pl2000fmodel         nvarchar(200)        null,
   pl2000fnum           decimal(20)          null,
   pl2000fprice         decimal(20,4)        null,
   pl2000flistprice     decimal(20,4)        null,
   constraint PK_T_PRODUCTPL_HISTORY primary key (pdplid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '历史订单产品PL子表',
   'user', @CurrentUser, 'table', 't_productpl_history'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'pdplid',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'pdplid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'productId',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'productId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL4200规格型号',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'fmodel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL4200数量',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'fnum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL4200合同单价',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'fprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL4200列表单价',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'flistprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL3000型号',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'pl3000fmodel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL3000数量',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'pl3000fnum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL3000合同单价',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'pl3000fprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL3000列表单价',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'pl3000flistprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SSV3500型号',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'ssv3500fmodel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SSV3500数量',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'ssv3500fnum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SSV3500合同单价',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'ssv3500fprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SSV3500列表单价',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'ssv3500flistprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL2000型号',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'pl2000fmodel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL2000数量',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'pl2000fnum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL2000合同单价',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'pl2000fprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL2000列表单价',
   'user', @CurrentUser, 'table', 't_productpl_history', 'column', 'pl2000flistprice'
go

/*==============================================================*/
/* Table: t_project_bom                                         */
/*==============================================================*/
create table t_project_bom (
   bomid                bigint               identity,
   infoid               bigint               null,
   itemcode             nvarchar(100)        null,
   itemname             nvarchar(200)        null,
   fmodel               nvarchar(300)        null,
   fdescript            nvarchar(500)        null,
   flevel               nvarchar(100)        null,
   fposition            nvarchar(30)         null,
   fmaker               nvarchar(200)        null,
   srcarea              nvarchar(200)        null,
   unit                 nvarchar(50)         null,
   fnum                 decimal(20,2)        null,
   factor               decimal(10,2)        null,
   bidprice             decimal(10,4)        null,
   bidtotalprice        decimal(20,4)        null,
   listprice            decimal(10,2)        null,
   listtotalprice       decimal(20,4)        null,
   costprice            decimal(10,2)        null,
   costtotalprice       decimal(20,4)        null,
   constraint PK_T_PROJECT_BOM primary key (bomid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目清单',
   'user', @CurrentUser, 'table', 't_project_bom'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'bomid',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'bomid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'infoid',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'infoid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料代码',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'itemcode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '货物名称',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'itemname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '规格型号',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'fmodel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '性能描述',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'fdescript'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '压力等级',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'flevel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '位号',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'fposition'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '生产商名称',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'fmaker'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '原产地',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'srcarea'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '单位',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'unit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '数量',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'fnum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '系数',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'factor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '投标单价',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'bidprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '投标总价',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'bidtotalprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '列表单价',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'listprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '列表总价',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'listtotalprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '成本单价',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'costprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '成本总价',
   'user', @CurrentUser, 'table', 't_project_bom', 'column', 'costtotalprice'
go

/*==============================================================*/
/* Table: t_project_info                                        */
/*==============================================================*/
create table t_project_info (
   id                   bigint               not null,
   quoteOrderNo         nvarchar(10)         null,
   userName             nvarchar(20)         null,
   projectName          nvarchar(20)         null,
   deviceMode           nvarchar(20)         null,
   deviceType           nvarchar(4)          null,
   designPress          decimal(20,10)       null,
   designFlow           decimal(20,10)       null,
   inpress              decimal(20,10)       null,
   outpress             decimal(20,10)       null,
   quoteOrderDate       datetime             null,
   deliveryCondition    int                  null,
   priceUnit            int                  null,
   pressureStructure    bigint               null,
   meterStructure       bigint               null,
   validityDate         int                  null,
   deliveryDate         datetime             null,
   discountCoeff        decimal(20,10)       null,
   version              nvarchar(4)          null,
   orderUserId          bigint               null,
   quoteOrderStatus     int                  null,
   examineUserId        bigint               null,
   createdate           datetime             null,
   constraint PK_T_PROJECT_INFO primary key (id)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目列表信息',
   'user', @CurrentUser, 'table', 't_project_info'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '报价单号',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'quoteOrderNo'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户名称',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'userName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目名称',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'projectName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设备型号',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'deviceMode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设备类型',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'deviceType'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设计压力',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'designPress'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设计流量',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'designFlow'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '进口压力',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'inpress'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '出口压力',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'outpress'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '报价日期',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'quoteOrderDate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '交货条件',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'deliveryCondition'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '价格单位',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'priceUnit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '调压结构型式',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'pressureStructure'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '计量结构型式',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'meterStructure'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '有效期',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'validityDate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '交货期',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'deliveryDate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '折扣系数',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'discountCoeff'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '版本号',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'version'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '制单人',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'orderUserId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '单据状态',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'quoteOrderStatus'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '审核人',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'examineUserId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '制单日期',
   'user', @CurrentUser, 'table', 't_project_info', 'column', 'createdate'
go

/*==============================================================*/
/* Table: t_province                                            */
/*==============================================================*/
create table t_province (
   provinceid           bigint               identity,
   provincename         nvarchar(50)         null,
   areaid               bigint               null,
   fitemid              bigint               null,
   fnumber              nvarchar(50)         null,
   constraint PK_T_PROVINCE primary key (provinceid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '省份',
   'user', @CurrentUser, 'table', 't_province'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'provinceid',
   'user', @CurrentUser, 'table', 't_province', 'column', 'provinceid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'provincename',
   'user', @CurrentUser, 'table', 't_province', 'column', 'provincename'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属区域',
   'user', @CurrentUser, 'table', 't_province', 'column', 'areaid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'erpid',
   'user', @CurrentUser, 'table', 't_province', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'erp编号',
   'user', @CurrentUser, 'table', 't_province', 'column', 'fnumber'
go

/*==============================================================*/
/* Table: t_questionandreply                                    */
/*==============================================================*/
create table dbo.t_questionandreply (
   questionAndReplyId   bigint               not null,
   orderCode            varchar(20)          null,
   question             varchar(500)         null,
   questioner           varchar(20)          null,
   questionTime         datetime             null,
   reply                varchar(500)         null,
   replyer              varchar(20)          null,
   replyTime            datetime             null,
   contractReviewId     bigint               null,
   fstatus              int                  null,
   constraint PK_T_QUESTIONANDREPLY primary key (questionAndReplyId)
)
go

execute sp_addextendedproperty 'MS_Description', 
   '问题反馈表',
   'user', 'dbo', 'table', 't_questionandreply'
go

execute sp_addextendedproperty 'MS_Description', 
   '唯一标识ID',
   'user', 'dbo', 'table', 't_questionandreply', 'column', 'questionAndReplyId'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单编号',
   'user', 'dbo', 'table', 't_questionandreply', 'column', 'orderCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '问题',
   'user', 'dbo', 'table', 't_questionandreply', 'column', 'question'
go

execute sp_addextendedproperty 'MS_Description', 
   '提问人',
   'user', 'dbo', 'table', 't_questionandreply', 'column', 'questioner'
go

execute sp_addextendedproperty 'MS_Description', 
   '提问时间',
   'user', 'dbo', 'table', 't_questionandreply', 'column', 'questionTime'
go

execute sp_addextendedproperty 'MS_Description', 
   '回复',
   'user', 'dbo', 'table', 't_questionandreply', 'column', 'reply'
go

execute sp_addextendedproperty 'MS_Description', 
   '回复人',
   'user', 'dbo', 'table', 't_questionandreply', 'column', 'replyer'
go

execute sp_addextendedproperty 'MS_Description', 
   '回复时间',
   'user', 'dbo', 'table', 't_questionandreply', 'column', 'replyTime'
go

execute sp_addextendedproperty 'MS_Description', 
   '评审单ID',
   'user', 'dbo', 'table', 't_questionandreply', 'column', 'contractReviewId'
go

execute sp_addextendedproperty 'MS_Description', 
   '是否同意',
   'user', 'dbo', 'table', 't_questionandreply', 'column', 'fstatus'
go

/*==============================================================*/
/* Table: t_rece_pl                                             */
/*==============================================================*/
create table t_rece_pl (
   fentryid             bigint               identity,
   receivableid         bigint               null,
   PL4200fmodel         nvarchar(200)        null,
   PL4200fnum           decimal(20)          null,
   PL4200listprice      decimal(20,4)        null,
   PL4200finalprice     decimal(20,4)        null,
   PL3000fmodel         nvarchar(200)        null,
   PL3000fnum           decimal(20,0)        null,
   PL3000listprice      decimal(20,4)        null,
   PL3000finalprice     decimal(20,4)        null,
   SSV3500fmodel        nvarchar(200)        null,
   SSV3500fnum          decimal(20)          null,
   SSV3500listprice     decimal(20,4)        null,
   SSV3500finalprice    decimal(20,4)        null,
   PL2000fmodel         nvarchar(200)        null,
   PL2000fnum           decimal(20)          null,
   PL2000listprice      decimal(20,4)        null,
   PL2000finalprice     decimal(20,4)        null,
   PL4200listpricesum   decimal(20,4)        null,
   PL4200finalpricesum  decimal(20,4)        null,
   PL3000listpricesum   decimal(20,4)        null,
   PL3000finalpricesum  decimal(20,4)        null,
   SSV3500listpricesum  decimal(20,4)        null,
   SSV3500finalpricesum decimal(20,4)        null,
   PL2000listpricesum   decimal(20,4)        null,
   PL2000finalpricesum  decimal(20,4)        null,
   constraint PK_T_RECE_PL primary key (fentryid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '应收款PL价格',
   'user', @CurrentUser, 'table', 't_rece_pl'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fentryid',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'fentryid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'receivableid',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'receivableid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL4200规格型号',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL4200fmodel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL4200数量',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL4200fnum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL4200列表单价',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL4200listprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL4200结算单价',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL4200finalprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL3000规格型号',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL3000fmodel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL3000数量',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL3000fnum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL3000列表单价',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL3000listprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL3000结算单价',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL3000finalprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SSV3500型号',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'SSV3500fmodel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SSV3500数量',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'SSV3500fnum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SSV3500列表单价',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'SSV3500listprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SSV3500结算单价',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'SSV3500finalprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL2000型号',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL2000fmodel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL2000数量',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL2000fnum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL2000列表单价',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL2000listprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL2000结算单价',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL2000finalprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL4200列表总价',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL4200listpricesum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL4200结算总价',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL4200finalpricesum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL3000列表总价',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL3000listpricesum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL3000结算总价',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL3000finalpricesum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SSV3500列表总价',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'SSV3500listpricesum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SSV3500结算总价',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'SSV3500finalpricesum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL2000列表总价',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL2000listpricesum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'PL2000结算总价',
   'user', @CurrentUser, 'table', 't_rece_pl', 'column', 'PL2000finalpricesum'
go

/*==============================================================*/
/* Table: t_receivable                                          */
/*==============================================================*/
create table t_receivable (
   receivableid         bigint               not null,
   fcontractno          nvarchar(100)        null,
   forderno             nvarchar(50)         null,
   fmocode              nvarchar(50)         null,
   fnumber              nvarchar(100)        null,
   fnum                 decimal(20,2)        null,
   famount              decimal(28,4)        null,
   fitemname            nvarchar(300)        null,
   fclass               nvarchar(50)         null,
   serviceprice         decimal(20,4)        null,
   servicelistprice     decimal(20,4)        null,
   servicefinalprice    decimal(20,4)        null,
   servicepricesum      decimal(20,4)        null,
   servicelistpricesum  decimal(20,4)        null,
   servicefinalpricesum decimal(20,4)        null,
   margin               decimal(20,4)        null,
   loaninterest         decimal(20,4)        null,
   productid            bigint               null,
   constraint PK_T_RECEIVABLE primary key (receivableid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '201504后合同应收款',
   'user', @CurrentUser, 'table', 't_receivable'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'receivableid',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'receivableid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同号',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'fcontractno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单号',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'forderno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '制令号',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'fmocode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '产品代码',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'fnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '数量',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'fnum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '价税合计',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'famount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '产品名称',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'fitemname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '产品类别',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'fclass'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '服务/工程费单价',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'serviceprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '服务/工程费列表单价',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'servicelistprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '服务/工程费结算单价',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'servicefinalprice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '服务/工程费总价',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'servicepricesum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '服务/工程费列表总价',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'servicelistpricesum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '服务/工程费结算总价',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'servicefinalpricesum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '保证金',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'margin'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '贷款利息',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'loaninterest'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '源单ID',
   'user', @CurrentUser, 'table', 't_receivable', 'column', 'productid'
go

/*==============================================================*/
/* Table: t_rewardnotes                                         */
/*==============================================================*/
create table t_rewardnotes (
   noteid               bigint               identity,
   fyear                nvarchar(10)         null,
   fnotes               nvarchar(500)        null,
   createdate           datetime             null,
   adminid              bigint               null,
   ftitle               nvarchar(50)         null,
   constraint PK_T_REWARDNOTES primary key (noteid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业绩政策说明',
   'user', @CurrentUser, 'table', 't_rewardnotes'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'noteid',
   'user', @CurrentUser, 'table', 't_rewardnotes', 'column', 'noteid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业绩年',
   'user', @CurrentUser, 'table', 't_rewardnotes', 'column', 'fyear'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fnotes',
   'user', @CurrentUser, 'table', 't_rewardnotes', 'column', 'fnotes'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 't_rewardnotes', 'column', 'createdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建人',
   'user', @CurrentUser, 'table', 't_rewardnotes', 'column', 'adminid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '标题',
   'user', @CurrentUser, 'table', 't_rewardnotes', 'column', 'ftitle'
go

/*==============================================================*/
/* Table: t_role                                                */
/*==============================================================*/
create table t_role (
   roleid               bigint               identity,
   roleKEY              nvarchar(100)        null,
   roleName             nvarchar(100)        null,
   constraint PK_T_ROLE primary key (roleid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   't_role',
   'user', @CurrentUser, 'table', 't_role'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'roleid',
   'user', @CurrentUser, 'table', 't_role', 'column', 'roleid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'roleKEY',
   'user', @CurrentUser, 'table', 't_role', 'column', 'roleKEY'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'roleName',
   'user', @CurrentUser, 'table', 't_role', 'column', 'roleName'
go

/*==============================================================*/
/* Table: t_role_authority                                      */
/*==============================================================*/
create table t_role_authority (
   id                   bigint               identity,
   roleId               bigint               null,
   authorityId          bigint               null,
   constraint PK_T_ROLE_AUTHORITY primary key (id)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   't_role_authority',
   'user', @CurrentUser, 'table', 't_role_authority'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 't_role_authority', 'column', 'id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'roleId',
   'user', @CurrentUser, 'table', 't_role_authority', 'column', 'roleId'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'authorityId',
   'user', @CurrentUser, 'table', 't_role_authority', 'column', 'authorityId'
go

/*==============================================================*/
/* Table: t_rp_bill                                             */
/*==============================================================*/
create table t_rp_bill (
   fbillid              bigint               identity,
   fcontractno          nvarchar(50)         null,
   fanaitem             nvarchar(200)        null,
   forderdate           datetime             null,
   forderamountfor      decimal(20,4)        null,
   fempid               bigint               null,
   fcurempid            bigint               null,
   fdate                nvarchar(20)         null,
   fexchangeamount      decimal(20,4)        null,
   fpreparer            bigint               null,
   createdate           datetime             null,
   fstatus              integer              null,
   forderno             nvarchar(50)         null,
   fempname             nvarchar(50)         null,
   fcurempname          nvarchar(50)         null,
   constraint PK_T_RP_BILL primary key (fbillid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '2015年4月前应收款',
   'user', @CurrentUser, 'table', 't_rp_bill'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '应收款ID',
   'user', @CurrentUser, 'table', 't_rp_bill', 'column', 'fbillid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同号',
   'user', @CurrentUser, 'table', 't_rp_bill', 'column', 'fcontractno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '核算项目',
   'user', @CurrentUser, 'table', 't_rp_bill', 'column', 'fanaitem'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单日期',
   'user', @CurrentUser, 'table', 't_rp_bill', 'column', 'forderdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单金额',
   'user', @CurrentUser, 'table', 't_rp_bill', 'column', 'forderamountfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业务员',
   'user', @CurrentUser, 'table', 't_rp_bill', 'column', 'fempid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '当前业务员',
   'user', @CurrentUser, 'table', 't_rp_bill', 'column', 'fcurempid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '回款月份',
   'user', @CurrentUser, 'table', 't_rp_bill', 'column', 'fdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '回款金额',
   'user', @CurrentUser, 'table', 't_rp_bill', 'column', 'fexchangeamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '提交人',
   'user', @CurrentUser, 'table', 't_rp_bill', 'column', 'fpreparer'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 't_rp_bill', 'column', 'createdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0:未处理，1：已支付，2：已关闭',
   'user', @CurrentUser, 'table', 't_rp_bill', 'column', 'fstatus'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单号',
   'user', @CurrentUser, 'table', 't_rp_bill', 'column', 'forderno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业务员名',
   'user', @CurrentUser, 'table', 't_rp_bill', 'column', 'fempname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '当前业务员名',
   'user', @CurrentUser, 'table', 't_rp_bill', 'column', 'fcurempname'
go

/*==============================================================*/
/* Table: t_rp_exchange                                         */
/*==============================================================*/
create table t_rp_exchange (
   frpexid              bigint               identity,
   rpid                 bigint               null,
   fbillid              bigint               null,
   fentryid             bigint               null,
   fexchangeamount      decimal(20,4)        null,
   fexchangeamountfor   decimal(20,4)        null,
   fexchangecyid        bigint               null,
   fexchangeexpense     decimal(20,4)        null,
   fexchangeexpensefor  decimal(20,4)        null,
   fexchangerate        decimal(15,4)        null,
   findex               bigint               null,
   fserial              bigint               null,
   fsettleamount        decimal(20,4)        null,
   fsettleamountfor     decimal(20,4)        null,
   fsettlecyid          bigint               null,
   constraint PK_T_RP_EXCHANGE primary key (frpexid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '收款单分录表',
   'user', @CurrentUser, 'table', 't_rp_exchange'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '分录id',
   'user', @CurrentUser, 'table', 't_rp_exchange', 'column', 'frpexid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'rpid',
   'user', @CurrentUser, 'table', 't_rp_exchange', 'column', 'rpid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '内码',
   'user', @CurrentUser, 'table', 't_rp_exchange', 'column', 'fbillid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '换算分录内码',
   'user', @CurrentUser, 'table', 't_rp_exchange', 'column', 'fentryid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '收款金额(本位币)',
   'user', @CurrentUser, 'table', 't_rp_exchange', 'column', 'fexchangeamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '收款金额',
   'user', @CurrentUser, 'table', 't_rp_exchange', 'column', 'fexchangeamountfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '收款币别',
   'user', @CurrentUser, 'table', 't_rp_exchange', 'column', 'fexchangecyid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '兑换费用(本位币)',
   'user', @CurrentUser, 'table', 't_rp_exchange', 'column', 'fexchangeexpense'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '兑换费用',
   'user', @CurrentUser, 'table', 't_rp_exchange', 'column', 'fexchangeexpensefor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '汇率',
   'user', @CurrentUser, 'table', 't_rp_exchange', 'column', 'fexchangerate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '换算行号',
   'user', @CurrentUser, 'table', 't_rp_exchange', 'column', 'findex'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '换算次序',
   'user', @CurrentUser, 'table', 't_rp_exchange', 'column', 'fserial'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '实收金额(本位币)',
   'user', @CurrentUser, 'table', 't_rp_exchange', 'column', 'fsettleamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '实收金额',
   'user', @CurrentUser, 'table', 't_rp_exchange', 'column', 'fsettleamountfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结算币种',
   'user', @CurrentUser, 'table', 't_rp_exchange', 'column', 'fsettlecyid'
go

/*==============================================================*/
/* Table: t_rp_newreceivebill                                   */
/*==============================================================*/
create table t_rp_newreceivebill (
   rpid                 bigint               identity,
   famount              decimal(20,4)        null,
   famount_cn           decimal(20,4)        null,
   famountfor           decimal(20,4)        null,
   famountfor_cn        decimal(20,4)        null,
   fapplybillno_cn      nvarchar(100)        null,
   farnumber            nvarchar(100)        null,
   fbankacct            nvarchar(100)        null,
   fbankacct_pay        nvarchar(100)        null,
   fbanknoteno          nvarchar(80)         null,
   fbillid              bigint               null,
   fbillno_src          nvarchar(100)        null,
   fbilltype            bigint               null,
   fchcckamount         decimal(20,4)        null,
   fcheckamountfor      decimal(20,4)        null,
   fcheckdate           datetime             null,
   fcheckdate_cn        datetime             null,
   fchecker             bigint               null,
   fcheckerid_cn        bigint               null,
   fcheckstatus         int                  null,
   fclassid_src         int                  null,
   fcurrencyid          int                  null,
   fdate                datetime             null,
   femployee            bigint               null,
   fexchangerate        decimal(20,4)        null,
   ffincdate            datetime             null,
   fmodifytime          timestamp            null,
   fnumber              nvarchar(255)        null,
   forderamountfor      decimal(20,10)       null,
   forderno             nvarchar(255)        null,
   forgnumber           nvarchar(255)        null,
   fscsenderid_cn       bigint               null,
   fscsenddate_cn       datetime             null,
   fscstatus_cn         int                  null,
   fsettle              int                  null,
   fsettleamount        decimal(20,4)        null,
   fsettleamountfor     decimal(20,4)        null,
   fsettlecyid          bigint               null,
   fsettleno            nvarchar(50)         null,
   fstatus              int                  null,
   ftransdate_cn        datetime             null,
   fvoucherid           bigint               null,
   fyear                nvarchar(10)         null,
   fquarter             integer              null,
   constraint PK_T_RP_NEWRECEIVEBILL primary key (rpid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '收款单',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'rpid',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'rpid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '单据金额(本位币)',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'famount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '现金管理单据金额(本位币)',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'famount_cn'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '单据金额',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'famountfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '现金管理单据金额',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'famountfor_cn'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '申请单号(现金管理)',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fapplybillno_cn'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '应收单号码',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'farnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '账号',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fbankacct'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '核算项目银行账号',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fbankacct_pay'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '银行票据号',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fbanknoteno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '内码',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fbillid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '源单号',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fbillno_src'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '付款类型',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fbilltype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '本位币核销金额',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fchcckamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '原币核销金额',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fcheckamountfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '审核日期',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fcheckdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '审核日期（现金管理）',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fcheckdate_cn'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '审核人',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fchecker'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '审核人(现金管理)',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fcheckerid_cn'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '状态',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fcheckstatus'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '源单类型',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fclassid_src'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '币别',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fcurrencyid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '单据日期',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业务员',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'femployee'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '汇率',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fexchangerate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '财务日期',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'ffincdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '时间戳',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fmodifytime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '单据号',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单金额',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'forderamountfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单单号',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'forderno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '银行票据号码',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'forgnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '提交人',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fscsenderid_cn'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '提交时间',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fscsenddate_cn'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '提交到结算中心的状态标识(0:已提交,1：未提交：2：已提交并获取了结算信息)',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fscstatus_cn'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结算方式',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fsettle'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '实收金额(本位币)',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fsettleamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '实收金额',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fsettleamountfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结算币别',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fsettlecyid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结算号',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fsettleno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '单据状态',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fstatus'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结算日期',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'ftransdate_cn'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '凭证字号',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fvoucherid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '年份',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fyear'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '季度',
   'user', @CurrentUser, 'table', 't_rp_newreceivebill', 'column', 'fquarter'
go

/*==============================================================*/
/* Table: t_rpcontract                                          */
/*==============================================================*/
create table t_rpcontract (
   contractid           bigint               identity,
   fcontractid          int                  null,
   fcontractname        nvarchar(255)        null,
   fcontractno          nvarchar(80)         null,
   fdate                datetime             null,
   fdepartment          int                  null,
   ftext                text                 null,
   ftotalamount         decimal(20,10)       null,
   ftotalamountfor      decimal(20,10)       null,
   fexplanation         nvarchar(255)        null,
   fstatus              int                  null,
   fcheckdate           datetime             null,
   fcustomer            integer              null,
   constraint PK_T_RPCONTRACT primary key (contractid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同表',
   'user', @CurrentUser, 'table', 't_rpcontract'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'contractid',
   'user', @CurrentUser, 'table', 't_rpcontract', 'column', 'contractid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '常州合同内码',
   'user', @CurrentUser, 'table', 't_rpcontract', 'column', 'fcontractid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同名',
   'user', @CurrentUser, 'table', 't_rpcontract', 'column', 'fcontractname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同编码',
   'user', @CurrentUser, 'table', 't_rpcontract', 'column', 'fcontractno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同日期',
   'user', @CurrentUser, 'table', 't_rpcontract', 'column', 'fdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '部门',
   'user', @CurrentUser, 'table', 't_rpcontract', 'column', 'fdepartment'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同内容',
   'user', @CurrentUser, 'table', 't_rpcontract', 'column', 'ftext'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '总金额(本位币)',
   'user', @CurrentUser, 'table', 't_rpcontract', 'column', 'ftotalamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '总金额(原币)',
   'user', @CurrentUser, 'table', 't_rpcontract', 'column', 'ftotalamountfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同摘要',
   'user', @CurrentUser, 'table', 't_rpcontract', 'column', 'fexplanation'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同状态',
   'user', @CurrentUser, 'table', 't_rpcontract', 'column', 'fstatus'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '审核日期',
   'user', @CurrentUser, 'table', 't_rpcontract', 'column', 'fcheckdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '客户',
   'user', @CurrentUser, 'table', 't_rpcontract', 'column', 'fcustomer'
go

/*==============================================================*/
/* Table: t_rpcontractentry                                     */
/*==============================================================*/
create table t_rpcontractentry (
   entiryid             bigint               identity,
   fproductid           bigint               null,
   fquantity            decimal(20,10)       null,
   famount              decimal(20,10)       null,
   famountfor           decimal(20,10)       null,
   famountincludetax    decimal(20,10)       null,
   famountincludetaxfor decimal(20,10)       null,
   fcontractid          int                  null,
   fentryid             int                  null,
   fexplanation         nvarchar(100)        null,
   fbusinessdiscount    decimal(20,10)       null,
   fbusinessdiscountfor decimal(20,10)       null,
   fbusinessdiscountrate decimal(20,10)       null,
   ftax                 decimal(20,10)       null,
   ftaxfor              decimal(20,10)       null,
   ftaxrate             decimal(10,2)        null,
   finitinvoiceamt      decimal(20,10)       null,
   finitinvoiceamtfor   decimal(20,10)       null,
   finitreceiveamt      decimal(20,10)       null,
   finitreceiveamtfor   decimal(20,10)       null,
   finituninvoiceamt    decimal(20,10)       null,
   finituninvoiceamtfor decimal(20,10)       null,
   finitunreceiveamt    decimal(20,10)       null,
   finitunreceiveamtfor decimal(20,10)       null,
   finvoiceamt_commit   decimal(20,10)       null,
   finvoiceamtfor_commit decimal(20,10)       null,
   finvoiceamt_relative decimal(20,10)       null,
   finvoiceamtfor_relative decimal(20,10)       null,
   forderamt_commit     decimal(20,10)       null,
   forderamtfor_commit  decimal(20,10)       null,
   forderamt_relative   decimal(20,10)       null,
   forderamtfor_relative decimal(20,10)       null,
   fpayapplyamount      decimal(20,10)       null,
   fpayapplyamountfor   decimal(20,10)       null,
   freceiveamount       decimal(20,10)       null,
   freceiveamountfor    decimal(20,10)       null,
   funinvoice_amount    decimal(20,10)       null,
   funinvoice_amountfor decimal(20,10)       null,
   funreceive_amount    decimal(20,10)       null,
   funreceive_amountfor decimal(20,10)       null,
   constraint PK_T_RPCONTRACTENTRY primary key (entiryid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同分录表',
   'user', @CurrentUser, 'table', 't_rpcontractentry'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'entiryid',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'entiryid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '物料id',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'fproductid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '数量',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'fquantity'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '金额(本币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'famount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '金额(原币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'famountfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '价税合计(本币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'famountincludetax'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '价税合计(原币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'famountincludetaxfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同id',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'fcontractid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '分录内码',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'fentryid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '摘要',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'fexplanation'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '折扣额(本币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'fbusinessdiscount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '折扣额(原币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'fbusinessdiscountfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '折扣率',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'fbusinessdiscountrate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '税额(本币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'ftax'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '税额(原币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'ftaxfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '税率',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'ftaxrate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '开票金额(本币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'finitinvoiceamt'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '开票金额',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'finitinvoiceamtfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '收款金额(本币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'finitreceiveamt'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '收款金额',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'finitreceiveamtfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '未开票金额(本币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'finituninvoiceamt'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '未开票金额',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'finituninvoiceamtfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '未收款金额(本币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'finitunreceiveamt'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '未收款金额',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'finitunreceiveamtfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '发票执行金额(本币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'finvoiceamt_commit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '发票执行金额',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'finvoiceamtfor_commit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '发票关联金额(本位币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'finvoiceamt_relative'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '发票关联金额',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'finvoiceamtfor_relative'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单执行金额(本位币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'forderamt_commit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单执行金额',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'forderamtfor_commit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单关联金额(本位币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'forderamt_relative'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单关联金额',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'forderamtfor_relative'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '付款申请单关联金额(本币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'fpayapplyamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '付款申请单关联金额',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'fpayapplyamountfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '收款关联金额(本位币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'freceiveamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '收款关联金额',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'freceiveamountfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '未开票金额(本位币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'funinvoice_amount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '未开票金额(原币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'funinvoice_amountfor'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '未收款金额(本位币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'funreceive_amount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '未收款金额(原币)',
   'user', @CurrentUser, 'table', 't_rpcontractentry', 'column', 'funreceive_amountfor'
go

/*==============================================================*/
/* Table: t_sale_ratio                                          */
/*==============================================================*/
create table t_sale_ratio (
   saleid               bigint               not null,
   salename             nvarchar(50)         null,
   saleratio            decimal(10,2)        null,
   smratio              decimal(10,2)        null,
   szmpratio            decimal(10,2)        null,
   constraint PK_T_SALE_RATIO primary key (saleid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '2015年4月前个人比例',
   'user', @CurrentUser, 'table', 't_sale_ratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'saleid',
   'user', @CurrentUser, 'table', 't_sale_ratio', 'column', 'saleid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'salename',
   'user', @CurrentUser, 'table', 't_sale_ratio', 'column', 'salename'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售员比例',
   'user', @CurrentUser, 'table', 't_sale_ratio', 'column', 'saleratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售经理比例',
   'user', @CurrentUser, 'table', 't_sale_ratio', 'column', 'smratio'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '区域经理比例',
   'user', @CurrentUser, 'table', 't_sale_ratio', 'column', 'szmpratio'
go

/*==============================================================*/
/* Table: t_salestype                                           */
/*==============================================================*/
create table t_salestype (
   salestypeid          bigint               identity,
   fname                nvarchar(20)         null,
   fitemid              bigint               null,
   fnumber              nvarchar(30)         null,
   fdesc                nvarchar(200)        null,
   fclass               int                  null,
   fbase                decimal(20,10)       null,
   constraint PK_T_SALESTYPE primary key (salestypeid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售产品类别',
   'user', @CurrentUser, 'table', 't_salestype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'salestypeid',
   'user', @CurrentUser, 'table', 't_salestype', 'column', 'salestypeid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '类别名称',
   'user', @CurrentUser, 'table', 't_salestype', 'column', 'fname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'erpid',
   'user', @CurrentUser, 'table', 't_salestype', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'erp编号',
   'user', @CurrentUser, 'table', 't_salestype', 'column', 'fnumber'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '说明',
   'user', @CurrentUser, 'table', 't_salestype', 'column', 'fdesc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:标准产品，2：非标产品',
   'user', @CurrentUser, 'table', 't_salestype', 'column', 'fclass'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '基数系数',
   'user', @CurrentUser, 'table', 't_salestype', 'column', 'fbase'
go

/*==============================================================*/
/* Table: t_sdari                                               */
/*==============================================================*/
create table t_sdari (
   finterid             bigint               identity,
   sdariname            nvarchar(100)        null,
   notes                nvarchar(100)        null,
   constraint PK_T_SDARI primary key (finterid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设计院',
   'user', @CurrentUser, 'table', 't_sdari'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'finterid',
   'user', @CurrentUser, 'table', 't_sdari', 'column', 'finterid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设计院名称',
   'user', @CurrentUser, 'table', 't_sdari', 'column', 'sdariname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 't_sdari', 'column', 'notes'
go

/*==============================================================*/
/* Table: t_sdari_engineer                                      */
/*==============================================================*/
create table t_sdari_engineer (
   engineerid           bigint               not null,
   finterid             bigint               null,
   engname              nvarchar(50)         null,
   constraint PK_T_SDARI_ENGINEER primary key (engineerid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设计院工程师',
   'user', @CurrentUser, 'table', 't_sdari_engineer'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'engineerid',
   'user', @CurrentUser, 'table', 't_sdari_engineer', 'column', 'engineerid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'finterid',
   'user', @CurrentUser, 'table', 't_sdari_engineer', 'column', 'finterid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '工程师名',
   'user', @CurrentUser, 'table', 't_sdari_engineer', 'column', 'engname'
go

/*==============================================================*/
/* Table: t_seorder                                             */
/*==============================================================*/
create table t_seorder (
   orderid              bigint               identity,
   finterid             int                  null,
   fdate                datetime             null,
   fbillno              nvarchar(255)        null,
   fcheckdate           datetime             null,
   fpaydate             datetime             null,
   fsettledate          datetime             null,
   fstatus              int                  null,
   constraint PK_T_SEORDER primary key (orderid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售订单表',
   'user', @CurrentUser, 'table', 't_seorder'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'orderid',
   'user', @CurrentUser, 'table', 't_seorder', 'column', 'orderid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '常州订单内码',
   'user', @CurrentUser, 'table', 't_seorder', 'column', 'finterid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日期',
   'user', @CurrentUser, 'table', 't_seorder', 'column', 'fdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售订单号',
   'user', @CurrentUser, 'table', 't_seorder', 'column', 'fbillno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '审核日期',
   'user', @CurrentUser, 'table', 't_seorder', 'column', 'fcheckdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '付款日期',
   'user', @CurrentUser, 'table', 't_seorder', 'column', 'fpaydate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结算日期',
   'user', @CurrentUser, 'table', 't_seorder', 'column', 'fsettledate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '状态',
   'user', @CurrentUser, 'table', 't_seorder', 'column', 'fstatus'
go

/*==============================================================*/
/* Table: t_seorderentry                                        */
/*==============================================================*/
create table t_seorderentry (
   entryid              bigint               identity,
   famount              decimal(20,10)       null,
   fallamount           decimal(20,10)       null,
   fallstdamount        decimal(20,10)       null,
   fcontractbillno      nvarchar(255)        null,
   fcontractentryid     int                  null,
   fcontractinterid     int                  null,
   fdate                datetime             null,
   freceiveamountfor_commit decimal(20,10)       null,
   freceiveamount_commit decimal(20,10)       null,
   fcostobjectid        int                  null,
   fitemid              int                  null,
   ffinalamount         decimal(20,10)       null,
   forderbillno         nvarchar(255)        null,
   forderentryid        int                  null,
   finterid             int                  null,
   constraint PK_T_SEORDERENTRY primary key (entryid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售订单分录表',
   'user', @CurrentUser, 'table', 't_seorderentry'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'entryid',
   'user', @CurrentUser, 'table', 't_seorderentry', 'column', 'entryid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '金额',
   'user', @CurrentUser, 'table', 't_seorderentry', 'column', 'famount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fallamount',
   'user', @CurrentUser, 'table', 't_seorderentry', 'column', 'fallamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '价税合计(本位币)',
   'user', @CurrentUser, 'table', 't_seorderentry', 'column', 'fallstdamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同单号',
   'user', @CurrentUser, 'table', 't_seorderentry', 'column', 'fcontractbillno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同分录',
   'user', @CurrentUser, 'table', 't_seorderentry', 'column', 'fcontractentryid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同内码',
   'user', @CurrentUser, 'table', 't_seorderentry', 'column', 'fcontractinterid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '交货日期',
   'user', @CurrentUser, 'table', 't_seorderentry', 'column', 'fdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'freceiveamountfor_commit',
   'user', @CurrentUser, 'table', 't_seorderentry', 'column', 'freceiveamountfor_commit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'freceiveamount_commit',
   'user', @CurrentUser, 'table', 't_seorderentry', 'column', 'freceiveamount_commit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '成本对象',
   'user', @CurrentUser, 'table', 't_seorderentry', 'column', 'fcostobjectid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '产品代码',
   'user', @CurrentUser, 'table', 't_seorderentry', 'column', 'fitemid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '折后金额',
   'user', @CurrentUser, 'table', 't_seorderentry', 'column', 'ffinalamount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '客户订单号',
   'user', @CurrentUser, 'table', 't_seorderentry', 'column', 'forderbillno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单行号',
   'user', @CurrentUser, 'table', 't_seorderentry', 'column', 'forderentryid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订单内码',
   'user', @CurrentUser, 'table', 't_seorderentry', 'column', 'finterid'
go

/*==============================================================*/
/* Table: t_sortcodefir                                         */
/*==============================================================*/
create table t_sortcodefir (
   firid                bigint               identity,
   fircode              nvarchar(50)         null,
   firname              nvarchar(50)         null,
   fiedesc              nvarchar(50)         null,
   firenable            nvarchar(50)         null,
   emplid               bigint               null,
   lastupdate           datetime             null,
   constraint PK_T_SORTCODEFIR primary key (firid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '一级代码表',
   'user', @CurrentUser, 'table', 't_sortcodefir'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'firid',
   'user', @CurrentUser, 'table', 't_sortcodefir', 'column', 'firid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fircode',
   'user', @CurrentUser, 'table', 't_sortcodefir', 'column', 'fircode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'firname',
   'user', @CurrentUser, 'table', 't_sortcodefir', 'column', 'firname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fiedesc',
   'user', @CurrentUser, 'table', 't_sortcodefir', 'column', 'fiedesc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'firenable',
   'user', @CurrentUser, 'table', 't_sortcodefir', 'column', 'firenable'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'emplid',
   'user', @CurrentUser, 'table', 't_sortcodefir', 'column', 'emplid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'lastupdate',
   'user', @CurrentUser, 'table', 't_sortcodefir', 'column', 'lastupdate'
go

/*==============================================================*/
/* Table: t_sortcodesec                                         */
/*==============================================================*/
create table t_sortcodesec (
   secid                bigint               identity,
   seccode              nvarchar(50)         null,
   secname              nvarchar(50)         null,
   secdesc              nvarchar(50)         null,
   secenable            nvarchar(50)         null,
   emplid               bigint               null,
   lastupdate           datetime             null,
   firid                bigint               null,
   constraint PK_T_SORTCODESEC primary key (secid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '二级代码表',
   'user', @CurrentUser, 'table', 't_sortcodesec'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'secid',
   'user', @CurrentUser, 'table', 't_sortcodesec', 'column', 'secid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'seccode',
   'user', @CurrentUser, 'table', 't_sortcodesec', 'column', 'seccode'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'secname',
   'user', @CurrentUser, 'table', 't_sortcodesec', 'column', 'secname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'secdesc',
   'user', @CurrentUser, 'table', 't_sortcodesec', 'column', 'secdesc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'secenable',
   'user', @CurrentUser, 'table', 't_sortcodesec', 'column', 'secenable'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'emplid',
   'user', @CurrentUser, 'table', 't_sortcodesec', 'column', 'emplid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'lastupdate',
   'user', @CurrentUser, 'table', 't_sortcodesec', 'column', 'lastupdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'firid',
   'user', @CurrentUser, 'table', 't_sortcodesec', 'column', 'firid'
go

/*==============================================================*/
/* Table: t_structure                                           */
/*==============================================================*/
create table t_structure (
   id                   bigint               not null,
   structureName        nvarchar(10)         null,
   structureType        int                  null,
   structureDesc        nvarchar(200)        null,
   isuse                int                  null,
   constraint PK_T_STRUCTURE primary key (id)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结构型式表',
   'user', @CurrentUser, 'table', 't_structure'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 't_structure', 'column', 'id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结构型式名称',
   'user', @CurrentUser, 'table', 't_structure', 'column', 'structureName'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结构形式类型',
   'user', @CurrentUser, 'table', 't_structure', 'column', 'structureType'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结构型式描述',
   'user', @CurrentUser, 'table', 't_structure', 'column', 'structureDesc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否使用',
   'user', @CurrentUser, 'table', 't_structure', 'column', 'isuse'
go

/*==============================================================*/
/* Table: t_summary                                             */
/*==============================================================*/
create table t_summary (
   sumid                bigint               identity,
   fyear                nvarchar(10)         null,
   fmonth               nvarchar(10)         null,
   areaid               bigint               null,
   provinceid           bigint               null,
   provincename         nvarchar(50)         null,
   areaname             nvarchar(50)         null,
   salesrep             bigint               null,
   classa               decimal(20,10)       null,
   classb               decimal(20,10)       null,
   classc               decimal(20,10)       null,
   classd               decimal(20,10)       null,
   classe               decimal(20,10)       null,
   fee                  decimal(20,10)       null,
   adminid              bigint               null,
   createdate           datetime             null,
   bitem                decimal(20,10)       null,
   bigitem              decimal(20,10)       null,
   constraint PK_T_SUMMARY primary key (sumid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售数据汇总表',
   'user', @CurrentUser, 'table', 't_summary'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'sumid',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'sumid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '年',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'fyear'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '月',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'fmonth'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '区域',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'areaid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '省',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'provinceid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '省名',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'provincename'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '区域名',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'areaname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '销售员',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'salesrep'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'A类',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'classa'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'B类',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'classb'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'C类',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'classc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'D类',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'classd'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'E类',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'classe'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '服务费',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'fee'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '汇总人',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'adminid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '汇总时间',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'createdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '基础项目',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'bitem'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '大项目',
   'user', @CurrentUser, 'table', 't_summary', 'column', 'bigitem'
go

/*==============================================================*/
/* Table: t_surveys                                             */
/*==============================================================*/
create table t_surveys (
   surveysid            bigint               identity,
   finnerid             bigint               null,
   flevelid             bigint               null,
   fyear                nvarchar(10)         null,
   fscore               decimal(20,10)       null,
   fdate                datetime             null,
   femp                 bigint               null,
   fdescribe            nvarchar(200)        null,
   ftimes               int                  null default 0,
   constraint PK_T_SURVEYS primary key (surveysid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '评分调查表',
   'user', @CurrentUser, 'table', 't_surveys'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'surveysid',
   'user', @CurrentUser, 'table', 't_surveys', 'column', 'surveysid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'finnerid',
   'user', @CurrentUser, 'table', 't_surveys', 'column', 'finnerid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '等级',
   'user', @CurrentUser, 'table', 't_surveys', 'column', 'flevelid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fyear',
   'user', @CurrentUser, 'table', 't_surveys', 'column', 'fyear'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '得分',
   'user', @CurrentUser, 'table', 't_surveys', 'column', 'fscore'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '评分日期',
   'user', @CurrentUser, 'table', 't_surveys', 'column', 'fdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '评分人',
   'user', @CurrentUser, 'table', 't_surveys', 'column', 'femp'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '评分描述',
   'user', @CurrentUser, 'table', 't_surveys', 'column', 'fdescribe'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '评分次数',
   'user', @CurrentUser, 'table', 't_surveys', 'column', 'ftimes'
go

/*==============================================================*/
/* Table: t_surveys_entry                                       */
/*==============================================================*/
create table t_surveys_entry (
   id                   bigint               identity,
   gwid                 bigint               null,
   surveysid            bigint               null,
   finnerid             bigint               null,
   scoreval             decimal(10,2)        null,
   fyear                nvarchar(50)         null,
   gwval                decimal(10,0)        null,
   money                decimal(20,10)       null,
   notes                nvarchar(200)        null,
   constraint PK_T_SURVEYS_ENTRY primary key (id)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '评分调查明细',
   'user', @CurrentUser, 'table', 't_surveys_entry'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 't_surveys_entry', 'column', 'id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '评分权重项',
   'user', @CurrentUser, 'table', 't_surveys_entry', 'column', 'gwid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'surveysid',
   'user', @CurrentUser, 'table', 't_surveys_entry', 'column', 'surveysid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'finnerid',
   'user', @CurrentUser, 'table', 't_surveys_entry', 'column', 'finnerid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '评分值',
   'user', @CurrentUser, 'table', 't_surveys_entry', 'column', 'scoreval'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '年',
   'user', @CurrentUser, 'table', 't_surveys_entry', 'column', 'fyear'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '权重值',
   'user', @CurrentUser, 'table', 't_surveys_entry', 'column', 'gwval'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '金额',
   'user', @CurrentUser, 'table', 't_surveys_entry', 'column', 'money'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '评分条件',
   'user', @CurrentUser, 'table', 't_surveys_entry', 'column', 'notes'
go

/*==============================================================*/
/* Table: t_sysorder                                            */
/*==============================================================*/
create table dbo.t_sysorder (
   sysOrderId           bigint               identity,
   orderCode            nvarchar(50)         not null,
   contractCode         nvarchar(50)         null,
   contractName         nvarchar(50)         null,
   userName             varchar(50)          null,
   userId               bigint               null,
   contractTime         datetime             null,
   checkProject         nvarchar(500)        null,
   checkProjectId       bigint               null,
   contractTxt          nvarchar(500)        null,
   contractType         int                  null,
   model                nvarchar(30)         null,
   biddingNotice        nvarchar(500)        null,
   coinType             varchar(50)          null,
   bussinessType        varchar(5)           null,
   contractReview       nvarchar(100)        null,
   exchangeRate         varchar(50)          null,
   systemConsumer       nvarchar(500)        null,
   systemConsumerId     bigint               null,
   finalConsumer        nvarchar(500)        null,
   finalConsumerId      bigint               null,
   contractVersion      nvarchar(10)         null,
   changeReason         nvarchar(500)        null,
   changeTime           datetime             null default getdate(),
   billUserId           bigint               null,
   billUserName         varchar(50)          null,
   changeUserId         bigint               null,
   changeUserName       nvarchar(200)        null,
   marketManagerAdvice  nvarchar(200)        null,
   businessUserId       bigint               null,
   businessUser         nvarchar(500)        null,
   printCount           int                  null,
   manager              nvarchar(200)        null,
   managerId            bigint               null,
   payCondition         nvarchar(200)        null,
   department           nvarchar(200)        null,
   departmentId         bigint               null,
   examineUserId        bigint               null,
   examineUserName      nvarchar(200)        null,
   warrantyTime         int                  null,
   province             nvarchar(500)        null,
   provinceId           bigint               null,
   examineTime          datetime             null,
   remarks              nvarchar(500)        null,
   sysOrderStatus       int                  null,
   customContractCode   varchar(50)          null,
   saleType             varchar(50)          null,
   saleArea             varchar(50)          null,
   changeAreaType       int                  null default (0),
   FHeadSelfS0156       bigint               null,
   pl3000count          int                  null,
   pl3000Unit           decimal(20,10)       null,
   pl3000listprice      decimal(20,10)       null,
   pl4200count          int                  null,
   pl4200Unit           decimal(20,10)       null,
   pl4200listprice      decimal(20,10)       null,
   ssv3500count         int                  null,
   ssv3500Unit          decimal(20,10)       null,
   ssv3500listprice     decimal(20,10)       null,
   spl2000count         int                  null,
   spl2000Unit          decimal(20,10)       null,
   spl2000listprice     decimal(20,10)       null,
   disCoefficient       decimal(10, 5)       null,
   dealerName           nvarchar(100)        null,
   isbill               int                  null default 0,
   operatorrate         decimal(10,4)        null,
   issummary            int                  null,
   constraint PK_T_SYSORDER primary key (sysOrderId)
         on "PRIMARY"
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   't_sysorder',
   'user', 'dbo', 'table', 't_sysorder'
go

execute sp_addextendedproperty 'MS_Description', 
   'sysOrderId',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'sysOrderId'
go

execute sp_addextendedproperty 'MS_Description', 
   '订单编号',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'orderCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同编号',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'contractCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同名称',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'contractName'
go

execute sp_addextendedproperty 'MS_Description', 
   '客户名称（预留）',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'userName'
go

execute sp_addextendedproperty 'MS_Description', 
   '客户Id（预留）',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'userId'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同时间',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'contractTime'
go

execute sp_addextendedproperty 'MS_Description', 
   '核算项目',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'checkProject'
go

execute sp_addextendedproperty 'MS_Description', 
   '核算项目Id',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'checkProjectId'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同文本',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'contractTxt'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同类型',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'contractType'
go

execute sp_addextendedproperty 'MS_Description', 
   '模式',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'model'
go

execute sp_addextendedproperty 'MS_Description', 
   '中标通知单',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'biddingNotice'
go

execute sp_addextendedproperty 'MS_Description', 
   '币种',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'coinType'
go

execute sp_addextendedproperty 'MS_Description', 
   '业务类型',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'bussinessType'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同评审单',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'contractReview'
go

execute sp_addextendedproperty 'MS_Description', 
   '汇率',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'exchangeRate'
go

execute sp_addextendedproperty 'MS_Description', 
   '体系客户',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'systemConsumer'
go

execute sp_addextendedproperty 'MS_Description', 
   '体系客户Id',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'systemConsumerId'
go

execute sp_addextendedproperty 'MS_Description', 
   '最终用户',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'finalConsumer'
go

execute sp_addextendedproperty 'MS_Description', 
   '最终用户Id',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'finalConsumerId'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同版本',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'contractVersion'
go

execute sp_addextendedproperty 'MS_Description', 
   '变更原因',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'changeReason'
go

execute sp_addextendedproperty 'MS_Description', 
   '变更时间',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'changeTime'
go

execute sp_addextendedproperty 'MS_Description', 
   '发票接收人ID(预留)',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'billUserId'
go

execute sp_addextendedproperty 'MS_Description', 
   '发票接收人名称(预留)',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'billUserName'
go

execute sp_addextendedproperty 'MS_Description', 
   '变更人ID',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'changeUserId'
go

execute sp_addextendedproperty 'MS_Description', 
   '变更人名称',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'changeUserName'
go

execute sp_addextendedproperty 'MS_Description', 
   '营销主管意见(预留)',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'marketManagerAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   '业务员Id',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'businessUserId'
go

execute sp_addextendedproperty 'MS_Description', 
   '业务员名称',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'businessUser'
go

execute sp_addextendedproperty 'MS_Description', 
   '打印次数',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'printCount'
go

execute sp_addextendedproperty 'MS_Description', 
   '主管人名称',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'manager'
go

execute sp_addextendedproperty 'MS_Description', 
   '主管人Id',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'managerId'
go

execute sp_addextendedproperty 'MS_Description', 
   '付款条件',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'payCondition'
go

execute sp_addextendedproperty 'MS_Description', 
   '部门名称',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'department'
go

execute sp_addextendedproperty 'MS_Description', 
   '部门ID',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'departmentId'
go

execute sp_addextendedproperty 'MS_Description', 
   '审核人ID',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'examineUserId'
go

execute sp_addextendedproperty 'MS_Description', 
   '审核人名称',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'examineUserName'
go

execute sp_addextendedproperty 'MS_Description', 
   '保质时间',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'warrantyTime'
go

execute sp_addextendedproperty 'MS_Description', 
   '省份',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'province'
go

execute sp_addextendedproperty 'MS_Description', 
   '省份Id',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'provinceId'
go

execute sp_addextendedproperty 'MS_Description', 
   '审核时间',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'examineTime'
go

execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'remarks'
go

execute sp_addextendedproperty 'MS_Description', 
   '合同状态',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'sysOrderStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   '客户合同号',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'customContractCode'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售方式',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'saleType'
go

execute sp_addextendedproperty 'MS_Description', 
   '销售范围',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'saleArea'
go

execute sp_addextendedproperty 'MS_Description', 
   '可变范围',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'changeAreaType'
go

execute sp_addextendedproperty 'MS_Description', 
   '是否有合同',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'FHeadSelfS0156'
go

execute sp_addextendedproperty 'MS_Description', 
   'pl3000数量',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'pl3000count'
go

execute sp_addextendedproperty 'MS_Description', 
   'pl3000单价',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'pl3000Unit'
go

execute sp_addextendedproperty 'MS_Description', 
   'PL3000列表价',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'pl3000listprice'
go

execute sp_addextendedproperty 'MS_Description', 
   'PL4200数量',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'pl4200count'
go

execute sp_addextendedproperty 'MS_Description', 
   'PL4200单价',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'pl4200Unit'
go

execute sp_addextendedproperty 'MS_Description', 
   'PL4200列表价',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'pl4200listprice'
go

execute sp_addextendedproperty 'MS_Description', 
   'SSV3500数量',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'ssv3500count'
go

execute sp_addextendedproperty 'MS_Description', 
   'SSV3500单价',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'ssv3500Unit'
go

execute sp_addextendedproperty 'MS_Description', 
   'SSV3500列表价',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'ssv3500listprice'
go

execute sp_addextendedproperty 'MS_Description', 
   'SPL2000数量',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'spl2000count'
go

execute sp_addextendedproperty 'MS_Description', 
   'SPL2000单价',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'spl2000Unit'
go

execute sp_addextendedproperty 'MS_Description', 
   'SPL2000列表价',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'spl2000listprice'
go

execute sp_addextendedproperty 'MS_Description', 
   '经销奖励系数',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'disCoefficient'
go

execute sp_addextendedproperty 'MS_Description', 
   '经销商',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'dealerName'
go

execute sp_addextendedproperty 'MS_Description', 
   '0:未记账，1：已记账',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'isbill'
go

execute sp_addextendedproperty 'MS_Description', 
   '经销业务费系数',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'operatorrate'
go

execute sp_addextendedproperty 'MS_Description', 
   '是否已汇总',
   'user', 'dbo', 'table', 't_sysorder', 'column', 'issummary'
go

/*==============================================================*/
/* Table: t_sysorder_history                                    */
/*==============================================================*/
create table dbo.t_sysorder_history (
   sysOrderId           bigint               identity,
   orderCode            nvarchar(50)         not null,
   contractCode         nvarchar(50)         null,
   contractName         nvarchar(50)         null,
   userName             varchar(50)          null,
   userId               bigint               null,
   contractTime         datetime             null,
   checkProject         nvarchar(500)        null,
   checkProjectId       bigint               null,
   contractTxt          nvarchar(500)        null,
   contractType         int                  null,
   model                nvarchar(30)         null,
   biddingNotice        nvarchar(500)        null,
   coinType             varchar(50)          null,
   bussinessType        varchar(5)           null,
   contractReview       nvarchar(100)        null,
   exchangeRate         varchar(50)          null,
   systemConsumer       nvarchar(500)        null,
   systemConsumerId     bigint               null,
   finalConsumer        nvarchar(500)        null,
   finalConsumerId      bigint               null,
   contractVersion      nvarchar(10)         null,
   changeReason         nvarchar(500)        null,
   changeTime           datetime             null default getdate(),
   billUserId           bigint               null,
   billUserName         varchar(50)          null,
   changeUserId         bigint               null,
   changeUserName       nvarchar(200)        null,
   marketManagerAdvice  nvarchar(200)        null,
   businessUserId       bigint               null,
   businessUser         nvarchar(500)        null,
   printCount           int                  null,
   manager              nvarchar(200)        null,
   managerId            bigint               null,
   payCondition         nvarchar(200)        null,
   department           nvarchar(200)        null,
   departmentId         bigint               null,
   examineUserId        bigint               null,
   examineUserName      nvarchar(200)        null,
   warrantyTime         int                  null,
   province             nvarchar(500)        null,
   provinceId           bigint               null,
   examineTime          datetime             null,
   remarks              nvarchar(500)        null,
   sysOrderStatus       int                  null,
   customContractCode   varchar(50)          null,
   saleType             varchar(50)          null,
   saleArea             varchar(50)          null,
   changeAreaType       int                  null default (0),
   FHeadSelfS0156       bigint               null,
   disCoefficient       decimal(10, 5)       null,
   dealerName           nvarchar(100)        null,
   pL3000Count          int                  null,
   pL3000Unit           decimal(20, 10)      null,
   pL4200Count          int                  null,
   pL4200Unit           decimal(20, 10)      null,
   sSV3500Count         int                  null,
   sSV3500Unit          decimal(20, 10)      null,
   sPL2000Count         int                  null,
   sPL2000Unit          decimal(20, 10)      null,
   pL3000ListPrice      decimal(20, 10)      null,
   pL4200ListPrice      decimal(20, 10)      null,
   sSV3500ListPrice     decimal(20, 10)      null,
   sPL2000ListPrice     decimal(20, 10)      null,
   operatorrate         decimal(10,4)        null,
   isbill               integer              null,
   constraint PK_T_SYSORDER_HISTORY primary key (sysOrderId)
         on "PRIMARY"
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   't_sysorder_history',
   'user', 'dbo', 'table', 't_sysorder_history'
go

execute sp_addextendedproperty 'MS_Description', 
   'sysOrderId',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'sysOrderId'
go

execute sp_addextendedproperty 'MS_Description', 
   'orderCode',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'orderCode'
go

execute sp_addextendedproperty 'MS_Description', 
   'contractCode',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'contractCode'
go

execute sp_addextendedproperty 'MS_Description', 
   'contractName',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'contractName'
go

execute sp_addextendedproperty 'MS_Description', 
   'userName',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'userName'
go

execute sp_addextendedproperty 'MS_Description', 
   'userId',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'userId'
go

execute sp_addextendedproperty 'MS_Description', 
   'contractTime',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'contractTime'
go

execute sp_addextendedproperty 'MS_Description', 
   'checkProject',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'checkProject'
go

execute sp_addextendedproperty 'MS_Description', 
   'checkProjectId',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'checkProjectId'
go

execute sp_addextendedproperty 'MS_Description', 
   'contractTxt',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'contractTxt'
go

execute sp_addextendedproperty 'MS_Description', 
   'contractType',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'contractType'
go

execute sp_addextendedproperty 'MS_Description', 
   'model',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'model'
go

execute sp_addextendedproperty 'MS_Description', 
   'biddingNotice',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'biddingNotice'
go

execute sp_addextendedproperty 'MS_Description', 
   'coinType',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'coinType'
go

execute sp_addextendedproperty 'MS_Description', 
   'bussinessType',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'bussinessType'
go

execute sp_addextendedproperty 'MS_Description', 
   'contractReview',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'contractReview'
go

execute sp_addextendedproperty 'MS_Description', 
   'exchangeRate',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'exchangeRate'
go

execute sp_addextendedproperty 'MS_Description', 
   'systemConsumer',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'systemConsumer'
go

execute sp_addextendedproperty 'MS_Description', 
   'systemConsumerId',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'systemConsumerId'
go

execute sp_addextendedproperty 'MS_Description', 
   'finalConsumer',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'finalConsumer'
go

execute sp_addextendedproperty 'MS_Description', 
   'finalConsumerId',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'finalConsumerId'
go

execute sp_addextendedproperty 'MS_Description', 
   'contractVersion',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'contractVersion'
go

execute sp_addextendedproperty 'MS_Description', 
   'changeReason',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'changeReason'
go

execute sp_addextendedproperty 'MS_Description', 
   'changeTime',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'changeTime'
go

execute sp_addextendedproperty 'MS_Description', 
   'billUserId',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'billUserId'
go

execute sp_addextendedproperty 'MS_Description', 
   'billUserName',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'billUserName'
go

execute sp_addextendedproperty 'MS_Description', 
   'changeUserId',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'changeUserId'
go

execute sp_addextendedproperty 'MS_Description', 
   'changeUserName',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'changeUserName'
go

execute sp_addextendedproperty 'MS_Description', 
   'marketManagerAdvice',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'marketManagerAdvice'
go

execute sp_addextendedproperty 'MS_Description', 
   'businessUserId',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'businessUserId'
go

execute sp_addextendedproperty 'MS_Description', 
   'businessUser',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'businessUser'
go

execute sp_addextendedproperty 'MS_Description', 
   'printCount',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'printCount'
go

execute sp_addextendedproperty 'MS_Description', 
   'manager',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'manager'
go

execute sp_addextendedproperty 'MS_Description', 
   'managerId',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'managerId'
go

execute sp_addextendedproperty 'MS_Description', 
   'payCondition',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'payCondition'
go

execute sp_addextendedproperty 'MS_Description', 
   'department',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'department'
go

execute sp_addextendedproperty 'MS_Description', 
   'departmentId',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'departmentId'
go

execute sp_addextendedproperty 'MS_Description', 
   'examineUserId',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'examineUserId'
go

execute sp_addextendedproperty 'MS_Description', 
   'examineUserName',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'examineUserName'
go

execute sp_addextendedproperty 'MS_Description', 
   'warrantyTime',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'warrantyTime'
go

execute sp_addextendedproperty 'MS_Description', 
   'province',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'province'
go

execute sp_addextendedproperty 'MS_Description', 
   'provinceId',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'provinceId'
go

execute sp_addextendedproperty 'MS_Description', 
   'examineTime',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'examineTime'
go

execute sp_addextendedproperty 'MS_Description', 
   'remarks',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'remarks'
go

execute sp_addextendedproperty 'MS_Description', 
   'sysOrderStatus',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'sysOrderStatus'
go

execute sp_addextendedproperty 'MS_Description', 
   'customContractCode',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'customContractCode'
go

execute sp_addextendedproperty 'MS_Description', 
   'saleType',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'saleType'
go

execute sp_addextendedproperty 'MS_Description', 
   'saleArea',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'saleArea'
go

execute sp_addextendedproperty 'MS_Description', 
   'changeAreaType',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'changeAreaType'
go

execute sp_addextendedproperty 'MS_Description', 
   'FHeadSelfS0156',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'FHeadSelfS0156'
go

execute sp_addextendedproperty 'MS_Description', 
   'disCoefficient',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'disCoefficient'
go

execute sp_addextendedproperty 'MS_Description', 
   'dealerName',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'dealerName'
go

execute sp_addextendedproperty 'MS_Description', 
   'pL3000Count',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'pL3000Count'
go

execute sp_addextendedproperty 'MS_Description', 
   'pL3000Unit',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'pL3000Unit'
go

execute sp_addextendedproperty 'MS_Description', 
   'pL4200Count',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'pL4200Count'
go

execute sp_addextendedproperty 'MS_Description', 
   'pL4200Unit',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'pL4200Unit'
go

execute sp_addextendedproperty 'MS_Description', 
   'sSV3500Count',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'sSV3500Count'
go

execute sp_addextendedproperty 'MS_Description', 
   'sSV3500Unit',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'sSV3500Unit'
go

execute sp_addextendedproperty 'MS_Description', 
   'sPL2000Count',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'sPL2000Count'
go

execute sp_addextendedproperty 'MS_Description', 
   'sPL2000Unit',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'sPL2000Unit'
go

execute sp_addextendedproperty 'MS_Description', 
   'pL3000ListPrice',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'pL3000ListPrice'
go

execute sp_addextendedproperty 'MS_Description', 
   'pL4200ListPrice',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'pL4200ListPrice'
go

execute sp_addextendedproperty 'MS_Description', 
   'sSV3500ListPrice',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'sSV3500ListPrice'
go

execute sp_addextendedproperty 'MS_Description', 
   'sPL2000ListPrice',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'sPL2000ListPrice'
go

execute sp_addextendedproperty 'MS_Description', 
   '业务费系数',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'operatorrate'
go

execute sp_addextendedproperty 'MS_Description', 
   '日否已记帐',
   'user', 'dbo', 'table', 't_sysorder_history', 'column', 'isbill'
go

/*==============================================================*/
/* Table: t_tabledescription                                    */
/*==============================================================*/
create table t_tabledescription (
   ftableid             bigint               identity,
   ftablename           nvarchar(50)         null,
   ftablenote           nvarchar(200)        null,
   fdescription         nvarchar(200)        null,
   constraint PK_T_TABLEDESCRIPTION primary key (ftableid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '表描述表',
   'user', @CurrentUser, 'table', 't_tabledescription'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '表id',
   'user', @CurrentUser, 'table', 't_tabledescription', 'column', 'ftableid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '表名',
   'user', @CurrentUser, 'table', 't_tabledescription', 'column', 'ftablename'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '表描述',
   'user', @CurrentUser, 'table', 't_tabledescription', 'column', 'ftablenote'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 't_tabledescription', 'column', 'fdescription'
go

/*==============================================================*/
/* Table: t_team                                                */
/*==============================================================*/
create table t_team (
   teamseq              bigint               identity,
   fdeptid              bigint               null,
   adminid              bigint               null,
   fname                nvarchar(50)         null,
   constraint PK_T_TEAM primary key (teamseq)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '班组',
   'user', @CurrentUser, 'table', 't_team'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '班组id',
   'user', @CurrentUser, 'table', 't_team', 'column', 'teamseq'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '归属部门',
   'user', @CurrentUser, 'table', 't_team', 'column', 'fdeptid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '班组负责人',
   'user', @CurrentUser, 'table', 't_team', 'column', 'adminid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '班组名称',
   'user', @CurrentUser, 'table', 't_team', 'column', 'fname'
go

/*==============================================================*/
/* Table: t_tecnorm                                             */
/*==============================================================*/
create table t_tecnorm (
   parmid               bigint               identity,
   fformno              nvarchar(50)         null,
   fname                nvarchar(200)        null,
   fmo                  nvarchar(50)         null,
   fmodel               nvarchar(100)        null,
   addemp               bigint               null,
   createdate           datetime             null,
   desigen              bigint               null,
   fcheck               bigint               null,
   freview              bigint               null,
   reviewdate           datetime             null,
   bdesignermpa         nvarchar(50)         null,
   adesignermpa         nvarchar(50)         null,
   bdesignert           nvarchar(50)         null,
   adesignert           nvarchar(50)         null,
   bworkmpa             nvarchar(50)         null,
   aworkmpa             nvarchar(50)         null,
   bworkt               nvarchar(50)         null,
   aworkt               nvarchar(50)         null,
   fparam1              nvarchar(80)         null,
   fparam2              nvarchar(80)         null,
   fparam3              nvarchar(80)         null,
   fparam4              nvarchar(80)         null,
   fparam5              nvarchar(80)         null,
   fparam6              nvarchar(80)         null,
   fparam7              nvarchar(80)         null,
   fparam8              nvarchar(80)         null,
   fparam9              nvarchar(80)         null,
   fparam10             nvarchar(80)         null,
   fparam11             nvarchar(80)         null,
   fparam12             nvarchar(80)         null,
   fparam13             nvarchar(80)         null,
   fparam14             nvarchar(80)         null,
   fparam15             nvarchar(80)         null,
   fparam16             nvarchar(80)         null,
   fparam17             nvarchar(80)         null,
   fparam18             nvarchar(80)         null,
   fparam19             nvarchar(80)         null,
   fparam20             nvarchar(80)         null,
   fparam21             nvarchar(80)         null,
   fparam22             nvarchar(80)         null,
   fparam23             nvarchar(80)         null,
   fparam24             nvarchar(80)         null,
   fparam25             nvarchar(80)         null,
   fparam26             nvarchar(80)         null,
   fparam27             nvarchar(80)         null,
   fparam28             nvarchar(80)         null,
   fparam29             nvarchar(80)         null,
   fparam30             nvarchar(80)         null,
   fparam31             nvarchar(80)         null,
   fparam32             nvarchar(80)         null,
   fparam33             nvarchar(80)         null,
   fparam34             nvarchar(80)         null,
   fparam35             nvarchar(80)         null,
   fparam36             nvarchar(80)         null,
   fparam37             nvarchar(80)         null,
   fparam38             nvarchar(80)         null,
   fparam39             nvarchar(80)         null,
   fparam40             nvarchar(80)         null,
   fparam41             nvarchar(80)         null,
   fparam42             nvarchar(80)         null,
   fparam43             nvarchar(80)         null,
   fparam44             nvarchar(80)         null,
   fparam45             nvarchar(80)         null,
   fparam46             nvarchar(80)         null,
   fparam47             nvarchar(80)         null,
   fparam48             nvarchar(80)         null,
   fparam49             nvarchar(80)         null,
   fparam50             nvarchar(80)         null,
   fparam51             nvarchar(80)         null,
   fparam52             nvarchar(80)         null,
   fparam53             nvarchar(80)         null,
   fparam54             nvarchar(80)         null,
   fparam55             nvarchar(80)         null,
   constraint PK_T_TECNORM primary key (parmid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '产品设计指标与要求',
   'user', @CurrentUser, 'table', 't_tecnorm'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'parmid',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'parmid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '表单编号',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fformno'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '产品名称',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '制令号',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fmo'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '型号',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fmodel'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '制单人',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'addemp'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '制单时间',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'createdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设计',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'desigen'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '校核',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fcheck'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '审核',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'freview'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '审核时间',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'reviewdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设计压力前',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'bdesignermpa'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设计压力后',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'adesignermpa'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设计温度前',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'bdesignert'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '设计温度后',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'adesignert'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最高工作压力前',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'bworkmpa'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最高工作压力后',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'aworkmpa'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最高工作温度前',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'bworkt'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最高工作温度后',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'aworkt'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数1',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam1'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数2',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam2'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数3',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam3'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数4',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam4'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数5',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam5'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数6',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam6'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数7',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam7'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数8',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam8'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数9',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam9'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数10',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam10'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数11',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam11'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数12',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam12'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数13',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam13'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数14',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam14'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数15',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam15'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数16',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam16'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数17',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam17'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数18',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam18'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数19',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam19'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数20',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam20'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数21',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam21'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数22',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam22'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数23',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam23'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数24',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam24'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数25',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam25'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数26',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam26'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数27',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam27'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数28',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam28'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数29',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam29'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数30',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam30'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数31',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam31'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数32',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam32'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数33',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam33'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数34',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam34'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数35',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam35'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数36',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam36'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数37',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam37'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数38',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam38'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数39',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam39'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数40',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam40'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数41',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam41'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数42',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam42'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数43',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam43'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数44',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam44'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数45',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam45'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数46',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam46'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数47',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam47'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数48',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam48'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数49',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam49'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数50',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam50'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数51',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam51'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数52',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam52'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数53',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam53'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数54',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam54'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参数55',
   'user', @CurrentUser, 'table', 't_tecnorm', 'column', 'fparam55'
go

/*==============================================================*/
/* Table: t_win_company                                         */
/*==============================================================*/
create table t_win_company (
   winid                bigint               not null,
   pmid                 bigint               null,
   competitorid         bigint               null,
   sectionid            bigint               null,
   constraint PK_T_WIN_COMPANY primary key (winid)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目中标公司',
   'user', @CurrentUser, 'table', 't_win_company'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'winid',
   'user', @CurrentUser, 'table', 't_win_company', 'column', 'winid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'pmid',
   'user', @CurrentUser, 'table', 't_win_company', 'column', 'pmid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'competitorid',
   'user', @CurrentUser, 'table', 't_win_company', 'column', 'competitorid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'sectionid',
   'user', @CurrentUser, 'table', 't_win_company', 'column', 'sectionid'
go

alter table t_admin
   add constraint FK_T_ADMIN_REFERENCE_T_DUTY foreign key (dutyid)
      references t_duty (dutyid)
go

alter table t_admin
   add constraint FK_T_ADMIN_REFERENCE_T_AREA foreign key (areaid)
      references t_area (areaid)
go

alter table t_admin
   add constraint FK_T_ADMIN_REFERENCE_T_PROVIN foreign key (provinceid)
      references t_province (provinceid)
go

alter table t_admin_orggroup
   add constraint FK_T_ADMIN__REFERENCE_T_ORGGRA foreign key (groupid)
      references t_orggrantgroup (groupid)
go

alter table t_admin_orggroup
   add constraint FK_T_ADMIN__REFERENCE_T_ADMIN foreign key (adminId)
      references t_admin (adminId)
go

alter table t_admin_province
   add constraint FK_T_ADMIN__REFERENCE_T_PROVIN foreign key (provinceid)
      references t_province (provinceid)
go

alter table t_admin_province
   add constraint FK_T_ADMIN__REFERENCE_T_ADMIN_PROVINCE foreign key (adminid)
      references t_admin (adminId)
go

alter table t_admin_province
   add constraint FK_T_ADMIN__REFERENCE_T_AREA foreign key (areaid)
      references t_area (areaid)
go

alter table t_area
   add constraint FK_T_AREA_REFERENCE_T_ADMIN foreign key (adminid)
      references t_admin (adminId)
go

alter table t_bitem
   add constraint FK_T_BITEM_REFERENCE_T_ITEMCL foreign key (fitemclassid)
      references t_itemclass (fitemclassid)
go

alter table t_cdepartment
   add constraint FK_T_CDEPAR_REFERENCE_T_ORGANI foreign key (finnerid)
      references t_organization (finnerid)
go

alter table t_crm_contact
   add constraint FK_T_CRM_CO_REFERENCE_T_ORGANI foreign key (finnerid)
      references t_organization (finnerid)
go

alter table t_crm_contact
   add constraint FK_T_CRM_CO_REFERENCE_T_CDEPAR foreign key (departid)
      references t_cdepartment (departid)
go

alter table t_customer_score
   add constraint FK_T_CUSTOM_REFERENCE_T_AREA foreign key (areaid)
      references t_area (areaid)
go

alter table t_customer_score
   add constraint FK_T_CUSTOM_REFERENCE_T_PROVIN foreign key (provinceid)
      references t_province (provinceid)
go

alter table t_customer_score
   add constraint FK_T_CUSTOM_REFERENCE_T_ORGANI foreign key (finnerid)
      references t_organization (finnerid)
go

alter table t_customer_score
   add constraint FK_T_CUSTOM_REFERENCE_T_BLOC foreign key (blocid)
      references t_bloc (blocid)
go

alter table t_department
   add constraint FK_T_DEPART_REFERENCE_T_ADMIN foreign key (adminId)
      references t_admin (adminId)
go

alter table t_duty
   add constraint FK_T_DUTY_REFERENCE_T_DEPART foreign key (teamid)
      references t_department (teamid)
go

alter table t_duty_organ
   add constraint FK_T_DUTY_O_REFERENCE_T_DUTY foreign key (dutyid)
      references t_duty (dutyid)
go

alter table t_duty_organ
   add constraint FK_T_DUTY_O_REFERENCE_T_ORGANI foreign key (finnerid)
      references t_organization (finnerid)
go

alter table t_employee
   add constraint FK_T_EMPLOY_REFERENCE_T_TEAM foreign key (teamseq)
      references t_team (teamseq)
go

alter table t_employee
   add constraint FK_T_EMPLOY_REFERENCE_T_DUTY foreign key (dutyid)
      references t_duty (dutyid)
go

alter table t_employee
   add constraint FK_T_EMPLOY_REFERENCE_T_DEPART foreign key (teamid)
      references t_department (teamid)
go

alter table t_enduser
   add constraint FK_T_ENDUSE_REFERENCE_T_AREA foreign key (areaid)
      references t_area (areaid)
go

alter table t_enduser
   add constraint FK_T_ENDUSE_REFERENCE_T_CDEPAR foreign key (departid)
      references t_cdepartment (departid)
go

alter table t_enduser
   add constraint FK_T_ENDUSE_REFERENCE_T_PROVIN foreign key (provinceid)
      references t_province (provinceid)
go

alter table t_fielddescription
   add constraint FK_T_FIELDD_REFERENCE_T_TABLED foreign key (ftableid)
      references t_tabledescription (ftableid)
go

alter table t_forderinstock
   add constraint FK_T_FORDER_REFERENCE_T_RECEIVSTOCK foreign key (receivableid)
      references t_receivable (receivableid)
go

alter table t_forderinvoice
   add constraint FK_T_FORDER_REFERENCE_T_RECEIV_INVOICE foreign key (receivableid)
      references t_receivable (receivableid)
go

alter table t_forderrefund
   add constraint FK_T_FORDER_REFERENCE_T_RECEIV_REFUND foreign key (receivableid)
      references t_receivable (receivableid)
go

alter table t_fordersend
   add constraint FK_T_FORDER_REFERENCE_T_RECEIV foreign key (receivableid)
      references t_receivable (receivableid)
go

alter table t_item
   add constraint FK_T_ITEM_REFERENCE_T_PDCATE foreign key (categoryid)
      references t_pdcategory (categoryid)
go

alter table t_item_rule
   add constraint FK_T_ITEM_R_REFERENCE_T_BITEM foreign key (fitemid)
      references t_bitem (fitemid)
go

alter table t_item_rule_detail
   add constraint FK_T_ITEM_R_REFERENCE_T_ITEM_R foreign key (itemruleid)
      references t_item_rule (itemruleid)
go

alter table t_item_rule_detail
   add constraint FK_T_ITEM_R_REFERENCE_T_BITEM_RULE foreign key (fitemid)
      references t_bitem (fitemid)
go

alter table t_org_orggorup
   add constraint FK_T_ORG_OR_REFERENCE_T_ORGGRA foreign key (groupid)
      references t_orggrantgroup (groupid)
go

alter table t_org_orggorup
   add constraint FK_T_ORG_OR_REFERENCE_T_ORGANI foreign key (finnerid)
      references t_organization (finnerid)
go

alter table t_organization
   add constraint FK_T_ORGANI_REFERENCE_T_AREA foreign key (areaid)
      references t_area (areaid)
go

alter table t_organization
   add constraint FK_T_ORGANI_REFERENCE_T_PROVIN foreign key (provinceid)
      references t_province (provinceid)
go

alter table t_organization
   add constraint FK_T_ORGANI_REFERENCE_T_BLOC foreign key (blocid)
      references t_bloc (blocid)
go

alter table t_pdbase
   add constraint FK_T_PDBASE_REFERENCE_T_SALEST foreign key (salestypename)
      references t_salestype (salestypeid)
go

alter table t_pdbase
   add constraint FK_T_PDBASE_REFERENCE_T_PROVIN foreign key (provinceid)
      references t_province (provinceid)
go

alter table t_pdbase
   add constraint FK_T_PDBASE_REFERENCE_T_ADMIN foreign key (adminId)
      references t_admin (adminId)
go

alter table t_per_fee
   add constraint FK_T_PER_FE_REFERENCE_T_RP_BIL foreign key (fbillid)
      references t_rp_bill (fbillid)
go

alter table t_performance
   add constraint FK_T_PERFOR_REFERENCE_T_PRODUC foreign key (productId)
      references dbo.t_product (productId)
go

alter table t_pm
   add constraint FK_T_PM_REFERENCE_T_KEY_DE foreign key (deviceid)
      references t_key_device (deviceid)
go

alter table t_pm
   add constraint FK_T_PM_REFERENCE_T_SDARI_ foreign key (engineerid)
      references t_sdari_engineer (engineerid)
go

alter table t_pm
   add constraint FK_T_PM_REFERENCE_T_SDARI foreign key (finterid)
      references t_sdari (finterid)
go

alter table t_pm
   add constraint FK_T_PM_REFERENCE_T_ORGANI foreign key (finnerid)
      references t_organization (finnerid)
go

alter table t_pm_competitor
   add constraint FK_T_PM_COM_REFERENCE_T_PM foreign key (pmid)
      references t_pm (pmid)
go

alter table t_pm_competitor
   add constraint FK_T_PM_COM_REFERENCE_T_COMPET foreign key (competitorid)
      references t_competitor (competitorid)
go

alter table t_pm_competitor
   add constraint FK_T_PM_COM_REFERENCE_T_PM_SEC foreign key (sectionid)
      references t_pm_section (sectionid)
go

alter table t_pm_section
   add constraint FK_T_PM_SEC_REFERENCE_T_PM foreign key (pmid)
      references t_pm (pmid)
go

alter table t_pm_section
   add constraint FK_T_PM_SEC_REFERENCE_T_KEY_DE foreign key (deviceid)
      references t_key_device (deviceid)
go

alter table t_productpl
   add constraint FK_T_PRODUC_REFERENCE_T_PRODUC foreign key (productId)
      references dbo.t_product (productId)
go

alter table t_project_bom
   add constraint FK_T_PROJEC_REFERENCE_T_PROJEC foreign key (infoid)
      references t_project_info (id)
go

alter table t_province
   add constraint FK_T_PROVIN_REFERENCE_T_AREA foreign key (areaid)
      references t_area (areaid)
go

alter table t_rece_pl
   add constraint FK_T_RECE_P_REFERENCE_T_RECEIV foreign key (receivableid)
      references t_receivable (receivableid)
go

alter table t_rp_exchange
   add constraint FK_T_RP_EXC_REFERENCE_T_RP_NEW foreign key (rpid)
      references t_rp_newreceivebill (rpid)
go

alter table t_sdari_engineer
   add constraint FK_T_SDARI__REFERENCE_T_SDARI foreign key (finterid)
      references t_sdari (finterid)
go

alter table t_sortcodesec
   add constraint FK_T_SORTCO_REFERENCE_T_SORTCO foreign key (firid)
      references t_sortcodefir (firid)
go

alter table t_surveys
   add constraint FK_T_SURVEY_REFERENCE_T_ORGANI foreign key (finnerid)
      references t_organization (finnerid)
go

alter table t_surveys
   add constraint FK_T_SURVEY_REFERENCE_T_GRADES foreign key (flevelid)
      references t_grades (flevelid)
go

alter table t_surveys_entry
   add constraint FK_T_SURVEY_REFERENCE_T_SURVEY foreign key (surveysid)
      references t_surveys (surveysid)
go

alter table t_surveys_entry
   add constraint FK_T_SURVEY_REFERENCE_T_GRADE_ foreign key (gwid)
      references t_grade_wight (gwid)
go

alter table t_surveys_entry
   add constraint FK_T_SURVEY_REFERENCE_T_ORGANI_entry foreign key (finnerid)
      references t_organization (finnerid)
go

alter table t_team
   add constraint FK_T_TEAM_REFERENCE_T_DEPART foreign key (fdeptid)
      references t_department (teamid)
go

alter table t_team
   add constraint FK_T_TEAM_REFERENCE_T_ADMIN foreign key (adminid)
      references t_admin (adminId)
go

alter table t_win_company
   add constraint FK_T_WIN_CO_REFERENCE_T_PM foreign key (pmid)
      references t_pm (pmid)
go

alter table t_win_company
   add constraint FK_T_WIN_CO_REFERENCE_T_COMPET foreign key (competitorid)
      references t_competitor (competitorid)
go

alter table t_win_company
   add constraint FK_T_WIN_CO_REFERENCE_T_PM_SEC foreign key (sectionid)
      references t_pm_section (sectionid)
go

create table t_performance_detail (
   detailid             bigint               not null,
   forderno             nvarchar(50)         null,
   fcontractno          nvarchar(50)         null,
   productid            bigint               null,
   refundid             bigint               null,
   achrewardtype        int          null,
   achrewardamount      decimal(10,2)        null,
   excrewardtype        int          null,
   excrewardamount      decimal(10,2)        null,
   servicefeetype       int          null,
   servicefeeamount     decimal(10,2)        null,
   ispl                 int                  null,
   plamount             decimal(10,2)        null,
   isspecial            int                  null,
   specialamount        decimal(10,2)        null,
   isdebit              int                  null,
   debitamount          decimal(10,2)        null,
   salerid              bigint               null,
   belongsaleid         bigint               null,
   createtime           datetime             null,
   fyear                int                  null,
   fquarter             int                  null,
   isexstock            int                  null,
   isexstockwards       decimal(10,2)        null,
   bailtype             int                  null,
   bailwards            decimal(10,2)        null,
   constraint PK_T_PERFORMANCE_DETAIL primary key (detailid)
)
go