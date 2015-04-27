/**
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

 */

/**
 * The main javascript file for the class. Application functionality
 * is implemented by invoking the REST API through AJAX
 * 
 * @author Sandip Ghosh (sandip.ghosh@resilient-networks.com)
 */
Petstore = {
	items : null,
	rowsPerPage : 5,
	pageIndex : 0,
	contextPath : null,
	
	getItems : function() {
		var self = this;
		$.getJSON(this.contextPath + "/REST/item/list", function(data) {
			if (data && data.status == "success") {
				self.items = data.items;
				self.showItems(false, true);
			} 
		});
	},

	showItems : function(prev, firstTime) {
		 // setup the pageIndex
        if (!firstTime) {
        	if (prev) {
        		this.pageIndex -= this.rowsPerPage;
            } else {
            	this.pageIndex += this.rowsPerPage;       
            }
        }
        if (this.pageIndex < 0 || this.pageIndex > this.items.length) {
            return;
        }
        var startIdx = this.pageIndex;
        var endIdx = (this.pageIndex + this.rowsPerPage <= this.items.length) ? this.pageIndex + this.rowsPerPage : this.items.length;
        $("#itemsBody").empty();
        var itemsHtml = "";
        for (var row = startIdx; row < endIdx; row++) {
        	var item = this.items[row];
        	itemsHtml += (row % 2 ? "<tr style='background-color: #ebf2fe;' id='" : "<tr style='background-color: #ffffff' id='") + item.id + "'>";
        	itemsHtml += "<td class='col-xs-3'><a href='" + this.contextPath + "/details.jsp?id=" + item.id + "'><img src='" + this.contextPath + "/images/" + item.thumbnail + "'/></a></td>";
        	
        	itemsHtml += "<td class='col-xs-3'>" + item.name + "</td>";
        	itemsHtml += "<td class='col-xs-1'>$" + item.price + "</td>";
        	itemsHtml += "<td class='col-xs-3'>" + (item.sold ? "<img src='" + this.contextPath + "/images/sold.jpg'/>" : "<button class='btn btn-primary addToCart'>Add to Cart</button>") + "</td>";
        	itemsHtml += "</tr>"
        }
        $("#itemsBody").append(itemsHtml);
        $("#prevBtn").prop("disabled", startIdx == 0);
        $("#nextBtn").prop("disabled", endIdx == this.items.length);
        
        setTimeout(function() {
        	$(".addToCart").on("click", function(e) {
        		var parentRow = $(this).parent().parent();
        		Petstore.addToCart($(parentRow).attr("id"));
        		e.preventDefault();
        	});
        }, 10);

	},
	
	getDetails : function(id) {
		var self = this;
		$.getJSON(this.contextPath + "/REST/item/details/" + id, function(data) {
			if (data && data.status == "success") {
				$("#itemName").empty();
				$("#itemName").text(data.item.name);
				$("#itemDescription").empty();
				$("#itemDescription").text(data.item.description);
				$("#itemImage").attr("src", self.contextPath + '/images/' + data.item.image);
				$("#itemPrice").empty();
				$("#itemPrice").text("$ " + data.item.price);
				$("#addToCartBtn").prop("disabled", data.item.sold)
			} 
		});
	},
	
	getCart : function() {
		var self = this;
		$.getJSON(this.contextPath + "/REST/cart/items", function(data) {
			if (data && data.status === "success") {
		        $("#itemsBody").empty();
		        var itemsHtml = "";
		        var total = 0;
		        if (data.items.length) {
			        for (var row = 0; row < data.items.length; row++) {
			        	var item = data.items[row];
			        	itemsHtml += (row % 2 ? "<tr style='background-color: #ebf2fe;' id='" : "<tr style='background-color: #ffffff' id='") + item.id + "'>";
			        	itemsHtml += "<td class='col-xs-3'><a href='" + self.contextPath + "/details.jsp?id=" + item.id + "'><img src='" + self.contextPath + "/images/" + item.thumbnail + "'/></a></td>";
			        	itemsHtml += "<td class='col-xs-3'>" + item.name + "</td>";
			        	itemsHtml += "<td class='col-xs-1'>$" + item.price + "</td>";
			        	itemsHtml += "<td class='col-xs-3'><button class='btn btn-primary removeFromCart'>Remove from Cart</button></td>";
			        	itemsHtml += "</tr>"
			        	total += item.price;
			        }
			        itemsHtml += "<tr style='background-color: #d9edf7'><td></td><td></td><td></td><td style='font-weight:bold'>Subtotal (" + data.items.length + ") items: <span class='cartSubtotal'>$ " + total + "</span></td></tr>";
			        $("#itemsBody").append(itemsHtml);
					$("#itemsTable").show();
					$("#cartNotif").hide();
					$("#checkoutBtn").prop("disabled", false);
					$("#cartTotal").empty();
					var totalLine = "Subtotal (" + data.items.length + "):<span class='cartSubtotal'> $" + total + "</span>"; 
					$("#cartTotal").append(totalLine);
					$("#cartTotal").show();
					
					setTimeout(function() {
						$(".removeFromCart").on("click", function(e) {
							var parentRow = $(this).parent().parent();
							Petstore.removeFromCart($(parentRow).attr("id"));
							e.preventDefault();
						});
					}, 10);
		        } else {
					self.showNotification("error", "#cartNotif", "The shopping cart is empty");
					$("#itemsTable").hide();
					$("#cartNotif").show();
					$("#checkoutBtn").prop("disabled", true);
		        }
			} else if (data.status === "error") {
				self.showNotification("error", "#cartNotif", data.message);
				$("#itemsTable").hide();
				$("#cartNotif").show();
				$("#checkoutBtn").prop("disabled", true);
			}
		});	
	},
	
	addToCart : function(id) {
		$.ajax({
			type: "PUT",
			url: this.contextPath + "/REST/cart/add/" + id,
			contentType: "application/json; charset=utf-8",
			timeout: 12000,
			dataType: "json",
			success:
				function(data) {
					if (data && data.status === "success") {
						// update the count in the Cart button
						$("#cartLink").empty();
						$("#cartLink").text("Cart (" + data.cartCount + ")");
					}
					// TODO error handling
				}
		});
	},
	
	removeFromCart : function(id) {
		$.ajax({
			type: "PUT",
			url: this.contextPath + "/REST/cart/remove/" + id,
			contentType: "application/json; charset=utf-8",
			timeout: 12000,
			dataType: "json",
			success:
				function(data) {
					if (data && data.status === "success") {
						// update the count in the Cart button
						$("#cartLink").empty();
						$("#cartLink").text("Cart (" + data.cartCount + ")");
						// reload the page
						location.reload();
					}
					// TODO error handling
				}
		});
		
	},
	
	updateCartCount : function() {
		var self = this;
		$.getJSON(this.contextPath + "/REST/cart/count", function(data) {
			if (data && data.status === "success") {
				$("#cartLink").empty();
				$("#cartLink").text("Cart (" + data.cartCount + ")");
			}
		});
	},
	
	showNotification : function(type, id, message) {
		$(id).addClass(type);
		$(id).empty();
		var notifContents = "";
		if (type === "success") {
			notifContents += "<i class='fa fa-check-square fa-lg'></i>&nbsp;&nbsp;"
		} else if (type === "error") {
			notifContents += "<i class='fa fa-times-circle fa-lg'></i>&nbsp;&nbsp;"
		}
		notifContents += message;
		$(id).append(notifContents);
	},
	
	commitSale : function(cartItemIds) {
		$.ajax({
			type: "PUT",
			url: this.contextPath + "/REST/item/sold?ids=" + cartItemIds,
			contentType: "application/json; charset=utf-8",
			timeout: 12000,
			dataType: "json",
			success:
				function(data) {
					if (data && data.status === "success") {
						$("#purchaseNotif").show();
					}
				}
			});
	},
	
	createUser: function() {
		var postData = {
			emailAddress: $("#signUpEmail").val(),
			password: hex_md5($("#password").val()),
			firstName: $("#firstName").val(),
			lastName: $("#lastName").val(),
			mobileNumber: $("#phone").val()
		}
		var postDataStr = JSON.stringify(postData, null);
		var self = this;
		$.ajax({
			type: "POST",
			url: this.contextPath + "/REST/user/register",
			contentType: "application/json; charset=utf-8",
			data: postDataStr,
			dataType: "json",
			processData: false,
			success: 
    			function(data) {
					if (data) {
						if (data.status === "success") {
							// user creation successful, redirect to activation page
							var paramsObj = {
								email: $("#signUpEmail").val()	
							}
							var params = encodeURIComponent(JSON.stringify(paramsObj, null));
							var name = encodeURIComponent($("#firstName").val() + " " + $("#lastName").val());
							location.href = self.contextPath + "/activate.jsp?parameters=" + params + "&name=" + name + "&userId=" + data.userID; 
						} else if (data.status === "error") {
							self.showNotification("error", "#errorNotif", data.message);
						}
					}
				}
		});
	}
}

