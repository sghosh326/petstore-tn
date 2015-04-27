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
The activation page of the app. This page will include a Trust Tag to
enforce Email Authentication policy

@author Sandip Ghosh (sandip.ghosh@resilient-networks.com)
 --> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:page>
    <jsp:attribute name="trustTagScript">
    <!-- 
     ****************************************
     * Put Trust Tag Script here
     ****************************************  
     -->
    </jsp:attribute>
	<jsp:body>
		<t:activate></t:activate>
        <div class="row extra-top">
            <div id="notif" class="col-xs-8 alert-box">
            </div>
            <div class="col-xs-4"></div>
        </div>
 		<script type="text/javascript">
			function afterGrant() {
				$.ajax({
					type: "PUT",
					url: $("#contextPath").val() + "/REST/user/activate/" + $("#userId").val(),
					contentType: "application/json; charset=utf-8",
					timeout: 12000,
					dataType: "json",
					success:
						function(data) {
							if (data) {
								if (data.status === "success") {
									var message = "Congratulation " + $("#name").val() + ". You have successfully registered and activated your account. Please click on our logo above (Parrot) to begin using the application";
									Petstore.showNotification("success", "#notif", message);
								} else {
									Petstore.showNotification("error", "#notif", data.message);
								}				
							}
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
