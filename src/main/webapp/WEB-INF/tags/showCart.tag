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

-->

<!-- 
 A custom tag for the shopping cart page
 
 @author Sandip Ghosh (sandip.ghosh@resilient-networks.com)
 -->
<%@tag description="Shows the shopping cart navigation bar" pageEncoding="UTF-8"%>
<%
 	String cp = application.getContextPath();
%>

	        <div id="cartPanel" class="panel-footer pull-right">
	            <ul class="nav nav-pills">
	                <li role="presentation" class="active"><a href="<%=cp%>/cart.jsp" id="cartLink">Cart (0)</a></li>
	            </ul>
	        </div>