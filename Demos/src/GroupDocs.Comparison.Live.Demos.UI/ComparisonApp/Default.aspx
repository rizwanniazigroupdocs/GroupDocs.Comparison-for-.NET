﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GroupDocs.Comparison.Live.Demos.UI.ComparisonApp.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" data-ng-app="myApp" style="height: 100%; overflow-y: hidden;">
<head runat="server">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width" />

	<title>GroupDocs Comparison App</title>
	<link href="/favicon.ico" rel="shortcut icon" type="image/vnd.microsoft.icon" />

	<script src="/ComparisonApp/qi/doc/js/custom.js?v1.6"></script>
	<script>
		fileName = '<%= fileName%>';
		fileName2 = '<%= fileName2%>';
		folderName = '<%= folderName%>';
	</script>
	<style>
		.InsertedItem {
			color: #050c9c !important;
			font-weight: bold;
			font-size: smaller;
		}

		.DeletedItem {
			color: #ff0000 !important;
			font-weight: bold;
			font-size: smaller;
		}

		.StyleChangedItem {
			color: #167607 !important;
			font-weight: bold;
			font-size: smaller;
		}
	</style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

	<link href="/qi/css/addon/effect-light.min.css" rel="stylesheet" />
	<link href="/qi/css/quantumui.min.css?v1.6" rel="stylesheet" />
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
	<script src="https://code.angularjs.org/1.7.2/angular.min.js"></script>
	<script src="https://code.angularjs.org/1.7.2/angular-sanitize.min.js"></script>
	<script src="https://code.angularjs.org/1.7.2/angular-animate.min.js"></script>
	<script src="https://code.angularjs.org/1.7.2/angular-resource.min.js"></script>
	<script src="/qi/js/quantumui-all.min.js?v1.6"></script>
	<script src="/qi/config/icons.js"></script>
	<script src="/ComparisonApp/qi/doc/js/app.js?v1.8"></script>
	<% if (Request.Url.AbsoluteUri.Contains("://products.groupdocs.app"))
		{ %>
	<!-- Only track live pages in Google Analytics -->
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-27946748-4"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() { dataLayer.push(arguments); }
		gtag('js', new Date());

		gtag('config', 'UA-27946748-4');
	</script>
	<% } %>
