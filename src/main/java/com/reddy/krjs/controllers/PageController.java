package com.reddy.krjs.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {
	
	
	@RequestMapping(value= {"/","home","index"})
	public ModelAndView index() {
		System.out.println("welcome to pagecontroller->index()");
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","home");
		return mv;
	}
	
	@RequestMapping("/about")
	public ModelAndView aboutUs() {
		System.out.println("welcome to pagecontroller->aboutus()");
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","About Us");
		mv.addObject("userclickabout",true);
		return mv;
	}
	
	
	@RequestMapping("/contact")
	public ModelAndView contactUs() {
		System.out.println("welcome to pagecontroller->aboutus()");
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","Contact Us");
		mv.addObject("userclickcontact",true);
		return mv;
	}

}
