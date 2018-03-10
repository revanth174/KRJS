package com.reddy.krjs.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.DocumentException;
import com.reddy.krjs.supportEnd.Model.Member;
import com.reddy.krjs.supportEnd.service.MemberService;

import extra.PdfOpener;
import pdf.IdCard;


@Controller
public class ReportControllers {
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value= {"/report"})
	public ModelAndView index() {
		System.out.println("welcome to reportcontroller->report()");
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","report");
		mv.addObject("userclickreport",true);
		return mv;
	}

	
	@RequestMapping(value= {"/report/idcard"})
	public ModelAndView id(@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "name", required = false) String name,HttpServletRequest request) throws DocumentException, IOException {
		
		System.out.println("welcome to reportcontroller->id()");
		List<Member> list;
		
		if(category!=null && category.equals("districk")) {
			list = service.getByDistrict(name);
			if(!list.isEmpty()) {
				IdCard.memberPrint(list,"voter",request.getSession().getServletContext().getRealPath("assets"));
				new PdfOpener().openPdf("voter",request.getSession().getServletContext().getRealPath("assets"));
			}
		}
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","Idcard");
		mv.addObject("userclickid",true);
		
		String realPath  = request.getServletContext().getRealPath("/webapp");
		System.out.println(realPath);
		String Path = request.getContextPath();
		System.out.println(Path);
		
		return mv;
	}

}
