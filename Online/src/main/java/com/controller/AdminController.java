package com.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.DaoImpl.CatDaoImpl;
import com.DaoImpl.ProDaoImpl;
import com.DaoImpl.SupDaoImpl;
import com.Model.Category;
import com.Model.Product;
import com.Model.Supplier;


	@Controller
	@RequestMapping("/admin")
	public class AdminController {
		
		@Autowired
		CatDaoImpl catDaoImpl;
		
		@Autowired
		ProDaoImpl proDaoImpl;
		
		@Autowired
		SupDaoImpl supDaoImpl;
	
	
	@RequestMapping("/adding")
	public String addPage()
	{  return "Adding";  }
	
	
/*	@RequestMapping(value="/category", method = RequestMethod.GET) 
	public ModelAndView category() {
		ModelAndView mav= new ModelAndView();
		mav.addObject("cat", new Category());
		mav.setViewName("AddCategory");
		return mav;
		}

	@RequestMapping(value="/savecategory", method = RequestMethod.POST) 
	public ModelAndView savecat(@ModelAttribute("cat") Category cat, BindingResult result) {
		ModelAndView mav= new ModelAndView();
		catDaoImpl.insertCategory(cat);
		mav.setViewName("redirect:/index");
		return mav;
	}*/


	@RequestMapping(value="/savecategory", method = RequestMethod.POST) 
	@Transactional
	public ModelAndView savecat(@RequestParam("cid") int cid, @RequestParam("name") String name) {
		ModelAndView mav= new ModelAndView();
		Category c = new Category();
		c.setCid(cid);
		c.setName(name);
		catDaoImpl.insertCategory(c);
		mav.setViewName("index");
		return mav;
	}
	
	
	@RequestMapping(value="/savesupplier", method = RequestMethod.POST) 
	@Transactional
	public ModelAndView savesup(@RequestParam("sid") int sid, @RequestParam("suppliername") String name) {
		ModelAndView mav= new ModelAndView();
		Supplier s = new Supplier();
		s.setSid(sid);
		s.setSuppliername(name);
		supDaoImpl.insertSupplier(s);
		mav.setViewName("index");
		return mav;
	}
	
	/*@RequestMapping(value="/supplier", method = RequestMethod.GET) 
	public ModelAndView supplier() {
		ModelAndView mav= new ModelAndView();
		mav.addObject("sup", new Supplier());
		mav.setViewName("AddSupplier");
		return mav;
		}

	@RequestMapping(value="/savesupplier", method = RequestMethod.POST) 
	public ModelAndView savesup(@ModelAttribute("sup") Supplier sup, BindingResult result) {
		ModelAndView mav= new ModelAndView();
		supDaoImpl.insertSupplier(sup);
		mav.setViewName("redirect:/index");
		return mav;
		
	}*/
	
/*	@RequestMapping(value="/product", method = RequestMethod.GET) 
	public ModelAndView product() {
		ModelAndView mav= new ModelAndView();
		mav.addObject("pro", new Product());
		mav.setViewName("AddProduct");
		return mav;
		}

	@RequestMapping(value="/addproduct", method = RequestMethod.POST) 
	public ModelAndView savepro(@ModelAttribute("pro") Product pro, BindingResult result) {
		ModelAndView mav= new ModelAndView();
		proDaoImpl.insertProduct(pro);
		mav.setViewName("redirect:/index");
		return mav;
		}*/
	
	
	@ModelAttribute
	public void addAttributes(Model m)
	{
	m.addAttribute("catList",catDaoImpl.retrieve());
	m.addAttribute("produList",proDaoImpl.retrieve());
	m.addAttribute("supList",supDaoImpl.retrieve());
	}
	
	
	@RequestMapping(value="/addproduct", method = RequestMethod.POST) 
	public String addproduct(HttpServletRequest request, @RequestParam("file") MultipartFile file)
  {
	  Product pro=new Product();
	  pro.setName(request.getParameter("pName"));
	  pro.setDescription(request.getParameter("pDescription"));
	  pro.setPrice(Float.parseFloat(request.getParameter("pPrice")));
	  pro.setStock(Integer.parseInt(request.getParameter("pStock")));
	  pro.setCat(catDaoImpl.findById(Integer.parseInt(request.getParameter("pCategory"))));
	  pro.setSup(supDaoImpl.findById(Integer.parseInt(request.getParameter("pSupplier"))));
	  String filepath=request.getSession().getServletContext().getRealPath("/");
	  String filename= file.getOriginalFilename();
	  pro.setImgname(filename);
	  proDaoImpl.insertProduct(pro);
	  System.out.println("File path File" + filepath + " " + filename);
	try
	{
		byte imagebyte[] = file.getBytes();
		BufferedOutputStream fos = new BufferedOutputStream (new FileOutputStream(filepath+ "/resources/" + filename));
				
				fos.write(imagebyte);
		fos.close();
				
						
				} catch(IOException e)  {
				e.printStackTrace();
	} catch(Exception e)  
	{
		e.printStackTrace();
	}
				return "ProductList";
	   
		}
	
	@RequestMapping(value="/productUpdate", method = RequestMethod.POST) 
	public ModelAndView editProduct(HttpServletRequest request, @RequestParam("file") MultipartFile file)
  {    ModelAndView mv = new ModelAndView();
    
      
      int pid = (Integer.parseInt(request.getParameter("pid")));
      String pName = request.getParameter("pName");
      String pDesc = request.getParameter("pDescription");
      String pPrice = request.getParameter("pPrice");
      String pStock = request.getParameter("pStock");
      String pCategory = request.getParameter("pCategory");
      String pSupplier = request.getParameter("pSupplier");
  
  
	  Product pro2=new Product();
	  pro2.setPid(pid);
	  pro2.setName(pName);
	  pro2.setDescription(pDesc);
	  pro2.setPrice(Float.parseFloat(pPrice));
	  pro2.setStock(Integer.parseInt(pStock));
	  pro2.setCat(catDaoImpl.findById(Integer.parseInt(pCategory)));
	  pro2.setSup(supDaoImpl.findById(Integer.parseInt(pSupplier)));
	  String filepath=request.getSession().getServletContext().getRealPath("/");
	  String filename= file.getOriginalFilename();
	  pro2.setImgname(filename);
	  proDaoImpl.updateProduct(pro2);
	  System.out.println("File path File" + filepath + " " + filename);
	try
	{
		byte imagebyte[] = file.getBytes();
		BufferedOutputStream fos = new BufferedOutputStream (new FileOutputStream(filepath+"/resources/" + filename));
				
				fos.write(imagebyte);
		fos.close();
				
						
				} catch(IOException e)  {
				e.printStackTrace();
	} catch(Exception e)  
	{
		e.printStackTrace();
	}
	    mv.setViewName("redirect:/admin/productList?update");
				return mv;
	   
		}
	
	@RequestMapping("/updateProduct")
	public ModelAndView updatePro(@RequestParam("pid") int pid)
	{
		ModelAndView mv= new ModelAndView();
	
		Product p = proDaoImpl.findById(pid);
		mv.addObject("produ", p);
		mv.addObject("catList", catDaoImpl.retrieve());
	    mv.addObject("supList", supDaoImpl.retrieve());
        mv.setViewName("updateProduct");
		return mv;
	}
	
	
	@RequestMapping("/productList")
	public ModelAndView ProductList () {
		ModelAndView mav = new ModelAndView();
		mav.addObject("ProductList", proDaoImpl.retrieve());
		mav.setViewName("ProductList");
		return mav;
	}
	
	@RequestMapping("/deleteProduct{pid}")
	public String deleteProduct(@PathVariable("pid") int pid) 
	{
	  proDaoImpl.deleteProduct(pid);
	  return "redirect:/admin/productList?del";
	}
	

	




	}



