package com.terrence.crm.dol.contasnt;

import org.springframework.context.support.StaticApplicationContext;

public interface TerrcnceConstants {
	/**已下推**/
	public static final Integer ORDER_BOMPUSH_STATE_PUSHED=1;
	/**未下推**/
	public static final Integer ORDER_BOMPUSH_STATE_UNPUSH=0;
	
	/**已审**/
	public static final Integer PLANDETAIL_STATE_CHECKED=1;
	/**未审**/
	public static final Integer PLANDETAIL_STATE_UNCHECK=0;
	
	/**0:产品，1:零部件外购，2自制物料,3原材料外购**/
	public static final Integer PLANDETAIL_PROPERTY_PD=0;
	public static final Integer PLANDETAIL_PROPERTY_PART=1;
	public static final Integer PLANDETAIL_PROPERTY_SELF=2;
	public static final Integer PLANDETAIL_PROPERTY_MATERIAL=3;
	
	/**计划来源,1:手工添加，2：订单下推**/
	public static final Integer PLAN_SOURCE_HAND=1;
	public static final Integer PLAN_SOURCE_ORDER=2;
	
	/**订单下推装配日期4天，装配下推零件7天,订单下推未做工艺任务3天**/
	public static final Integer ORDER_TO_ASSEMBLE=-4;
	public static final Integer ASSEMBLE_TO_MACH=-7;
	public static final Integer ORDER_TO_PROCESS=3;
	/**
	 * 采购装态0:未采购，1,采购中,2:结束
	 */
	public static final Integer PO_STATE_NOT_BUY=0;
	public static final Integer PO_STATE_BUY=1;
	public static final Integer PO_STATE_BUYED=2;
	/**采购单邮件发送状态0：未发送，1：已发送**/
	public static final Integer PO_MAILSTATE_NOTSEND=0;
	public static final Integer PO_MAILSTATE_SENDED=1;
	/**机加未排产计划数据排产状态**/
	public static final Integer MACH_DISPATCH_STATE_NO=0;
	public static final Integer MACH_DISPATCH_STATE_YES=1;
	
	/**未排产计划来源,1:计划,2:订单 **/
	public static final Integer WORK_PLAN_SOURCE_PLAN=1;
	public static final Integer WORK_PLAN_SOURCE_ORDER=2;
	
	/**装配生产任务单来源,1:手动，2：订单，3：计划**/
	public static final Integer ASSEMBLY_SOURCE_MANUAL=1;
	public static final Integer ASSEMBLY_SOURCE_ORDER=2;
	public static final Integer ASSEMBLY_SOURCE_PLAN=3;
	/***装配生产任务单状态，0:未开工,1：工作中,2：已完工**/
	public static final Integer ASSEMBLY_TASK_STATUS_NOWORK=0;
	public static final Integer ASSEMBLY_TASK_STATUS_WORKING=1;
	public static final Integer ASSEMBLY_TASK_STATUS_WORKED=2;
	/**装配工序任务状态,0：未开始，1:进行中，2:已完工**/
	public static final Integer ASSEMBLYTASK_FLOW_WORKING=1;
	public static final Integer ASSEMBLYTASK_FLOW_WORKED=2;
	public static final Integer ASSEMBLYTASK_FLOW_DELAY=3;
	/***已分配物料序列号使用状态**/
	public static final Integer ASSIGNE_SERIAL_UNUSED=0;
	public static final Integer ASSIGNE_SERIAL_USED=1;
	/***物料序列号表锁库状态**/
	public static final Integer SERIAL_UNLOCK=0;
	public static final Integer SERIAL_LOCKED=1;
	/**来料检测报告编号一级代码表标志,前缀**/
	public static final String CHECK_SEQ="CHECK_SEQ";
	public static final String ITEM_ICQ="ICQ";
	/***产品序列号前缀***/
	public static final String PD_SEQ_C="C";
	public static final String PD_SEQ_B="B";
	/***产品序列号编排码***/
	public static final String PD_SEQ_CODE="14";
	/**数据库帐套**/
	public static final int SYS_DB_3=3;
	public static final int SYS_DB_4=4;
	/**单据来源,1:手填，2:下推**/
	public static final Integer BILL_SOURCE_HAND=1;
	public static final Integer BILL_SOURCE_PUSH=2;

	/**机加领料单状态1:已申请领料,2已领**/
	public static final Integer STATUS_REQTAKE_REQ=1;
	public static final Integer STATUS_REQTAKE_REQED=2;
	
	
	/**表**/
	/**采购订单表**/
	public static final String TABLE_POORDER="t_poorder";
	
	/**流程模板id**/
	/**采购订单模板**/
	public static final Long WORK_FLOW_TEMPLATE_POORDER=1l;

	/**投料单状态,0:未配料，1:已配料**/
	public static final Integer ASSEMBLY_UNDO=0;
	public static final Integer ASSEMBLY_DONE=1;
	
	/***装配班组任务状态0:未配料：1：配料中，2:已完成:3:延期**/
	public static final Integer ADTT_DONE=1;
	/**未排产计划单单号**/
	public static final Long ICBILLNO_NOQUEUE=222222L;
	/***装配生立任务单前缀**/
	public static final String ASSEMBLY_BILL_PREFIX="JOB";
	/***** OPCServer分组名称 ***/
	/**输入参数*/
	public static final String TAG_INPUT ="检测参数输入变量";
	/**全局实时变量*/
	public static final String TAG_PRESSTRANSFER ="模拟量输入变量";
	/**检测输出结果*/
	public static final String TAG_OUTPUT ="检测记录输出变量";
	/**临时变量*/
	public static final String TAG_TEMP ="分步执行控制变量";
	/**开关*/
	public static final String TAG_VALUE ="开关变量";
	/**步骤*/
	public static final String TAG_STEP ="执行步骤变量";
	/**手动/自动**/
	public static final String TAG_AUTOMANUAL ="自动/手动切换变量";
	/**调节输入量*/
	public static final String TAG_TIAOJIE ="其他变量";
	
	/**不合格报告表编号*/
	public static final String T_TABLE_SUM ="T8301-01";
	
	public static final String[] groupNames ={"检测参数输入变量","检测记录输出变量","分步执行控制变量","开关变量","执行步骤变量","自动/手动切换变量","模拟量输入变量,其他变量"};
	public static final String[] shortGroupNames ={"模拟量输入变量","开关变量","执行步骤变量"};
	public static final String[] globalGroupNames ={"模拟量输入变量","检测记录输出变量"};
}
