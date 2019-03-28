package pl.potaczala.books.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pl.potaczala.books.domain.Book;
import pl.potaczala.books.repository.BookRep;

@Controller
public class BooksController {

	@Autowired
	BookRep books;

	@RequestMapping("/lista")
	public ModelAndView bookList() {
		ModelAndView mv = new ModelAndView("list");
		mv.addObject("books", books.findAll());
		return mv;
	}

	@RequestMapping(value = "/dodaj", method = RequestMethod.GET)
	public ModelAndView appendBookForm() {
		ModelAndView mv = new ModelAndView("append");
		mv.addObject("book", new Book());
		return mv;
	}

	@RequestMapping(value = "/dodaj", method = RequestMethod.POST)
	public ModelAndView appendBook(Book book) {
		books.save(book);
		ModelAndView mv = new ModelAndView("list");
		mv.addObject("books", books.findAll());
		return mv;
	}

	@RequestMapping("/book-{id}")
	public ModelAndView bookDetails(@PathVariable("id") Long id) {
		Optional<Book> book = books.findById(id);		
		if (!book.isPresent()) {}
		ModelAndView mv = new ModelAndView("details");
		mv.addObject("book", book.get());
		return mv;
	}
}
