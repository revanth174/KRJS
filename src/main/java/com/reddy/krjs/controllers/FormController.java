package com.reddy.krjs.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.reddy.krjs.supportEnd.Model.DetailsDup;
import com.reddy.krjs.supportEnd.Model.MemberDup;
import com.reddy.krjs.supportEnd.Model.PaymentDup;
import com.reddy.krjs.supportEnd.service.MemberService;

@Controller
public class FormController {

	@Autowired
	MemberService service;
	
	@RequestMapping("/add")
	public ModelAndView add(@RequestParam("file") MultipartFile file, @ModelAttribute("member") MemberDup member) {
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

		ModelAndView mv = new ModelAndView("sucees");
		mv.addObject("title", "upload");

		return mv;
	}

	
	
	
}
