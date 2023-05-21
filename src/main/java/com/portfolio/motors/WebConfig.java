package com.portfolio.motors;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.portfolio.motors.interceptors.LogInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    InterceptorRegistration ir = registry.addInterceptor(new LogInterceptor());

    ir.excludePathPatterns();
  }
  
}
