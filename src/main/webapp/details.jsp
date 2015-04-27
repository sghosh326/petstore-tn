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
Item details page

@author Sandip Ghosh (sandip.ghosh@resilient-networks.com)
 -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="appHeader.jsp" %> 
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:page>
    <jsp:attribute name="navigation">
      <t:showCart></t:showCart> 
    </jsp:attribute>
    <jsp:body>
    	<t:details></t:details>
		<div class="row extra-top">
            <div class="col-xs-8">
                <h3 id="itemName"></h3>
             </div>
            <div class="col-xs-4"></div>
        </div>
        <div class="row extra-top">
            <div class="col-xs-6">
                <h5 id="itemDescription"></h5>
             </div>
            <div class="col-xs-6"><img id="itemImage" src=""/></div>
        </div>
        <div class="row extra-top">
            <div class="col-xs-8">
                <h3 id="itemPrice"></h3>
             </div>
            <div class="col-xs-4"></div>
        </div>
		
       <div class="row extra-top extra-bottom">
            <div class="col-xs-8">
               <button id="addToCartBtn" class="btn btn-primary">Add to Cart</button>

               <button id="backBtn" class="btn">Back</button>
            </div>
            <div class="col-xs-4">&nbsp;</div>
        </div>    	
    </jsp:body>
</t:page>