</head>
<body oncontextmenu="return false" data-ng-controller="ComparisonAPIController as ctrl" style="height: 100vh; overflow: hidden!important;">
	<header>
		<div class="navbar navbar-inverse navbar-fixed-top" style="margin: 0; background-color: #131313!important;">
			<div class="container-fluid" style="padding-right: 5px!important;">
				<div class="pull-left" style="height: 50px; width: 35px;" ng-hide="myLeftAside.$isOpen">
					<a href="#" class="titip-right" data-title="Show Thumbnails" data-aside-toggle="#leftMenuAside" style="padding-top: 15px; font-size: 14px; color: #fff;">
						<i class="glyphicon glyphicon-menu-hamburger"></i>
					</a>
				</div>
				<div class="navbar-header-right" style="color: #fff;">
					<button type="button" class="navbar-toggle" data-nq-collapse="" data-target-id=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<div class="navbar-header">
					<a class="navbar-brand" href="#" style="padding: 5px 15px;">
						<img src="/images/GroupDocs-logo.png" alt="GroupDocs Document Comparison App" />
					</a>
				</div>
				<ul class="nav navbar-nav navbar-left">
					<li>
						<div style="color: #fff; margin-top: 21px;"><strong>&nbsp;Comparison</strong></div>
					</li>
				</ul>
				<div class="collapse navbar-collapse" style="color: #fff;">
					<ul class="nav navbar-nav navbar-right">
						<li style="display: block;">
							<button type="button" data-title="Downloads" role="button" data-nq-dropdown="" class="navbar-toggle titip-left" style="border: none!important;" data-qo-placement="bottom-right">
								<i class="glyphicon glyphicon-download-alt"></i><span class="caret"></span>
							</button>
							<ul class="dropdown-menu" tabindex="-1" role="menu">
								<li role="presentation"><a role="menuitem" tabindex="-1" target="_blank" ng-href="/GroupDocsapi/api/GroupDocsComparison/downloaddocument?file=<%= fileName%>&folderName=<%= folderName%>&isSourceFile=true&isImage=false"><i class="glyphicon glyphicon-download-alt"></i>&nbsp;Download Source Document</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" target="_blank" ng-href="/GroupDocsapi/api/GroupDocsComparison/downloaddocument?file=<%= fileName2%>&folderName=<%= folderName%>&isSourceFile=true&isImage=false"><i class="glyphicon glyphicon-download-alt"></i>&nbsp;Download Target Document</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" target="_blank" ng-href="/GroupDocsapi/api/GroupDocsComparison/downloaddocument?file=Result_<%= fileName2%>&folderName=<%= folderName%>&isSourceFile=false&isImage=false"><i class="glyphicon glyphicon-download-alt"></i>&nbsp;Download Output Document</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" target="_blank" ng-href="/GroupDocsapi/api/GroupDocsComparison/downloaddocument?file=<%= fileName2%>&folderName=<%= folderName%>&isSourceFile=false&isImage=true"><i class="glyphicon glyphicon-compressed"></i>&nbsp;Download Output As Images</a></li>
							</ul>
						</li>
						<li>
							<button type="button" data-nq-modal-box="" data-box-type="confirm" class="navbar-toggle titip-left" data-after-confirm="existApp()" data-qs-content="<p>Are you sure, you want to close?</p>" data-title="Close" style="border: none;">
								<i class="glyphicon glyphicon-remove"></i>
							</button>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right" style="margin-right: 27vw;">
						<li>
							<button type="button" class="navbar-toggle titip-left" style="border: none!important;" ng-click="navigatePage('-')" data-title="Previous Page">
								<i class="glyphicon glyphicon-circle-arrow-left"></i>
							</button>
						</li>
						<li>
							<button type="button" class="navbar-toggle titip-right" style="border: none!important;">
								<span id="spantoolpager" style="">1 of 1</span>
							</button>
						</li>
						<li style="display: none;">
							<input class="titip-right" id="inputcurrentpage" readonly="true" my-enter="navigatePage(this.value)" value="0" style="display: none; background: transparent; border: solid 0px #ccc; color: #fff !important; width: 50px; text-align: center; height: 18px; font-size: small;" />
						</li>
						<li>
							<button type="button" class="navbar-toggle titip-right" style="border: none!important;" ng-click="navigatePage('+')" data-title="Next Page">
								<i class="glyphicon glyphicon-circle-arrow-right"></i>
							</button>
						</li>
						<li>
							<button type="button" class="navbar-toggle titip-left" style="display: none; border: none!important;" ng-click="navigatePage('f')" data-title="First Page">
								<i class="glyphicon glyphicon-step-backward"></i>
							</button>
						</li>
						<li>
							<div style="margin: 13px 14px 0px 0px;">|</div>
						</li>
						<li style="display: none;">
							<button type="button" class="navbar-toggle titip-right" style="display: none; border: none!important;" ng-click="navigatePage('e')" data-title="Last Page">
								<i class="glyphicon glyphicon-step-forward"></i>
							</button>
						</li>
						<li>
							<button type="button" class="navbar-toggle titip-left" style="border: none!important;" ng-click="zoomPage('+')" data-title="Zoom In">
								<i class="glyphicon glyphicon-zoom-in"></i>
							</button>
						</li>
						<li>
							<select name="zoomSelect" ng-model="itemSelected" ng-change="zoomPage(itemSelected)" class="navbar-toggle titip-top" style="padding: 3px!important; margin-top: 13px!important; max-width: 150px!important;">
								<option value="6.00">600%</option>
								<option value="5.50">550%</option>
								<option value="5.00">500%</option>
								<option value="4.50">450%</option>
								<option value="4.00">400%</option>
								<option value="3.50">350%</option>
								<option value="3.00">300%</option>
								<option value="2.75">275%</option>
								<option value="2.50">250%</option>
								<option value="2.25">225%</option>
								<option value="2.00">200%</option>
								<option value="1.75">175%</option>
								<option value="1.50">150%</option>
								<option value="1.25">125%</option>
								<option value="1.00">100%</option>
								<option value="0.75">75%</option>
								<option value="0.50">50%</option>
								<option value="0.25">25%</option>
								<option value="0.20">20%</option>
								<option value="0.15">15%</option>
								<option value="0.10">10%</option>
								<option value="0.05">5%</option>
								<option value="w">Fit to Width</option>
								<option value="h">Fit to Height</option>
							</select>
						</li>
						<li>
							<button type="button" class="navbar-toggle titip-right" style="border: none!important;" ng-click="zoomPage('-')" data-title="Zoom Out">
								<i class="glyphicon glyphicon-zoom-out"></i>
							</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<div style="width: 100%; overflow: hidden; background-color: #333333; background-image: none!important;" ng-init="asideSettings={enlargeHover:true, offCanvas:'mobile'}">
		<div id="leftMenuAside" data-nq-aside="myLeftAside" class="aside aside-with-menu" style="color: #fff;"
			data-collapsible="true"
			data-top-offset="50px"
			data-off-canvas="{{asideSettings.offCanvas}}"
			data-pinnable="true"
			data-opened="true"
			data-collapsed="true"
			data-enlarge-hover="{{asideSettings.enlargeHover}}"
			data-ng-swipe-left="$aside.toggleCollapse(true);"
			data-ng-swipe-right="$aside.toggleCollapse(false);">
			<div class="aside-header">
				<div class="aside-buttons">
					<span ng-show="myLeftAside.$collapsed" ng-click="$aside.toggleCollapse()" class="titip-right" data-title="Collapse"><i class="glyphicon glyphicon-arrow-right"></i></span>
					<span ng-hide="myLeftAside.$collapsed" ng-click="$aside.toggleCollapse()" class="titip-right" data-title="Collapse"><i class="glyphicon glyphicon-arrow-left"></i></span>
					<span ng-hide="myLeftAside.$collapsed" ng-click="asideSettings.enlargeHover = !$aside.$pinned; $aside.togglePin();" class="titip-right" data-title="Toggle Pin"><i class="glyphicon glyphicon-pushpin"></i></span>
					<span ng-hide="myLeftAside.$collapsed" ng-click="$aside.close()" class="titip-right" data-title="Close"><i class="glyphicon glyphicon-remove"></i></span>
				</div>
				<span ng-hide="$aside.$collapsed" class="aside-title">Pages</span>

			</div>
			<div class="aside-body" style="text-align: center; padding-top: 10px; overflow-y: auto;">
				<p ng-repeat="PageData in PageList" style="background: none!important; border: none!important;" class="thumbnail">
					<img ng-class="{selectedthumbnail: PageData === selected}" id="imgt-page-{{$index + 1}}" ng-click="slectedPageImage($event, PageData)" ng-mouseover="slectedPageImage($event, PageData)" width="170px" height="170px" ng-src="{{ createPageImage(PageData, $index)}}" style="border: 1px solid #000000; border-radius: 2px; box-shadow: #333 4px 4px 4px; border-radius: 4px;" />
				</p>
			</div>
		</div>
		<div id="rightMenuAside" data-nq-aside="myRightAside" class="aside aside-with-menu" style="color: #fff;"
			data-collapsible="true"
			data-side="right"
			data-top-offset="50px"
			data-off-canvas="{{asideSettings.offCanvas}}"
			data-pinnable="true"
			data-opened="true"
			data-collapsed="false"
			data-enlarge-hover="{{asideSettings.enlargeHover}}"
			data-ng-swipe-left="$aside.toggleCollapse(true);"
			data-ng-swipe-right="$aside.toggleCollapse(true);">
			<div class="aside-header">
				<div class="aside-buttons">
					<span ng-show="myRightAside.$collapsed" ng-click="$aside.toggleCollapse()" class="titip-left" data-title="Collapse"><i class="glyphicon glyphicon-arrow-right"></i></span>
					<span ng-hide="myRightAside.$collapsed" ng-click="$aside.toggleCollapse()" class="titip-left" data-title="Collapse"><i class="glyphicon glyphicon-arrow-left"></i></span>
					<span ng-hide="myRightAside.$collapsed" ng-click="asideSettings.enlargeHover = !$aside.$pinned; $aside.togglePin();" class="titip-left" data-title="Toggle Pin"><i class="glyphicon glyphicon-pushpin"></i></span>
				</div>
				<span ng-hide="$aside.$collapsed" class="aside-title">Changes</span>

			</div>
			<div class="aside-body" style="text-align: left; background-color: #eee; color: #333; padding-top: 10px; overflow-y: auto;">
				<ol>
					<li ng-repeat="changeItems in ChangesList">
						<span class="{{changeItems.TypeText}}Item">{{changeItems.TypeText}}</span><span style="font-size: x-small"> (P:{{changeItems.Page.Id+1}})</span>
						<p style="font-size: smaller;">{{changeItems.changeInfo.Text}}&nbsp; <b>Author: </b>{{changeItems.changeInfo.Authors[0]}}</p>
					</li>
				</ol>
			</div>
		</div>
	</div>
	<div name="dvPages" class="content-wrapper container-fluid" infinityscroll="NextPage()" style="height: 100vh; padding-top: 55px!important; width: auto!important; overflow: auto!important; background: #fff; background-image: url('/images/loader.gif'); background-repeat: no-repeat; background-position: center;">
		<div class="container-fluid" style="text-align: center;">
			<div class="clearfix" style="text-align: center;">
				<div class="row" style="text-align: center;">
					<ul class="col-sm-12" style="text-align: center;">
						<li name="dvInnerPages" ng-repeat="PageData in PageList" style="border: 1px solid #000000; margin: 12px auto 0px 10px; display: inline-block; position: relative; box-shadow: #333 4px 4px 4px; border-radius: 4px; height: auto; width: {{PageWidth}}%;" class="thumbnail">
							<a name="page-view-{{$index + 1}}"></a>
							<img id="img-page-{{$index + 1}}" ng-click="slectedPageImage($event, PageData)" ng-mouseover="slectedPageImage($event)" ng-src="{{ createPageImage(PageData, $index)}}" />
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
