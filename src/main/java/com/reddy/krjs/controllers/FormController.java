package com.reddy.krjs.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.reddy.krjs.supportEnd.Model.DetailsDup;
import com.reddy.krjs.supportEnd.Model.Member;
import com.reddy.krjs.supportEnd.Model.MemberDup;
import com.reddy.krjs.supportEnd.Model.PaymentDup;
import com.reddy.krjs.supportEnd.service.MemberService;

import extra.JsonUtil;
import extra.Mem;

@Controller
public class FormController {

	@Autowired
	MemberService service;
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
	 SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	 dateFormat.setLenient(false);
	 webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	 }
	
	@RequestMapping(value = {"/add"},method = RequestMethod.POST)
	public ModelAndView add(@RequestParam("register_image") MultipartFile file, @ModelAttribute("member") MemberDup member) {
		System.out.println("welcome to pagecontroller->add()");

		
		System.out.println(member);
		PaymentDup payment = new PaymentDup();
		DetailsDup d = member.getDetails();

		d.setMember(member);
		payment.setFeePaid(BigDecimal.valueOf(1000.0));
		String ref = "ref" + Integer.toString(new Random().nextInt(10000));
		payment.setRefNo(ref);
		payment.setMop("online");
		payment.setApplicationDate(new Date());
		member.setPayment(payment);
		payment.setMember(member);
		System.out.println(member);
		service.insert_registerMember(member);
		String path = "F:/First/pro/krjs/src/main/webapp/assets/images/";
		path = path + member.getMemberId() + ".jpg";
		File f = new File(path);
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bs = new BufferedOutputStream(fos);
				bs.write(bytes);
				System.out.println("success");
				bs.close();

			} catch (Exception e) {
				System.out.println("Exception Arised:" + e);
			}

		} else {
			System.out.println("File Uploading Problem");
		}

		ModelAndView mv = new ModelAndView("page");
		mv.addObject("success",true);
		
		return mv;
	}
	
	@RequestMapping(value = {"/show/details/{id}"})
	public ModelAndView  showMember(@PathVariable("id") String mid) {
		System.out.println("form controller-> showMember");
		Member m = service.getById(mid);
		ModelAndView mv = new ModelAndView("form");
		mv.addObject("member", m);
		return mv;
	}
	
	@RequestMapping("/member")
	@ResponseBody
	public String check(@RequestParam("name") String memberid) {
		Boolean valid = service.checkMemberId(memberid) != null;
		return valid.toString();
	}
	
	@RequestMapping("/pid")
	public @ResponseBody String getShopInJSON(@RequestParam("id") String memberid) {
		Member m = service.getById(memberid);
		System.out.println("json");
		Mem mem = new Mem();
		mem.setName(m.getName());
		mem.setPhone(Long.toString(m.getDetails().getPhone()));
		String json = JsonUtil.convertJavaToJson(mem);
		return json;

	}

	@RequestMapping(value= {"/update"})
	public ModelAndView update(@RequestParam(value="id",required= false) String memberid) {
		ModelAndView mv = new ModelAndView("page");
		if(memberid != null) {
			Member mem = service.getById(memberid);
			if(mem == null) {
				mv.addObject("nomember",true);
			} else {
				mv.addObject("nomember",false);
				mv.addObject("member",mem);
				
			}
		}
		
		mv.addObject("userclickupdate",true);
		return mv;

	}

	@RequestMapping(value= {"/updatemember/{id}"})
	public ModelAndView updatemember(@PathVariable("id") String memberid) {
		ModelAndView mv = new ModelAndView("redirect:/form");
		/*mv.addObject("userclickform", true);
		mv.addObject("title","updateform");
*/		memberid = memberid.trim();
		
		Member mem = service.getById(memberid);
		if(mem!=null)  {
			System.out.println(mem.getMemberId());
		mv.addObject("member", mem);
		}
		else 
			mv.addObject("member",null);
		return mv;

	}

	
	
	class Json {
		private String membername;
		private String membernumber;
		public String getMembername() {
			return membername;
		}
		public void setMembername(String membername) {
			this.membername = membername;
		}
		public String getMembernumber() {
			return membernumber;
		}
		public void setMembernumber(String membernumber) {
			this.membernumber = membernumber;
		}
	}

	
	
	
}
