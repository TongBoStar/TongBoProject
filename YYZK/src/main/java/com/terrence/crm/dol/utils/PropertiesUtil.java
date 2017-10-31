package com.terrence.crm.dol.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtil {
	public static Properties  prop;
	static{
		prop = new Properties();   
		InputStream inputStream = Thread.currentThread().
			getContextClassLoader().getResourceAsStream("application.properties");
	    try {
			prop.load(inputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static String getPropertyValue(String propertyName){
		String orderPDFName = prop.getProperty(propertyName).trim();
		return orderPDFName;
	}
 	
}
