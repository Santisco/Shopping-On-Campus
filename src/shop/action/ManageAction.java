package shop.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import shop.dao.CategoryDao;
import shop.dao.DingdanDao;
import shop.dao.GonggaoDao;
import shop.dao.PicDao;
import shop.dao.PingjiaDao;
import shop.dao.ProductDao;
import shop.dao.UserDao;
import shop.model.Category;
import shop.model.Dingdan;
import shop.model.Gonggao;
import shop.model.Pic;
import shop.model.Pingjia;
import shop.model.Product;
import shop.model.User;
import shop.util.Pager;
import shop.util.Util;

import com.opensymphony.xwork2.ActionSupport;

public class ManageAction extends ActionSupport {

	private static final long serialVersionUID = -4304509122548259589L;

	private UserDao userDao;

	private String url = "./";

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}


	
	
	
//登入请求
	public String login() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = userDao.selectBean(" where username = '" + username
				+ "' and password= '" + password + "'  ");
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			this.setUrl("manage/index.jsp");
			return "redirect";
		} else {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");
			response.setContentType("text/html; charset=gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('用户名或者密码错误');window.location.href='login.jsp';</script>");
		}
		return null;
	}
//用户退出
	public String loginout() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		this.setUrl("login.jsp");
		return SUCCESS;
	}

//修改密码操作
	public void changepwd2() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		User bean = userDao.selectBean(" where username= '"+u.getUsername()+"' and password= '"+password1+"' ");
		if(bean!=null){
			bean.setPassword(password2);
			userDao.updateBean(bean);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('修改成功');window.location.href='password.jsp';</script>");
		}else{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('原密码错误');window.location.href='password.jsp';</script>");
		}
	}
	
	
	private CategoryDao categoryDao;

	public CategoryDao getCategoryDao() {
		return categoryDao;
	}

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
	
	
	//分类列表
	public String categorylist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String catename = request.getParameter("catename");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (catename != null && !"".equals(catename)) {

			sb.append("catename like '%" + catename + "%'");
			sb.append(" and ");
			request.setAttribute("catename", catename);
		}
		

		sb.append("   deletestatus=0 order by id desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = categoryDao.selectBeanCount(where.replaceAll(" order by id desc ", ""));
		request.setAttribute("list", categoryDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "method!categorylist", "共有" + total + "条记录"));
		request.setAttribute("url", "method!categorylist");
		request.setAttribute("url2", "method!category");
		request.setAttribute("title", "分类管理");
		this.setUrl("category/categorylist.jsp");
		return SUCCESS;

	}
//跳转到添加分类页面
	public String categoryadd() {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("url", "method!categoryadd2");
		request.setAttribute("title", "分类添加");
		this.setUrl("category/categoryadd.jsp");
		return SUCCESS;
	}
//添加分类操作
	public void categoryadd2() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String catename = request.getParameter("catename");
		

		Category bean = new Category();
		bean.setCatename(catename);
		
		categoryDao.insertBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!categorylist';</script>");
	}
//跳转到更新分类页面
	public String categoryupdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Category bean = categoryDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("url", "method!categoryupdate2?id="+bean.getId());
		request.setAttribute("title", "分类信息修改");
		this.setUrl("category/categoryupdate.jsp");
		return SUCCESS;
	}
//更新分类操作
	public void categoryupdate2() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String catename = request.getParameter("catename");
		Category bean = categoryDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setCatename(catename);
		categoryDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!categorylist';</script>");
	}
	//删除分类操作
	public void categorydelete() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		Category bean = categoryDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setDeletestatus(1);
		categoryDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!categorylist';</script>");
	}
	
	
	//跳转到查看分类页面
	public String categoryupdate3() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Category bean = categoryDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("title", "分类信息查看");
		this.setUrl("category/categoryupdate3.jsp");
		return SUCCESS;
	}
	
	private ProductDao productDao;

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	
	
	//商品信息列表
	public String productlist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String pname = request.getParameter("pname");
		
		
		request.setAttribute("catelist", categoryDao.selectBeanList(0, 9999, " where deletestatus=0 "));
		String catename = request.getParameter("catename");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (pname != null && !"".equals(pname)) {

			sb.append("pname like '%" + pname + "%'");
			sb.append(" and ");
			request.setAttribute("pname", pname);
		}
		
		if (catename != null && !"".equals(catename)) {

			sb.append("cate.catename like '%" + catename + "%'");
			sb.append(" and ");
			request.setAttribute("catename", catename);
		}
		

		sb.append("   deletestatus=0 order by  tuijian,id desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = productDao.selectBeanCount(where.replaceAll("order by  tuijian,id desc", ""));
		request.setAttribute("list", productDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "method!productlist", "共有" + total + "条记录"));
		request.setAttribute("url", "method!productlist");
		request.setAttribute("url2", "method!product");
		request.setAttribute("title", "商品信息管理");
		this.setUrl("product/productlist.jsp");
		return SUCCESS;

	}
	
	private File uploadfile;
	
	

	public File getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(File uploadfile) {
		this.uploadfile = uploadfile;
	}
	
	
