/*==============================================================*/
/* 工作流相关表				                        */
/*==============================================================*/
/****** Object:  Table [dbo].[ACT_EVT_LOG]    Script Date: 08/06/2015 13:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACT_EVT_LOG](
	[LOG_NR_] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[TYPE_] [nvarchar](64) NULL,
	[PROC_DEF_ID_] [nvarchar](64) NULL,
	[PROC_INST_ID_] [nvarchar](64) NULL,
	[EXECUTION_ID_] [nvarchar](64) NULL,
	[TASK_ID_] [nvarchar](64) NULL,
	[TIME_STAMP_] [datetime] NOT NULL,
	[USER_ID_] [nvarchar](255) NULL,
	[DATA_] [varbinary](max) NULL,
	[LOCK_OWNER_] [nvarchar](255) NULL,
	[LOCK_TIME_] [datetime] NULL,
	[IS_PROCESSED_] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[LOG_NR_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ACT_RE_PROCDEF]    Script Date: 08/06/2015 13:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_RE_PROCDEF](
	[ID_] [nvarchar](64) NOT NULL,
	[REV_] [int] NULL,
	[CATEGORY_] [nvarchar](255) NULL,
	[NAME_] [nvarchar](255) NULL,
	[KEY_] [nvarchar](255) NOT NULL,
	[VERSION_] [int] NOT NULL,
	[DEPLOYMENT_ID_] [nvarchar](64) NULL,
	[RESOURCE_NAME_] [nvarchar](4000) NULL,
	[DGRM_RESOURCE_NAME_] [nvarchar](4000) NULL,
	[DESCRIPTION_] [nvarchar](4000) NULL,
	[HAS_START_FORM_KEY_] [tinyint] NULL,
	[HAS_GRAPHICAL_NOTATION_] [tinyint] NULL,
	[SUSPENSION_STATE_] [tinyint] NULL,
	[TENANT_ID_] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ACT_UNIQ_PROCDEF] UNIQUE NONCLUSTERED 
(
	[KEY_] ASC,
	[VERSION_] ASC,
	[TENANT_ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_RE_DEPLOYMENT]    Script Date: 08/06/2015 13:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_RE_DEPLOYMENT](
	[ID_] [nvarchar](64) NOT NULL,
	[NAME_] [nvarchar](255) NULL,
	[CATEGORY_] [nvarchar](255) NULL,
	[TENANT_ID_] [nvarchar](255) NULL,
	[DEPLOY_TIME_] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_ID_USER]    Script Date: 08/06/2015 13:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_ID_USER](
	[ID_] [nvarchar](64) NOT NULL,
	[REV_] [int] NULL,
	[FIRST_] [nvarchar](255) NULL,
	[LAST_] [nvarchar](255) NULL,
	[EMAIL_] [nvarchar](255) NULL,
	[PWD_] [nvarchar](255) NULL,
	[PICTURE_ID_] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_ID_INFO]    Script Date: 08/06/2015 13:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACT_ID_INFO](
	[ID_] [nvarchar](64) NOT NULL,
	[REV_] [int] NULL,
	[USER_ID_] [nvarchar](64) NULL,
	[TYPE_] [nvarchar](64) NULL,
	[KEY_] [nvarchar](255) NULL,
	[VALUE_] [nvarchar](255) NULL,
	[PASSWORD_] [varbinary](max) NULL,
	[PARENT_ID_] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ACT_ID_GROUP]    Script Date: 08/06/2015 13:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_ID_GROUP](
	[ID_] [nvarchar](64) NOT NULL,
	[REV_] [int] NULL,
	[NAME_] [nvarchar](255) NULL,
	[TYPE_] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_HI_VARINST]    Script Date: 08/06/2015 13:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_HI_VARINST](
	[ID_] [nvarchar](64) NOT NULL,
	[PROC_INST_ID_] [nvarchar](64) NULL,
	[EXECUTION_ID_] [nvarchar](64) NULL,
	[TASK_ID_] [nvarchar](64) NULL,
	[NAME_] [nvarchar](255) NOT NULL,
	[VAR_TYPE_] [nvarchar](100) NULL,
	[REV_] [int] NULL,
	[BYTEARRAY_ID_] [nvarchar](64) NULL,
	[DOUBLE_] [float] NULL,
	[LONG_] [numeric](19, 0) NULL,
	[TEXT_] [nvarchar](4000) NULL,
	[TEXT2_] [nvarchar](4000) NULL,
	[CREATE_TIME_] [datetime] NULL,
	[LAST_UPDATED_TIME_] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_HI_TASKINST]    Script Date: 08/06/2015 13:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_HI_TASKINST](
	[ID_] [nvarchar](64) NOT NULL,
	[PROC_DEF_ID_] [nvarchar](64) NULL,
	[TASK_DEF_KEY_] [nvarchar](255) NULL,
	[PROC_INST_ID_] [nvarchar](64) NULL,
	[EXECUTION_ID_] [nvarchar](64) NULL,
	[NAME_] [nvarchar](255) NULL,
	[PARENT_TASK_ID_] [nvarchar](64) NULL,
	[DESCRIPTION_] [nvarchar](4000) NULL,
	[OWNER_] [nvarchar](255) NULL,
	[ASSIGNEE_] [nvarchar](255) NULL,
	[START_TIME_] [datetime] NOT NULL,
	[CLAIM_TIME_] [datetime] NULL,
	[END_TIME_] [datetime] NULL,
	[DURATION_] [numeric](19, 0) NULL,
	[DELETE_REASON_] [nvarchar](4000) NULL,
	[PRIORITY_] [int] NULL,
	[DUE_DATE_] [datetime] NULL,
	[FORM_KEY_] [nvarchar](255) NULL,
	[CATEGORY_] [nvarchar](255) NULL,
	[TENANT_ID_] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_HI_PROCINST]    Script Date: 08/06/2015 13:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_HI_PROCINST](
	[ID_] [nvarchar](64) NOT NULL,
	[PROC_INST_ID_] [nvarchar](64) NOT NULL,
	[BUSINESS_KEY_] [nvarchar](255) NULL,
	[PROC_DEF_ID_] [nvarchar](64) NOT NULL,
	[START_TIME_] [datetime] NOT NULL,
	[END_TIME_] [datetime] NULL,
	[DURATION_] [numeric](19, 0) NULL,
	[START_USER_ID_] [nvarchar](255) NULL,
	[START_ACT_ID_] [nvarchar](255) NULL,
	[END_ACT_ID_] [nvarchar](255) NULL,
	[SUPER_PROCESS_INSTANCE_ID_] [nvarchar](64) NULL,
	[DELETE_REASON_] [nvarchar](4000) NULL,
	[TENANT_ID_] [nvarchar](255) NULL,
	[NAME_] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PROC_INST_ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_HI_IDENTITYLINK]    Script Date: 08/06/2015 13:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_HI_IDENTITYLINK](
	[ID_] [nvarchar](64) NOT NULL,
	[GROUP_ID_] [nvarchar](255) NULL,
	[TYPE_] [nvarchar](255) NULL,
	[USER_ID_] [nvarchar](255) NULL,
	[TASK_ID_] [nvarchar](64) NULL,
	[PROC_INST_ID_] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_HI_DETAIL]    Script Date: 08/06/2015 13:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_HI_DETAIL](
	[ID_] [nvarchar](64) NOT NULL,
	[TYPE_] [nvarchar](255) NOT NULL,
	[PROC_INST_ID_] [nvarchar](64) NULL,
	[EXECUTION_ID_] [nvarchar](64) NULL,
	[TASK_ID_] [nvarchar](64) NULL,
	[ACT_INST_ID_] [nvarchar](64) NULL,
	[NAME_] [nvarchar](255) NOT NULL,
	[VAR_TYPE_] [nvarchar](255) NULL,
	[REV_] [int] NULL,
	[TIME_] [datetime] NOT NULL,
	[BYTEARRAY_ID_] [nvarchar](64) NULL,
	[DOUBLE_] [float] NULL,
	[LONG_] [numeric](19, 0) NULL,
	[TEXT_] [nvarchar](4000) NULL,
	[TEXT2_] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_HI_COMMENT]    Script Date: 08/06/2015 13:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACT_HI_COMMENT](
	[ID_] [nvarchar](64) NOT NULL,
	[TYPE_] [nvarchar](255) NULL,
	[TIME_] [datetime] NOT NULL,
	[USER_ID_] [nvarchar](255) NULL,
	[TASK_ID_] [nvarchar](64) NULL,
	[PROC_INST_ID_] [nvarchar](64) NULL,
	[ACTION_] [nvarchar](255) NULL,
	[MESSAGE_] [nvarchar](4000) NULL,
	[FULL_MSG_] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ACT_HI_ATTACHMENT]    Script Date: 08/06/2015 13:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_HI_ATTACHMENT](
	[ID_] [nvarchar](64) NOT NULL,
	[REV_] [int] NULL,
	[USER_ID_] [nvarchar](255) NULL,
	[NAME_] [nvarchar](255) NULL,
	[DESCRIPTION_] [nvarchar](4000) NULL,
	[TYPE_] [nvarchar](255) NULL,
	[TASK_ID_] [nvarchar](64) NULL,
	[PROC_INST_ID_] [nvarchar](64) NULL,
	[URL_] [nvarchar](4000) NULL,
	[CONTENT_ID_] [nvarchar](64) NULL,
	[TIME_] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_HI_ACTINST]    Script Date: 08/06/2015 13:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_HI_ACTINST](
	[ID_] [nvarchar](64) NOT NULL,
	[PROC_DEF_ID_] [nvarchar](64) NOT NULL,
	[PROC_INST_ID_] [nvarchar](64) NOT NULL,
	[EXECUTION_ID_] [nvarchar](64) NOT NULL,
	[ACT_ID_] [nvarchar](255) NOT NULL,
	[TASK_ID_] [nvarchar](64) NULL,
	[CALL_PROC_INST_ID_] [nvarchar](64) NULL,
	[ACT_NAME_] [nvarchar](255) NULL,
	[ACT_TYPE_] [nvarchar](255) NOT NULL,
	[ASSIGNEE_] [nvarchar](255) NULL,
	[START_TIME_] [datetime] NOT NULL,
	[END_TIME_] [datetime] NULL,
	[DURATION_] [numeric](19, 0) NULL,
	[TENANT_ID_] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_GE_PROPERTY]    Script Date: 08/06/2015 13:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_GE_PROPERTY](
	[NAME_] [nvarchar](64) NOT NULL,
	[VALUE_] [nvarchar](300) NULL,
	[REV_] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NAME_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_GE_BYTEARRAY]    Script Date: 08/06/2015 13:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACT_GE_BYTEARRAY](
	[ID_] [nvarchar](64) NOT NULL,
	[REV_] [int] NULL,
	[NAME_] [nvarchar](255) NULL,
	[DEPLOYMENT_ID_] [nvarchar](64) NULL,
	[BYTES_] [varbinary](max) NULL,
	[GENERATED_] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ACT_RU_EXECUTION]    Script Date: 08/06/2015 13:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_RU_EXECUTION](
	[ID_] [nvarchar](64) NOT NULL,
	[REV_] [int] NULL,
	[PROC_INST_ID_] [nvarchar](64) NULL,
	[BUSINESS_KEY_] [nvarchar](255) NULL,
	[PARENT_ID_] [nvarchar](64) NULL,
	[PROC_DEF_ID_] [nvarchar](64) NULL,
	[SUPER_EXEC_] [nvarchar](64) NULL,
	[ACT_ID_] [nvarchar](255) NULL,
	[IS_ACTIVE_] [tinyint] NULL,
	[IS_CONCURRENT_] [tinyint] NULL,
	[IS_SCOPE_] [tinyint] NULL,
	[IS_EVENT_SCOPE_] [tinyint] NULL,
	[SUSPENSION_STATE_] [tinyint] NULL,
	[CACHED_ENT_STATE_] [int] NULL,
	[TENANT_ID_] [nvarchar](255) NULL,
	[NAME_] [nvarchar](255) NULL,
	[LOCK_TIME_] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_ID_MEMBERSHIP]    Script Date: 08/06/2015 13:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_ID_MEMBERSHIP](
	[USER_ID_] [nvarchar](64) NOT NULL,
	[GROUP_ID_] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[USER_ID_] ASC,
	[GROUP_ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_RE_MODEL]    Script Date: 08/06/2015 13:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_RE_MODEL](
	[ID_] [nvarchar](64) NOT NULL,
	[REV_] [int] NULL,
	[NAME_] [nvarchar](255) NULL,
	[KEY_] [nvarchar](255) NULL,
	[CATEGORY_] [nvarchar](255) NULL,
	[CREATE_TIME_] [datetime] NULL,
	[LAST_UPDATE_TIME_] [datetime] NULL,
	[VERSION_] [int] NULL,
	[META_INFO_] [nvarchar](4000) NULL,
	[DEPLOYMENT_ID_] [nvarchar](64) NULL,
	[EDITOR_SOURCE_VALUE_ID_] [nvarchar](64) NULL,
	[EDITOR_SOURCE_EXTRA_VALUE_ID_] [nvarchar](64) NULL,
	[TENANT_ID_] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_RU_EVENT_SUBSCR]    Script Date: 08/06/2015 13:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_RU_EVENT_SUBSCR](
	[ID_] [nvarchar](64) NOT NULL,
	[REV_] [int] NULL,
	[EVENT_TYPE_] [nvarchar](255) NOT NULL,
	[EVENT_NAME_] [nvarchar](255) NULL,
	[EXECUTION_ID_] [nvarchar](64) NULL,
	[PROC_INST_ID_] [nvarchar](64) NULL,
	[ACTIVITY_ID_] [nvarchar](64) NULL,
	[CONFIGURATION_] [nvarchar](255) NULL,
	[CREATED_] [datetime] NOT NULL,
	[PROC_DEF_ID_] [nvarchar](64) NULL,
	[TENANT_ID_] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_RU_VARIABLE]    Script Date: 08/06/2015 13:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_RU_VARIABLE](
	[ID_] [nvarchar](64) NOT NULL,
	[REV_] [int] NULL,
	[TYPE_] [nvarchar](255) NOT NULL,
	[NAME_] [nvarchar](255) NOT NULL,
	[EXECUTION_ID_] [nvarchar](64) NULL,
	[PROC_INST_ID_] [nvarchar](64) NULL,
	[TASK_ID_] [nvarchar](64) NULL,
	[BYTEARRAY_ID_] [nvarchar](64) NULL,
	[DOUBLE_] [float] NULL,
	[LONG_] [numeric](19, 0) NULL,
	[TEXT_] [nvarchar](4000) NULL,
	[TEXT2_] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_RU_TASK]    Script Date: 08/06/2015 13:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_RU_TASK](
	[ID_] [nvarchar](64) NOT NULL,
	[REV_] [int] NULL,
	[EXECUTION_ID_] [nvarchar](64) NULL,
	[PROC_INST_ID_] [nvarchar](64) NULL,
	[PROC_DEF_ID_] [nvarchar](64) NULL,
	[NAME_] [nvarchar](255) NULL,
	[PARENT_TASK_ID_] [nvarchar](64) NULL,
	[DESCRIPTION_] [nvarchar](4000) NULL,
	[TASK_DEF_KEY_] [nvarchar](255) NULL,
	[OWNER_] [nvarchar](255) NULL,
	[ASSIGNEE_] [nvarchar](255) NULL,
	[DELEGATION_] [nvarchar](64) NULL,
	[PRIORITY_] [int] NULL,
	[CREATE_TIME_] [datetime] NULL,
	[DUE_DATE_] [datetime] NULL,
	[CATEGORY_] [nvarchar](255) NULL,
	[SUSPENSION_STATE_] [int] NULL,
	[TENANT_ID_] [nvarchar](255) NULL,
	[FORM_KEY_] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_RU_JOB]    Script Date: 08/06/2015 13:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_RU_JOB](
	[ID_] [nvarchar](64) NOT NULL,
	[REV_] [int] NULL,
	[TYPE_] [nvarchar](255) NOT NULL,
	[LOCK_EXP_TIME_] [datetime] NULL,
	[LOCK_OWNER_] [nvarchar](255) NULL,
	[EXCLUSIVE_] [bit] NULL,
	[EXECUTION_ID_] [nvarchar](64) NULL,
	[PROCESS_INSTANCE_ID_] [nvarchar](64) NULL,
	[PROC_DEF_ID_] [nvarchar](64) NULL,
	[RETRIES_] [int] NULL,
	[EXCEPTION_STACK_ID_] [nvarchar](64) NULL,
	[EXCEPTION_MSG_] [nvarchar](4000) NULL,
	[DUEDATE_] [datetime] NULL,
	[REPEAT_] [nvarchar](255) NULL,
	[HANDLER_TYPE_] [nvarchar](255) NULL,
	[HANDLER_CFG_] [nvarchar](4000) NULL,
	[TENANT_ID_] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACT_RU_IDENTITYLINK]    Script Date: 08/06/2015 13:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACT_RU_IDENTITYLINK](
	[ID_] [nvarchar](64) NOT NULL,
	[REV_] [int] NULL,
	[GROUP_ID_] [nvarchar](255) NULL,
	[TYPE_] [nvarchar](255) NULL,
	[USER_ID_] [nvarchar](255) NULL,
	[TASK_ID_] [nvarchar](64) NULL,
	[PROC_INST_ID_] [nvarchar](64) NULL,
	[PROC_DEF_ID_] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF__ACT_EVT_L__IS_PR__3A5795F5]    Script Date: 08/06/2015 13:14:58 ******/
