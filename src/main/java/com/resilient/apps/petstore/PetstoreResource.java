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

package com.resilient.apps.petstore;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * The REST interface for the application. All application functionality is 
 * through the API exposed by this REST interface
 * 
 * @author Sandip Ghosh (sandip.ghosh@resilient-networks.com)
 *
 */
@Path("/")
public class PetstoreResource {

	private static final Logger LOG = LoggerFactory.getLogger(PetstoreResource.class);
	
	@GET
	@Path("/item/list")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAllPets(@Context ServletContext context) {
		LOG.info("Retrieving all the pets in the database");
		JSONObject respJSON = new JSONObject();
		ObjectMapper mapper = new ObjectMapper();
		try {
			MySQLDataSource dataSource = (MySQLDataSource)context.getAttribute("dataSource");
			List<Item> items = dataSource.getItems();
			JSONArray itemsJSON = new JSONArray();
			for (Item item: items) {
				JSONObject itemJSON = new JSONObject(mapper.writeValueAsString(item));
				itemsJSON.put(itemJSON);
			}
			respJSON.put("status", "success");
			respJSON.put("items", itemsJSON);
			return Response.status(200).entity(respJSON.toString()).build();
		} catch (Exception ex) {
			return errorResponse("Exception occurred retrieving the pets from the database. Reason: " + ex.getLocalizedMessage());
		}
	}

	@GET
	@Path("/item/details/{itemID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getDecision(@PathParam("itemID") int itemID, @Context ServletContext context) {
		JSONObject petJSON = new JSONObject();
		ObjectMapper mapper = new ObjectMapper();
		LOG.info("Getting details for item with ID: " + itemID);
		try {
			MySQLDataSource dataSource = (MySQLDataSource)context.getAttribute("dataSource");
			Item item = dataSource.getItem(itemID);
			if (item == null) {
				return errorResponse("Item with the ID " + itemID + " not found in database");
			} else {
				JSONObject itemJSON = new JSONObject(mapper.writeValueAsString(item));
				petJSON.put("status", "success");
				petJSON.put("item", itemJSON);
			}	
			return Response.status(200).entity(petJSON.toString()).build();
		} catch (Exception ex) {
			return errorResponse("Exception occurred retrieving the pet with the specified ID from the database. Reason: " + ex.getLocalizedMessage());
		}
	}

	@PUT
	@Path("/item/sold")
	@Produces(MediaType.APPLICATION_JSON)
	public Response markSold(@Context HttpServletRequest req, @Context ServletContext context) {
		String itemIDs = req.getParameter("ids");
		if (itemIDs == null) {
			return errorResponse("The required parameter 'ids' is not present");
		}
		JSONObject statusJSON = new JSONObject();
		LOG.info("Marking the items with IDs: " + itemIDs + " as sold");
		try {
			MySQLDataSource dataSource = (MySQLDataSource)context.getAttribute("dataSource");
			if (dataSource.markAsSold(itemIDs)) {
				req.getSession().removeAttribute("cart");
				statusJSON.put("status", "success");
				return Response.status(200).entity(statusJSON.toString()).build();
			} else {
				return errorResponse("Failed to mark the pets with the specified IDs as sold");
			}
		} catch (Exception ex) {
			return errorResponse("Exception occurred marking the pet with the specified ID as sold. Reason: " + ex.getLocalizedMessage());
		}	
	}
	
	
	@POST
	@Path("/user/register")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response registerUser(@Context HttpServletRequest req, @Context ServletContext context, byte[] input) {
		try {
			JSONObject postData = new JSONObject(new String(input));
			String emailAddress = postData.getString("emailAddress");
			MySQLDataSource dataSource = (MySQLDataSource)context.getAttribute("dataSource");
			LOG.info("Checking if the user exists in the database");
			if (dataSource.userExists(emailAddress)) {
				return errorResponse("User exists in the database");
			}
			ObjectMapper mapper = new ObjectMapper();
			LOG.info("Registering the user in the database");
			User user = mapper.readValue(postData.toString(), User.class);
			long userID = dataSource.registerUser(user); 
			if (userID != -1L) {
				JSONObject statusJSON = new JSONObject();
				statusJSON.put("status", "success");
				statusJSON.put("userID", userID);
				return Response.status(200).entity(statusJSON.toString()).build();
			} else {
				return errorResponse("Failed to register the user in the database");
			}
		} catch (Exception ex) {
			return errorResponse("Exception occurred while attempting to register user. Reason: " + ex.getLocalizedMessage());
		}	
	}
	
	@PUT
	@Path("/user/activate/{userID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response activateUser(@PathParam("userID") int userID, @Context HttpServletRequest req, @Context ServletContext context) {
		JSONObject statusJSON = new JSONObject();
		try {
			MySQLDataSource dataSource = (MySQLDataSource)context.getAttribute("dataSource");
			LOG.info("Activating the user with ID: " + userID);
			if (dataSource.activateUser(userID)) {
				statusJSON.put("status", "success");
				return Response.status(200).entity(statusJSON.toString()).build();
			} else {
				return errorResponse("Failed to activate user with ID " + userID);
			}
		} catch (Exception ex) {
			return errorResponse("Exception occurred attempting to active the user with ID: " + userID + " Reason: " + ex.getLocalizedMessage());
		}
	}

