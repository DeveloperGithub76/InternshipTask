package com.spring.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import com.spring.mvc.dao.CustDao;
import com.spring.mvc.dao.UserDao;
import com.spring.mvc.entity.Cust;
import com.spring.mvc.entity.User;

@Controller
public class HomeController {

	@Autowired
	private CustDao custDao;
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping("/home")
	public String home(Model m)
	{
		List<Cust>  list=custDao.getAllCust();
		m.addAttribute("custList",list);
		return "home";
	}
	

	@RequestMapping("/addCust")
	public String addCust()
	{
		return "add_cust";
	}
	
	@RequestMapping(path = "/createCust",method = RequestMethod.POST)
	public String createCust(@ModelAttribute Cust cust,HttpSession session)
	{
		System.out.println(cust);
		int i=custDao.saveCust(cust);
		session.setAttribute("msg","Register Successfully");
		return "redirect:/addCust";
	}
	
	@RequestMapping(path = "/editCust/{id}")
	public String editCust(@PathVariable int id,Model m)
	{
		Cust cust=custDao.getCustById(id);
		m.addAttribute("cust",cust);
		return "/edit_cust";
	}
	@RequestMapping(path = "/updateCust",method = RequestMethod.POST)
	public String updateCust(@ModelAttribute Cust cust,HttpSession session)
	{
		custDao.update(cust); 
	session.setAttribute("msg","Update Successfully");
		return "redirect:/home";
	}
	
	@RequestMapping("/deleteCust/{id}")
	public String deleteCust(@PathVariable int id,HttpSession session)
	{
		custDao.delete(id);
		session.setAttribute("msg","Delete cust sucessfully");
		return "redirect:/home";
	}
	
	@RequestMapping("/register")
	public String registerPage()
	{
		return "/register";
	}
	
	@RequestMapping("/login")
	public String loginPage()
	{
		return "/login";
	}
	
	@RequestMapping(path = "/createUser",method = RequestMethod.POST)
	public String register(@ModelAttribute User user,HttpSession session)
	{
		userDao.saveUser(user);
		session.setAttribute("msg","User Register Successfully");
		//System.out.println(user);
		return "redirect:/register";
	}
	@RequestMapping(path = "/userlogin",method = RequestMethod.POST)
	public String login(@RequestParam("email") String em,@RequestParam("password") String pswd,HttpSession session)
	{
		User user=userDao.loginUser(em, pswd);
		
		if(user !=null)
		{
			session.setAttribute("loginuser", user);
			return "profile";
		}
		else {
			session.setAttribute("msg","Invalid email and password");
			return "redirect:/login";
		}
			
	}
	@RequestMapping("/myProfile")
	public String myProfile()
	{
		return "/profile";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		session.removeAttribute("loginuser");
		session.setAttribute("msg","Logout Successfully");
		return "/login";
	}
}