//跳转到添加商品信息页面
	public String productadd() {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("catelist", categoryDao.selectBeanList(0, 9999, " where deletestatus=0 "));
		request.setAttribute("url", "method!productadd2");
		request.setAttribute("title", "商品信息添加");
		this.setUrl("product/productadd.jsp");
		return SUCCESS;
	}
//添加商品信息操作
	public void productadd2() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String cate = request.getParameter("cate");
		String info = request.getParameter("info");
		String kucun = request.getParameter("kucun");
		String pname = request.getParameter("pname");
		String price1 = request.getParameter("price1");
		String price2 = request.getParameter("price2");
		

		Product bean = new Product();
		bean.setCate(categoryDao.selectBean(" where id= "+cate));
		bean.setCreatetime(Util.getTime());
		if(uploadfile!=null){
			String savaPath = ServletActionContext.getServletContext().getRealPath("/")+ "/uploadfile/";

			String time = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new Date()).toString();

			String imgpath = time + ".jpg";
			File file1 = new File(savaPath + imgpath);
			Util.copyFile(uploadfile, file1);
			
			bean.setImgpath(imgpath);
		}
		
		
		bean.setInfo(info);
		bean.setKucun(Integer.parseInt(kucun));
		bean.setPname(pname);
		bean.setPrice1(Double.parseDouble(price1));
		bean.setPrice2(Double.parseDouble(price2));
		bean.setTuijian("未推荐");
	
		
		productDao.insertBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!productlist';</script>");
	}
//跳转到更新商品信息页面
	public String productupdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("catelist", categoryDao.selectBeanList(0, 9999, " where deletestatus=0 "));
		Product bean = productDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("url", "method!productupdate2?id="+bean.getId());
		request.setAttribute("title", "商品信息修改");
		this.setUrl("product/productupdate.jsp");
		return SUCCESS;
	}
//更新商品信息操作
	public void productupdate2() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String cate = request.getParameter("cate");
		String info = request.getParameter("info");
		String pname = request.getParameter("pname");
		String price1 = request.getParameter("price1");
		String price2 = request.getParameter("price2");
		Product bean = productDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setCate(categoryDao.selectBean(" where id= "+cate));
		if(uploadfile!=null){
			String savaPath = ServletActionContext.getServletContext().getRealPath("/")+ "/uploadfile/";

			String time = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new Date()).toString();

			String imgpath = time + ".jpg";
			File file1 = new File(savaPath + imgpath);
			Util.copyFile(uploadfile, file1);
			
			bean.setImgpath(imgpath);
		}
		
		
		bean.setInfo(info);
		bean.setPname(pname);
		bean.setPrice1(Double.parseDouble(price1));
		bean.setPrice2(Double.parseDouble(price2));
		productDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!productlist';</script>");
	}
	//删除商品信息操作
	public void productdelete() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		Product bean = productDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setDeletestatus(1);
		productDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!productlist';</script>");
	}
	
	
	//跳转到查看商品信息页面
	public String productupdate3() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Product bean = productDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("title", "商品信息查看");
		this.setUrl("product/productupdate3.jsp");
		return SUCCESS;
	}
	
	
	//跳转到商品入库页面
	public String productupdate5() {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("catelist", categoryDao.selectBeanList(0, 9999, " where deletestatus=0 "));
		Product bean = productDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("url", "method!productupdate6?id="+bean.getId());
		request.setAttribute("title", "商品入库");
		this.setUrl("product/productupdate5.jsp");
		return SUCCESS;
	}
//商品入库操作
	public void productupdate6() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String sl = request.getParameter("sl");
	
		Product bean = productDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setKucun(bean.getKucun()+Integer.parseInt(sl));
		productDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!productlist';</script>");
	}
	
	
	//推荐商品操作
	public void productdelete2() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		Product bean = productDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setTuijian("推荐");
		productDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!productlist';</script>");
	}
	
	
	//取消商品推荐操作
	public void productdelete3() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		Product bean = productDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setTuijian("未推荐");
		productDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!productlist';</script>");
	}
	
	private GonggaoDao gonggaoDao;

	public GonggaoDao getGonggaoDao() {
		return gonggaoDao;
	}

	public void setGonggaoDao(GonggaoDao gonggaoDao) {
		this.gonggaoDao = gonggaoDao;
	}
	
	
	//商城公告列表
	public String gonggaolist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String biaoti = request.getParameter("biaoti");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (biaoti != null && !"".equals(biaoti)) {

			sb.append("biaoti like '%" + biaoti + "%'");
			sb.append(" and ");
			request.setAttribute("biaoti", biaoti);
		}
		

		sb.append("   1=1 order by id desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = gonggaoDao.selectBeanCount(where.replaceAll(" order by id desc ", ""));
		request.setAttribute("list", gonggaoDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "method!gonggaolist", "共有" + total + "条记录"));
		request.setAttribute("url", "method!gonggaolist");
		request.setAttribute("url2", "method!gonggao");
		request.setAttribute("title", "商城公告管理");
		this.setUrl("gonggao/gonggaolist.jsp");
		return SUCCESS;

	}