$(document).ready(function() {
	
	Petstore.contextPath = $("#contextPath").val();
	// strip out contextPath from URL path
	var currPage = location.pathname.substring(Petstore.contextPath.length, location.pathname.length)
	if (currPage === '' || currPage === '/' || currPage.indexOf("/index.jsp") != -1) {
		Petstore.getItems();
	} else if (currPage.indexOf("details.jsp") != -1) {
		var qString = location.search.substring(1);
		var id = qString.split("=")[1];
		Petstore.getDetails(id);
	} else if (currPage.indexOf("cart.jsp") != -1) {
		Petstore.getCart();
	} else if (currPage.indexOf("confirm.jsp") != -1) {
		$("#cartPanel").hide();
	}
	if (currPage.indexOf("confirm.jsp") == -1) {
		Petstore.updateCartCount();
	}
	
	$("#nextBtn").click(function(event) {
        Petstore.showItems(false, false);
        event.preventDefault();
	});

	$("#prevBtn").click(function(event) {
        Petstore.showItems(true, false);
        event.preventDefault();
	});	
	
	$("#backBtn").click(function(event) {
        location.href = Petstore.contextPath;
        event.preventDefault();
	});
	
	$("#addToCartBtn").click(function(event) {
		var itemID = $("#itemID").val();
		Petstore.addToCart(itemID);
		event.preventDefault();
	});
	
	$("#checkoutBtn").click(function(event) {
        location.href = Petstore.contextPath + "/checkout.jsp";
        event.preventDefault();
	});
	
	$("#confirmBtn").click(function(event) {
		var formErrors = document.querySelectorAll(':invalid');
		if (formErrors.length) {
			Petstore.showNotification("error", "#errorNotif", "Please enter values for all the required fields.");
			event.preventDefault();
		} else {
			//var qString = "?name=" + $("#name").val() + "&streetAddress=" + $("#street").val() + "&city=" + $("#city").val() + "&state=" + $("#state").val() + "&zip=" + $("#zipCode").val();
			var paramsObj = {
				name: $("#name").val(),
				streetAddress: $("#street").val(),
				city: $("#city").val(),
				state: $("#state").val(),
				zip: $("#zipCode").val()
			}
			var params = encodeURIComponent(JSON.stringify(paramsObj, null));
			location.href = Petstore.contextPath +"/confirm.jsp?parameters=" + params; 
		}
	});
	
	$("#signIn").click(function(event) {
		$("#signInPanel").show();
		$("#signUpPanel").hide();
		if ($("#signUp").hasClass("btn-primary")) {
			$("#signUp").removeClass("btn-primary");
		}
		if (!$("#signIn").hasClass("btn-primary")) {
			$("#signIn").addClass("btn-primary");
		}
		$("#errorNotif").removeClass("error");
		$("#errorNotif").empty();
		event.preventDefault();
	});
	
	$("#signUp").click(function(event) {
		$("#signInPanel").hide();
		$("#signUpPanel").show();
		if ($("#signIn").hasClass("btn-primary")) {
			$("#signIn").removeClass("btn-primary");
		}
		if (!$("#signUp").hasClass("btn-primary")) {
			$("#signUp").addClass("btn-primary");
		}
		$("#errorNotif").removeClass("error");
		$("#errorNotif").empty();
		event.preventDefault();
	});
	
	$("#beginSignIn").click(function(event) {
		var formErrors = document.querySelectorAll('#signInPanel :invalid');
		if (formErrors.length) {
			Petstore.showNotification("error", "#errorNotif", "Please enter a valid email address");
			event.preventDefault();
		} else {
			var paramsObj = {
				userid: 	$("#signInEmail").val()
			}
			var params = encodeURIComponent(JSON.stringify(paramsObj, null));
			location.href = Petstore.contextPath + "/rns/login.jsp?parameters=" + params;
		}					
	});
	
	$("#register").click(function(event) {
		var formErrors = document.querySelectorAll('#signUpPanel :invalid');
		if (formErrors.length) {
			Petstore.showNotification("error", "#errorNotif", "Please enter all the required fields for creating your account");
		} else {
			if ($("#password").val() !== $("#passwordConfirm").val()) {
				Petstore.showNotification("error", "#errorNotif", "The password and the confirm password did not match");
			} else {
				Petstore.createUser();
			}
		}
		event.preventDefault();
	});
	
});