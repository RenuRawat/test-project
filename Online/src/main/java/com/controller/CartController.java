package com.controller;


import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.DaoImpl.CartDaoImpl;
import com.DaoImpl.CatDaoImpl;
import com.DaoImpl.OrdersDaoImpl;
import com.DaoImpl.ProDaoImpl;
import com.DaoImpl.SupDaoImpl;
import com.DaoImpl.UserDaoImpl;
import com.Model.Cart;
import com.Model.Orders;
import com.Model.User;

@Controller
public class CartController {
	int x;
	
	@Autowired
	UserDaoImpl userDaoImpl;
	
	@Autowired
	CatDaoImpl catDaoImpl;
	
	@Autowired
	ProDaoImpl proDaoImpl;
	
	@Autowired
	SupDaoImpl supDaoImpl;
	
	@Autowired
	 CartDaoImpl cartDaoImpl;
	
	@Autowired
	 OrdersDaoImpl ordersDaoImpl;
	
	
	@RequestMapping(value="/addToCart", method = RequestMethod.POST) 
	
	public ModelAndView addToCart(HttpServletRequest req)
	 {
		ModelAndView mav= new ModelAndView();
	   try {
		   Principal principal = req.getUserPrincipal();
		   String userEmail = principal.getName();
		   int pid=Integer.parseInt(req.getParameter("pId"));
		   x=pid;
		   Double price= Double.parseDouble(req.getParameter("pPrice"));
		   int quantity= Integer.parseInt(req.getParameter("quant"));
		   String productName=req.getParameter("name");
		   String imgname= req.getParameter("imgname");
		   Cart exists= cartDaoImpl.getCartById(pid, userEmail);
		   
		   if(exists==null)
		   {
			Cart cm = new Cart();
			cm.setCartPrice(price);
			cm.setCartProductID(pid);
			cm.setCartProductName(productName);
			cm.setCartImage(imgname);
			User u =userDaoImpl.findById(userEmail);
			cm.setCartUserDetails(u);
			cartDaoImpl.insertCart(cm);
		   }
		   else  
		     {
			Cart cm = new Cart();
			cm.setCartPrice(price);
			cm.setCartProductID(pid);
			cm.setCartProductName(productName);
			cm.setCartImage(imgname);
			User u =userDaoImpl.findById(userEmail);
			cm.setCartUserDetails(u);
			cartDaoImpl.updateCart(cm);
		   }
		   mav.addObject("cartInfo", cartDaoImpl.findCartById(userEmail));
		   mav.setViewName("cart");
		   return mav;
	     }
	      catch(Exception e)
	   {
	    	  mav.setViewName("cart");
	    	  return mav;
	   }
	 }
	
	
@RequestMapping(value="/invoiceprocess", method = RequestMethod.POST) 
	
	public ModelAndView orderSave(HttpServletRequest req)
	 {
		ModelAndView mav= new ModelAndView("invoice");
		Orders ord=new Orders();
		Principal principal = req.getUserPrincipal();
		String userEmail = principal.getName();
		Double total= Double.parseDouble(req.getParameter("total"));
		String payment= req.getParameter("payment");
		User user= userDaoImpl.findById(userEmail);
		ord.setUser(user);
		ord.setTotal(total);
		ord.setPayment(payment);
        ordersDaoImpl.insertOrders(ord);
        mav.addObject("orderDetails", user);
        return mav;
	 }
        
@RequestMapping(value="/checkout", method = RequestMethod.POST) 

    public ModelAndView checkoutProcess(HttpServletRequest req)
    {   
	ModelAndView mav= new ModelAndView("checkout");
	Principal principal = req.getUserPrincipal();
	String userEmail = principal.getName();
	User user=userDaoImpl.findById(userEmail);
	List<Cart> cart = cartDaoImpl.findCartById(userEmail);
	mav.addObject("user", user);
	mav.addObject("cart", cart);
	return mav;
    }
    
   @RequestMapping("/deleteCart/{cartId}")
     public ModelAndView deleteCartItem(@PathVariable("cartId") int cartId, HttpServletRequest req) 
      {
	   ModelAndView mv= new ModelAndView("checkout");
	   Principal principal = req.getUserPrincipal();
	   String userEmail =principal.getName();
       cartDaoImpl.deleteCart(cartId);
       mv.addObject("cartInfo", cartDaoImpl.findCartById(userEmail));
       mv.setViewName("cart");
       return mv;
     
      
   }     


}

