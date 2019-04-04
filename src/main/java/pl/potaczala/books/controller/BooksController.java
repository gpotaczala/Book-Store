package pl.potaczala.books.controller;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index1() {
		return "indexView";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index2() {
		return "indexView";
	}	

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
	public ModelAndView appendBook(@Valid Book book, BindingResult result) {
		ModelAndView mv;	
		if (!result.hasErrors()) {
			books.save(book);
			mv = new ModelAndView("redirect:/list");
			mv.addObject("books", books.findAll());
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
