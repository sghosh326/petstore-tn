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

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 
 * Objects of this class represent the items for sales 
 * 
 * @author Sandip Ghosh (sandip.ghosh@resilient-networks.com)
 *
 */
public class Item {
	private int id;
	private String name;
	private String description;
	private String thumbnail;
	private String image;
	private float price;
	private boolean sold;
	
	public int getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}
	
	void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}
	
	void setDescription(String desc) {
		this.description = desc;
	}
	
	public String getThumbnail() {
		return thumbnail;
	}
	
	void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	public String getImage() {
		return image;
	}
	
	void setImage(String image) {
		this.image = image;
	}
	
	public float getPrice() {
		return price;
	}
	
	void setPrice(float price) {
		this.price = price;
	}
	
	public boolean isSold() {
		return sold;
	}
	
	void setSold() {
		sold = true;
	}
	
	static Item initFromResultSet(ResultSet rs) throws SQLException {
		Item item = new Item();
		item.id = rs.getInt("id");
		item.name = rs.getString("name");
		item.description = rs.getString("description");
		item.thumbnail = rs.getString("thumbnail");
		item.image = rs.getString("image");
		item.price = rs.getFloat("price");
		item.sold = rs.getBoolean("sold");
		return item;
	}
}
