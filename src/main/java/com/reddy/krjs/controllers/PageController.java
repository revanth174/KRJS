package com.reddy.krjs.controllers;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.reddy.krjs.supportEnd.Model.Member;
import com.reddy.krjs.supportEnd.Model.MemberDup;
import com.reddy.krjs.supportEnd.Model.Users;
import com.reddy.krjs.supportEnd.Model.Ward;
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
	public ModelAndView form(@RequestParam(value = "member", required = false) Member member) {
		System.out.println("welcome to pagecontroller->form()");
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Application form");
		mv.addObject("userclickform", true);
		Calendar calendar = new GregorianCalendar();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		int hourOfDay = calendar.get(Calendar.HOUR_OF_DAY); // 24 hour clock
		int minute = calendar.get(Calendar.MINUTE);
		int second = calendar.get(Calendar.SECOND);
		int appno = new Random().nextInt(1000000);
		int memid = new Random().nextInt(1000000);
		
		mv.addObject("appno", appno);
		mv.addObject("memid", memid);
		if (member != null)
			mv.addObject("member", member);
		else
			mv.addObject("member", new Member());
		mv.addObject("wards",service.listOfWards());
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
			@RequestParam(value = "input-search", required = false) String catvalue,
			@RequestParam(value = "state", required = false) String state,
			@RequestParam(value = "district", required = false) String district,
			@RequestParam(value = "taluk", required = false) String taluk) {
		
		System.out.println("welcome to pagecontroller->showcategoryMembers()");
		System.out.println(category);
		List<Member> l = null;
		ModelAndView mv = new ModelAndView("page");
		if (category != null && catvalue!=null) {
			mv.addObject("entered", category + catvalue);
			if (category.equals("memberid")) {
				int id = Integer.parseInt(catvalue);
				System.out.println("category = memberid");
				Member mem = service.getById(id);
				l = new ArrayList<>();
				l.add(mem);

			} else if (category.equals("taluk")) {
				System.out.println("category = taluk");
				
				System.out.println(state );
				System.out.println(district );
				System.out.println(taluk );
				l = service.getByTaluk(catvalue);

			} else if (category.equals("phone")) {

				l = service.getByMobileNumber(catvalue);

			} else if (category.equals("district")) {
				l = service.getByDistrict((catvalue));

			} else if (category.equals("pincode")) {
				l = service.getByPincode(catvalue);

			} else if (category.equals("state")) {
				l = service.getByState(catvalue);

			}
		}
		mv.addObject("memberobject", l);
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
			@RequestParam(value = "remarks", required = false) String remarks,HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(memberid);
		System.out.println("memberManipulate");
		System.out.println(remarks);
		System.out.println(key + "   " + memberid);
		ModelAndView mv = new ModelAndView("redirect:/show/pending/all/members");
		if (key.equals("delete")) {
			MemberDup member = service.getById_registeredMember(id);
			member.setDeleted(true);
			member.setRemarks(remarks);
			service.update(member);
		} else if (key.equals("view")) {

		} else if (key.equals("approve")) {
			MemberDup member = service.getById_registeredMember(id);
			System.out.println(member.getMemberId());
			
			/*Users u = new Users();
			u.setMemberId(member.getMemberId());
			u.setEnable(true);
			u.setRole("ROLE_USER");
			Random r = new Random();
			int password = 7396;
			u.setPassword(passwordEncoder.encode(Integer.toString(password)));
*/
			File f1 = null;
			File f2 = null;
			BufferedImage image = null;
			
			 f1 = new File(request.getSession().getServletContext().getRealPath("assets/images/"+ member.getMemberId()+".jpg"));
			 image = new BufferedImage(100,100,BufferedImage.TYPE_INT_ARGB);
			 image = ImageIO.read(f1);
			 System.out.println("reading compleer");
			try {
				int gid = service.insertAndDelete(member);
				
				 f2 = new File(request.getSession().getServletContext().getRealPath("assets/images/"+gid+".jpg"));
				 ImageIO.write(image, "jpg", f2);
				 System.out.println("writing commplere");
				 
				
				/*ServletContext servletContext = request.getServletContext();
				Resource r =(Resource) new ServletContextResource(servletContext, "/WEB-INF/images/image-example.jpg");
				Image image=Image.getInstance("/resources/images/102.png");
				*/
				Thread d = new Thread(() -> new Email().sendMain(member.getDetails().getGmail()));
				d.start();
				new Thread(() -> {
					try {
						new BulkSms().send(gid, member.getDetails().getPhone());
					} catch (Exception e) {
						
						e.printStackTrace();
					}
				}).start();
				//service.insert(u);
			} catch (Exception e) {
				e.printStackTrace();
			}

			
			
		}
		return mv;

	}

	@RequestMapping("/login")
	public ModelAndView login(@RequestParam(name = "error", required = false) String error) {
		System.out.println("welcome to pagecontroller->login()");
		ModelAndView mv = new ModelAndView("login");
		mv.addObject("title", "login");
		if (error != null) {
			mv.addObject("error", "invalid memberid or password");

		}

		return mv;
	}
	
	
	

	@RequestMapping("/login/forgot")
	public ModelAndView forgot(@RequestParam(name = "memberid",required = false) String mid,
			@RequestParam(name = "newpassword", required = false) String newpassword) {
		
		ModelAndView mv = new ModelAndView("forgot");
		
		mv.addObject("title","forgot");
		if(mid == null) {
			//int id = Integer.parseInt(mid);
			mv.addObject("forgotpassword",true);
		}
		else {
			int id = Integer.parseInt(mid);
			service.changeUserPassword(newpassword, id);
			mv.addObject("success", "true");
			mv.addObject("newpasswordchanged",true);
		}
		return mv;
	}

	@RequestMapping("/sendcode")
	@ResponseBody
	public String sendcode(@RequestParam("name") String memberid) {

		System.out.println("sendcode");
		int id = Integer.parseInt(memberid);
		Member m = service.checkMemberId(id);
		if(m == null)
			return "false";
		else {
			String code = Integer.toString(new Random().nextInt(1000000));
			System.out.println("sent code");
			try {
				memberdao.insert_code(code, id);
				new Thread(() -> {
					try {
						new BulkSms().sendForgotCode(memberid, m.getDetails().getPhone(), code);
					} catch (Exception e) {
						
						e.printStackTrace();
					}
				}).start();	
				
			} catch (Exception e) {
				
			}
		}
		
		return "true";
		
	}
	
	
	@RequestMapping("/checkcode")
	@ResponseBody
	public String checkcode(@RequestParam("name") String mid,
			@RequestParam(name = "enteredcode", required = false) String enteredcode) {

		System.out.println("checkcode");
		Boolean check= false;
		if(mid!= null && enteredcode != null) {
			 int id = Integer.parseInt(mid);
			check = memberdao.checkCode(enteredcode, id);
		}

		
		
		return check.toString();
		
	}

	

	@RequestMapping("/access-denied")
	public ModelAndView denied() {
		System.out.println("welcome to pagecontroller->denied()");
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("title", "error");
		mv.addObject("errorTitle", "caught you");
		mv.addObject("errorDescription", "you are authorized to view");

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
	
	
	@RequestMapping("/ward") 
	public ModelAndView ward() {
		ModelAndView mv = new ModelAndView("ward");
		mv.addObject("title","ward");
		mv.addObject("ward",new Ward());
		mv.addObject("wards",service.listOfWards());
		return mv;
	}
	
	
	@RequestMapping("/ward/add") 
	public String addWard(@ModelAttribute("ward") Ward ward) {
		System.out.println(ward.getWardName());
		System.out.println(ward.getWardNumber());
		service.addWard(ward);
		
		return "redirect:/ward";
	}
	
	
	@RequestMapping("/committeeMembers")
	public ModelAndView commitee() {
		System.out.println("welcome to pagecontroller->commiteeMember()");
		ModelAndView mv = new ModelAndView("commitemembers");
		mv.addObject("title", "commiteeMembers");
		List<Integer> ids = service.getAdmins();
		System.out.println("coame");
		HashMap<Integer,String> hash = new HashMap<>();
		HashMap<Integer,String> hashTemp = new HashMap<>();
		for(Integer id : ids ) {
			hashTemp = service.getIdAndName(id);
			hash.put(id,hashTemp.get(id));
		}
		
		mv.addObject("members",hash);
		mv.addObject("userclickcommitteemembers",true);
		mv.addObject("title","committeemembers");
		return mv;
	}
	
	@RequestMapping("/committeeMembers/add")
	public String addCommitteeMember(@RequestParam("id") String id) {
		System.out.println("welcome to pagecontroller->addCommiteeMember()");
		
		int mid = Integer.parseInt(id);
		Users user = new Users();
		user.setMemberId(mid);
		user.setEnable(true);
		user.setPassword(new BCryptPasswordEncoder().encode("7396"));
		user.setRole("ROLE_ADMIN");
		
			service.insert(user);
			/*new Thread(() -> {
				try {
					new BulkSms().send(user.getMemberId(), member.getDetails().getPhone());
				} catch (Exception e) {
					
					e.printStackTrace();
				}
			}).start();*/
		
		
			return "redirect:/committeeMembers";
	}

}
