<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.affirmlayer{top:10;left:10;width:500px;border:3px solid #E7EFF1;background:#fff;border-radius:5px!important;}
.affirmlayer h2{height:30px;border-bottom:1px solid #ccc;padding:5px 5px;margin:0px;font-size:14px;background:#E7EFF1;}
input.inputall{border:1px #ccc solid; width:130px; height:20px;text-align:left;}
</style>
</head>
<body>
<div id="header-topbar-option-demo" class="page-header-topbar">
	<nav id="topbar" role="navigation"
		style="margin-bottom: 0; z-index: 2;"
		class="navbar navbar-default navbar-static-top">
		<div class="navbar-header">
			<button type="button" data-toggle="collapse"
				data-target=".sidebar-collapse" class="navbar-toggle">
				<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
					class="icon-bar"></span><span class="icon-bar"></span>
			</button>
			<a id="logo" href="${ctx }/home.htm" class="navbar-brand" style="line-height: 35px;"><span
				class="fa fa-rocket"></span> <span class="logo-text" style="font-size: 20px;font-family: 楷体;">依云智酷管理系统
			</span><span style="display: none" class="logo-text-icon">T</span>
			</a>
		</div>
		<div class="topbar-main">
			<a id="menu-toggle" href="#" class="hidden-xs"><i
				class="fa fa-bars"></i>
			</a>
			<form id="topbar-search" action="#" method="GET" class="hidden-xs">
				<div class="input-group">
					<input type="text" placeholder="Search..." class="form-control" /><span
						class="input-group-btn"><a href="javascript:;"
						class="btn submit"><i class="fa fa-search"></i>
					</a>
					</span>
				</div>
			</form>
			<ul class="nav navbar navbar-top-links navbar-right mbn">
				<li class="dropdown topbar-user">
                     <a data-hover="dropdown" href="#" class="dropdown-toggle" style="width:126px;">
	                     <img src="${ctx }/images/user.png" alt="" class="img-responsive img-circle" />
	                     <span class="hidden-xs"><font size="3px;">${realName}</font></span>&nbsp;<span class="caret"></span>
                     </a>
                     <ul class="dropdown-menu dropdown-user pull-right">
                         <li><a id="modifyPassword" href="#"><i class="fa fa-eye"></i>修改密码</a></li>
                         <!-- <li class="divider"></li>
                         <li><a href="extra-lock-screen.html"><i class="fa fa-lock"></i>锁屏</a></li> -->
                         <li><a href="javascript:void(0);" onclick="logout();"><i class="glyphicon glyphicon-off"></i>注销</a>
                         </li>
                     </ul>
                 </li>
				<!-- <li class="dropdown">
					<a data-hover="dropdown" href="#" class="dropdown-toggle">
						<i class="fa fa-tasks fa-fw"></i>
						<span class="badge badge-yellow">8</span>
					</a>
					<ul class="dropdown-menu dropdown-tasks">
						<li>
							<p>You have 14 pending tasks</p></li>
						<li>
							<div class="dropdown-slimscroll">
								<ul>
									<li><a href="page-blog-item.html" target="_blank"><span
											class="task-item">Fix the HTML code<small
												class="pull-right text-muted">40%</small>
										</span>
										<div class="progress progress-sm">
												<div role="progressbar" aria-valuenow="40" aria-valuemin="0"
													aria-valuemax="100" style="width: 40%;"
													class="progress-bar progress-bar-orange">
													<span class="sr-only">40% Complete (success)</span>
												</div>
											</div>
									</a></li>
									<li><a href="page-blog-item.html" target="_blank"> <span
											class="task-item">Make a wordpress theme<small
												class="pull-right text-muted">60%</small>
										</span>
											<div class="progress progress-sm">
												<div role="progressbar" aria-valuenow="60" aria-valuemin="0"
													aria-valuemax="100" style="width: 60%;"
													class="progress-bar progress-bar-blue">
													<span class="sr-only">60% Complete (success)</span>
												</div>
											</div> </a></li>
									<li><a href="page-blog-item.html" target="_blank"> <span
											class="task-item">Convert PSD to HTML<small
												class="pull-right text-muted">55%</small>
										</span>
											<div class="progress progress-sm">
												<div role="progressbar" aria-valuenow="55" aria-valuemin="0"
													aria-valuemax="100" style="width: 55%;"
													class="progress-bar progress-bar-green">
													<span class="sr-only">55% Complete (success)</span>
												</div>
											</div> </a></li>
									<li><a href="page-blog-item.html" target="_blank"> <span
											class="task-item">Convert HTML to Wordpress<small
												class="pull-right text-muted">78%</small>
										</span>
											<div class="progress progress-sm">
												<div role="progressbar" aria-valuenow="78" aria-valuemin="0"
													aria-valuemax="100" style="width: 78%;"
													class="progress-bar progress-bar-yellow">
													<span class="sr-only">78% Complete (success)</span>
												</div>
											</div> </a></li>
								</ul>
							</div>
						</li>
						<li class="last"><a href="page-blog-item.html"
							target="_blank">See all tasks</a></li>
					</ul>
				</li> -->
				<!-- 
	            <li class="dropdown topbar-user">
	                <a data-hover="dropdown" href="#" class="dropdown-toggle"><img src="https://s3.amazonaws.com/uifaces/faces/twitter/kolage/48.jpg" alt="" class="img-responsive img-circle" />&nbsp;<span class="hidden-xs">John Doe</span>&nbsp;<span class="caret"></span>
	                </a>
	                <ul class="dropdown-menu dropdown-user pull-right">
	                    <li><a href="extra-profile.html"><i class="fa fa-user"></i>My Profile</a>
	                    </li>
	                    <li class="divider"></li>
	                    <li><a href="extra-lock-screen.html"><i class="fa fa-lock"></i>Lock Screen</a>
	                    </li>
	                    <li><a href="extra-signin.html"><i class="fa fa-key"></i>Log Out</a>
	                    </li>
	                </ul>
	            </li>
	            <li id="topbar-chat" class="hidden-xs"><a href="javascript:void(0)" class="btn-chat"><i class="fa fa-comments"></i><span class="badge badge-info">3</span></a>
	            </li> -->
				<!-- <li class="dropdown hidden-xs">
					<a id="theme-setting" href="javascript:;" data-hover="dropdown" data-step="1" data-intro="&lt;b&gt;Header&lt;/b&gt;, &lt;b&gt;sidebar&lt;/b&gt;, &lt;b&gt;border style&lt;/b&gt; and &lt;b&gt;color&lt;/b&gt;, all of them can change for you to create the best" data-position="left" class="dropdown-toggle">
						<i class="fa fa-cogs"></i>
					</a>
					<ul class="dropdown-menu dropdown-theme-setting pull-right">
						<li>
							<h4 class="mtn">Theme Styles</h4> <select id="list-style"
							class="form-control">
								<option value="style1">Flat Squared style</option>
								<option value="style2">Flat Rounded style</option>
								<option value="style3">Flat Border style</option>
						</select></li>
						<li>
							<h4 class="mtn">Menu Styles</h4> <select id="list-menu"
							class="form-control">
								<option value="sidebar-default">Menu style 1</option>
								<option value="sidebar-colors">Menu style 2</option>
								<option value="sidebar-icons">Menu style 3</option>
								<option value="sidebar-collapsed">Menu style 4</option>
						</select></li>
						<li>
							<h4 class="mtn">Header & Sidebar</h4> <select id="list-header"
							class="form-control">
								<option value="header-static">Static</option>
								<option value="header-fixed">Fixed</option>
						</select></li>
						<li>
							<h4 class="mtn">Theme Colors</h4>
							<ul id="list-color" class="list-unstyled list-inline">
								<li data-color="green-dark" data-hover="tooltip"
									title="Green - Dark" class="green-dark"></li>
								<li data-color="red-dark" data-hover="tooltip"
									title="Red - Dark" class="red-dark"></li>
								<li data-color="pink-dark" data-hover="tooltip"
									title="Pink - Dark" class="pink-dark"></li>
								<li data-color="blue-dark" data-hover="tooltip"
									title="Blue - Dark" class="blue-dark"></li>
								<li data-color="yellow-dark" data-hover="tooltip"
									title="Yellow - Dark" class="yellow-dark"></li>
								<li data-color="green-grey" data-hover="tooltip"
									title="Green - Grey" class="green-grey"></li>
								<li data-color="red-grey" data-hover="tooltip"
									title="Red - Grey" class="red-grey"></li>
								<li data-color="pink-grey" data-hover="tooltip"
									title="Pink - Grey" class="pink-grey"></li>
							</ul>
						</li>
					</ul>
				</li> -->
			</ul>
		</div>
	</nav>
</div>

<div id="modifypwddiv" class="affirmlayer" style="display: none; width: 400px;height: auto;">
		<h2 syle="height:20px;">
			<b>修改密码</b>
			<a href="#" id="closeModifypwddiv"  style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;">
			<form>
				<table width="100%" class="my-table-form">
					<tbody>
						<tr>
							<td width="30%">您当前密码：</td>
							<td width="40%" style="text-align:left;"><input id="nowpwd" name="nowpwd" class="inputall" type="password" onclick="displayError();"/></td>
							<td width="30%">&nbsp<span id="nowpwd_error" style="color: red;display: none;position:relative;left: 0px">当前密码不正确！</span></td>
						</tr>
						<tr>
							<td>设置新密码：</td>
							<td style="text-align:left;"><input id="newpwd" name="newpwd" class="inputall" type="password"/></td>
							<td>&nbsp</td>
						</tr>
						<tr>
							<td>重复新密码：</td>
							<td style="text-align:left;"><input id="newpwd2" name="newpwd2" class="inputall" type="password"/></td>
							<td>&nbsp</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div style="width:100%;text-align: center;height:auto;border-top: 1px solid #ccc;padding-top:3px;">
			<button type="button" class="btn btn-success btn-outlined" style="border-radius:2px!important;" onclick="checkpwd();">确定修改</button>
	    </div>
	</div>
	<div id="newAlert" class="affirmlayer" style="display: none;min-width:100px; max-width:300px;height: auto;min-height:100px;max-height:300px;">
		<h2 style="font-family: 微软雅黑;">
			<b>信息提示:</b>
			<a href="#" onclick="closeDiv('newAlert');" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;padding:20px;text-align:center;font-size:14px" id="alertbody">
			
		</div>
		<div style="width:100%;text-align: right;height:auto;border-top: 1px solid #ccc;padding-top:3px;">
			<button type="button" class="btn btn-success btn-outlined" style="border-radius:2px!important;" onclick="closeDiv('newAlert');">确定</button>
	    </div>
	</div>
	<div id="newConfirm" class="affirmlayer" style="display: none;min-width:100px; max-width:300px;height: auto;min-height:100px;max-height:300px;">
		<h2 style="font-family: 微软雅黑;">
			<b>信息提示:</b>
			<a href="#" onclick="isconfirmDiv(0);" style="float:right;font-size: 18px;"><i class="fa fa-times-circle"></i></a>
		</h2>
		<div style="height: auto;padding:20px;text-align:center;font-size:14px" id="confirmbody">
			
		</div>
		<div style="width:100%;text-align: right;height:auto;border-top: 1px solid #ccc;padding-top:3px;">
			<button type="button" class="btn btn-success btn-outlined" style="border-radius:2px!important;" onclick="isconfirmDiv(1);">确定</button>
			<button type="button" class="btn btn-warning btn-outlined" style="border-radius:2px!important;" onclick="isconfirmDiv(0);">取消</button>
	    </div>
	</div>
</body>