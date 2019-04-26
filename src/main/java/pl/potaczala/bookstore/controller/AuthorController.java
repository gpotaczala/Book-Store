package pl.potaczala.bookstore.controller;

import java.sql.SQLException;

import javax.persistence.PersistenceException;

import org.hibernate.exception.ConstraintViolationException;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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

import pl.potaczala.bookstore.entity.Author;
import pl.potaczala.bookstore.service.AuthorService;
import pl.potaczala.bookstore.validator.AuthorFormValidator;

@Controller
public class AuthorController {

	@Autowired
	private AuthorService authorService;

	@Autowired
	AuthorFormValidator authorFormValidator;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(authorFormValidator);
	}

	// Lista
	@RequestMapping(value = "/authors", method = RequestMethod.GET)
	public ModelAndView authorList() {
		ModelAndView mv = new ModelAndView("authorsList");
		mv.addObject("authors", authorService.findAll());
		return mv;
	}

	// Wprwoadzenie nowego lub aktualizacja
	@RequestMapping(value = "/authors", method = RequestMethod.POST)
	public ModelAndView addOrUpdateAuthor(@ModelAttribute("authorForm") @Validated Author author, BindingResult result,
			final RedirectAttributes redirectAttributes) {
		ModelAndView mv;
		if (!result.hasErrors()) {
			boolean isNew = author.isNew();
			try {
				authorService.saveOrUpdate(author);

				redirectAttributes.addFlashAttribute("alertType", "success");
				redirectAttributes.addFlashAttribute("msgHead", "Sukces!");
				if (isNew) {
					redirectAttributes.addFlashAttribute("msg", "Pomyœlnie wprowadzono autora!");
				} else {
					redirectAttributes.addFlashAttribute("msg", "Pomyœlnie zaktualizowano dane autora!");
				}
				mv = new ModelAndView("redirect:/authors/" + author.getId());

			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("alertType", "warning");
				redirectAttributes.addFlashAttribute("msgHead", "B³¹d!");
				if (isNew) {
					redirectAttributes.addFlashAttribute("msg", "Wyst¹pi³ b³¹d podczas wprowadzania autora!");
				} else {
					redirectAttributes.addFlashAttribute("msg", "Wyst¹pi³ b³¹d podczas aktualizacji danych autora!");
				}

				mv = new ModelAndView("redirect:/authors");
			}

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

		if (!authorService.findById(id).getAuthorBooks().isEmpty()) {
			redirectAttributes.addFlashAttribute("alertType", "warning");
			redirectAttributes.addFlashAttribute("msgHead", "Uwaga!");
			redirectAttributes.addFlashAttribute("msg", "Nie mo¿na usun¹æ autora, poniewa¿ w serwisie istniej¹ powi¹zane z nim ksi¹¿ki!");			
		} else {

			try {
				authorService.delete(id);
				redirectAttributes.addFlashAttribute("alertType", "success");
				redirectAttributes.addFlashAttribute("msgHead", "Sukces!");
				redirectAttributes.addFlashAttribute("msg", "Pomyœlnie usuniêto autora!");
			} catch (DataAccessException ce) {
				redirectAttributes.addFlashAttribute("alertType", "danger");
				redirectAttributes.addFlashAttribute("msgHead", "B³¹d!");
				redirectAttributes.addFlashAttribute("msg",
						"Podczas próby usuniêcia autora wyst¹pi³ b³¹d: " + ce.getMessage());
			}
		}

		ModelAndView mv = new ModelAndView("redirect:/authors");
		return mv;
	}

	// Prezentacja danych
	@RequestMapping(value = "/authors/{id}", method = RequestMethod.GET)
	public ModelAndView authorDetails(@PathVariable("id") Long id) {
		Author author = authorService.findById(id);
		if (author == null) {
		}
		ModelAndView mv = new ModelAndView("authorDetails");
		mv.addObject("authorForm", author);
		mv.addObject("booksForm", author.getAuthorBooks());
		return mv;
	}
}