ALTER TABLE [dbo].[ACT_EVT_LOG] ADD  DEFAULT ((0)) FOR [IS_PROCESSED_]
GO
/****** Object:  Default [DF__ACT_HI_AC__TENAN__58DC1D15]    Script Date: 08/06/2015 13:14:58 ******/
ALTER TABLE [dbo].[ACT_HI_ACTINST] ADD  DEFAULT ('') FOR [TENANT_ID_]
GO
/****** Object:  Default [DF__ACT_HI_PR__TENAN__541767F8]    Script Date: 08/06/2015 13:14:58 ******/
ALTER TABLE [dbo].[ACT_HI_PROCINST] ADD  DEFAULT ('') FOR [TENANT_ID_]
GO
/****** Object:  Default [DF__ACT_HI_TA__TENAN__5DA0D232]    Script Date: 08/06/2015 13:14:58 ******/
ALTER TABLE [dbo].[ACT_HI_TASKINST] ADD  DEFAULT ('') FOR [TENANT_ID_]
GO
/****** Object:  Default [DF__ACT_RE_DE__TENAN__11558062]    Script Date: 08/06/2015 13:14:58 ******/
ALTER TABLE [dbo].[ACT_RE_DEPLOYMENT] ADD  DEFAULT ('') FOR [TENANT_ID_]
GO
/****** Object:  Default [DF__ACT_RE_MO__TENAN__161A357F]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RE_MODEL] ADD  DEFAULT ('') FOR [TENANT_ID_]
GO
/****** Object:  Default [DF__ACT_RE_PR__TENAN__246854D6]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RE_PROCDEF] ADD  DEFAULT ('') FOR [TENANT_ID_]
GO
/****** Object:  Default [DF__ACT_RU_EV__TENAN__3592E0D8]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_EVENT_SUBSCR] ADD  DEFAULT ('') FOR [TENANT_ID_]
GO
/****** Object:  Default [DF__ACT_RU_EX__TENAN__1ADEEA9C]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_EXECUTION] ADD  DEFAULT ('') FOR [TENANT_ID_]
GO
/****** Object:  Default [DF__ACT_RU_JO__TENAN__1FA39FB9]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_JOB] ADD  DEFAULT ('') FOR [TENANT_ID_]
GO
/****** Object:  Default [DF__ACT_RU_TA__TENAN__292D09F3]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_TASK] ADD  DEFAULT ('') FOR [TENANT_ID_]
GO
/****** Object:  ForeignKey [ACT_FK_BYTEARR_DEPL]    Script Date: 08/06/2015 13:14:58 ******/
ALTER TABLE [dbo].[ACT_GE_BYTEARRAY]  WITH CHECK ADD  CONSTRAINT [ACT_FK_BYTEARR_DEPL] FOREIGN KEY([DEPLOYMENT_ID_])
REFERENCES [dbo].[ACT_RE_DEPLOYMENT] ([ID_])
GO
ALTER TABLE [dbo].[ACT_GE_BYTEARRAY] CHECK CONSTRAINT [ACT_FK_BYTEARR_DEPL]
GO
/****** Object:  ForeignKey [ACT_FK_MEMB_GROUP]    Script Date: 08/06/2015 13:14:58 ******/
ALTER TABLE [dbo].[ACT_ID_MEMBERSHIP]  WITH CHECK ADD  CONSTRAINT [ACT_FK_MEMB_GROUP] FOREIGN KEY([GROUP_ID_])
REFERENCES [dbo].[ACT_ID_GROUP] ([ID_])
GO
ALTER TABLE [dbo].[ACT_ID_MEMBERSHIP] CHECK CONSTRAINT [ACT_FK_MEMB_GROUP]
GO
/****** Object:  ForeignKey [ACT_FK_MEMB_USER]    Script Date: 08/06/2015 13:14:58 ******/
ALTER TABLE [dbo].[ACT_ID_MEMBERSHIP]  WITH CHECK ADD  CONSTRAINT [ACT_FK_MEMB_USER] FOREIGN KEY([USER_ID_])
REFERENCES [dbo].[ACT_ID_USER] ([ID_])
GO
ALTER TABLE [dbo].[ACT_ID_MEMBERSHIP] CHECK CONSTRAINT [ACT_FK_MEMB_USER]
GO
/****** Object:  ForeignKey [ACT_FK_MODEL_DEPLOYMENT]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RE_MODEL]  WITH CHECK ADD  CONSTRAINT [ACT_FK_MODEL_DEPLOYMENT] FOREIGN KEY([DEPLOYMENT_ID_])
REFERENCES [dbo].[ACT_RE_DEPLOYMENT] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RE_MODEL] CHECK CONSTRAINT [ACT_FK_MODEL_DEPLOYMENT]
GO
/****** Object:  ForeignKey [ACT_FK_MODEL_SOURCE]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RE_MODEL]  WITH CHECK ADD  CONSTRAINT [ACT_FK_MODEL_SOURCE] FOREIGN KEY([EDITOR_SOURCE_VALUE_ID_])
REFERENCES [dbo].[ACT_GE_BYTEARRAY] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RE_MODEL] CHECK CONSTRAINT [ACT_FK_MODEL_SOURCE]
GO
/****** Object:  ForeignKey [ACT_FK_MODEL_SOURCE_EXTRA]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RE_MODEL]  WITH CHECK ADD  CONSTRAINT [ACT_FK_MODEL_SOURCE_EXTRA] FOREIGN KEY([EDITOR_SOURCE_EXTRA_VALUE_ID_])
REFERENCES [dbo].[ACT_GE_BYTEARRAY] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RE_MODEL] CHECK CONSTRAINT [ACT_FK_MODEL_SOURCE_EXTRA]
GO
/****** Object:  ForeignKey [ACT_FK_EVENT_EXEC]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_EVENT_SUBSCR]  WITH CHECK ADD  CONSTRAINT [ACT_FK_EVENT_EXEC] FOREIGN KEY([EXECUTION_ID_])
REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RU_EVENT_SUBSCR] CHECK CONSTRAINT [ACT_FK_EVENT_EXEC]
GO
/****** Object:  ForeignKey [ACT_FK_EXE_PARENT]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_EXECUTION]  WITH CHECK ADD  CONSTRAINT [ACT_FK_EXE_PARENT] FOREIGN KEY([PARENT_ID_])
REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RU_EXECUTION] CHECK CONSTRAINT [ACT_FK_EXE_PARENT]
GO
/****** Object:  ForeignKey [ACT_FK_EXE_PROCDEF]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_EXECUTION]  WITH CHECK ADD  CONSTRAINT [ACT_FK_EXE_PROCDEF] FOREIGN KEY([PROC_DEF_ID_])
REFERENCES [dbo].[ACT_RE_PROCDEF] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RU_EXECUTION] CHECK CONSTRAINT [ACT_FK_EXE_PROCDEF]
GO
/****** Object:  ForeignKey [ACT_FK_EXE_SUPER]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_EXECUTION]  WITH CHECK ADD  CONSTRAINT [ACT_FK_EXE_SUPER] FOREIGN KEY([SUPER_EXEC_])
REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RU_EXECUTION] CHECK CONSTRAINT [ACT_FK_EXE_SUPER]
GO
/****** Object:  ForeignKey [ACT_FK_ATHRZ_PROCEDEF]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_IDENTITYLINK]  WITH CHECK ADD  CONSTRAINT [ACT_FK_ATHRZ_PROCEDEF] FOREIGN KEY([PROC_DEF_ID_])
REFERENCES [dbo].[ACT_RE_PROCDEF] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RU_IDENTITYLINK] CHECK CONSTRAINT [ACT_FK_ATHRZ_PROCEDEF]
GO
/****** Object:  ForeignKey [ACT_FK_IDL_PROCINST]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_IDENTITYLINK]  WITH CHECK ADD  CONSTRAINT [ACT_FK_IDL_PROCINST] FOREIGN KEY([PROC_INST_ID_])
REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RU_IDENTITYLINK] CHECK CONSTRAINT [ACT_FK_IDL_PROCINST]
GO
/****** Object:  ForeignKey [ACT_FK_TSKASS_TASK]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_IDENTITYLINK]  WITH CHECK ADD  CONSTRAINT [ACT_FK_TSKASS_TASK] FOREIGN KEY([TASK_ID_])
REFERENCES [dbo].[ACT_RU_TASK] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RU_IDENTITYLINK] CHECK CONSTRAINT [ACT_FK_TSKASS_TASK]
GO
/****** Object:  ForeignKey [ACT_FK_JOB_EXCEPTION]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_JOB]  WITH CHECK ADD  CONSTRAINT [ACT_FK_JOB_EXCEPTION] FOREIGN KEY([EXCEPTION_STACK_ID_])
REFERENCES [dbo].[ACT_GE_BYTEARRAY] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RU_JOB] CHECK CONSTRAINT [ACT_FK_JOB_EXCEPTION]
GO
/****** Object:  ForeignKey [ACT_FK_TASK_EXE]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_TASK]  WITH CHECK ADD  CONSTRAINT [ACT_FK_TASK_EXE] FOREIGN KEY([EXECUTION_ID_])
REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RU_TASK] CHECK CONSTRAINT [ACT_FK_TASK_EXE]
GO
/****** Object:  ForeignKey [ACT_FK_TASK_PROCDEF]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_TASK]  WITH CHECK ADD  CONSTRAINT [ACT_FK_TASK_PROCDEF] FOREIGN KEY([PROC_DEF_ID_])
REFERENCES [dbo].[ACT_RE_PROCDEF] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RU_TASK] CHECK CONSTRAINT [ACT_FK_TASK_PROCDEF]
GO
/****** Object:  ForeignKey [ACT_FK_TASK_PROCINST]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_TASK]  WITH CHECK ADD  CONSTRAINT [ACT_FK_TASK_PROCINST] FOREIGN KEY([PROC_INST_ID_])
REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RU_TASK] CHECK CONSTRAINT [ACT_FK_TASK_PROCINST]
GO
/****** Object:  ForeignKey [ACT_FK_VAR_BYTEARRAY]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_VARIABLE]  WITH CHECK ADD  CONSTRAINT [ACT_FK_VAR_BYTEARRAY] FOREIGN KEY([BYTEARRAY_ID_])
REFERENCES [dbo].[ACT_GE_BYTEARRAY] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RU_VARIABLE] CHECK CONSTRAINT [ACT_FK_VAR_BYTEARRAY]
GO
/****** Object:  ForeignKey [ACT_FK_VAR_EXE]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_VARIABLE]  WITH CHECK ADD  CONSTRAINT [ACT_FK_VAR_EXE] FOREIGN KEY([EXECUTION_ID_])
REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RU_VARIABLE] CHECK CONSTRAINT [ACT_FK_VAR_EXE]
GO
/****** Object:  ForeignKey [ACT_FK_VAR_PROCINST]    Script Date: 08/06/2015 13:14:59 ******/
ALTER TABLE [dbo].[ACT_RU_VARIABLE]  WITH CHECK ADD  CONSTRAINT [ACT_FK_VAR_PROCINST] FOREIGN KEY([PROC_INST_ID_])
REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_])
GO
ALTER TABLE [dbo].[ACT_RU_VARIABLE] CHECK CONSTRAINT [ACT_FK_VAR_PROCINST]
GO

