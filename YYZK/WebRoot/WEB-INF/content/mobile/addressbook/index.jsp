<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="renderer" content="webkit">
        <meta name="robots" content="all">
        <meta name="Copyright" content="WAPWEI">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
        <meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,minimal-ui" name="viewport">
		<title>通讯录</title>
		<link rel="stylesheet" href="${ctx}/resources/mobile/style/wapwei.css">
        <link rel="stylesheet" type="text/css" href="${ctx}/resources/mobile/member/member.css">
        <script src="${ctx}/resources/mobile/plugin/jquery-1.11.1/jquery-1.11.1.min.js"></script>
        <script src="${ctx}/resources/mobile/js/core/sea.js"></script>
        <script src="${ctx}/resources/mobile/js/core/seaConfig.js"></script>
        <script src="${ctx}/resources/mobile/js/lib/jquery-easing.js"></script>
        <script src="${ctx}/resources/mobile/js/lib/iscroll-probe.js"></script>
        <script src="${ctx}/resources/mobile/js/core/handlebars-1.3.0.js"></script>
        <script src="${ctx}/resources/mobile/js/lib/handleJsReg.js"></script>
        <script src="${ctx}/resources/mobile/js/lib/samphay-jquery.js"></script>
        <script src="${ctx}/resources/mobile/js/base/base.js"></script>
        <script src="${ctx}/resources/mobile/member/member.js"></script>
        <script >
            seajs.use('base', function(base){
                $(function(){
                    base.init();
                    init();
                })
            })
        </script>
    </head>

    <body class="new-member">
        <div class="header">
            <div class="info-top memberinfo">

            </div>
            <ul class="info-down" id="punch-container">
                <!-- <li >
                    <div class="info-small-box">
                        <div class="number">08:20</div>
                        <div class="text">今天上班</div>
                    </div>

                </li>
                <li >
                    <div class="info-small-box">
                        <div class="number">5</div>
                        <div class="text">待审批</div>
                    </div>

                </li> -->
            </ul>
        </div>
        <!--加载头部信息-->
        <script type="text/html" id="memberInfoTem">
            <div class="imgBox">
               <img id="user_avatar" src="{{avatar}}" alt="{{name}}"/>
            </div>
            <div class="content">
                <div class="name">{{name}}</div>
                <div class="userid">{{wx_userid}}</div>
                <div class="department">{{deptName}}</div>
            </div>
        </script>

        <!--加载打卡信息-->
        <script type="text/html" id="punch-tmp">
            <li >
                <div class="info-small-box" id="work_url_btn" href="{{work_url}}">
                    {{#compare onOrOff "off"}}
                    <div class="punch-status">{{off_time}}</div>
                    {{#if on_work_time}}
                    {{#gt on_work_time 0}}
                    <div class="text">已打卡</div>
                    {{else}}
                    <div class="text">去打卡</div>
                    {{/gt}}
                    {{/if}}
                    {{/compare}}
                    {{#compare onOrOff "on"}}
                    <div class="punch-status">{{on_time}}</div>
                    {{#if off_work_time}}
                    {{#gt on_work_time 0}}
                    <div class="text">已打卡</div>
                    {{else}}
                    <div class="text">去打卡</div>
                    {{/gt}}
                    {{/if}}
                    {{/compare}}


                </div>

            </li>
            <li >
                <div class="info-small-box waitingApprove">
                    <div class="number" href="{{approve_url}}">{{approve_count}}</div>
                    <div class="text">待审批</div>
                </div>

            </li>
        </script>

        <div class="member-search-bar">
            <input type="text" placeholder="搜索部门、成员姓名">
            <span class="icon-search"></span>
        </div>
        <div class="container">
            <ul class="nav">
                <li class="nav-item  getOriginize">
                    <span class="icon-users"></span>
                    <span class="text">组织架构</span>
                    <span class="arrow"></span>
                </li>
                <li class="nav-item  getMine">
                    <span class="icon-shashidi"></span>
                    <span class="text">我</span>
                    <span class="arrow"></span>
                </li>
                <li class="nav-item getUsually">
                    <span class=" icon-user"></span>
                    <span class="text">常用联系人</span>
                    <span class="arrow"></span>
                </li>
            </ul>
            <div class="originize-box receivedList" id="originize-box">

            </div>
        </div>

        <!--我的-->
        <script id="subuserTem" type="text/x-handlebars-template">
            <li class="layer">
                <ul class="staffList">
                    {{#each my.userinfo}}
                    <li class="staff {{#compare selected '1'}}on{{/compare}}" wxuserid="{{wx_userid}}" avatar="{{avatar}}" name="{{name}}">
                        <span class="headPic"><img src="{{avatar}}" alt="{{name}}"></span>
                        <span class="person">{{name}}</span>
                        <span class="f12" style="color:#b5b5b5;">({{depName}})</span>
                        <span class="selected"></span>
                    </li>
                    {{/each}}
                </ul>
            </li>
            <li class="layer">
                <div class="title openLayer ">
                    <span class="name">上司</span>
                </div>
                <ul class="contentWrap on">
                    <ul class="staffList">
                        {{#each superior.userinfo}}
                        <li class="staff {{#compare selected '1'}}on{{/compare}}" wxuserid="{{wx_userid}}" avatar="{{avatar}}" name="{{name}}">
                            <span class="headPic"><img src="{{avatar}}" alt="{{name}}"></span>
                            <span class="person">{{name}}<span class="f12" style="color:#b5b5b5;">({{depName}})</span></span>
                            <div class="actionBox">
                                <div class="actItem callMe" mobile="{{mobile}}">
                                    <span class="icon-phone2"></span>
                                </div>
                                <div class="actItem weChat" userid="{{wx_userid}}">
                                    <span class="icon-message"></span>
                                </div>
                            </div>

                            <span class="selected"></span>
                        </li>
                        {{/each}}
                    </ul>
                </ul>
            </li>
            <li class="layer">
                <div class="title openLayer ">
                    <span class="name">下属</span>
                </div>
                <ul class="contentWrap on">
                    {{#if subordinate.userinfo}}
                    <ul class="staffList">
                        {{#each subordinate.userinfo}}
                        <li class="staff {{#compare selected '1'}}on{{/compare}}" wxuserid="{{wx_userid}}" avatar="{{avatar}}" name="{{name}}">
                            <span class="headPic"><img src="{{avatar}}" alt="{{name}}"></span>
                            <span class="person">{{name}}<span class="f12" style="color:#b5b5b5;">({{depName}})</span></span>
                            <div class="actionBox">
                                <div class="actItem callMe" mobile="{{mobile}}">
                                    <span class="icon-phone2 "></span>
                                </div>
                                <div class="actItem weChat" userid="{{wx_userid}}">
                                    <span class="icon-message"></span>
                                </div>
                            </div>

                            <span class="selected"></span>
                        </li>
                        {{/each}}
                    </ul>
                    {{else}}
                    <li style="padding:8px;font-size : 14px; color : #b5b5b5; text-align : center;">暂无人员</li>
                    {{/if}}
                </ul>
            </li>
        </script>
        <!--组织架构-->
        <script id="originizeBoxTem" type="text/html">
            <div class="layer c_{{deep}}"  p_id="{{id}}" wxdpid="{{wx_department_id}}">
                <div class="uplayer title openLayer {{#triangleDown child member_counts}}child{{/triangleDown}}" id="cItem_{{deep}}" tid = "{{wx_department_id}}">
                    <span class="trangleDown"></span>

                    <span class="name">{{name}}                    
                    </span>
                    <span class="member-number">
                        ({{member_counts}})
                    </span>
                    <span class="group-talk">群聊</span>
                </div>
                <ul class="downlayer contentWrap {{layer deep}} wrap_{{wx_department_id}}" id="dp_{{id}}">
                    <ul class="staffList staff_{{wx_department_id}} people-list"></ul>
                </ul>
            </div>
        </script>

        <!--人员列表-->
        <script type="text/html" id="people-list-tmp">
            {{#each this}}
            <a href="memberCard.html?user={{wx_userid}}">
                <li class="people-list-item"  id="{{id}}" >
                    <span class="imgBox">
                        <img src="{{avatar}}">
                    </span>
                    <span class="name">{{name}}
					{{#compare is_leader 1}}
                        <span class="boxes_fz">(负责人)</span>
                    {{/compare}}
					</span>
                    <span class="iconBox">
                        <span class="icon-phone2 callMe" mobile="{{mobile}}" userid="{{wx_userid}}"></span>
                        <span class="icon-message weChat" userid="{{wx_userid}}"></span>
                        <span class="icon-issue issue" userid="{{wx_userid}}"></span>
                    </span>
                </li>
            </a>
            {{/each}}
        </script>

        <!--事务弹窗-->
        <div class="issue-big-box hide">
            <div class="issue-box ">
                <div class="icon-close"></div>
                <div class="text">你可以对他 :</div>
                <div class="approve-box box">
                    <span class="approve ">发起审批</span>
                </div>
                <!-- <div class="task-box box">
                    <span class="task">发起任务</span>
                </div> -->
            </div>
        </div>

        <!--群聊弹窗-->
        <div class="group-talk-big-box hide">
            <div class="group-talk-box">
                <div class="text">你确定要和这个群的所有人聊天吗？</div>
                <div class="button-box">
                    <span class="cancle button">取消</span>
                    <span class="ok button">确定</span>
                </div>
            </div>
        </div>
    </body>
</html>