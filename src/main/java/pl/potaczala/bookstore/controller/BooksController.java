package pl.potaczala.bookstore.controller;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pl.potaczala.bookstore.entity.Book;
import pl.potaczala.bookstore.repository.AuthorRep;
import pl.potaczala.bookstore.repository.BookRep;

@Controller
public class BooksController {

	@Autowired
	BookRep books;
	
	@Autowired
	AuthorRep authors;	

	@RequestMapping("/books")
	public ModelAndView bookList() {
		ModelAndView mv = new ModelAndView("booksListView");
		mv.addObject("books", books.findByOrderByTitleAsc());
		return mv;
	}

	@RequestMapping(value = "/book-append", method = RequestMethod.GET)
	public ModelAndView appendBookForm() {
		ModelAndView mv = new ModelAndView("bookAppendView");
		mv.addObject("book", new Book());
		mv.addObject("authors", authors.findByOrderBySurnameAsc());
		return mv;
	}

	@RequestMapping(value = "/book-append", method = RequestMethod.POST)
	public ModelAndView appendBook(@Valid Book book, BindingResult result) {
		ModelAndView mv;	
		if (!result.hasErrors()) {
			books.save(book);
			mv = new ModelAndView("redirect:/books");
		} else {
			mv = new ModelAndView("bookAppendView");
		}
		return mv;
	}

	@RequestMapping("/book-{id}")
	public ModelAndView bookDetails(@PathVariable("id") Long id) {
		Optional<Book> book = books.findById(id);		
		if (!book.isPresent()) {}
		ModelAndView mv = new ModelAndView("bookDetailsView");
		mv.addObject("book", book.get());
		return mv;
	}
}
