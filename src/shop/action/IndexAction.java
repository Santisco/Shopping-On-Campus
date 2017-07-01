package shop.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import shop.dao.DingdanDao;
import shop.dao.GonggaoDao;
import shop.dao.GouwucheDao;
import shop.dao.PingjiaDao;
import shop.dao.ProductDao;
import shop.dao.ShouhuoDao;
import shop.dao.UserDao;
import shop.model.Dingdan;
import shop.model.Gonggao;
import shop.model.Gouwuche;
import shop.model.Pingjia;
import shop.model.Product;
import shop.model.Shouhuo;
import shop.model.User;
import shop.util.Pager;
import shop.util.Util;

import com.opensymphony.xwork2.ActionSupport;






public class IndexAction extends ActionSupport {

	private static final long serialVersionUID = -4304509122548259589L;
	
	
	
	private String url = "./";
	
	

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	private ProductDao productDao;
	
	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	//网站首页
	public String index() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String pname = request.getParameter("pname");
		String cateid = request.getParameter("cateid");
		
		String type = request.getParameter("type");
		
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		if (cateid != null && !"".equals(cateid)) {

			sb.append(" cate.id= "+cateid);
			sb.append(" and ");
		
		}
		
		if (pname != null && !"".equals(pname)) {

			sb.append("pname like '%" + pname + "%'");
			sb.append(" and ");
			request.setAttribute("pname", pname);
		}
		
		
		if("1".equals(type)){
			sb.append("   deletestatus=0 order by  tuijian ,id desc ");
		}else if("2".equals(type)){
			sb.append("   deletestatus=0 order by  id desc ");
		}else if("3".equals(type)){
			sb.append("   deletestatus=0 order by  xiaoliang desc ");
		}else {
			sb.append("   deletestatus=0  ");
		}
		
		
		String where = sb.toString();
		int total = 0;
		if("1".equals(type)){
			total = productDao.selectBeanCount(where.replaceAll("order by  tuijian ,id desc", ""));
		}else if("2".equals(type)){
			total = productDao.selectBeanCount(where.replaceAll("order by  id desc", ""));
		}else if("3".equals(type)){
			total = productDao.selectBeanCount(where.replaceAll("order by  xiaoliang desc", ""));
		}else {
			total = productDao.selectBeanCount(where);
		}


