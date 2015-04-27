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

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Uses JDBC to execute the SQL operations for the application
 * 
 * @author Sandip Ghosh (sandip.ghosh@resilient-networks.com)
 *
 */
public class MySQLDataSource {
    private static final Logger LOG = LoggerFactory.getLogger(MySQLDataSource.class);
    
    private String user;
    private String password;
    private String connectionURI;
 
    MySQLDataSource(String dbUser, String password, String connectionURI) {
    	this.user = dbUser;
    	this.password = password;
    	this.connectionURI = connectionURI;
    }
    
    public void initDatabase() throws SQLException {
    	String dbName = "";
        String[] parts = connectionURI.split("/");
        for (int i = parts.length - 1; i >= 0; i--) {
        	if (!parts[i].isEmpty()) {
        		dbName = parts[i];
        		break;
        	}
        }
    	if (dbName.isEmpty()) {
    		throw new SQLException("Failed to read the database name from connection URL");
    	}	
        try {
            LOG.info("Loading jdbc driver...");
            Class.forName("com.mysql.jdbc.Driver");
            LOG.info("Driver loaded!");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Cannot find the driver in the classpath!", e);
        }
        try {
	        Connection con = DriverManager.getConnection(connectionURI, user, password);
	        Statement s = con.createStatement();    	
	        s.executeUpdate("use " + dbName);
	        s.close();
    	
            File sqlFile = new File(AppContextListener.getRootPath(), "WEB-INF/init.sql");
	        FileInputStream fis = new FileInputStream(sqlFile);
	
	        SQLParser sp = new SQLParser(fis);
	        List<String> stmts = sp.getStatements();
	
	        for (int i = 0; i < stmts.size(); i++) {
	
	            execSqlStatement(con, stmts.get(i));
	        }
            fis.close();

        } catch (Exception e) {
        	LOG.error("Exception occurred while initializing the database. Reason: " + e.getMessage());
            throw new SQLException(e);
        }
    }

    public List<Item> getItems() throws SQLException {
    	List<Item> items = new ArrayList<Item>();
    	try {
    		LOG.info("Retrieving the items in the database");
	    	Connection con = DriverManager.getConnection(connectionURI, user, password);
	    	String select = "select * from item";
	        PreparedStatement ps = con.prepareStatement(select);
	        ResultSet rs = ps.executeQuery();
	        while(rs.next()) {
	        	items.add(Item.initFromResultSet(rs));
	        }
	        rs.close();
    	} catch (Exception e) {
        	LOG.error("Exception occurred while retrieving the items from the database. Reason: " + e.getMessage());
            throw new SQLException(e);
    	}
    	return items;
    }
    
    public Item getItem(int id) throws SQLException {
    	Item item = null;
    	try {
    		LOG.info("Retrieving the specified item from the database");
	    	Connection con = DriverManager.getConnection(connectionURI, user, password);
	    	String select = "select * from item where id= ?";
	        PreparedStatement ps = con.prepareStatement(select);
	        ps.setObject(1, id);
	        ResultSet rs = ps.executeQuery();
			rs.first();
			item = Item.initFromResultSet(rs);
    	} catch (Exception e) {
        	LOG.error("Exception occurred while retrieving the specified item from the database. Reason: " + e.getMessage());
            throw new SQLException(e);
    	}    		
    	return item;
    }
    
    public boolean markAsSold(String itemIds) throws SQLException {
    	try {
    		LOG.info("Making the specified items in the database as sold");
    		String[] idArray = itemIds.split(",");
	    	Connection con = DriverManager.getConnection(connectionURI, user, password);
	    	String paramList = "";
	    	for (int i = 0; i < idArray.length; i++) {
	    		if (i > 0) {
	    			paramList += ",";
	    		}
	    		paramList += "?";
	    	}
	    	String select = "update item set sold=true where id in (" + paramList + ")";
	        PreparedStatement ps = con.prepareStatement(select);
	        for (int i = 0; i < idArray.length; i++) {
	        	ps.setObject(i + 1, Integer.valueOf(idArray[i]));
	        }	
	        int rowsAffected = ps.executeUpdate();
	        return rowsAffected == idArray.length;
    	} catch (Exception e) {
        	LOG.error("Exception occurred while making the specified items in the database as sold. Reason: " + e.getMessage());
            throw new SQLException(e);
    	}    		
    }

    public boolean userExists(String emailAddress) throws SQLException {
    	try {
    		LOG.info("Checking if user exists in the database");
    		Connection con = DriverManager.getConnection(connectionURI, user, password);
            String select = "select count(*) from user where email_address= ?";
            PreparedStatement ps = con.prepareStatement(select);
            ps.setObject(1, emailAddress);
            ResultSet rs = ps.executeQuery();
            int count = 0;
            while(rs.next()) {
                count = rs.getInt("COUNT(*)");                              
            }
            rs.close();
    		return count != 0;
    	} catch(Exception e) {
        	LOG.error("Exception occurred while checking if user exists in database. Reason: " + e.getMessage());
            throw new SQLException(e);
    	}
    	
    }
    
    public long registerUser(User userObj) throws SQLException {
    	try {
    		LOG.info("Registering the user in the database");
    		Connection con = DriverManager.getConnection(connectionURI, user, password);
            String insert = "insert into user (email_address, password, first_name, last_name, mobile_number) values (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
            ps.setObject(1, userObj.getEmailAddress());
            ps.setObject(2, userObj.getPassword());
            ps.setObject(3,  userObj.getFirstName());
            ps.setObject(4,  userObj.getLastName());
            ps.setObject(5, userObj.getMobileNumber());
            int rowsAffected = ps.executeUpdate();
    		if (rowsAffected != 0) {
    	       ResultSet generatedKeys = ps.getGeneratedKeys();
	            if (generatedKeys.next()) {
	            	return generatedKeys.getLong(1);
	            }
	            return 1L;
    		} else {
    			return -1L;
    		}
    	} catch(Exception e) {
        	LOG.error("Exception occurred while checking if user exists in database. Reason: " + e.getMessage());
            throw new SQLException(e);
    	}
    }
    
    public boolean activateUser(int userID) throws SQLException {
    	try {
	    	LOG.info("Activating the user with ID: " + userID);
			Connection con = DriverManager.getConnection(connectionURI, user, password);
			String update = "update user set activated=1 where id= ?";
			PreparedStatement ps = con.prepareStatement(update);
			ps.setObject(1,  userID);
            int rowsAffected = ps.executeUpdate();
    		return rowsAffected != 0;
    	} catch(Exception e) {
        	LOG.error("Exception occurred while checking if user exists in database. Reason: " + e.getMessage());
            throw new SQLException(e);
    	}
    }
    
    
    private void execSqlStatement(Connection con, String sql) throws SQLException {
        PreparedStatement st = null;
        try {
            st = con.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException se) {
            if (sql.toLowerCase().trim().startsWith("drop"))
                LOG.warn(se.getMessage());
            else if (sql.toLowerCase().trim().startsWith("create")) {
            	LOG.info(se.getMessage());
            }
            else
                throw se;
        } finally {
            if (st != null) st.close();
        }
    }
    
    
}
