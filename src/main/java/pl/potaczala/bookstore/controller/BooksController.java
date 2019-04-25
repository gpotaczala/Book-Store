package pl.potaczala.bookstore.controller;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pl.potaczala.bookstore.entity.Book;
import pl.potaczala.bookstore.service.AuthorService;
import pl.potaczala.bookstore.service.BookService;
import pl.potaczala.bookstore.validator.BookFormValidator;

@Controller
public class BooksController {

	@Autowired
	BookService bookService;

	@Autowired
	AuthorService authorService;

	@Autowired
	BookFormValidator bookFormValidator;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(bookFormValidator);
	}

	// lista
	@RequestMapping(value = "/books", method = RequestMethod.GET)
	public ModelAndView bookList() {
		ModelAndView mv = new ModelAndView("booksList");
		mv.addObject("books", bookService.findAll());
		return mv;
	}
	
	// Wprwoadzenie nowego lub aktualizacja
	@RequestMapping(value = "/books" , method = RequestMethod.POST)
	public ModelAndView saveOrUpdateBook(@ModelAttribute("bookF") @Validated Book book, BindingResult result,
			final RedirectAttributes redirectAttributes) {
		ModelAndView mv;
		if (!result.hasErrors()) {
			redirectAttributes.addFlashAttribute("alertType", "success");
			redirectAttributes.addFlashAttribute("msgHead", "Sukces!");			
			if (book.isNew()) {
				redirectAttributes.addFlashAttribute("msg", "Pomyœlnie wprowadzono ksi¹¿kê!");
			} else {
				redirectAttributes.addFlashAttribute("msg", "Pomyœlnie zaktualizowano dane ksi¹¿ki!");
			}

			bookService.saveOrUpdate(book);

			mv = new ModelAndView("redirect:/books/"+ book.getId());
		} else {
			mv = new ModelAndView("bookForm");
			mv.addObject("authorsF", authorService.findAll());
		}
		return mv;
	}	
	
	// Formularz wprowadzania
	@RequestMapping(value = "/books/add", method = RequestMethod.GET)
	public ModelAndView showAddBookForm() {
		ModelAndView mv = new ModelAndView("bookForm");
		mv.addObject("bookF", new Book());
		mv.addObject("authorsF", authorService.findAll());
		return mv;
	}
	
	// Formularz aktualizacji
	@RequestMapping(value = "/books/{id}/update", method = RequestMethod.GET)
	public ModelAndView showUpdateBookForm(@PathVariable("id") Long id) {
		Book book = bookService.findById(id);	
		ModelAndView mv = new ModelAndView("bookForm");
		mv.addObject("bookF", book);
		mv.addObject("authorsF", authorService.findAll());
		return mv;
	}	
	
	// Usuwanie
	@RequestMapping(value = "/books/{id}/delete")
	public ModelAndView bookDelete(@PathVariable("id") Long id, final RedirectAttributes redirectAttributes) {
		bookService.delete(id);
		//bookService.deleteBookFromAuthorObj(id);

		redirectAttributes.addFlashAttribute("alertType", "success");
		redirectAttributes.addFlashAttribute("msgHead", "Sukces!");				
		redirectAttributes.addFlashAttribute("msg", "Pomyœlnie usuniêto ksi¹¿kê!");

		ModelAndView mv = new ModelAndView("redirect:/books");
		return mv;
	}	

	// Prezentacja danych
	@RequestMapping("/books/{id}")
	public ModelAndView bookDetails(@PathVariable("id") Long id) {
		Book book = bookService.findById(id);
		if (book == null) {
		}
		ModelAndView mv = new ModelAndView("bookDetails");
		mv.addObject("book", book);
		return mv;
	}
}
