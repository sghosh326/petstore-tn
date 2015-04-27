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
 The payment confirmation page. The Trust Tag script for enforcing
 the payment confirmation policy goes here
 
 @author Sandip Ghosh (sandip.ghosh@resilient-networks.com)
 -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="appHeader.jsp" %> 
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:page>
    <jsp:attribute name="trustTagScript">
    <!-- 
     ****************************************
     * Put Trust Tag Script here
     ****************************************  
     -->
    </jsp:attribute>
    <jsp:attribute name="navigation">
      <t:showCart></t:showCart>
    </jsp:attribute>
    
	<jsp:body>
        <div class="row extra-top">
            <div id="purchaseNotif" class="col-xs-8 alert-box success" style="display:none">
            	<i class="fa fa-check-square fa-lg"></i>&nbsp;&nbsp;Congratulations! You are a proud owner of one of our wonderful pet(s).
            </div>
            <div class="col-xs-4"></div>
        </div>
		<script type="text/javascript">
			function afterGrant() {
				$.getJSON($("#contextPath").val() + "/REST/cart/count", function(data) {
					if (data && data.status === "success") {
						Petstore.commitSale(data.cartItemIds);
					}
				});	
			}

			/*******************************************************
			 * 	Remove the section below after adding policy in TNaaS
			*********************************************************/
			$(document).ready(function() {
				afterGrant();
			});
		</script>  
	</jsp:body>
</t:page>		 