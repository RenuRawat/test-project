package com.controller;


import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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



@RequestMapping(value="/invoiceprocess", method = RequestMethod.GET) 

public ModelAndView orderSave(HttpServletRequest req)
 {
	ModelAndView mav= new ModelAndView("invoice");
	Orders ord=new Orders();
	Principal principal = req.getUserPrincipal();
	
	String userEmail = principal.getName();
	
	String payment= (req.getParameter("payment"));
	
 	//Double total=(Double.parseDouble(req.getParameter("total")));
     
	User user= userDaoImpl.findById(userEmail);
	
	ord.setUser(user);
	//ord.setTotal(total);
	ord.setPayment(payment);
	
    ordersDaoImpl.insertOrders(ord);
   
    mav.addObject("orderDetails", user);
    mav.setViewName("invoice");

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
} 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/*	@Autowired
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
		   mav.setViewName("mycart");
		   
		   
		   return mav;
	     }
	      catch(Exception e)
	   {
	    	  mav.setViewName("mycart");
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
		
		String payment= (req.getParameter("payment"));
		
     	Double total=(Double.parseDouble(req.getParameter("total")));
	     
		User user= userDaoImpl.findById(userEmail);
		
		ord.setUser(user);
		ord.setTotal(total);
		ord.setPayment(payment);
		
        ordersDaoImpl.insertOrders(ord);
       
        mav.addObject("orderDetails", user);
       

        return mav;
	 }
        




@RequestMapping(value="/checkout", method = RequestMethod.GET) 
    public ModelAndView checkoutProcess(HttpServletRequest req)
    {   
	ModelAndView mav= new ModelAndView("checkout");
	Principal principal = req.getUserPrincipal();
	String userEmail = principal.getName();
	
	User user=userDaoImpl.findById(userEmail);
	System.out.println("getcode1");
	List<Cart> cart = cartDaoImpl.findCartById(userEmail);
	System.out.println("getcode2");
	mav.addObject("user", user);
	mav.addObject("cart", cart);
	
 
    
    
for (Cart cartItem : cart) {
	
int pid=cartItem.getCartProductID();
Product prod=proDaoImpl.findById(pid);
int quantity=cartItem.getCartQuantity();
int pStock=prod.getStock();

if(pStock==quantity) {
	prod.setStock(0);
}
if(pStock!=quantity) {
	prod.setStock(pStock-quantity);
}
  proDaoImpl.updateProduct(prod);

}

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
       mv.setViewName("mycart");
       return mv;
    }     
   
   public void deleteCartItem(String strItemIndex) {
	   int iItemIndex = 0;
	   try {
	    iItemIndex = Integer.parseInt(strItemIndex);
	    alCartItems.remove(iItemIndex - 1);
	    OrderTotal();
	   } catch(NumberFormatException e) {
	    System.out.println("Error while deleting cart item: "+e.getMessage());
	    e.printStackTrace();
	   }
	  }

   
   @RequestMapping(value="/goToCart", method=RequestMethod.GET)
   public ModelAndView goToCart(HttpServletRequest req) 
    {
	   ModelAndView mv= new ModelAndView();
	   Principal principal = req.getUserPrincipal();
	   String userEmail =principal.getName();  
	   mv.addObject("cartInfo", cartDaoImpl.findCartById(userEmail));
	   mv.setViewName("mycart");
	   return mv;
    }
 }*/

