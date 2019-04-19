package pl.potaczala.bookstore.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import pl.potaczala.bookstore.entity.Author;

@Component
public class AuthorFormValidator implements Validator {

	public boolean supports(Class<?> cl) {
		return Author.class.equals(cl);
	}

	public void validate(Object target, Errors errors) {

		Author author = (Author) target;

		if (author.getSurname() == null || author.getSurname() == "") {
			errors.rejectValue("surname", "NotEmpty.author.surname");
		} else if (author.getSurname().length() <= 2) {
			errors.rejectValue("surname", "Size.author.surname");
		}

		if (author.getName() == null || author.getName() == "") {
			errors.rejectValue("name", "NotEmpty.author.name");
		} else if (author.getName().length() <= 2)
			errors.rejectValue("name", "Size.author.name");
	}
}