/*==============================================================*/
/* 信息平台相关表			                        */
/*==============================================================*/
/****** Object:  Table [dbo].[oa_task_yalirongqi]    压力容器任务 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_task_yalirongqi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[systemNumber] [nvarchar](50) NULL,
	[filterNumber] [nvarchar](50) NULL,
	[directiveNumber] [nvarchar](50) NULL,
	[publisherId] [int] NULL,
	[recipientId] [int] NULL,
	[recipientFinishDate] [datetime] NULL,
	[isDel] [int] NULL,
	[plannedFinishDate] [datetime] NULL,
	[actualFinishDate] [datetime] NULL,
	[remark] [nvarchar](50) NULL,
	[taskState] [int] NULL,
	[jiaoYanId] [int] NULL,
	[jiaoYanTime] [datetime] NULL,
	[shenHeId] [int] NULL,
	[shenHeTime] [datetime] NULL,
	[applyState] [int] NULL,
	[processInstanceId] [nvarchar](50) NULL,
	[createUserRealName] [nvarchar](100) NULL,
	[createUserId] [int] NULL,
	[createDate] [datetime] NULL,
	[modifyUserRealName] [nvarchar](100) NULL,
	[modifyUserId] [int] NULL,
	[modifyDate] [datetime] NULL,
	[systemId] [int] NULL,
 CONSTRAINT [PK_task_yalirongqi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_task_tiaoyazhan]    调压站任务 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_task_tiaoyazhan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[systemNumber] [nvarchar](50) NULL,
	[customerName] [nvarchar](100) NULL,
	[productModel] [nvarchar](200) NULL,
	[tiaoYaQiModel] [nvarchar](200) NULL,
	[inPressure] [nvarchar](200) NULL,
	[outPressure] [nvarchar](200) NULL,
	[filterNumber] [nvarchar](500) NULL,
	[equipmentColor] [nvarchar](50) NULL,
	[boxColor] [nvarchar](50) NULL,
	[publisherId] [int] NULL,
	[recipientId] [int] NULL,
	[recipientFinishDate] [datetime] NULL,
	[isDel] [int] NULL,
	[plannedFinishDate] [datetime] NULL,
	[actualFinishDate] [datetime] NULL,
	[taskState] [int] NULL,
	[remark] [nvarchar](50) NULL,
	[jiaoYanId] [int] NULL,
	[jiaoYanTime] [datetime] NULL,
	[shenHeId] [int] NULL,
	[shenHeTime] [datetime] NULL,
	[applyState] [int] NULL,
	[processInstanceId] [nvarchar](50) NULL,
	[createUserRealName] [nvarchar](100) NULL,
	[createUserId] [int] NULL,
	[createDate] [datetime] NULL,
	[modifyUserRealName] [nvarchar](100) NULL,
	[modifyUserId] [int] NULL,
	[modifyDate] [datetime] NULL,
	[systemId] [int] NULL,
 CONSTRAINT [PK_task_tiaoyazhan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[oa_meetingroom_info_res]    会议室资源 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_meetingroom_info_res](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[meetingroomInfoId] [int] NULL,
	[oldName] [nvarchar](500) NULL,
	[newName] [nvarchar](50) NULL,
	[resPath] [nvarchar](50) NULL,
 CONSTRAINT [PK_oa_meetingroom_info_res] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_meetingroom_info]    会议室信息 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_meetingroom_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NULL,
	[number] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
	[isDel] [int] NULL,
	[equipmentPCode] [nvarchar](50) NULL,
	[equipmentValues] [nvarchar](50) NULL,
 CONSTRAINT [PK_office_meeting_info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_meetingroom_application]   会议室申请 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_meetingroom_application](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[meetingroomInfoId] [int] NULL,
	[startTime] [datetime] NULL,
	[endTime] [datetime] NULL,
	[applicantId] [int] NULL,
	[applicationTime] [datetime] NULL,
	[remark] [nvarchar](500) NULL,
	[userNames] [text] NULL,
	[userIds] [text] NULL,
	[importance] [nvarchar](10) NULL,
	[isDel] [int] NULL,
	[processInstanceId] [nvarchar](50) NULL,
	[meetingRoomState] [int] NULL,
	[applyState] [int] NULL,
 CONSTRAINT [PK_office_meeting_list] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_car_info_res]    车辆资源 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_car_info_res](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[carInfoId] [int] NULL,
	[oldName] [nvarchar](500) NULL,
	[newName] [nvarchar](50) NULL,
	[resPath] [nvarchar](50) NULL,
 CONSTRAINT [PK_oa_carinfo_res] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_car_info]    车辆信息 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_car_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[driver] [nvarchar](50) NULL,
	[carTypeValue] [nvarchar](50) NULL,
	[carTypePCode] [nvarchar](50) NULL,
	[buyPrice] [nvarchar](50) NULL,
	[buyTime] [datetime] NULL,
	[state] [int] NULL,
	[remark] [nvarchar](500) NULL,
	[isDel] [int] NULL,
 CONSTRAINT [PK_office_car_info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车牌号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_car_info', @level2type=N'COLUMN',@level2name=N'number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车辆名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_car_info', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车辆类型 1轿车 2货车 3SUV' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_car_info', @level2type=N'COLUMN',@level2name=N'carTypeValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_car_info', @level2type=N'COLUMN',@level2name=N'buyPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_car_info', @level2type=N'COLUMN',@level2name=N'buyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态 1可用 2维修中 3顺坏 4报废' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_car_info', @level2type=N'COLUMN',@level2name=N'state'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_car_info', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_car_info', @level2type=N'COLUMN',@level2name=N'isDel'
GO
/****** Object:  Table [dbo].[oa_car_application]    车辆申请 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[oa_car_application](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[startTime] [datetime] NULL,
	[endTime] [datetime] NULL,
	[userOf] [nvarchar](1000) NULL,
	[userNumber] [nvarchar](1000) NULL,
	[userMobilePhone] [varchar](20) NULL,
	[remark] [nvarchar](1000) NULL,
	[carId] [int] NULL,
	[applicantId] [int] NOT NULL,
	[driver] [nvarchar](1000) NULL,
	[processInstanceId] [nvarchar](50) NULL,
	[isDel] [int] NULL,
	[carState] [int] NULL,
	[applyState] [int] NULL,
	[cargoRoute] [nvarchar](1000) NULL,
	[createTime] [datetime] NULL,
 CONSTRAINT [PK_office_car_list] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'司机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_car_application', @level2type=N'COLUMN',@level2name=N'driver'
GO
/****** Object:  Table [dbo].[oa_addressbook_tree]   通讯录分类 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_addressbook_tree](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[code] [nvarchar](50) NULL,
	[pCode] [nvarchar](50) NULL,
	[pId] [int] NULL,
	[sort] [int] NULL,
 CONSTRAINT [PK_oaaddressbook_tree] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_addressbook_item]    通讯录明细 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_addressbook_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[treeId] [int] NULL,
	[name] [nvarchar](50) NULL,
	[telQuHao] [nvarchar](50) NULL,
	[telHaoMa] [nvarchar](50) NULL,
	[telNeiXian] [nvarchar](50) NULL,
	[telFenJi] [nvarchar](50) NULL,
	[mobileHaoMa] [nvarchar](50) NULL,
	[mobileDuanHao] [nvarchar](100) NULL,
	[email] [nvarchar](50) NULL,
	[faxQuHao] [nvarchar](50) NULL,
	[faxHaoMa] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[zipcode] [nvarchar](50) NULL,
	[remark] [nvarchar](100) NULL,
	[createUserRealName] [nvarchar](100) NULL,
	[createUserId] [int] NULL,
	[createDate] [datetime] NULL,
	[modifyUserRealName] [nvarchar](100) NULL,
	[modifyUserId] [int] NULL,
	[modifyDate] [datetime] NULL,
	[systemId] [int] NULL,
 CONSTRAINT [PK_oa_addressbook_item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[core_role_power]    角色权限 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[core_role_power](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleId] [int] NULL,
	[code] [varchar](50) NULL,
	[authorityId] [int] NULL,
	[menuId] [int] NULL,
 CONSTRAINT [PK_sys_role_power] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[core_role]    角色 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[core_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](100) NULL,
	[name] [nvarchar](100) NULL,
	[keywords] [nvarchar](100) NULL,
	[pId] [int] NULL,
	[pCode] [nvarchar](100) NULL,
 CONSTRAINT [PK_sys_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[core_operation_log]   操作日志表 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[core_operation_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[empId] [int] NULL,
	[empLoginName] [nvarchar](50) NULL,
	[empUserName] [nvarchar](50) NULL,
	[moduleName] [nvarchar](50) NULL,
	[operateType] [nvarchar](50) NULL,
	[operateDescription] [nvarchar](500) NULL,
	[ip] [nvarchar](50) NULL,
	[machineName] [nvarchar](50) NULL,
	[operateDate] [datetime] NULL,
 CONSTRAINT [PK_core_operation_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[core_msg]   系统消息表 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[core_msg](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[toUserId] [int] NULL,
	[details] [nvarchar](4000) NULL,
	[state] [int] NULL,
	[url] [nvarchar](100) NULL,
	[receiveTime] [datetime] NULL,
	[isDel] [int] NULL,
	[menuId] [int] NULL,
 CONSTRAINT [PK_sys_msg] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[core_menu_operate]    菜单按钮表 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[core_menu_operate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menuId] [int] NULL,
	[name] [nvarchar](50) NULL,
	[functionName] [nvarchar](500) NULL,
	[iconCls] [nvarchar](50) NULL,
	[keywords] [nvarchar](50) NULL,
	[remark] [nvarchar](500) NULL,
 CONSTRAINT [PK_sys_menu_operate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[core_menu_data]    菜单数据表 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[core_menu_data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menuId] [int] NULL,
	[name] [nvarchar](50) NULL,
	[sql] [nvarchar](500) NULL,
	[remark] [nvarchar](50) NULL,
	[grade] [int] NULL,
 CONSTRAINT [PK_sys_menu_data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[core_menu]    菜单表 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[core_menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[keywords] [nvarchar](50) NULL,
	[code] [nvarchar](50) NULL,
	[pCode] [nvarchar](50) NULL,
	[pId] [int] NULL,
	[url] [varchar](100) NULL,
	[iconCls] [varchar](50) NULL,
	[sort] [int] NULL,
	[iconFont] [varchar](50) NULL,
	[layers] [int] NULL,
	[iconColor] [varchar](50) NULL,
 CONSTRAINT [PK_sysmenu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'core_menu', @level2type=N'COLUMN',@level2name=N'id'
GO


/****** Object:  Table [dbo].[core_emp_role]    用户角色-已废弃 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[core_emp_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleId] [int] NULL,
	[empId] [int] NULL,
 CONSTRAINT [PK_sys_user_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[core_emp_dept]    用户部分-已废弃 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[core_emp_dept](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[deptId] [int] NULL,
	[empId] [int] NULL,
 CONSTRAINT [PK_sys_user_dept] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[core_emp]    用户-已废弃 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[core_emp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](10) NULL,
	[sort] [int] NULL,
	[loginName] [varchar](20) NULL,
	[password] [varchar](50) NULL,
	[isDel] [int] NULL,
	[email] [varchar](500) NULL,
 CONSTRAINT [PK_sys_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ__sys_user__C1BEAA43060DEAE8] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[core_dict]    字典表 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[core_dict](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[code] [nvarchar](50) NULL,
	[pId] [int] NULL,
	[pCode] [nvarchar](50) NULL,
	[value] [nvarchar](50) NULL,
	[isChildren] [int] NULL,
	[sort] [int] NULL,
	[webId] [int] NULL,
	[createOn] [datetime] NULL,
	[createUserId] [int] NULL,
	[modifiedOn] [datetime] NULL,
	[modifiedUserId] [int] NULL,
 CONSTRAINT [PK_sys_dicttype] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[core_dept]   部门表 - 已废弃 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[core_dept](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[code] [nvarchar](50) NULL,
	[pCode] [nvarchar](50) NULL,
	[pId] [int] NULL,
	[sort] [int] NULL,
	[leaderId] [int] NULL,
 CONSTRAINT [PK_sys_dept] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[base_table_info]    暂不用 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base_table_info](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[packageName] [nvarchar](50) NULL,
	[lowerName] [nvarchar](50) NULL,
	[upperName] [nvarchar](50) NULL,
 CONSTRAINT [PK_base_table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[base_table_field]  暂不用 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base_table_field](
	[id] [int] NOT NULL,
	[tableName] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[dataType] [nvarchar](50) NULL,
	[length] [nvarchar](50) NULL,
	[isPrimaryKey] [int] NULL,
	[description] [nvarchar](50) NULL,
	[sort] [int] NULL,
	[title] [nvarchar](50) NULL,
	[isForm] [int] NULL,
	[isList] [int] NULL,
	[validform] [nvarchar](50) NULL,
	[inputType] [nvarchar](50) NULL,
 CONSTRAINT [PK_base_table_field] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[act_category]    工作流分类表 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[act_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[code] [nvarchar](50) NULL,
	[pCode] [nvarchar](50) NULL,
	[pId] [int] NULL,
	[isChildren] [int] NULL,
 CONSTRAINT [PK_activiti_task] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[oa_doc_rules_relation]    Script Date: 08/06/2015 13:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oa_doc_rules_relation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NULL,
	[itemId] [int] NOT NULL,
	[type] [int] NULL,
 CONSTRAINT [PK_oa_doc_rules_relation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oa_doc_rules_item]    Script Date: 08/06/2015 13:18:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[oa_doc_rules_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[oldName] [nvarchar](500) NULL,
	[newName] [nvarchar](500) NULL,
	[fileType] [varchar](10) NULL,
	[iconSkin] [varchar](10) NULL,
	[isDel] [bit] NULL,
	[isEffective] [bit] NULL,
	[userIds] [varchar](4000) NULL,
	[userNames] [nvarchar](4000) NULL,
	[number] [varchar](100) NULL,
	[revision] [varchar](100) NULL,
	[effectiveDate] [datetime] NULL,
	[adoptStandard] [varchar](50) NULL,
	[remark] [nvarchar](4000) NULL,
	[createUserRealName] [nvarchar](20) NULL,
	[createUserId] [bigint] NULL,
	[createDate] [datetime] NULL,
	[modifyUserRealName] [nvarchar](20) NULL,
	[modifyUserId] [bigint] NULL,
	[modifyDate] [datetime] NULL,
	[systemId] [bigint] NULL,
 CONSTRAINT [PK_oa_doc_rules_item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件夹名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules_item', @level2type=N'COLUMN',@level2name=N'oldName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件夹名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules_item', @level2type=N'COLUMN',@level2name=N'newName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules_item', @level2type=N'COLUMN',@level2name=N'fileType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules_item', @level2type=N'COLUMN',@level2name=N'iconSkin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules_item', @level2type=N'COLUMN',@level2name=N'isDel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules_item', @level2type=N'COLUMN',@level2name=N'number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules_item', @level2type=N'COLUMN',@level2name=N'revision'
GO

/****** Object:  Table [dbo].[oa_doc_rules_category]    标准体系分类 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[oa_doc_rules_category](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[code] [varchar](60) NULL,
	[isOpen] [bit] NULL,
	[parentCode] [varchar](60) NULL,
	[parentId] [bigint] NULL,
	[createUserRealName] [nvarchar](20) NULL,
	[createUserId] [bigint] NULL,
	[createDate] [datetime] NULL,
	[modifyUserRealName] [nvarchar](20) NULL,
	[modifyUserId] [bigint] NULL,
	[modifyDate] [datetime] NULL,
	[systemId] [bigint] NULL,
	[type] [int] NULL,
 CONSTRAINT [PK_oa_doc_rules_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件夹名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules_category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules_category', @level2type=N'COLUMN',@level2name=N'code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules_category', @level2type=N'COLUMN',@level2name=N'parentCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules_category', @level2type=N'COLUMN',@level2name=N'parentId'
GO

/****** Object:  Table [dbo].[oa_doc_rules]    标准体系文档 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[oa_doc_rules](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[code] [varchar](60) NULL,
	[parentCode] [varchar](60) NULL,
	[parentId] [bigint] NULL,
	[sort] [bigint] NULL,
	[isChildren] [bit] NULL,
	[fileType] [varchar](10) NULL,
	[iconSkin] [varchar](10) NULL,
	[isOpen] [bit] NULL,
	[isDel] [bit] NULL,
	[isEffective] [bit] NULL,
	[userIds] [varchar](4000) NULL,
	[userNames] [nvarchar](4000) NULL,
	[number] [varchar](100) NULL,
	[revision] [varchar](100) NULL,
	[effectiveDate] [datetime] NULL,
	[adoptStandard] [varchar](50) NULL,
	[remark] [nvarchar](4000) NULL,
	[createUserRealName] [nvarchar](20) NULL,
	[createUserId] [bigint] NULL,
	[createDate] [datetime] NULL,
	[modifyUserRealName] [nvarchar](20) NULL,
	[modifyUserId] [bigint] NULL,
	[modifyDate] [datetime] NULL,
	[systemId] [bigint] NULL,
 CONSTRAINT [PK_oa_doc_rules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件夹名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules', @level2type=N'COLUMN',@level2name=N'code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules', @level2type=N'COLUMN',@level2name=N'parentCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules', @level2type=N'COLUMN',@level2name=N'parentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules', @level2type=N'COLUMN',@level2name=N'sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件夹还是文件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules', @level2type=N'COLUMN',@level2name=N'isChildren'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules', @level2type=N'COLUMN',@level2name=N'fileType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules', @level2type=N'COLUMN',@level2name=N'iconSkin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否打开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules', @level2type=N'COLUMN',@level2name=N'isOpen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules', @level2type=N'COLUMN',@level2name=N'isDel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules', @level2type=N'COLUMN',@level2name=N'number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc_rules', @level2type=N'COLUMN',@level2name=N'revision'
GO
/****** Object:  Table [dbo].[oa_doc]    文档列表 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[oa_doc](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[code] [varchar](60) NULL,
	[pCode] [varchar](60) NULL,
	[pId] [bigint] NULL,
	[sort] [bigint] NULL,
	[isChildren] [bit] NULL,
	[fileType] [varchar](10) NULL,
	[iconSkin] [varchar](10) NULL,
	[isOpen] [bit] NULL,
	[isDel] [bit] NULL,
	[userIds] [varchar](4000) NULL,
	[userNames] [nvarchar](4000) NULL,
	[createUserRealName] [nvarchar](20) NULL,
	[createUserId] [bigint] NULL,
	[createDate] [datetime] NULL,
	[modifyUserRealName] [nvarchar](20) NULL,
	[modifyUserId] [bigint] NULL,
	[modifyDate] [datetime] NULL,
	[systemId] [bigint] NULL,
 CONSTRAINT [PK_OA_DOC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件夹名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc', @level2type=N'COLUMN',@level2name=N'code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc', @level2type=N'COLUMN',@level2name=N'pCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc', @level2type=N'COLUMN',@level2name=N'pId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc', @level2type=N'COLUMN',@level2name=N'sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件夹还是文件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc', @level2type=N'COLUMN',@level2name=N'isChildren'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc', @level2type=N'COLUMN',@level2name=N'fileType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc', @level2type=N'COLUMN',@level2name=N'iconSkin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否打开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc', @level2type=N'COLUMN',@level2name=N'isOpen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc', @level2type=N'COLUMN',@level2name=N'isDel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文档管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_doc'
GO


/****** Object:  Table [dbo].[oa_pos_workovertimelist]  加班列表   Script Date: 10/22/2015 11:20:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[oa_pos_workovertimelist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[overtimeDate] [datetime] NULL,
	[mealType] [nvarchar](10) NULL,
	[user_name] [nvarchar](10) NULL,
	[user_id] [nvarchar](20) NULL,
	[user_pin] [nvarchar](20) NULL,
	[deptName] [nvarchar](50) NULL,
 CONSTRAINT [PK_OA_POS_WORKOVERTIMELIST] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键自增长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_workovertimelist', @level2type=N'COLUMN',@level2name=N'id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加班日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_workovertimelist', @level2type=N'COLUMN',@level2name=N'overtimeDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'餐别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_workovertimelist', @level2type=N'COLUMN',@level2name=N'mealType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加班人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_workovertimelist', @level2type=N'COLUMN',@level2name=N'user_name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'后期可能用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_workovertimelist', @level2type=N'COLUMN',@level2name=N'user_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'后期可能用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_workovertimelist', @level2type=N'COLUMN',@level2name=N'user_pin'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加班表，通过人事excle导入' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_workovertimelist'
GO

/****** Object:  Table [dbo].[oa_pos_icconsumerlist]    Script Date: 10/22/2015 11:21:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[oa_pos_icconsumerlist](
	[id] [int] NOT NULL,
	[userId] [nvarchar](20) NULL,
	[userPin] [nvarchar](20) NULL,
	[userName] [nvarchar](24) NULL,
	[card] [nvarchar](20) NULL,
	[sysCardNo] [int] NULL,
	[posTime] [datetime] NULL,
	[mealId] [int] NULL,
	[deptId] [int] NULL,
 CONSTRAINT [PK_OA_POS_ICCONSUMERLIST] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID同步，非自增长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_icconsumerlist', @level2type=N'COLUMN',@level2name=N'id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'后期可能用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_icconsumerlist', @level2type=N'COLUMN',@level2name=N'userId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工号，后期可能用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_icconsumerlist', @level2type=N'COLUMN',@level2name=N'userPin'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名，即刷卡人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_icconsumerlist', @level2type=N'COLUMN',@level2name=N'userName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IC卡NO，后期可能用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_icconsumerlist', @level2type=N'COLUMN',@level2name=N'card'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IC卡ID，后期可能用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_icconsumerlist', @level2type=N'COLUMN',@level2name=N'sysCardNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消费时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_icconsumerlist', @level2type=N'COLUMN',@level2name=N'posTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'餐别：中餐、晚餐' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_icconsumerlist', @level2type=N'COLUMN',@level2name=N'mealId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_icconsumerlist', @level2type=N'COLUMN',@level2name=N'deptId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消费机数据，来自于192.168.2.11的zkteco_database库中的pos_icconsumerlist表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'oa_pos_icconsumerlist'
GO
