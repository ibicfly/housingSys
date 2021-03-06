package com.easyhousing.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.easyhousing.dao.BuildingPicDao;
import com.easyhousing.dao.BuyHouseCommentDao;
import com.easyhousing.dao.UserCollectBuildingDao;
import com.easyhousing.dao.UserDao;
import com.easyhousing.model.BuildingInfo;
import com.easyhousing.model.BuyHouseComment;
import com.easyhousing.model.Collect;
import com.easyhousing.model.User;
import com.easyhousing.model.UserCollectBuilding;
import com.easyhousing.service.BuildingSearch;
/**
 * 
 * @author 张东南
 * 显示楼盘具体信息
 */
@Controller
public class buildingDetailController {
	
	@Autowired
	private BuildingSearch buildingSearch;
	
	@Autowired
	private BuyHouseCommentDao buyHouseCommentDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private UserCollectBuildingDao userCollectBuildingDao;
	
	@Autowired
	private BuildingPicDao buildingPicDao;
	
	//显示租房具体信息
	@RequestMapping(value="buildingDetail.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView buildingDetail(HttpServletRequest request) {
		Cookie[] cookie = request.getCookies();
		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView();
		
		//获取显示楼盘的id
		int buildingId = 0;
		for(Cookie iCookie : cookie) {
			String name = iCookie.getName();
			String value = iCookie.getValue();
			if(name.equals("buildingId")) {
				buildingId = Integer.parseInt(value);
			}
		}
		BuildingInfo buildingInfo = buildingSearch.searchBuildingById(buildingId);
		session.setAttribute("buildingId", buildingId);
		System.out.println(buildingInfo.getBuildingId());
		

		User user = (User)session.getAttribute("user");
		boolean collectYet = false;
		
		//用户已登录，查看是否收藏
		if(user != null) {
			System.out.println(user.getUserId());
			UserCollectBuilding ucb = new UserCollectBuilding();
			ucb.setUserId(user.getUserId());
			for (UserCollectBuilding i : userCollectBuildingDao.selectAllByUserId(ucb)) {
				if (i.getBuildingId() == buildingId) {
					collectYet = true;
					break;
				}
			}
		}
		System.out.println(buildingId);

		//设置收藏属性
		session.setAttribute("buildingInfo", buildingInfo);
		session.setAttribute("collectYet", collectYet);
		
		List<BuyHouseComment> lb = buyHouseCommentDao.selectAllByBuildingId(buildingId);
		List<Collect> lc = new ArrayList<>();
		//若评论，在评论表中添加记录
		for (BuyHouseComment i : lb) {
			Collect tmp = new Collect();
			User u = new User();
			u.setUserId(i.getUserId());
			tmp.name = userDao.selectUserByUserId(u.getUserId()).getName();
			tmp.comment = i.getUserComment();
			tmp.picUrl = userDao.selectUserByUserId(u.getUserId()).getUserPhoto();
			tmp.decoration = i.getUserCommentDate().toString();
			lc.add(tmp);
		}
		session.setAttribute("buildingUserComments", lc);
		
		List<String> t = buildingPicDao.selectBuildingPicByBuildingId(buildingId);
		String buildingDetailPic = "";
		if (t.size() != 0) {
			buildingDetailPic = t.get(0);
		}
		session.setAttribute("buildingDetailPic", buildingDetailPic);
		
		//刷新页面显示
		modelAndView.setViewName("buildingDetail");
		return modelAndView;
	}
	
	//用户评论
	@RequestMapping(value="userCommentBuilding.do", method={RequestMethod.GET,RequestMethod.POST})
	public String userCommentBuilding(HttpServletRequest request,HttpSession s,@RequestBody String comment) throws UnsupportedEncodingException {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		BuyHouseComment u=new BuyHouseComment();
		u.setUserCommentDate(new Date());
		u.setUserId(((User)s.getAttribute("user")).getUserId());
		if(s!=null&&s.getAttribute("buildingId")!=null)
			u.setBuildingId((Integer)s.getAttribute("buildingId"));
	    if(comment!=null)
	    {
	    	String temp=java.net.URLDecoder.decode(comment , "UTF-8");
	    	temp=temp.substring(temp.indexOf("=")+1);
	    	System.out.println("zhongwu request comment"+ temp);
	    	u.setUserComment(temp);
	    }else
	    {
	    	u.setUserComment("无留言");
	    }
		buyHouseCommentDao.insertBuyHouseComment(u);
		System.out.println("zhongyu chenggong jieshou request"+request);
		 return "Comment/loading";
	}
	
	//用户收藏楼盘
	@RequestMapping(value="userBuildingCollect.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView userBuildingCollect(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession s = request.getSession();
		int bid = (Integer)s.getAttribute("buildingId");
		int uid = ((User)s.getAttribute("user")).getUserId();
		
		UserCollectBuilding ucb = new UserCollectBuilding();
		ucb.setBuildingId(bid);
		ucb.setUserId(uid);
		ucb.setCollectTime(new Date());
		
		userCollectBuildingDao.insertUserCollectBuilding(ucb);
		s.setAttribute("collectYet", true);
		
		modelAndView.setViewName("buildingDetail");
		return modelAndView;
	}
}
