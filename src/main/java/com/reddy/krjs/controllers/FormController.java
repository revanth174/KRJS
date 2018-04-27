package com.reddy.krjs.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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

import com.reddy.krjs.supportEnd.Model.Address;
import com.reddy.krjs.supportEnd.Model.Details;
import com.reddy.krjs.supportEnd.Model.DetailsDup;
import com.reddy.krjs.supportEnd.Model.Member;
import com.reddy.krjs.supportEnd.Model.MemberDup;
import com.reddy.krjs.supportEnd.Model.Payment;
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
	 webDataBinder.registerCustomEditor(Date.class,"Dob" ,new CustomDateEditor(dateFormat, true));
	 }
	
	@RequestMapping(value = {"/add"},method = RequestMethod.POST)
	public ModelAndView add(@RequestParam("register_image") MultipartFile file, @ModelAttribute("member") MemberDup member,BindingResult results) {
		System.out.println("welcome to pagecontroller->add()");
		
		
		
		System.out.println(member.getAadhar());
		PaymentDup payment = member.getPayment();
		DetailsDup d = member.getDetails();

		d.setMember(member);
		payment.setMember(member);
		/*payment.setFeePaid(BigDecimal.valueOf(1000.0));
		String ref = "ref" + Integer.toString(new Random().nextInt(10000));
		payment.setRefNo(ref);
		payment.setMop("online");
		payment.setApplicationDate(new Date());*/
		member.setPayment(payment);
		//payment.setMember(member);
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
		mv.addObject("inserted",true);
		
		return mv;
	}
	
	@RequestMapping(value = {"/show/details/{id}"})
	public ModelAndView  showMember(@PathVariable("id") String mid) {
		System.out.println("form controller-> showMember");
		int id = Integer.parseInt(mid);
		Member m = service.getById(id);
		ModelAndView mv = new ModelAndView("form");
		mv.addObject("member", m);
		return mv;
	}
	
	@RequestMapping("/member")
	@ResponseBody
	public String check(@RequestParam("name") String memberid) {
		
		System.out.println("check");
		int id = Integer.parseInt(memberid);
		Boolean valid = service.checkMemberId(id) != null;
		return valid.toString();
	}
	
	@RequestMapping("/gettags")
	@ResponseBody
	public String tags(@RequestParam("name") String memberid) {
		
		System.out.println("check");
		int id = Integer.parseInt(memberid);
		Boolean valid = service.checkMemberId(id) != null;
		return valid.toString();
	}
	
	@RequestMapping("/memberref")
	@ResponseBody
	public String checkRef(@RequestParam("ref") String refno) {
		
		System.out.println("check");
		
	
		return Boolean.toString(service.checkRefNo(refno));
	}
	
	@RequestMapping("/pid")
	public @ResponseBody String getShopInJSON(@RequestParam("id") String memberid) {
		int id = Integer.parseInt(memberid);
		Member m = service.getById(id);
		System.out.println("json");
		Mem mem = new Mem();
		mem.setName(m.getName());
		mem.setPhone(m.getDetails().getPhone());
		String json = JsonUtil.convertJavaToJson(mem);
		return json;

	}

	@RequestMapping(value= {"/update"})
	public ModelAndView update(@RequestParam(value="id",required= false) String memberid) {
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","update");
		
		System.out.println(memberid);
		if(memberid != null) {
			int id = Integer.parseInt(memberid);
			Member mem = service.getById(id);
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
		int id = Integer.parseInt(memberid);
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("clickupdateform", true);
		mv.addObject("update",true);
		mv.addObject("title","updateform");
		
		
		Member mem = service.getById(id);
		if(mem!=null)  {
			System.out.println(mem.getMemberId());
			if(mem.getAadhar() != null)
				mv.addObject("aadhar",true);
			else if (mem.getPan() != null)
				mv.addObject("pan",true);
			else
				mv.addObject("voter",true);
			mv.addObject("member", mem);
			mv.addObject("memid",mem.getMemberId());
		}
		else 
			mv.addObject("member",null);
		return mv;

	}
	
	@RequestMapping(value= {"/memberupdate/"})
	public ModelAndView memberupdate(@RequestParam("register_image") MultipartFile file, @ModelAttribute("member") Member member) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("update",true);
		if(file.isEmpty()) {
			Member m = service.getById(member.getMemberId());
			m.setName(member.getName());
			m.setGender(member.getGender());
			m.setName(member.getName());
			m.setTitle(member.getTitle());
			m.setType(member.getType());
			m.setFhname(member.getFhname());
			m.setDob(member.getDob());
			m.setProposerMemberId(member.getProposerMemberId());
			m.setProposerName(member.getProposerName());
			m.setProposerPhoneNumber(member.getProposerPhoneNumber());
			m.setAadhar(member.getAadhar());
			m.setPan(member.getPan());
			m.setVoter(member.getVoter());
			
			Details details = m.getDetails();
			details.setGmail(member.getDetails().getGmail());
			details.setMaritalStatus(member.getDetails().getMaritalStatus());
			details.setNoc(member.getDetails().getNoc());
			details.setOccupation(member.getDetails().getOccupation());
			details.setPhone(member.getDetails().getPhone());
			details.setQualification(member.getDetails().getQualification());
			details.setVemanaVani(member.getDetails().getVemanaVani());
			details.setWard(member.getDetails().getWard());
			details.setWardNo(member.getDetails().getWardNo());
			details.setMember(m);
			
			Payment payment = m.getPayment();
			payment.setApplicationDate(member.getPayment().getApplicationDate());
			payment.setFeePaid(member.getPayment().getFeePaid());
			payment.setMop(member.getPayment().getMop());
			
			payment.setRefNo(member.getPayment().getRefNo());
			payment.setMember(m);
			
			
			Address address = m.getAddress();
			address.setAddress(member.getAddress().getAddress());
			address.setVillage(member.getAddress().getVillage());
			address.setDistrict(member.getAddress().getDistrict());
			address.setPincode(member.getAddress().getPincode());
			address.setState(member.getAddress().getState());
			address.setTaluk(member.getAddress().getTaluk());
			
			m.setAddress(address);
			/*Payment p = member.getPayment();
			Details d = member.getDetails();
			p.setMember(m);
			d.setMember(m);
			m.setPayment(p);
			m.setDetails(d);*/
			/*Details d = member.getDetails();

			d.setMember(member);
			member.setDetails(d);
			payment.setFeePaid(BigDecimal.valueOf(1000.0));
			String ref = "ref" + Integer.toString(new Random().nextInt(10000));
			payment.setRefNo(ref);
			payment.setMop("online");
			payment.setApplicationDate(new Date());
			member.setPayment(payment);
			payment.setMember(member);
			System.out.println(member);*/
			
			service.update(m);
			mv.addObject("updated",true);
			mv.addObject("success",true);
			
		}
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

	class Tag {
		String name;

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
	}
	
	
	
}
