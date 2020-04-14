package com.mgsoft;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.mgsoft.filters.SessionFilter;

@Configuration
public class AppConfig {

	@Bean
	public FilterRegistrationBean<SessionFilter> filterRegistrationBean() {
		FilterRegistrationBean<SessionFilter> registrationBean = new FilterRegistrationBean<>();
		SessionFilter sessionFilter = new SessionFilter();
		registrationBean.setFilter(sessionFilter);
		registrationBean.setOrder(1); // set precedence
		return registrationBean;
	}

}
