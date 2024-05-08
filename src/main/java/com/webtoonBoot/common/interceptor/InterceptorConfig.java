package com.webtoonBoot.common.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	
	@Autowired
	ViewNameInterceptor interceptor;
	
	@Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor((HandlerInterceptor) interceptor)
                .addPathPatterns("/*.do")
                .addPathPatterns("/*/*.do")
                .addPathPatterns("/*/*/*.do");
    }
	
}
