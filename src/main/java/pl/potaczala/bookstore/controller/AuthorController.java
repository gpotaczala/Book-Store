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

import pl.potaczala.bookstore.entity.Author;
import pl.potaczala.bookstore.repository.AuthorRep;

@Controller
public class AuthorController {

	@Autowired
	AuthorRep authorRep;
	
	@RequestMapping("/authors")
	public ModelAndView authorList() {
		ModelAndView mv = new ModelAndView("authorsListView");
		mv.addObject("authors", authorRep.findByOrderBySurnameAsc());
		return mv;
	}	
	
	@RequestMapping(value = "/author-append", method = RequestMethod.GET)
	public ModelAndView appendAuthorForm() {
		ModelAndView mv = new ModelAndView("authorAppendView");
		mv.addObject("author", new Author());
		return mv;
	}	
	
	@RequestMapping(value = "/author-append", method = RequestMethod.POST)
	public ModelAndView appendAuthor(@Valid Author author, BindingResult result) {
		ModelAndView mv;
		if (!result.hasErrors()) {
			authorRep.save(author);
			mv = new ModelAndView("redirect:/authors"); 
		} else {
			mv = new ModelAndView("authorAppendView");
		}
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
