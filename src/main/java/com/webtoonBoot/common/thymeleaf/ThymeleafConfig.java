//package com.webtoonBoot.common.thymeleaf;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.context.support.ResourceBundleMessageSource;
//import org.springframework.web.servlet.ViewResolver;
//import org.springframework.web.servlet.config.annotation.EnableWebMvc;
//import org.thymeleaf.spring6.SpringTemplateEngine;
//import org.thymeleaf.spring6.templateresolver.SpringResourceTemplateResolver;
//import org.thymeleaf.spring6.view.ThymeleafViewResolver;
//import org.thymeleaf.templatemode.TemplateMode;
//
//import nz.net.ultraq.thymeleaf.layoutdialect.LayoutDialect;
//
//@Configuration
//@EnableWebMvc
//public class ThymeleafConfig {
//
//    @Bean
//    public SpringResourceTemplateResolver templateResolver() {
//        SpringResourceTemplateResolver resolver = new SpringResourceTemplateResolver();
//        resolver.setPrefix("classpath:/templates");
//        resolver.setSuffix(".html");
//        resolver.setTemplateMode(TemplateMode.HTML);
//        resolver.setCacheable(false); // Development 모드에서는 캐시 사용 안 함
//        return resolver;
//    }
//
//    @Bean
//    public SpringTemplateEngine templateEngine() {
//    	SpringTemplateEngine templateEngine = new SpringTemplateEngine();
//		templateEngine.setTemplateResolver(templateResolver());
//		templateEngine.setEnableSpringELCompiler(true); // Spring EL 사용
//		templateEngine.addDialect(layoutDialect());
//		templateEngine.setTemplateEngineMessageSource(messageSource()); // property 파일의 값(메세지)을 사용할 경우
//		// templateEngine.addDialect(new SpringSecurityDialect());
//
//		return templateEngine;
//    }
//    
//    @Bean
//	public LayoutDialect layoutDialect() {
//		return new LayoutDialect();
//	}
//    @Bean
//	public ResourceBundleMessageSource messageSource() {
//		ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
//		messageSource.setDefaultEncoding("utf-8");
//		messageSource.setBasename("messages"); // messages.properties
//		return messageSource;
//	}
//    
//
//	@Bean
//	public ViewResolver thymeleafViewResolver() {
//		ThymeleafViewResolver viewResolver = new ThymeleafViewResolver();
//		viewResolver.setTemplateEngine(templateEngine());
//		viewResolver.setCharacterEncoding("UTF-8");
//		viewResolver.setOrder(1);
//		return viewResolver;
//	}
//}