		int currentpage = 1;
		int pagesize = 9;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		
		request.setAttribute("list", productDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "index.action", "共有" + total + "条记录"));
		
		return "success";
	}
	
	
	//跳转到查看产品详细信息页面
	public String product() {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		
		Product product = productDao.selectBean(" where id= "+request.getParameter("id"));
		request.setAttribute("product", product);
		
		
		this.setUrl("product.jsp");
		return SUCCESS;
	}
	
	private GonggaoDao gonggaoDao;
	
	
	public GonggaoDao getGonggaoDao() {
		return gonggaoDao;
	}

	public void setGonggaoDao(GonggaoDao gonggaoDao) {
		this.gonggaoDao = gonggaoDao;
	}

	//跳转到查看商城公告页面
	public String gonggaolist() {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		
	
		
		StringBuffer sb = new StringBuffer();
		sb.append(" where ");

		sb.append("   0=0 order by  id desc ");
		
		
		String where = sb.toString();
		int total = gonggaoDao.selectBeanCount(where.replaceAll("order by  id desc", ""));
		


		int currentpage = 1;
		int pagesize = 9;
		if (request.getParameter("pagenum") != null) {
			currentpage = Integer.parseInt(request.getParameter("pagenum"));
		}
		
		request.setAttribute("list", gonggaoDao.selectBeanList((currentpage - 1)
				* pagesize, pagesize, where));
		request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
				currentpage, "index.action", "共有" + total + "条记录"));
		
		
		this.setUrl("gonggaolist.jsp");
		return SUCCESS;
	}
	
	
	//跳转到查看公告信息页面
	public String gonggao() {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		
		Gonggao gonggao = gonggaoDao.selectBean(" where id= "+request.getParameter("id"));
		request.setAttribute("gonggao", gonggao);
		
		
		this.setUrl("gonggao.jsp");
		return SUCCESS;
	}
	
	
	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	//用户注册操作
	public void register() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html; charset=gbk");
		
		String username = request.getParameter("username");
		
		User bean = userDao.selectBean(" where username='"+username+"'  ");
		
		if(bean!=null){
			
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('该用户名已经存在，注册失败');window.location.href='register.jsp';</script>");

			return;
		}
		bean = new User();
		String password = request.getParameter("password");
		String truename = request.getParameter("truename");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		bean.setAddress(address);
		bean.setCreatetime(Util.getTime());
		bean.setPassword(password);
		bean.setPhone(phone);
		bean.setRole(2);
		bean.setTruename(truename);
		bean.setUsername(username);
		userDao.insertBean(bean);
		Shouhuo sh = new Shouhuo();
		sh.setAddress(address);
		sh.setPhone(phone);
		sh.setTruename(truename);
		sh.setUser(bean);
		shouhuoDao.insertBean(sh);
		
		response
		.getWriter()
		.print(
				"<script language=javascript>alert('注册成功');window.location.href='login.jsp';</script>");


		
	}
	
	
	
	//用户登录
		public String login() throws IOException {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");
			response.setContentType("text/html; charset=gbk");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			User user = userDao.selectBean(" where username = '" + username
					+ "' and password= '" + password + "' and deletestatus=0 and role=2 ");
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("shop", user);
				response
				.getWriter()
				.print(
						"<script language=javascript>alert('登录成功');window.location.href='ShopIndex.jsp';</script>");
			} else {
				response
						.getWriter()
						.print(
								"<script language=javascript>alert('用户名或者密码错误或者账户已停用');window.location.href='login.jsp';</script>");
			}
			return null;
		}
	//用户退出
		public void loginout() throws IOException {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");
			response.setContentType("text/html; charset=gbk");
			HttpSession session = request.getSession();
			session.removeAttribute("shop");
			response
			.getWriter()
			.print(
					"<script language=javascript>alert('退出成功');window.location.href='ShopIndex.jsp';</script>");
		}
		
		
		
		//跳转到我的信息页面
		public String userupdate() {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("shop");

			User bean = userDao.selectBean(" where id= "+ user.getId());
			request.setAttribute("bean", bean);
			this.setUrl("userupdate.jsp");
			return SUCCESS;
		}
	//修改我的信息操作
		public void userupdate2() throws IOException {
			HttpServletRequest request = ServletActionContext.getRequest();
			String address = request.getParameter("address");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String truename = request.getParameter("truename");
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("shop");
			User bean = userDao.selectBean(" where id= "+ user.getId());
			bean.setAddress(address);
			bean.setPassword(password);
			bean.setPhone(phone);
			bean.setTruename(truename);
			userDao.updateBean(bean);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('操作成功');window.location.href='indexmethod!userupdate';</script>");
		}
	
		
		private ShouhuoDao shouhuoDao;



		public ShouhuoDao getShouhuoDao() {
			return shouhuoDao;
		}

		public void setShouhuoDao(ShouhuoDao shouhuoDao) {
			this.shouhuoDao = shouhuoDao;
		}
		
		
		
		//收货信息列表
		public String shouhuolist() {
			HttpServletRequest request = ServletActionContext.getRequest();
			
			
			
			StringBuffer sb = new StringBuffer();
			sb.append(" where ");
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("shop");

			sb.append("   user.id="+user.getId()+" order by id desc ");
			String where = sb.toString();


			int currentpage = 1;
			int pagesize = 10;
			if (request.getParameter("pagenum") != null) {
				currentpage = Integer.parseInt(request.getParameter("pagenum"));
			}
			int total = shouhuoDao.selectBeanCount(where.replaceAll(" order by id desc ", ""));
			request.setAttribute("list", shouhuoDao.selectBeanList((currentpage - 1)
					* pagesize, pagesize, where));
			request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
					currentpage, "indexmethod!shouhuolist", "共有" + total + "条记录"));
			request.setAttribute("url", "indexmethod!shouhuolist");
			request.setAttribute("url2", "indexmethod!shouhuo");
			this.setUrl("shouhuolist.jsp");
			return SUCCESS;

		}
	//跳转到添加收货信息页面
		public String shouhuoadd() {
			this.setUrl("shouhuoadd.jsp");
			return SUCCESS;
		}
	//添加收货信息操作
		public void shouhuoadd2() throws IOException {
			HttpServletRequest request = ServletActionContext.getRequest();
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String truename = request.getParameter("truename");
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("shop");
			Shouhuo bean = new Shouhuo();
			bean.setAddress(address);
			bean.setPhone(phone);
			bean.setTruename(truename);
			bean.setUser(user);
			
			
			shouhuoDao.insertBean(bean);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('操作成功');window.location.href='indexmethod!shouhuolist';</script>");
		}
	//跳转到更新收货信息页面
		public String shouhuoupdate() {
			HttpServletRequest request = ServletActionContext.getRequest();
			Shouhuo bean = shouhuoDao.selectBean(" where id= "
					+ request.getParameter("id"));
			request.setAttribute("bean", bean);
			request.setAttribute("url", "indexmethod!shouhuoupdate2?id="+bean.getId());
		
			this.setUrl("shouhuoupdate.jsp");
			return SUCCESS;
		}
	//更新收货信息操作
		public void shouhuoupdate2() throws IOException {
			HttpServletRequest request = ServletActionContext.getRequest();
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String truename = request.getParameter("truename");
			Shouhuo bean = shouhuoDao.selectBean(" where id= "
					+ request.getParameter("id"));
			bean.setAddress(address);
			bean.setPhone(phone);
			bean.setTruename(truename);
			shouhuoDao.updateBean(bean);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('操作成功');window.location.href='indexmethod!shouhuolist';</script>");
		}
		//删除收货信息操作
		public void shouhuodelete() throws IOException {
			HttpServletRequest request = ServletActionContext.getRequest();
			Shouhuo bean = shouhuoDao.selectBean(" where id= "
					+ request.getParameter("id"));
			
			shouhuoDao.deleteBean(bean);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('操作成功');window.location.href='indexmethod!shouhuolist';</script>");
		}
		
		private GouwucheDao  gouwucheDao;



		public GouwucheDao getGouwucheDao() {
			return gouwucheDao;
		}

		public void setGouwucheDao(GouwucheDao gouwucheDao) {
			this.gouwucheDao = gouwucheDao;
		}
	
		
		//购物车列表
		public String gouwuchelist() {
			HttpServletRequest request = ServletActionContext.getRequest();
			
			
			
			StringBuffer sb = new StringBuffer();
			sb.append(" where ");
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("shop");

			sb.append("   user.id="+user.getId()+" order by id desc ");
			String where = sb.toString();


			int currentpage = 1;
			int pagesize = 9999;
			if (request.getParameter("pagenum") != null) {
				currentpage = Integer.parseInt(request.getParameter("pagenum"));
			}
			List<Gouwuche> list =  gouwucheDao.selectBeanList((currentpage - 1)* pagesize, pagesize, where);
			request.setAttribute("list",list );

			double zongjia = 0;
			for(Gouwuche bean:list){
				double jiage1 = bean.getSl()*bean.getProduct().getPrice2();
				zongjia  = zongjia + jiage1;
			}
			request.setAttribute("zongjia", zongjia);
			this.setUrl("gouwuchelist.jsp");
			return SUCCESS;

		}
		
		
		
		//添加到购物车操作
		public void gouwucheadd() throws IOException {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("shop");
			if(user==null){
				
				response
				.getWriter()
				.print(
						"<script language=javascript>alert('请先登录');window.location.href='login.jsp';</script>");
				return;
			}
			
			String pid = request.getParameter("id");
			Product p = productDao.selectBean(" where id= "+pid);
			
			if(p.getKucun()<=0){
				response
				.getWriter()
				.print(
						"<script language=javascript>alert('商品库存不够，添加失败！');window.location.href='indexmethod!product?id="+pid+"';</script>");
				return;
			}
			
			
			Gouwuche bean = gouwucheDao.selectBean(" where product.id= "+pid +" and user.id= "+user.getId());
			if(bean==null){
				bean = new Gouwuche();
				bean.setCreatetime(Util.getTime());
				bean.setSl(1);
				bean.setUser(user);
				bean.setProduct(p);
				gouwucheDao.insertBean(bean);
				response
				.getWriter()
				.print(
						"<script language=javascript>alert('操作成功');window.location.href='indexmethod!gouwuchelist';</script>");
			}else{
				response
				.getWriter()
				.print(
						"<script language=javascript>alert('该商品已经存在购物车中，请勿重复添加！');window.location.href='indexmethod!product?id="+pid+"';</script>");
			}

		}
		
		//删除购物车中的商品操作
		public void gouwuchedelete() throws IOException {
			HttpServletRequest request = ServletActionContext.getRequest();
			Gouwuche bean = gouwucheDao.selectBean(" where id= "
					+ request.getParameter("id"));
			
			gouwucheDao.deleteBean(bean);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('操作成功');window.location.href='indexmethod!gouwuchelist';</script>");
		}
		
		
		//修改购物车的商品数量的操作
		public void gouwucheupdate() throws IOException{
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			String sl = request.getParameter("sl");
			Gouwuche gouwuche = gouwucheDao.selectBean(" where id= "+request.getParameter("id"));
			
			Product p = productDao.selectBean(" where id= "+gouwuche.getProduct().getId());
			
			if(p.getKucun()<Integer.parseInt(sl)){
				response
				.getWriter()
				.print(
						"<script language=javascript>alert('商品库存不够，添加失败！该商品库存还剩"+p.getKucun()+"');window.location.href='indexmethod!gouwuchelist';</script>");
				return;
			}
			
			gouwuche.setSl(Integer.parseInt(sl));

			gouwucheDao.updateBean(gouwuche);
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('操作成功');" +"window.location.href='indexmethod!gouwuchelist'; </script>");
				
			
		}
		
		private DingdanDao dingdanDao;



		public DingdanDao getDingdanDao() {
			return dingdanDao;
		}

		public void setDingdanDao(DingdanDao dingdanDao) {
			this.dingdanDao = dingdanDao;
		}
		
		
		//跳转到客户填写收件信息页面
		public String dingdanadd(){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("shop");
			List<Shouhuo> list = shouhuoDao.selectBeanList(0, 9999, " where user.id=  "+user.getId());
			request.setAttribute("list", list);
			
			
			request.setAttribute("url", "indexmethod!dingdanadd2");
			this.setUrl("dingdanadd.jsp");
			return SUCCESS;
		}
		
		
		//添加订单操作
		public void dingdanadd2() throws IOException{
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			String sid = request.getParameter("sid");
			Shouhuo sh = shouhuoDao.selectBean(" where id= "+sid);
			
			String beizhu = request.getParameter("beizhu");
			String phone = sh.getPhone();
			String sjname = sh.getTruename();
			String address = sh.getAddress();
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("shop");
			Dingdan bean = new Dingdan();
			bean.setAddress(address);
			bean.setBeizhu(beizhu);
			bean.setCreatetime(new Date());
		    bean.setDeletestatus(0);
			bean.setOrderid(new Date().getTime()+"");
			bean.setPhone(phone);
			bean.setSjname(sjname);
			bean.setStatus("未处理");
			bean.setUser(user);
			
			
			List<Gouwuche> list = gouwucheDao.selectBeanList(0, 9999, " where user.id="+user.getId());
			StringBuffer sb = new StringBuffer();
			double zongjia = 0;
			for(Gouwuche g:list){
				sb.append(" 商品名： "+g.getProduct().getPname() +",购买数量:"+g.getSl()  +",单价"+g.getProduct().getPrice2() 
						+",￥小计"+ (g.getSl()*g.getProduct().getPrice2()) );
				
				Product product = g.getProduct();
				product.setXiaoliang(g.getProduct().getXiaoliang()+g.getSl());
				product.setKucun(product.getKucun()-g.getSl());
				productDao.updateBean(product);
				gouwucheDao.deleteBean(g);
				
				zongjia = zongjia+(g.getSl()*g.getProduct().getPrice2());
				
				Pingjia pj = new Pingjia();
				pj.setOrderid(bean.getOrderid());
				pj.setProduct(product);
				pj.setUser(user);
				pingjiaDao.insertBean(pj);
				
				
			}
			bean.setXiangqing(sb.toString());
			bean.setZongjia(zongjia);
			dingdanDao.insertBean(bean);
			
			response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("<script  language='javascript'>alert('操作成功');window.location.href='indexmethod!dingdanlist'; </script>");
			
		}
		
		//查看订单列表
		public String dingdanlist() throws IOException{
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("shop");
			if (user == null) {
				response.setCharacterEncoding("utf-8");response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer
						.print("<script  language='javascript'>alert('请先登录');window.location.href='index'; </script>");
				return null ;
			}
			String name = request.getParameter("name");
			StringBuffer sb = new StringBuffer();
			sb.append(" where ");

			if(name !=null &&!"".equals(name)){
				sb.append(" gouwuche.product.name like '%"+name+"%' ");
				sb.append(" and ");

				request.setAttribute("name", name);
			}

			
			sb.append(" user.id="+user.getId()+" and deletestatus=0 order by id desc ");

			String where = sb.toString();


			int currentpage = 1;
			int pagesize = 10;
			if(request.getParameter("pagenum") != null){
				currentpage = Integer.parseInt(request.getParameter("pagenum"));
			}
			
			long total = dingdanDao.selectBeanCount(where.replaceAll("order by id desc", ""));
			List<Dingdan> list = dingdanDao.selectBeanList((currentpage-1)*pagesize, pagesize, where);
			request.setAttribute("list", list);
			String pagerinfo = Pager.getPagerNormal((int)total, pagesize, currentpage, "indexmethod!dingdanlist", "共有"+total+"条记录");
			request.setAttribute("pagerinfo", pagerinfo);
		
			request.setAttribute("list", list);
			request.setAttribute("url", "indexmethod!dingdanlist");
			request.setAttribute("url2", "indexmethod!dingdan");
			request.setAttribute("title", "订单列表");
			this.setUrl("dingdanlist.jsp");
			return SUCCESS;
		}
		
		//跳转到订单详细信息页面
		public String dingdanupdate3(){
			HttpServletRequest request = ServletActionContext.getRequest();

			String id = request.getParameter("id");
			Dingdan bean =dingdanDao.selectBean(" where id= "+id );
			request.setAttribute("bean", bean);
			this.setUrl("dingdanupdate3.jsp");
			return SUCCESS;
		}
		
		
		private PingjiaDao pingjiaDao;



		public PingjiaDao getPingjiaDao() {
			return pingjiaDao;
		}

		public void setPingjiaDao(PingjiaDao pingjiaDao) {
			this.pingjiaDao = pingjiaDao;
		}
		
		
		
		//商品评价列表
		public String pingjialist() {
			HttpServletRequest request = ServletActionContext.getRequest();
			
			String orderid = request.getParameter("orderid");
			
			StringBuffer sb = new StringBuffer();
			sb.append(" where ");
			

			sb.append("   orderid='"+orderid+"' order by id desc ");
			String where = sb.toString();


			int currentpage = 1;
			int pagesize = 10;
			if (request.getParameter("pagenum") != null) {
				currentpage = Integer.parseInt(request.getParameter("pagenum"));
			}
			int total = pingjiaDao.selectBeanCount(where.replaceAll(" order by id desc ", ""));
			request.setAttribute("list", pingjiaDao.selectBeanList((currentpage - 1)
					* pagesize, pagesize, where));
			request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
					currentpage, "indexmethod!pingjialist", "共有" + total + "条记录"));
			request.setAttribute("url", "indexmethod!pingjialist");
			request.setAttribute("url2", "indexmethod!pingjia");
			this.setUrl("pingjialist.jsp");
			return SUCCESS;

		}
	//跳转到添加商品评价页面
		public String pingjiaadd() {
			HttpServletRequest request = ServletActionContext.getRequest();
		
			
	
			Pingjia bean = pingjiaDao.selectBean(" where id= "+request.getParameter("id"));
			request.setAttribute("bean", bean);
			this.setUrl("pingjiaadd.jsp");
			return SUCCESS;
		}
	//添加商品评价操作
		public void pingjiaadd2() throws IOException {
			HttpServletRequest request = ServletActionContext.getRequest();
			String pingjia = request.getParameter("pingjia");
			String pingyu = request.getParameter("pingyu");
			
	
			Pingjia bean = pingjiaDao.selectBean(" where id= "+request.getParameter("id"));
			bean.setCreatetime(Util.getTime());
			bean.setPingjia(pingjia);
			bean.setPingyu(pingyu);
		
			
			
			Product p = bean.getProduct();
			if("好评".equals(pingjia)){
				p.setHaoping(p.getHaoping()+1);
				
			}else if("中评".equals(pingjia)){
				
				p.setZhongping(p.getZhongping()+1);
			}else if("差评".equals(pingjia)){
				p.setChaping(p.getChaping()+1);
			}
			productDao.updateBean(p);
			
			pingjiaDao.updateBean(bean);

			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("gbk");response.setContentType("text/html; charset=gbk");
			response
					.getWriter()
					.print(
							"<script language=javascript>alert('操作成功');window.location.href='indexmethod!pingjialist?orderid="+bean.getOrderid()+"';</script>");
		}
		
		
		//我的评价列表
		public String pingjialist2() {
			HttpServletRequest request = ServletActionContext.getRequest();
			
			
			
			StringBuffer sb = new StringBuffer();
			sb.append(" where ");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("shop");
			
			
			sb.append("  user.id="+user.getId()+" and pingjia is not null  order by id desc ");
			String where = sb.toString();


			int currentpage = 1;
			int pagesize = 10;
			if (request.getParameter("pagenum") != null) {
				currentpage = Integer.parseInt(request.getParameter("pagenum"));
			}
			int total = pingjiaDao.selectBeanCount(where.replaceAll(" order by id desc ", ""));
			request.setAttribute("list", pingjiaDao.selectBeanList((currentpage - 1)
					* pagesize, pagesize, where));
			request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
					currentpage, "indexmethod!pingjialist2", "共有" + total + "条记录"));
			request.setAttribute("url", "indexmethod!pingjialist2");
			request.setAttribute("url2", "indexmethod!pingjia");
			this.setUrl("pingjialist2.jsp");
			return SUCCESS;

		}
		
		
		//商品评价列表
		public String pingjialist3() {
			HttpServletRequest request = ServletActionContext.getRequest();
			
			
			
			String pid = request.getParameter("pid");
			
			
			StringBuffer sb = new StringBuffer();
			sb.append(" where ");

			if (pid != null && !"".equals(pid)) {

				sb.append("product.id="+pid);
				sb.append(" and ");
				
			}
			
			
			sb.append("  pingjia is not null  order by id desc ");
			String where = sb.toString();


			int currentpage = 1;
			int pagesize = 10;
			if (request.getParameter("pagenum") != null) {
				currentpage = Integer.parseInt(request.getParameter("pagenum"));
			}
			int total = pingjiaDao.selectBeanCount(where.replaceAll(" order by id desc ", ""));
			request.setAttribute("list", pingjiaDao.selectBeanList((currentpage - 1)
					* pagesize, pagesize, where));
			request.setAttribute("pagerinfo", Pager.getPagerNormal(total, pagesize,
					currentpage, "indexmethod!pingjialist3", "共有" + total + "条记录"));
			request.setAttribute("url", "indexmethod!pingjialist3");
			request.setAttribute("url2", "indexmethod!pingjia");
			this.setUrl("pingjialist3.jsp");
			return SUCCESS;

		}
	
	
}
