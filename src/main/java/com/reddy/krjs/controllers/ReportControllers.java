package com.reddy.krjs.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.DocumentException;
import com.reddy.krjs.supportEnd.Model.Member;
import com.reddy.krjs.supportEnd.service.MemberService;

import extra.PdfOpener;
import pdf.Report;

@Controller
public class ReportControllers {

	@Autowired
	MemberService service;

	@RequestMapping(value = { "/report" })
	public ModelAndView index() {
		System.out.println("welcome to reportcontroller->report()");
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "report");
		mv.addObject("userclickreport", true);
		return mv;
	}

	@RequestMapping(value = { "/report/voterlist" })
	public ModelAndView voterlist(@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "name", required = false) String name, HttpServletRequest request)
			throws DocumentException, IOException {
		ModelAndView mv = new ModelAndView("page");
		System.out.println("welcome to reportcontroller->id()");
		List<Member> list = null;
		if (category != null) {
			if (category.equals("district")) {
				list = service.getByDistrict(name);
				
				
			} else if (category.equals("state")) {
				list = service.getByState(name);
				
			}
		}
		if (list != null && !list.isEmpty()) {

			System.out.println("genratee");
			Report.memberPrint(list, "voter", request.getSession().getServletContext().getRealPath("assets"));
			new PdfOpener().openPdf("voter", request.getSession().getServletContext().getRealPath("assets"));
		}
		
		mv.addObject("title", "Idcard");
		mv.addObject("userclickid", true);

		String realPath = request.getServletContext().getRealPath("/webapp");
		System.out.println(realPath);
		String Path = request.getContextPath();
		System.out.println(Path);

		return mv;
	}

	@RequestMapping(value = { "/report/idcard" })
	public ModelAndView idcard(@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "name", required = false) String name, HttpServletRequest request)
			throws DocumentException, IOException {

		System.out.println("welcome to reportcontroller->id()");
		List<Member> list;
		category = category.toLowerCase();
		if (category != null) {
			if (category.equals("district")) {
				list = service.getByDistrict(name);
				if (!list.isEmpty()) {
					System.out.println("genratee");
					Report.memberPrint(list, "idcard", request.getSession().getServletContext().getRealPath("assets"));
					new PdfOpener().openPdf("idcard", request.getSession().getServletContext().getRealPath("assets"));
				}
			} else if (category.equals("")) {

			}
		}
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Idcard");
		mv.addObject("userclickid", true);

		String realPath = request.getServletContext().getRealPath("/webapp");
		System.out.println(realPath);
		String Path = request.getContextPath();
		System.out.println(Path);

		return mv;
	}

}
