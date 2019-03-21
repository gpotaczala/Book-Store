package pl.potaczala.books.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pl.potaczala.books.domain.Book;
import pl.potaczala.books.repository.BookDAO;

@Controller
public class BooksController {

	@Autowired
	BookDAO bookDao;

	@RequestMapping("/lista")
	public ModelAndView bookList() {
		ModelAndView mv = new ModelAndView("list");
		mv.addObject("books", bookDao.getBooks());		
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
		bookDao.addBook(book);
		ModelAndView mv = new ModelAndView("list");
		mv.addObject("books", bookDao.getBooks());		
		return mv;
	}

	@RequestMapping("/book-{id}")
	public ModelAndView bookDetails(@PathVariable("id") Integer id) {
		ModelAndView mv = new ModelAndView("details");
		mv.addObject("book", bookDao.getBookById(id));
		return mv;
	}
}
