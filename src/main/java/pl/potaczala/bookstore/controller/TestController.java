package pl.potaczala.bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TestController {

	@RequestMapping("/glowny")
	public String testController1(@RequestParam(value = "a", required = false, defaultValue = "") String paramA,
			@RequestParam(value = "b", required = false, defaultValue = "") String paramB, Model model) {
		
		StringBuilder tresc = new StringBuilder();
		if (!paramA.isEmpty()) {
			tresc.append(paramA);
		}

		if (!paramB.isEmpty()) {
			tresc.append(paramB);
		}

		model.addAttribute("powitanie", tresc.toString() + "Witam wszystkich Pañstwa!");
		return "glowny";
	}

	@RequestMapping("/glowny/{powitanie}")
	public String testController2(@PathVariable(value = "powitanie") String powitanie, Model model) {
		model.addAttribute("powitanie", "Witam WAS " + powitanie + " !");
		return "glowny";
	}

}
