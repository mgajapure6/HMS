package com.mgsoft.util;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @since 18-04-2015
 * @author sathish
 * @version 1.2
 * @purpose this class is used to convert the java object into json string and
 *          json string into java object
 */
public class JsonUtil {
	// private static Logger logger = Logger.getLogger(JsonUtil.class);

	/**
	 * this method is used to convert the java object into JSON string
	 * 
	 * @param javaObject
	 * @return String
	 */
	public static <T> String convertToJson(final T javaObject) {
		String jsonStr = "{}";
		ObjectMapper mapper = new ObjectMapper();
		try {
			if (javaObject != null) {
				jsonStr = mapper.writeValueAsString(javaObject);
			}
		} catch (JsonGenerationException e) {
			System.out.println("Exception Occured while converting java object into json string ::" + e.getMessage());

		} catch (JsonMappingException e) {
			System.out.println("Exception Occured while converting java object into json string ::" + e.getMessage());

		} catch (IOException e) {
			System.out.println("Exception Occured while converting java object into json string ::" + e.getMessage());

		} catch (Throwable exception) {
			exception.printStackTrace();
		}
		return jsonStr;
	}

	public static <T> T convertToPojo(final String jsonString, final Class<T> className) {
		ObjectMapper objectMapper = new ObjectMapper();

		T response = null;

		try {
			if (jsonString != null && jsonString.trim().length() > 2) {
				// Read JSON string and convert to response object
				response = objectMapper.readValue(jsonString, className);

			}
		} catch (JsonGenerationException e) {
			System.out.println("JsonGenerationException occured while converting to POJO class--->" + e.getMessage());
		} catch (JsonMappingException e) {
			System.out.println("JsonMappingException occured while converting to POJO class--->" + e.getMessage());
		} catch (IOException e) {
			System.out.println("JsonMappingException occured while converting to POJO class--->" + e.getMessage());

		}
		return response;
	}

	/**
	 * this method is used to convert the jsonString into List<T>
	 * 
	 * @param jsonString
	 * @param target
	 * @return
	 */
	public static <T> T convertToList(final String jsonString, final Class<?> target) {
		ObjectMapper objectMapper = new ObjectMapper();
		T response = null;
		try {
			if (jsonString != null) {
				// Read JSON string and convert to response object
				response = objectMapper.readValue(jsonString, objectMapper.getTypeFactory()
						.constructCollectionType(List.class, Class.forName(target.getName())));

			}
		} catch (JsonGenerationException e) {
			System.out.println("JsonGenerationException occured while converting to POJO class--->" + e.getMessage());
		} catch (JsonMappingException e) {
			e.printStackTrace();
			System.out.println("JsonMappingException occured while converting to POJO class--->" + e.getMessage());
		} catch (IOException e) {
			System.out.println("JsonMappingException occured while converting to POJO class--->" + e.getMessage());

		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException occured while converting to POJO class--->" + e.getMessage());
		}
		return response;
	}

	/**
	 * this method is used to convert the jsonString into Set<T>
	 * 
	 * @param jsonString
	 * @param target
	 * @return
	 */
	public static <T> T convertToSet(final String jsonString, final Class<?> target) {
		ObjectMapper objectMapper = new ObjectMapper();
		T response = null;
		try {
			if (jsonString != null) {
				// Read JSON string and convert to response object
				response = objectMapper.readValue(jsonString, objectMapper.getTypeFactory()
						.constructCollectionType(Set.class, Class.forName(target.getName())));

			}
		} catch (JsonGenerationException e) {
			System.out.println("JsonGenerationException occured while converting to POJO class--->" + e.getMessage());
		} catch (JsonMappingException e) {
			e.printStackTrace();
			System.out.println("JsonMappingException occured while converting to POJO class--->" + e.getMessage());
		} catch (IOException e) {
			System.out.println("JsonMappingException occured while converting to POJO class--->" + e.getMessage());

		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException occured while converting to POJO class--->" + e.getMessage());
		}
		return response;
	}

	public static <T> String javaCollectionToJson(Collection<T> c) {
		final StringWriter sw = new StringWriter();
		try {
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(sw, c);
			sw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sw.toString();
	}
}