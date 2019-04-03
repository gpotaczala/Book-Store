package pl.potaczala.books.controller;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pl.potaczala.books.entity.Author;
import pl.potaczala.books.repository.AuthorRep;

@Controller
public class AuthorController {

	@Autowired
	AuthorRep authorRep;
	
	@RequestMapping("/authors")
	public ModelAndView authorList() {
		ModelAndView mv = new ModelAndView("authorListView");
		mv.addObject("authors", authorRep.findAll());
		return mv;
	}	
	
	@RequestMapping(value = "/author-append", method = RequestMethod.GET)
	public ModelAndView appendAuthorForm() {
		ModelAndView mv = new ModelAndView("authorAppendView");
		mv.addObject("author", new Author());
		return mv;
	}	
	

	@RequestMapping(value = "/author-append", method = RequestMethod.POST)
	public ModelAndView appendAuthor(Author author) {
		authorRep.save(author);
		ModelAndView mv = new ModelAndView("redirect:/authors"); 
		mv.addObject("authors", authorRep.findAll());
		return mv;
	}	
	
	@RequestMapping("/author-{id}")
	public ModelAndView authorDetails(@PathVariable("id") Long id) {
		Optional<Author> authorOpt = authorRep.findById(id);		
		if (!authorOpt.isPresent()) {}
		ModelAndView mv = new ModelAndView("authorDetailsView");
		mv.addObject("author", authorOpt.get());
		mv.addObject("books", authorOpt.get().getAuthorBooks());
		return mv;
	}	
}
