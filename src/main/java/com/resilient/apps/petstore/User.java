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

/**
 * Objects of this class represent user records
 * 
 * @author Sandip Ghosh (sandip.ghosh@resilient-networks.com)
 *
 */
public class User {
	private int id;
	private String firstName;
	private String lastName;
	private String emailAddress;
	private String mobileNumber;
	private String password;
	private boolean activated;
	
	public int getId() {
		return id;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public void setFirstName(String fname) {
		this.firstName = fname;
	}

	public String getLastName() {
		return lastName;
	}
	
	public void setLastName(String lname) {
		this.lastName = lname;
	}

	public String getEmailAddress() {
		return emailAddress;
	}
	
	public void setEmailAddress(String email) {
		this.emailAddress = email;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}
	
	public void setMobileNumber(String mobile) {
		this.mobileNumber = mobile;
	}

	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	public boolean getActivated() {
		return activated;
	}
	
	public void setActivated(boolean activated) {
		this.activated = activated;
	}
	
	
}
