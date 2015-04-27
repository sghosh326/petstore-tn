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
import java.io.FileOutputStream;
import java.io.FileReader;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.PropertyConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * This class initializes the Database if not initialized and configures the Logger
 *
 *	@author Sandip Ghosh (sandip.ghosh@resilient-networks.com)
 *
 */
public class AppContextListener implements ServletContextListener {

	// The application expects the configuration file to be located in the user's home directory
	private static final String APP_CONFIG_FILE = "petstore-tn-config.properties";
	private static String ROOT_PATH = null;
	
	private static final Logger LOG = LoggerFactory.getLogger(AppContextListener.class);
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {

	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ROOT_PATH = sce.getServletContext().getRealPath("");
		try {
	        String homePath = System.getenv("HOME");
	        String appConfigFilePath = homePath + File.separator + APP_CONFIG_FILE;
	        Properties configProps = new Properties();
	        configProps.load(new FileReader(appConfigFilePath));
	        // initialize log4j properties from config file
			PropertyConfigurator.configure(configProps);
			LOG.info("Initializing Application Context");
			String dbUser = configProps.getProperty("dbUsername");
	        String dbPassword = configProps.getProperty("dbPassword");
	        String dbConnectionURL = configProps.getProperty("dbConnectionURL");
        	MySQLDataSource appDB = new MySQLDataSource(dbUser, dbPassword, dbConnectionURL);
	        boolean dbInitialized = Boolean.valueOf(configProps.getProperty("dbInitialized"));
	        if (!dbInitialized) {
	        	LOG.info("Initializing the petstore database");
	        	appDB.initDatabase();
	        	LOG.info("Successfully initialized the petstore database");
	        	configProps.setProperty("dbInitialized", "true");
				File propFile = new File(appConfigFilePath);
				FileOutputStream propOutStream = new FileOutputStream(propFile);;
				configProps.store(propOutStream, "");
				propOutStream.flush();
				propOutStream.close();
	        }
	        sce.getServletContext().setAttribute("dataSource", appDB);
		} catch (Exception ex) {
			LOG.error("Application initialization failed. Reason: " + ex.getLocalizedMessage());
			throw new AppInitException("Application initialization failed. Reason: " + ex.getLocalizedMessage());
		}
	}
	
    public static String getRootPath() {
        return ROOT_PATH;
    }

}
