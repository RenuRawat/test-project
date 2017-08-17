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
	
	
	@RequestMapping(value="/cart/addToCart", method = RequestMethod.POST) 
	
	public ModelAndView addToCart(HttpServletRequest req)
	 {
		ModelAndView mav= new ModelAndView();
		Principal principal = req.getUserPrincipal();
		String userEmail = principal.getName();
	   try {
		
		   
		   int pid=Integer.parseInt(req.getParameter("pId"));
		   
		   Double price= Double.parseDouble(req.getParameter("pPrice"));
		   int quantity= Integer.parseInt(req.getParameter("quant"));
		   String productName=req.getParameter("name");
		   String imgname= req.getParameter("imgname");
		   Cart cartExist= cartDaoImpl.getCartById(pid, userEmail);
		    
		   if(cartExist==null)
		   {
			Cart cm = new Cart();
			cm.setCartPrice(price);
			cm.setCartQuantity(quantity);
			cm.setCartProductID(pid);
			cm.setCartProductName(productName);
			cm.setCartImage(imgname);;
			User u =userDaoImpl.findById(userEmail);
			cm.setCartUserDetails(u);
			cartDaoImpl.insertCart(cm);
		   }
		   else if(cartExist!=null)
		     {
			Cart cm = new Cart();
			cm.setCartId(cartExist.getCartId());
			cm.setCartPrice(price);
			cm.setCartQuantity(cartExist.getCartQuantity()+quantity);
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
		System.out.println("getinvoice1");
		String payment= (req.getParameter("payment"));
		System.out.println("getinvoice3");
     	Double total=(Double.parseDouble(req.getParameter("total")));
	        System.out.println("getinvoice2");
		User user= userDaoImpl.findById(userEmail);
		System.out.println("getinvoice4");
		ord.setUser(user);
		ord.setTotal(total);
		ord.setPayment(payment);
		System.out.println("getinvoice5");
        ordersDaoImpl.insertOrders(ord);
        System.out.println("getinvoice6");
        mav.addObject("orderDetails", user);
        return mav;
	 }
        
@RequestMapping(value="/checkout", method = RequestMethod.GET) 
    public ModelAndView checkoutProcess(HttpServletRequest req)
    {   
	ModelAndView mav= new ModelAndView("checkout");
	Principal principal = req.getUserPrincipal();
	String userEmail = principal.getName();
	
	System.out.println("getcode");
	
	User user=userDaoImpl.findById(userEmail);
	System.out.println("getcode1");
	List<Cart> cart = cartDaoImpl.findCartById(userEmail);
	System.out.println("getcode2");
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

   
   @RequestMapping(value="/cart/goToCart", method=RequestMethod.GET)
   public ModelAndView goToCart(HttpServletRequest req) 
    {
	   ModelAndView mv= new ModelAndView();
	   Principal principal = req.getUserPrincipal();
	   String userEmail =principal.getName();  
	   mv.addObject("cartInfo", cartDaoImpl.findCartById(userEmail));
	   mv.setViewName("cart");
	   return mv;
    }
   
   
   
}

