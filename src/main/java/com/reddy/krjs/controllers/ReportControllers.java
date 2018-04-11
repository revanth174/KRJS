package com.reddy.krjs.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

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
	
	
	@RequestMapping(value= {"/report/idcard"})
	public ModelAndView idcard(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("page");
		//mv.addObject("validlist",null);
		request.getSession().removeAttribute("validlist");
		Enumeration<String> e = request.getSession().getAttributeNames();
		while(e.hasMoreElements()) {
			System.out.println(e.nextElement());
			
		}
		mv.addObject("title","idcard");
		mv.addObject("idcard",true);
		return mv;
		
	}
	
	
	@RequestMapping(value= {"/report/idcardgen"})
	public ModelAndView idcardgen(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("page");
		Set<String> ids = (Set<String>) request.getSession().getAttribute("validlistsession");
		Enumeration<String> e = request.getSession().getAttributeNames();
		while(e.hasMoreElements()) {
			System.out.println(e.nextElement());
			
		}
		Set<Member> li = new HashSet<>();
		for(String id : ids) {
			Member m = service.getById(id);
			li.add(m);
		}
		List<Member> list = new ArrayList<>(li);
		ids.stream().forEach(System.out:: println);
		Report.printId(list, "id", request.getSession().getServletContext().getRealPath("assets"));
		try {
			new PdfOpener().openPdf("id", request.getSession().getServletContext().getRealPath("assets"));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			System.out.println("error in opening");
			e1.printStackTrace();
		}
		mv.addObject("idcard",true);
		return mv;
		
	}

	/*@RequestMapping(value = { "/report/idcard" })
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
*/
	
	@RequestMapping("/report/memberlist")
	public ModelAndView listOfIds(@RequestParam(name ="idlist") String idlist,HttpServletRequest request) {
		
		System.out.println(idlist);
		String[] ids = idlist.split(",");
		Set<String> valid = new LinkedHashSet<>();
		Set<String> notvalid = new LinkedHashSet<>();
		//FormController form = new FormController();
		for(String s : ids) {
			if(service.checkMemberId(s) != null)
				valid.add(s);
			else
				notvalid.add(s);
		}
		request.getSession().setAttribute("validlistsession", valid);;
		Arrays.stream(ids).forEach(x -> System.out.println(x));
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("idcard",true);
		mv.addObject("validlist", valid);
		mv.addObject("notvalidlist",notvalid);
		return mv;
	}
}
