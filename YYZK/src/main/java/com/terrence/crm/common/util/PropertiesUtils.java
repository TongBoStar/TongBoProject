package com.terrence.crm.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtils {
	public static void main(String[] args) throws IOException {
		getPropertyFileKeyValue("");
	}

	public static String getPropertyFileKeyValue(String propertyName) throws IOException {
		Properties prop = new Properties();   
		InputStream inputStream = Thread.currentThread().
		getContextClassLoader().getResourceAsStream("application.properties");
	    prop.load(inputStream);
	 	return prop.getProperty(propertyName).trim();
	}
}
