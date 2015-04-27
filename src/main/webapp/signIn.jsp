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
The sign in and sign up page

@author Sandip Ghosh (sandip.ghosh@resilient-networks.com)
 -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:page>
    <jsp:attribute name="navigation">
        <div id="navPanel" class="panel-footer">
			<div class="btn-group btn-group-lg" role="group" aria-label="...">
			  <button type="button" class="btn btn-default btn-primary" id="signIn">Sign In</button>
			  <button type="button" class="btn btn-default" id="signUp">Sign Up</button>
			</div>		        
		</div>
    </jsp:attribute>
	<jsp:body>
		<div class="col-xs-8 alert-box" id="errorNotif"></div>
		<div class="row extra-top" id="signInPanel">
          		<div class="col-xs-8">
              		<p class="h5">Enter your email address to begin Sign In Process. If you don't have an account with us click Sign Up to create an account</p>

			   <form class="form-horizontal" method="post"  action="" name="checkoutForm" style="padding:10px;"> 
			        <div class="form-group">
			            <div class="col-xs-1"></div>
			            <div class="col-xs-6">
			                <div class="input-group">
			                    <span class="input-group-addon"><i class="fa fa-envelope fa-fw"></i></span>
			                    <input type="email"
			                           class="form-control"
			                           id="signInEmail"
			                           name="signInEmail"
			                           placeholder="Email Address"
			                           required>
			                </div>
			            </div>
			            <div class="col-xs-2"></div>
			        </div>
				</form>
		        <div class="row extra-top extra-bottom">
		            <div class="col-xs-8">
		               <button id="beginSignIn" class="btn btn-primary">Begin Sign In</button>
		            </div>
		            <div class="col-xs-4">&nbsp;</div>
		        </div>
          		</div>
          		<div class="col-xs-4"></div>
      		</div>
		<div class="row extra-top" id="signUpPanel" style="display:none">
          		<div class="col-xs-8">
              		<p class="h5">Please create an account to view and purchase our wonderful pets!</p>
			   <form class="form-horizontal" method="post"  action="" name="checkoutForm" style="padding:10px;"> 
			        <div class="form-group">
			            <div class="col-xs-1"></div>
			            <div class="col-xs-6">
			                <div class="input-group">
			                    <span class="input-group-addon"><i class="fa fa-envelope fa-fw"></i></span>
			                    <input type="email"
			                           class="form-control"
			                           id="signUpEmail"
			                           name="signUpEmail"
			                           placeholder="Email Address"
			                           required>
			                </div>
			            </div>
			            <div class="col-xs-2"></div>
 							</div>
			        <div class="form-group">
			            <div class="col-xs-1"></div>
			            <div class="col-xs-6">
			                <div class="input-group">
			                    <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
			                    <input type="password"
			                           class="form-control"
			                           id="password"
			                           name="password"
			                           placeholder="Password"
			                           required>
			                </div>
			            </div>
			            <div class="col-xs-2"></div>
			        </div>
			        <div class="form-group">
			            <div class="col-xs-1"></div>
			            <div class="col-xs-6">
			                <div class="input-group">
			                    <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
			                    <input type="password"
			                           class="form-control"
			                           id="passwordConfirm"
			                           name="passwordConfirm"
			                           placeholder="Confirm Password"
			                           required>
			                </div>
			            </div>
			            <div class="col-xs-2"></div>
			        </div>
			        <div class="form-group">
			            <div class="col-xs-1"></div>
			            <div class="col-xs-6">
			                <div class="input-group">
			                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
			                    <input type="text"
			                           class="form-control"
			                           id="firstName"
			                           name="firstName"
			                           placeholder="First Name"
			                           required>
			                </div>
			            </div>
			            <div class="col-xs-2"></div>
			        </div>
			        <div class="form-group">
			            <div class="col-xs-1"></div>
			            <div class="col-xs-6">
			                <div class="input-group">
			                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
			                    <input type="text"
			                           class="form-control"
			                           id="lastName"
			                           name="lastName"
			                           placeholder="Last Name"
			                           required>
			                </div>
			            </div>
			            <div class="col-xs-2"></div>
			        </div>
			        <div class="form-group">
			            <div class="col-xs-1"></div>
			            <div class="col-xs-6">
			                <div class="input-group">
			                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>
			                    <input type="text"
			                           class="form-control"
			                           id="phone"
			                           name="phone"
			                           placeholder="Phone Number"
			                           required>
			                </div>
			            </div>
			            <div class="col-xs-2"></div>
			        </div>
				</form>
		        <div class="row extra-top extra-bottom">
		            <div class="col-xs-8">
		               <button id="register" class="btn btn-primary">Create Account</button>
		            </div>
		            <div class="col-xs-4">&nbsp;</div>
		        </div>
          		</div>
          		<div class="col-xs-4"></div>
      	</div>
	</jsp:body>
</t:page>	