//跳转到添加商城公告页面
	public String gonggaoadd() {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("url", "method!gonggaoadd2");
		request.setAttribute("title", "商城公告添加");
		this.setUrl("gonggao/gonggaoadd.jsp");
		return SUCCESS;
	}
//添加商城公告操作
	public void gonggaoadd2() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String biaoti = request.getParameter("biaoti");
		String neirong = request.getParameter("neirong");
		

		Gonggao bean = new Gonggao();
		bean.setBiaoti(biaoti);
		bean.setCreatetime(Util.getTime());
		bean.setNeirong(neirong);
		
		gonggaoDao.insertBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!gonggaolist';</script>");
	}
//跳转到更新商城公告页面
	public String gonggaoupdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Gonggao bean = gonggaoDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("url", "method!gonggaoupdate2?id="+bean.getId());
		request.setAttribute("title", "商城公告信息修改");
		this.setUrl("gonggao/gonggaoupdate.jsp");
		return SUCCESS;
	}
//更新商城公告操作
	public void gonggaoupdate2() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String biaoti = request.getParameter("biaoti");
		String neirong = request.getParameter("neirong");
		Gonggao bean = gonggaoDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setBiaoti(biaoti);
		bean.setNeirong(neirong);
		gonggaoDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!gonggaolist';</script>");
	}
	//删除商城公告操作
	public void gonggaodelete() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		Gonggao bean = gonggaoDao.selectBean(" where id= "
				+ request.getParameter("id"));
		
		gonggaoDao.deleteBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!gonggaolist';</script>");
	}
	
	
	//跳转到查看商城公告页面
	public String gonggaoupdate3() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Gonggao bean = gonggaoDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("title", "商城公告信息查看");
		this.setUrl("gonggao/gonggaoupdate3.jsp");
		return SUCCESS;
	}
	
	private PicDao picDao;

	public PicDao getPicDao() {
		return picDao;
	}

	public void setPicDao(PicDao picDao) {
		this.picDao = picDao;
	}
	
	
	//首页图片列表
	public String piclist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer sb = new StringBuffer();
		sb.append(" where 1=1 order by id desc");
		String where = sb.toString();

		request.setAttribute("list", picDao.selectBeanList(0, 9999, where));
		this.setUrl("pic/piclist.jsp");
		return SUCCESS;

	}

//跳转到更新首页图片页面
	public String picupdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Pic bean = picDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("url", "method!picupdate2.action?id="+bean.getId());
		request.setAttribute("title", "首页图片信息修改");
		this.setUrl("pic/picupdate.jsp");
		return SUCCESS;
	}
