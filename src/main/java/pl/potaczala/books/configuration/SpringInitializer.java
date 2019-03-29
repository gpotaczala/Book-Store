package pl.potaczala.books.configuration;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class SpringInitializer extends AbstractAnnotationConfigDispatcherServletInitializer  { 
	
	@Override 
	protected Class<?>[] getRootConfigClasses() { 
		return new Class[] {ApplicationConfig.class}; //na przyszłość - na razie ApplicatnionConfig
	} 
	
	@Override 
	protected Class<?>[] getServletConfigClasses() { 
		return new Class[] {ApplicationConfig.class}; 
	} 
	
	@Override 
	protected String[] getServletMappings() { 
		return new String[]{"/"}; 
	} 
}