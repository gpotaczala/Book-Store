package pl.potaczala.bookstore.configuration;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
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
	
    @Override
    protected Filter[] getServletFilters() {
      CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
      characterEncodingFilter.setEncoding("UTF-8");
      return new Filter[] { characterEncodingFilter};
    }	
}