//更新首页图片操作
	public void picupdate2() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String info = request.getParameter("info");
		
		
		
		Pic bean = picDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setInfo(info);
		if(uploadfile!=null){
			String savaPath = ServletActionContext.getServletContext().getRealPath(
			"/")
			+ "/uploadfile/";
			String time = new java.text.SimpleDateFormat("yyyyMMddHHmmss")
			.format(new Date()).toString();

			String path = time + ".jpg";
			File file1 = new File(savaPath + path);
			Util.copyFile(uploadfile, file1);
			bean.setPath(path);
		}
		
		picDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!piclist.action';</script>");
	}
	
	
	private DingdanDao dingdanDao;

	public DingdanDao getDingdanDao() {
		return dingdanDao;
	}

	public void setDingdanDao(DingdanDao dingdanDao) {
		this.dingdanDao = dingdanDao;
	}
	
	
	//订单列表
	public String dingdanlist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String orderid = request.getParameter("orderid");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (orderid != null && !"".equals(orderid)) {

			sb.append("orderid like '%" + orderid + "%'");
			sb.append(" and ");
			request.setAttribute("orderid", orderid);
		}
		

		sb.append("   1=1 order by status desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = dingdanDao.selectBeanCount(where.replaceAll(" order by status desc ", ""));
		request.setAttribute("list", dingdanDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "method!dingdanlist", "共有" + total + "条记录"));
		request.setAttribute("url", "method!dingdanlist");
		request.setAttribute("url2", "method!dingdan");
		request.setAttribute("title", "订单管理");
		this.setUrl("dingdan/dingdanlist.jsp");
		return SUCCESS;

	}

	//处理订单操作
	public void dingdandelete() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		Dingdan bean = dingdanDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setStatus("已处理");
		dingdanDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!dingdanlist';</script>");
	}
	
	
	//跳转到查看订单页面
	public String dingdanupdate3() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Dingdan bean = dingdanDao.selectBean(" where id= "
				+ request.getParameter("id"));
		request.setAttribute("bean", bean);
		request.setAttribute("title", "订单信息查看");
		this.setUrl("dingdan/dingdanupdate3.jsp");
		return SUCCESS;
	}
	
	
	//评价管理列表
	public String productlist2() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String pname = request.getParameter("pname");
		
		
		request.setAttribute("catelist", categoryDao.selectBeanList(0, 9999, " where deletestatus=0 "));
		String catename = request.getParameter("catename");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (pname != null && !"".equals(pname)) {

			sb.append("pname like '%" + pname + "%'");
			sb.append(" and ");
			request.setAttribute("pname", pname);
		}
		
		if (catename != null && !"".equals(catename)) {

			sb.append("cate.catename like '%" + catename + "%'");
			sb.append(" and ");
			request.setAttribute("catename", catename);
		}
		

		sb.append("   deletestatus=0 order by  tuijian,id desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = productDao.selectBeanCount(where.replaceAll("order by  tuijian,id desc", ""));
		request.setAttribute("list", productDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "method!productlist2", "共有" + total + "条记录"));
		request.setAttribute("url", "method!productlist2");
		request.setAttribute("url2", "method!product");
		request.setAttribute("title", "评价管理");
		this.setUrl("product/productlist2.jsp");
		return SUCCESS;

	}
	
	private PingjiaDao pingjiaDao;
	
	public PingjiaDao getPingjiaDao() {
		return pingjiaDao;
	}

	public void setPingjiaDao(PingjiaDao pingjiaDao) {
		this.pingjiaDao = pingjiaDao;
	}

	//评价列表
	public String pingjialist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String pingjia = request.getParameter("pingjia");
		
		String pid = request.getParameter("pid");
		request.setAttribute("pid", pid);
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (pingjia != null && !"".equals(pingjia)) {

			sb.append("pingjia like '%" + pingjia + "%'");
			sb.append(" and ");
			request.setAttribute("pingjia", pingjia);
		}
		

		sb.append("   product.id="+pid+" order by id desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = pingjiaDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		request.setAttribute("list", pingjiaDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "method!pingjialist", "共有" + total + "条记录"));
		request.setAttribute("url", "method!pingjialist");
		request.setAttribute("url2", "method!pingjia");
		request.setAttribute("title", "评价管理");
		this.setUrl("pingjia/pingjialist.jsp");
		return SUCCESS;

	}

	//删除评价操作
	public void pingjiadelete() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		Pingjia bean = pingjiaDao.selectBean(" where id= "
				+ request.getParameter("id"));
		int pid = bean.getProduct().getId();
		String pingjia = bean.getPingjia();
		pingjiaDao.deleteBean(bean);
		Product p = productDao.selectBean("  where id= "+pid);
		
		if("好评".equals(pingjia)){
			p.setHaoping(p.getHaoping()-1);
			
		}else if("中评".equals(pingjia)){
			
			p.setZhongping(p.getZhongping()-1);
		}else if("差评".equals(pingjia)){
			p.setChaping(p.getChaping()-1);
		}
		productDao.updateBean(p);
		
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!pingjialist?pid="+pid+"';</script>");
	}
	
	
	
	//注册用户列表
	public String userlist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = request.getParameter("username");
		
	
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (username != null && !"".equals(username)) {

			sb.append("username like '%" + username + "%'");
			sb.append(" and ");
			request.setAttribute("username", username);
		}
		

		sb.append("   role=2  order by id desc ");
		String where = sb.toString();


		int currentpage = 1;
		int pagesize = 10;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		int total = userDao.selectBeanCount(where.replaceAll("order by id desc", ""));
		request.setAttribute("list", userDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "method!userlist", "共有" + total + "条记录"));
		request.setAttribute("url", "method!userlist");
		request.setAttribute("url2", "method!user");
		request.setAttribute("title", "注册用户管理");
		this.setUrl("user/userlist.jsp");
		return SUCCESS;

	}

	//停用注册用户操作
	public void userdelete() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		User bean = userDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setDeletestatus(1);
		userDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!userlist';</script>");
	}
	
	//启用注册用户操作
	public void userdelete2() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		User bean = userDao.selectBean(" where id= "
				+ request.getParameter("id"));
		bean.setDeletestatus(0);
		userDao.updateBean(bean);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
		response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='method!userlist';</script>");
	}
	
}
