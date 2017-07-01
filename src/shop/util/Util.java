package shop.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import shop.dao.PicDao;
import shop.dao.UserDao;
import shop.model.Pic;
import shop.model.User;



public class Util {

	
	// 获取当前月份
	public static String getYuefen() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Date date = new Date();
		return sdf.format(date.getTime());
	}
	
	// 获取当前系统时间
	public static String getTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		return sdf.format(date.getTime());
	}

	// 获取当前系统时间
	public static String getTime2() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = new Date();
		return sdf.format(date.getTime());
	}

	// 上传文件/复制文件。
	public static void copyFile(File src, File dst) {
		try {
			int BUFFER_SIZE = 16 * 1024;
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src),
						BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				for (int byteRead = 0; (byteRead = in.read(buffer)) > 0;) {
					out.write(buffer, 0, byteRead);
				}

			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 组装响应的请求（适用于添加，更新）
	public static String tiaozhuan(String msg, String url, String id) {
		String tiaozhuan = "{\"statusCode\":\"200\", \"message\":\"" + msg
				+ "\"," + "\"navTabId\":\"" + id + "\", \"rel\":\"" + id
				+ "\", \"callbackType\":\"closeCurrent\",\"forwardUrl\":\""
				+ url + "\"}";
		return tiaozhuan;
	}

	// 组装响应的请求（适用于删除）
	public static String tiaozhuan2(String msg, String url, String id) {
		String tiaozhuan = "{\"statusCode\":\"200\", \"message\":\"" + msg
				+ "\"," + "\"navTabId\":\"" + id + "\", \"rel\":\"" + id
				+ "\", \"callbackType\":\"\",\"forwardUrl\":\"" + url + "\"}";
		return tiaozhuan;
	}

	// 初始化系统
	public static void init(HttpServletRequest request) {
		WebApplicationContext app = WebApplicationContextUtils
				.getWebApplicationContext(request.getSession()
						.getServletContext());
		UserDao userDao = (UserDao) app.getBean("userDao");
		PicDao picDao = (PicDao) app.getBean("picDao");
	
		
		User user = userDao.selectBean(" where username='admin'  ");
		if (user == null) {
			user = new User();
			user.setPassword("111111");
			user.setRole(1);
			user.setUsername("admin");
			userDao.insertBean(user);
			
			Pic p1 = new Pic();
			p1.setPath("pic1.jpg");
			p1.setInfo("展示图片一");
			picDao.insertBean(p1);
			
			Pic p2 = new Pic();
			p2.setPath("pic2.jpg");
			p2.setInfo("展示图片二");
			picDao.insertBean(p2);
			
			Pic p3 = new Pic();
			p3.setPath("pic3.jpg");
			p3.setInfo("展示图片三");
			picDao.insertBean(p3);
		}
	}

	// 获取当前系统时间
	public static Date getTime3(String str) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.parse(str);
	}

}
