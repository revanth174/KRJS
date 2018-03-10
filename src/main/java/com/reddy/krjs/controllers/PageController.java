package com.reddy.krjs.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.reddy.krjs.supportEnd.Model.Member;
import com.reddy.krjs.supportEnd.Model.MemberDup;
import com.reddy.krjs.supportEnd.Model.Users;
import com.reddy.krjs.supportEnd.dao.MemberDao;
import com.reddy.krjs.supportEnd.service.MemberService;

import extra.BulkSms;
import extra.Email;

@Controller
public class PageController {

	@Autowired
	MemberDao memberdao;

	@Autowired
	MemberService service;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@RequestMapping(value = { "/", "home", "index" })
	public ModelAndView index() {
		System.out.println("welcome to pagecontroller->index()");
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "home");
		return mv;
	}

	@RequestMapping("/about")
	public ModelAndView aboutUs() {
		System.out.println("welcome to pagecontroller->aboutus()");
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "About Us");
		mv.addObject("userclickabout", true);
		return mv;
	}

	@RequestMapping("/contact")
	public ModelAndView contactUs() {
		System.out.println("welcome to pagecontroller->aboutus()");
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Contact Us");
		mv.addObject("userclickcontact", true);
		return mv;
	}

	@RequestMapping("/form")
	public ModelAndView form() {
		System.out.println("welcome to pagecontroller->form()");
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Application form");
		mv.addObject("userclickform", true);
		mv.addObject("member", new MemberDup());
		return mv;
	}

	@RequestMapping("/show/all/members")
	public ModelAndView showAllMembers() {
		System.out.println("welcome to pagecontroller->showAllMember()");
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "All members");
		mv.addObject("userclickallmembers", true);
		return mv;
	}

	@RequestMapping(value = "/show/category/{id}/members")
	public ModelAndView showcategoryMembers(@PathVariable("id") String category,
			@RequestParam(value = "memid", required = false) String catvalue) {
		System.out.println("welcome to pagecontroller->showcategoryMembers()");
		System.out.println(catvalue);

		ModelAndView mv = new ModelAndView("page");
		if (catvalue != null) {
			mv.addObject("entered", category + catvalue);
			if (category.equals("memberid")) {
				System.out.println("category = memberid");
				Member mem = service.getById(catvalue);
				List<Member> li = new ArrayList<>();
				li.add(mem);
				mv.addObject("memberobject", li);

			} else if (category.equals("taluk")) {
				System.out.println("category = taluk");
				List<Member> li = service.getByTaluk(catvalue);
				mv.addObject("memberobject", li);

			} else if (category.equals("phone")) {

				List<Member> li = service.getByMobileNumber(Long.parseLong(catvalue));
				mv.addObject("memberobject", li);

			} else if (category.equals("district")) {
				List<Member> li = service.getByDistrict((catvalue));
				mv.addObject("memberobject", li);

			} else if (category.equals("pincode")) {
				List<Member> li = service.getByPincode(Integer.parseInt(catvalue));
				mv.addObject("memberobject", li);
			}
		}
		mv.addObject("title", category);
		mv.addObject("category", category);
		mv.addObject("userclickcategorymembers", true);
		return mv;
	}

	@RequestMapping(value = "/show/pending/all/members")
	public ModelAndView pendingMember() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "pendingMembers");
		mv.addObject("userclickpendingmembers", true);
		List<MemberDup> li = service.selectAll_registeredMembers(false);
		if (!li.isEmpty())
			for (MemberDup m : li) {
				System.out.println(m.getMemberId());
			}
		mv.addObject("memberobject", li);
		return mv;
	}
	
	
	@RequestMapping(value = "/show/deleted/all/members")
	public ModelAndView deletedMember() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "deletedMembers");
		mv.addObject("userclickdeletedmembers", true);
		List<MemberDup> li = service.selectAll_registeredMembers(true);
		if (!li.isEmpty())
			for (MemberDup m : li) {
				System.out.println(m.getMemberId());
			}
		mv.addObject("memberobject", li);
		return mv;
	}

	@RequestMapping(value = "/show/pending/members/{id}/{mid}")
	ModelAndView memberManipuate(@PathVariable("id") String key, @PathVariable("mid") String memberid,
			@RequestParam(value = "remarks", required = false) String remarks) throws Exception {
		System.out.println("memberManipulate");
		System.out.println(remarks);
		System.out.println(key + "   " + memberid);
		ModelAndView mv = new ModelAndView("redirect:/show/pending/all/members");
		if (key.equals("delete")) {
			MemberDup member = service.getById_registeredMember(memberid);
			member.setDeleted(true);
			member.setRemarks(remarks);
			service.update(member);
		} else if (key.equals("view")) {

		} else if (key.equals("approve")) {
			MemberDup member = service.getById_registeredMember(memberid);
			System.out.println(member.getMemberId());
			Users u = new Users();
			u.setMemberId(member.getMemberId());
			u.setEnable(true);
			u.setRole("ROLE_USER");
			Random r = new Random();
			int password = r.nextInt(4);
			
			u.setPassword(passwordEncoder.encode(Integer.toString(password)));
			
			try {
				service.insertAndDelete(member);
				service.insert(u);
				} catch(Exception e) {
					e.printStackTrace();
				}
			
			Thread d = new Thread(() -> new Email().sendMain(member.getDetails().getGmail()));
			d.start();
			// new Email().sendMain(member.getDetails().getGmail());
			new Thread(() -> {
				try {
					new BulkSms().send(Long.toString(member.getDetails().getPhone()));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}).start();
			;

		}
		return mv;

	}

	@RequestMapping("/login")
	public ModelAndView login(@RequestParam(name = "logout", required = false) String logout) {
		System.out.println("welcome to pagecontroller->login()");
		ModelAndView mv = new ModelAndView("login");
		mv.addObject("title", "login");
		if (logout != null) {
			mv.addObject("logout", "User has successfully logged out!");
		}
		return mv;
	}

	@RequestMapping("/access-denied")
	public ModelAndView denied() {
		System.out.println("welcome to pagecontroller->denied()");
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("title", "error");
		mv.addObject("errorTitle", "caught you");
		mv.addObject("errorDescription", "you are authorized to vieww");

		return mv;
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {

		// first we are going to fetch the authentication
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}

		return "redirect:/login?logout";
	}
	
	@RequestMapping("/hello")
	public ModelAndView hello() {
		System.out.println("welcome to pagecontroller->login()");
		ModelAndView mv = new ModelAndView("hello");
		mv.addObject("title", "login");
		
		return mv;
	}

}
