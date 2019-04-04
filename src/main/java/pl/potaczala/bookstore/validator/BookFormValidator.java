package pl.potaczala.bookstore.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import pl.potaczala.bookstore.entity.Book;

@Component
public class BookFormValidator implements Validator {

	public boolean supports(Class<?> cl) {
		return Book.class.equals(cl);
	}
	
	public void validate(Object target, Errors errors) {

		Book book = (Book) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "NotEmpty.book.title");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "releaseDate", "NotEmpty.book.releaseDate");
					
		if(!(book.getTitle()==null || book.getTitle()=="") && (book.getTitle().length() <= 2) ) {
			errors.rejectValue("title", "Size.book.title");		
		}
		
		if(book.getAuthor()==null || book.getAuthor().getId()== -1) {
			errors.rejectValue("author", "NotEmpty.book.author");						
		}
	}
}
