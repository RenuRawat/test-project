package com.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.DaoImpl.CatDaoImpl;
import com.DaoImpl.ProDaoImpl;
import com.DaoImpl.UserDaoImpl;
import com.Model.Product;
import com.Model.User;


@Controller
public class HomeController {
	
	@Autowired
	 UserDaoImpl userDaoImpl;
	@Autowired
	 ProDaoImpl proDaoImpl;
	@Autowired
	 CatDaoImpl catDaoImpl;
	@Autowired
	 CatDaoImpl supDaoImpl;
	
//////////////////////////////////////////////	
	@RequestMapping("/login")
	public String login() {
		return "Login";
		}	
	
	@RequestMapping("/userlogged")
	public String userlogged() {
		return "redirect:/index";
		}
	
	@RequestMapping("/error")
	public String error() {
		return "/error";
		}
	
///////////////////////////////////////	
@RequestMapping("/")
	public String index() {
		return "index";
		}

@RequestMapping("/index")
public String index1() {
	return "index";
	}
@RequestMapping("/admin")
public String admin() {
	return "Admin";
	}

@RequestMapping("/aboutus")
public String aboutus() {
	return "AboutUs";
	}

@RequestMapping("/contactus")
public String contactus() {
	return "ContactUs";
	}
@RequestMapping("/forget")
public String forget() {
	return "ForgetPassword";
	}


/*@RequestMapping(value="/goTologin") 
public ModelAndView goTologin() { 
	ModelAndView mav= new ModelAndView();
//	mav.addObject("user", new User());
	mav.setViewName("/login");
	return mav;
	}*/
/*@RequestMapping(value="/goTologin", method = RequestMethod.POST) 
public ModelAndView goTologin(@ModelAttribute("user") User user, BindingResult result) {
	ModelAndView mav= new ModelAndView();
	
	
		user.setRole("ROLE_USER");
		userDaoImpl.insertUser(user);
		mav.setViewName("redirect:/Home");
		return mav;
	
	
	}        */

///////////////////////////////////////////////////////////////////////////////////////////////////////

@RequestMapping(value="/register", method = RequestMethod.GET) 
public ModelAndView register() {
	ModelAndView mav= new ModelAndView();
	mav.addObject("user", new User());
	mav.setViewName("Registeration");
	return mav;
	}

@RequestMapping(value="/saveregister", method = RequestMethod.POST) 
public ModelAndView saveregister(@Valid @ModelAttribute("user") User user, BindingResult result) {
	ModelAndView mav= new ModelAndView();
	
	
		user.setRole("ROLE_USER");
		userDaoImpl.insertUser(user);
		mav.setViewName("redirect:/login");
		return mav;
	
	
	}

///////////////////////////////////
@RequestMapping(value="/productCustList") 
public ModelAndView productCustList(@RequestParam("cid") int cid) 
  {
	System.out.println(cid);
	ModelAndView mav= new ModelAndView();
	mav.addObject("productList", proDaoImpl.getProById(cid));
	mav.setViewName("ProductCustomerList");
	return mav;
	}



@ModelAttribute
public void addAttributes(Model m)
{
m.addAttribute("catList",catDaoImpl.retrieve());
m.addAttribute("proList",proDaoImpl.retrieve());
m.addAttribute("satList",supDaoImpl.retrieve());}


@RequestMapping(value="/prodDetail/{cid}") 
public ModelAndView prodDet(@PathVariable("cid") int cid) 
  {
	ModelAndView mv= new ModelAndView();
	Product product=proDaoImpl.findById(cid);
	mv.addObject("product", product);
	mv.setViewName("prodDetail");
	return mv;
	}

}
