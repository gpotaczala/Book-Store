package pl.potaczala.books.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pl.potaczala.books.entity.Book;
import pl.potaczala.books.repository.AuthorRep;
import pl.potaczala.books.repository.BookRep;

@Controller
public class BooksController {

	@Autowired
	BookRep books;
	
	@Autowired
	AuthorRep authors;	

	@RequestMapping("/list")
	public ModelAndView bookList() {
		ModelAndView mv = new ModelAndView("booksListView");
		mv.addObject("books", books.findAll());
		return mv;
	}

	@RequestMapping(value = "/append", method = RequestMethod.GET)
	public ModelAndView appendBookForm() {
		ModelAndView mv = new ModelAndView("bookAppendView");
		mv.addObject("book", new Book());
		mv.addObject("authors", authors.findAll());
		return mv;
	}

	@RequestMapping(value = "/append", method = RequestMethod.POST)
	public ModelAndView appendBook(Book book) {
		books.save(book);
		ModelAndView mv = new ModelAndView("redirect:/list");
		mv.addObject("books", books.findAll());
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
