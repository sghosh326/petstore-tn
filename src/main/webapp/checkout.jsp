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
 The checkout form page
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
                <h3>Checkout</h3>
            </div>
            <div class="col-xs-8 alert-box" id="errorNotif"></div>
            <div class="col-xs-4"></div>
        </div>
	   <form class="form-horizontal" method="post"  action="" name="checkoutForm" style="padding:10px;"> 
	        <div class="form-group">
	            <div class="col-xs-1"></div>
	            <div class="col-xs-5">
	                <div class="input-group">
	                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
	                    <input type="text"
	                           class="form-control"
	                           id="name"
	                           name="name"
	                           placeholder="Name"
	                           required>
	                </div>
	            </div>
	            <div class="col-xs-2"></div>
	        </div>
	        <div class="form-group">
	            <div class="col-xs-1"></div>
	            <div class="col-xs-5">
	                <div class="input-group">
	                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
	                    <input type="text"
	                           class="form-control"
	                           id="street"
	                           name="street"
	                           placeholder="Street Address"
	                           required>
	                </div>
	            </div>
	            <div class="col-xs-2"></div>
	        </div>
	        <div class="form-group">
	            <div class="col-xs-1"></div>
	            <div class="col-xs-5">
	                <div class="input-group">
	                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
	                    <input type="text"
	                           class="form-control"
	                           id="city"
	                           name="city"
	                           placeholder="City"
	                           required>
	                </div>
	            </div>
	            <div class="col-xs-2"></div>
	        </div>
	        <div class="form-group">
	            <div class="col-xs-1"></div>
	            <label class="control-label col-xs-1" for="state">State</label>
	            <div class="col-xs-4">
	                <select class="form-control" id="state" name="state">
						<option value="AL">Alabama</option>
						<option value="AK">Alaska</option>
						<option value="AZ">Arizona</option>
						<option value="AR">Arkansas</option>
						<option value="CA">California</option>
						<option value="CO">Colorado</option>
						<option value="CT">Connecticut</option>
						<option value="DE">Delaware</option>
						<option value="DC">District Of Columbia</option>
						<option value="FL">Florida</option>
						<option value="GA">Georgia</option>
						<option value="HI">Hawaii</option>
						<option value="ID">Idaho</option>
						<option value="IL">Illinois</option>
						<option value="IN">Indiana</option>
						<option value="IA">Iowa</option>
						<option value="KS">Kansas</option>
						<option value="KY">Kentucky</option>
						<option value="LA">Louisiana</option>
						<option value="ME">Maine</option>
						<option value="MD">Maryland</option>
						<option value="MA">Massachusetts</option>
						<option value="MI">Michigan</option>
						<option value="MN">Minnesota</option>
						<option value="MS">Mississippi</option>
						<option value="MO">Missouri</option>
						<option value="MT">Montana</option>
						<option value="NE">Nebraska</option>
						<option value="NV">Nevada</option>
						<option value="NH">New Hampshire</option>
						<option value="NJ">New Jersey</option>
						<option value="NM">New Mexico</option>
						<option value="NY">New York</option>
						<option value="NC">North Carolina</option>
						<option value="ND">North Dakota</option>
						<option value="OH">Ohio</option>
						<option value="OK">Oklahoma</option>
						<option value="OR">Oregon</option>
						<option value="PA">Pennsylvania</option>
						<option value="RI">Rhode Island</option>
						<option value="SC">South Carolina</option>
						<option value="SD">South Dakota</option>
						<option value="TN">Tennessee</option>
						<option value="TX">Texas</option>
						<option value="UT">Utah</option>
						<option value="VT">Vermont</option>
						<option value="VA">Virginia</option>
						<option value="WA">Washington</option>
						<option value="WV">West Virginia</option>
						<option value="WI">Wisconsin</option>
						<option value="WY">Wyoming</option>
	                </select>
	            </div>
	            <div class="col-xs-3"></div>
	        </div>
	        <div class="form-group">
	            <div class="col-xs-1"></div>
	            <div class="col-xs-5">
	                <div class="input-group">
	                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
	                    <input type="text"
	                           class="form-control"
	                           id="zipCode"
	                           name="zipCode"
	                           placeholder="Zip Code"
	                           required>
	                </div>
	            </div>
	            <div class="col-xs-2"></div>
	        </div>
	        <div class="form-group">
	            <div class="col-xs-1"></div>
	            <div class="col-xs-5">
	                <div class="input-group">
	                    <span class="input-group-addon"><i class="fa fa-credit-card fa-fw"></i></span>
	                    <input type="text"
	                           class="form-control"
	                           id="creditCard"
	                           name="creditCard"
	                           placeholder="Credit Card Number"
	                           required>
	                </div>
	            </div>
	            <div class="col-xs-2"></div>
	        </div>
	
	   </form>
   		<div class="row extra-top extra-bottom">
            <div class="col-xs-8">
               <button id="confirmBtn" class="btn btn-primary">Place Order</button>

               <button id="backBtn" class="btn">Back</button>
            </div>
            <div class="col-xs-4">&nbsp;</div>
        </div>
	</jsp:body>
</t:page>
    