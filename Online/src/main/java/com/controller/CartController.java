package com.controller;


import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.DaoImpl.CartDaoImpl;
import com.DaoImpl.CatDaoImpl;
import com.DaoImpl.OrdersDaoImpl;
import com.DaoImpl.ProDaoImpl;
import com.DaoImpl.SupDaoImpl;
import com.DaoImpl.UserDaoImpl;
import com.Model.Cart;
import com.Model.Orders;
import com.Model.Product;
import com.Model.Supplier;
import com.Model.User;

@Controller
@RequestMapping("/cart")
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
   
   
    @RequestMapping(value="/addToCart" , method=RequestMethod.POST)
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
   		System.out.println("reachead till cart exist");
   		   Cart cartExist= cartDaoImpl.getCartById(pid, userEmail);
                              
                               System.out.println("reachead after cart exist");
                               if(cartExist==null)
                               {
                                             Cart ct = new Cart();
                                             ct.setCartPrice(price);
                                             ct.setCartProductID(pid);
                                             ct.setCartProductName(productName);
                                             ct.setCartImage(imgname);
                                             ct.setCartQuantity(quantity);
                                             User u = userDaoImpl.findById(userEmail);
                                             ct.setCartUserDetails(u);
                                             cartDaoImpl.insertCart(ct);
                                            
                               }
                               else  if(cartExist!=null)
                      {
                               Cart cm = new Cart();
                               cm.setCartId(cartExist.getCartId());
                               cm.setCartPrice(price);
                               cm.setCartProductID(pid);
                               cm.setCartProductName(productName);
                               cm.setCartImage(imgname);
                               cm.setCartQuantity(cartExist.getCartQuantity()+quantity);
                               User u =userDaoImpl.findById(userEmail);
                               cm.setCartUserDetails(u);
                               cartDaoImpl.updateCart(cm);
                               System.out.println("reachead inside cart update");
                    }

                               System.out.println("to check the cart info variable");
                               mav.addObject("cartInfo" , cartDaoImpl.findCartById(userEmail));
                               mav.setViewName("cart");
                               System.out.println("reachead final end of cart ");
                               return mav;
                              
                              
                 } catch (Exception e) {
                	 mav.setViewName("cart");
                     return mav;
                 }
                
    }
   

@RequestMapping(value="/checkout", method = RequestMethod.GET)

public ModelAndView checkoutProcess(HttpServletRequest request)
{  
    ModelAndView mav= new ModelAndView("checkout");
    Principal principal = request.getUserPrincipal();
    String userEmail = principal.getName();
    User user=userDaoImpl.findById(userEmail);
   
   
    List<Cart> cart = cartDaoImpl.findCartById(userEmail);
    mav.addObject("user", user);
    mav.addObject("cart", cart);
   
    for (Cart cartItem : cart) {

                 System.out.println("inside forEach loop");
                 int pid = cartItem.getCartProductID();
                
                 System.out.println("after getting cart product id for a particular product");
                 Product prod = proDaoImpl.findById(pid) ;
                 System.out.println("after getting pid from product table ");
                 int stock = prod.getStock();
                 System.out.println("after getting stock from product table");
                 int quantity = cartItem.getCartQuantity(); // Finding total quantities purchased
                                                                                                                               // by user.
                                                         
                 System.out.println("after getting quantity");
                
                                                         
                 if(quantity == stock)
                 {
                               prod.setStock(0);
                               System.out.println("inside if block");
                 }

                 if(quantity!=stock)
                 {
                 prod.setStock(stock - quantity);
                 System.out.println("inside another if block");
                 }
                
                 proDaoImpl.updateProduct(prod);

    }
    return mav;
}




@RequestMapping(value="/invoiceprocess", method = RequestMethod.POST) 
//public ModelAndView orderSave(@Valid @ModelAttribute("user") User user, BindingResult result) {
public ModelAndView orderSave(@Valid HttpServletRequest request)
 {
	ModelAndView mav= new ModelAndView("invoice");
	
	Principal principal = request.getUserPrincipal();
	String userEmail = principal.getName();
	
	
//	int orderId = (Integer.parseInt(request.getParameter("orderId")));
	
	String shipemail = request.getParameter("semail");
	String shipphone = request.getParameter("sphone");
	String shipname = request.getParameter("sname");
	String shipadd1 = request.getParameter("sadd1");
	String shipadd2 = request.getParameter("sadd2");
	String shipcity = request.getParameter("scity");
	String shipstate = request.getParameter("sstate");
	String shipcode = request.getParameter("spincode");
//	String shipcountry = request.getParameter("scountry");
	
	Orders ord=new Orders();
//	ord.setOrderId(orderId);
	ord.setSemail(shipemail);
	ord.setSphone(shipphone);
	ord.setSname(shipname);
	ord.setSadd1(shipadd1);
	ord.setSadd2(shipadd2);
	ord.setScity(shipcity);
	ord.setSstate(shipstate);
	ord.setSpincode(shipcode);
//	ord.setScountry(shipcountry);
	
	
System.out.println("after list creation");
User user= userDaoImpl.findById(userEmail);
//Orders or=ordersDaoImpl.findByOrderId(userEmail);
List<Cart> cart = cartDaoImpl.findCartById(userEmail);
System.out.println(cart);
ord.setUser(user);
//ord.setTotal(total);
//ord.setPayment(payment);
ordersDaoImpl.insertOrders(ord);
mav.addObject("order", ord);
mav.addObject("cart", cart);
mav.addObject("orderDetails", user);


return mav;
}          











@RequestMapping("/deleteCart/{cartId}")
public ModelAndView deleteCartItem(@PathVariable("cartId") int cartId, HttpServletRequest req)
{

       ModelAndView mv= new ModelAndView("checkout");
       Principal principal = req.getUserPrincipal();
       String userEmail =principal.getName();
       System.out.println("getCartId3");
       
cartDaoImpl.deleteCart(cartId);

System.out.println("getCartId4");
mv.addObject("cartInfo", cartDaoImpl.findCartById(userEmail));
System.out.println("getCartId5");
mv.setViewName("cart");
System.out.println("getCartId6");
return mv;

} 


@RequestMapping("/goToCart")
public ModelAndView showCartItem( HttpServletRequest req)
{
       ModelAndView mv= new ModelAndView();
       Principal principal = req.getUserPrincipal();
       String userEmail =principal.getName();
mv.addObject("cartInfo", cartDaoImpl.findCartById(userEmail));
mv.setViewName("cart");
return mv;

}


@RequestMapping("/Thankyou")
public ModelAndView thankyou( HttpServletRequest req)
 {
              ModelAndView mv= new ModelAndView();
              Principal principal = req.getUserPrincipal();
              String userEmail =principal.getName();
              User user =userDaoImpl.findById(userEmail);
             List<Cart> cart = cartDaoImpl.findCartById(userEmail);
          
             for(Cart cartItem : cart){
             int id = cartItem.getCartId();
             cartDaoImpl.deleteCart(id);
          
             }
   
    mv.setViewName("Thankyou");
    return mv;

 
}



} 
	