	@PUT
	@Path("/cart/add/{itemID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response addToCart(@PathParam("itemID") int itemID, @Context HttpServletRequest req) {
		try {
			LOG.info("Adding the item with ID: " + itemID + " to the shopping cart");
			List<Integer> cartItems = null;
			if (req.getSession().getAttribute("cart") != null && req.getSession().getAttribute("cart") instanceof List) {
				cartItems = (List<Integer>)req.getSession().getAttribute("cart");
			} else {
				cartItems = new ArrayList<Integer>();
				req.getSession().setAttribute("cart", cartItems);
			}
			cartItems.add(itemID);
			JSONObject statusJSON = new JSONObject();
			statusJSON.put("status", "success");
			statusJSON.put("cartCount", cartItems.size());
			return Response.status(200).entity(statusJSON.toString()).build();
		} catch (Exception ex) {
			return errorResponse("Exception occurred adding the item with ID: " + itemID + " Reason: " + ex.getLocalizedMessage());
		}
	}
	
	@PUT
	@Path("/cart/remove/{itemID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response removeFromCart(@PathParam("itemID") int itemID, @Context HttpServletRequest req) {
		try {
			LOG.info("Removing the item with ID: " + itemID + " from the shopping cart");
			List<Integer> cartItems = null;
			if (req.getSession().getAttribute("cart") != null && req.getSession().getAttribute("cart") instanceof List) {
				cartItems = (List<Integer>)req.getSession().getAttribute("cart");
			} else {
				return errorResponse("The shopping cart is empty");
			}
			if (!cartItems.contains(itemID)) {
				return errorResponse("The item with ID " + itemID + " is not in the shopping cart");
			}
			cartItems.remove(new Integer(itemID));
			JSONObject statusJSON = new JSONObject();
			statusJSON.put("status", "success");
			statusJSON.put("cartCount", cartItems.size());
			return Response.status(200).entity(statusJSON.toString()).build();
		} catch (Exception ex) {
			return errorResponse("Exception occurred attempting to remove item with ID: " + itemID + " Reason: " + ex.getLocalizedMessage());
		}
	}

	@GET
	@Path("/cart/items")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getCartItems(@Context HttpServletRequest req, @Context ServletContext context) {
		try {
			LOG.info("Getting the items in the cart");
			List<Integer> cartItems = null;
			if (req.getSession().getAttribute("cart") != null && req.getSession().getAttribute("cart") instanceof List) {
				cartItems = (List<Integer>)req.getSession().getAttribute("cart");
				ObjectMapper mapper = new ObjectMapper();
				MySQLDataSource dataSource = (MySQLDataSource)context.getAttribute("dataSource");
				List<Item> items = dataSource.getItems();
				JSONArray itemsJSON = new JSONArray();
				for (Item item: items) {
					for (int cartItemID: cartItems) {
						if (cartItemID == item.getId()) {
							JSONObject itemJSON = new JSONObject(mapper.writeValueAsString(item));
							itemsJSON.put(itemJSON);
							break;	
						}
					}
				}
				JSONObject respJSON = new JSONObject();
				respJSON.put("status", "success");
				respJSON.put("items", itemsJSON);
				return Response.status(200).entity(respJSON.toString()).build();
			} else {
				return errorResponse("The shopping cart is empty");
			}	
		} catch (Exception ex) {
			return errorResponse("Exception occurred getting the items in the cart. Reason: " + ex.getLocalizedMessage());
		}
	}

	@GET
	@Path("/cart/count")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getCartCount(@Context HttpServletRequest req) {
		try {
			LOG.info("Getting the count of items in the cart");
			int count = 0;
			String cartItemIds = "";
			if (req.getSession().getAttribute("cart") != null && req.getSession().getAttribute("cart") instanceof List) {
				List<Integer> cartItems = (List<Integer>)req.getSession().getAttribute("cart");
				count = cartItems.size();
				for (int itemId : cartItems) {
					if (!cartItemIds.isEmpty()) {
						cartItemIds += ",";
					}
					cartItemIds += itemId;
				}
			}	
			JSONObject statusJSON = new JSONObject();
			statusJSON.put("status", "success");
			statusJSON.put("cartCount", count);
			statusJSON.put("cartItemIds", cartItemIds);
			return Response.status(200).entity(statusJSON.toString()).build();
		} catch (Exception ex) {
			return errorResponse("Exception occurred getting the count of items in the cart. Reason: " + ex.getLocalizedMessage());
		}

	}
	
	private Response errorResponse(String errMsg) {
		LOG.error(errMsg);
		try {
			JSONObject errJSON = new JSONObject();
			errJSON.put("status", "error");
			errJSON.put("message", errMsg);
			return Response.status(200).entity(errJSON.toString()).build();
		} catch (JSONException jex) {
			String errMsg2 = "Exception occurred in building JSON response. Reason: " + jex.getLocalizedMessage();
			Response.ResponseBuilder jsonErrResp = Response.status(500);
			jsonErrResp.entity("{\"status\": \"error\", \"message\": \"" + errMsg2 + "\"}");
			return jsonErrResp.build();
		}
	}
}
