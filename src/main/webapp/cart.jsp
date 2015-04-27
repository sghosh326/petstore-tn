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
 The shopping cart page
 
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
        <div class="row extra-top">
            <div class="col-xs-8">
                <h3>Shopping Cart</h3>
            </div>
            <div class="col-xs-4"></div>
        </div>
        <div class="row fg-sep">
            <div class="col-xs-10">
                <table id="itemsTable" class="table table-bordered" style="display:none">
                    <thead>
                    <tr>
                        <th class="col-xs-3"><h5>Thumbnail</h5></th>
                        <th class="col-xs-3"><h5>Name</h5></th>
                        <th class="col-xs-1"><h5>Price</h5></th>
                        <th class="col-xs-3"><h5></h5></th>
                    </tr>
                    </thead>
                    <tbody id="itemsBody">
                    </tbody>
                </table>
               <div class="col-xs-8 alert-box" id="cartNotif"></div>
            </div>
            <div class="col-xs-2"></div>
        </div>


        <div class="row extra-top extra-bottom">
            <div class="col-xs-8">
               <button id="checkoutBtn" class="btn btn-primary">Checkout</button>

               <button id="backBtn" class="btn">Back</button>
            </div>
            <div class="col-xs-4">&nbsp;</div>
        </div>
	</jsp:body>
</t:page>	