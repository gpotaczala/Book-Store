package pl.potaczala.bookstore.controller;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pl.potaczala.bookstore.entity.Author;
import pl.potaczala.bookstore.repository.AuthorRep;
import pl.potaczala.bookstore.service.AuthorService;

@Controller
public class AuthorController {

	@Autowired
	private AuthorService authorService;

	// Lista
	@RequestMapping(value = "/authors", method = RequestMethod.GET)
	public ModelAndView authorList() {
		ModelAndView mv = new ModelAndView("authorsListView");
		mv.addObject("authors", authorService.findAll());
		return mv;
	}

	// Wprwoadzenie nowego lub aktualizacja
	@RequestMapping(value = "/authors", method = RequestMethod.POST)
	public ModelAndView addOrUpdateAuthor(@ModelAttribute("authorForm") @Valid Author author, BindingResult result,
			final RedirectAttributes redirectAttributes) {
		ModelAndView mv;
		if (!result.hasErrors()) {
			redirectAttributes.addFlashAttribute("alertType", "success");
			redirectAttributes.addFlashAttribute("msgHead", "Sukces!");			
			if (authorService.isAuthorNew(author)) {
				redirectAttributes.addFlashAttribute("msg", "Pomyœlnie wprowadzono autora!");
			} else {
				redirectAttributes.addFlashAttribute("msg", "Pomyœlnie zaktualizowano dane autora!");
			}

			authorService.addOrUpdate(author);

			mv = new ModelAndView("redirect:/authors");
		} else {
			mv = new ModelAndView("authorForm");
		}
		return mv;
	}

	// Formularz wprowadzania
	@RequestMapping(value = "/authors/add", method = RequestMethod.GET)
	public ModelAndView showAddAuthorForm() {
		ModelAndView mv = new ModelAndView("authorForm");
		mv.addObject("authorForm", new Author());
		return mv;  
	}

	// Formularz aktualizacji
	@RequestMapping(value = "/authors/{id}/update", method = RequestMethod.GET)
	public ModelAndView showUpdateAuthorForm(@PathVariable("id") Long id) {
		Author author = authorService.findById(id);
		ModelAndView mv = new ModelAndView("authorForm");
		mv.addObject("authorForm", author);
		return mv;
	}

	// Usuwanie
	@RequestMapping(value = "/authors/{id}/delete")
	public ModelAndView authorDelete(@PathVariable("id") Long id, final RedirectAttributes redirectAttributes) {
		authorService.delete(id);

		redirectAttributes.addFlashAttribute("alertType", "success");
		redirectAttributes.addFlashAttribute("msgHead", "Sukces!");				
		redirectAttributes.addFlashAttribute("msg", "Pomyœlnie usuniêto autora!");

		ModelAndView mv = new ModelAndView("redirect:/authors");
		return mv;
	}

	// Prezentacja danych
	@RequestMapping(value = "/authors/{id}", method = RequestMethod.GET)
	public ModelAndView authorDetails(@PathVariable("id") Long id) {
		Author author = authorService.findById(id);
		if (author == null) {
		}
		ModelAndView mv = new ModelAndView("authorDetailsView");
		mv.addObject("authorForm", author);
		mv.addObject("booksForm", author.getAuthorBooks());
		return mv;
	}
}
