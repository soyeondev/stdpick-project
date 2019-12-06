package com.bit.std_1st.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bit.std_1st.dao.SNSDao;
import com.bit.std_1st.dao.UserDao;
import com.bit.std_1st.vo.CustomerVo;
import com.bit.std_1st.vo.FollowVo;
import com.bit.std_1st.vo.LoginVo;
import com.bit.std_1st.vo.ProviderVo;
import com.bit.std_1st.vo.SNSImgVo;
import com.bit.std_1st.vo.SNSLikeVo;
import com.bit.std_1st.vo.SNSReplyVo;
import com.bit.std_1st.vo.SNSTagVo;
import com.bit.std_1st.vo.SNSVo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@SessionAttributes("loginVo")
@Controller
public class SNSController {
	
	@ModelAttribute("loginVo")
	public LoginVo initLoginVo() {
		return null;
	}
	
	
	
	@Autowired
	SNSDao sns_dao;
	
	@Autowired
	UserDao user_dao;

	public void setSns_dao(SNSDao sns_dao) {
		this.sns_dao = sns_dao;
	}
	public void setUser_dao(UserDao user_dao) {
		this.user_dao = user_dao;
	}
	
//	@ResponseBody
//	@RequestMapping("/cntFollower")
//	public int cntFollower(String f_type, int f_no) {
//		int re = -1;
//		re = sns_dao.cntFollower(f_type, f_no);
//		return re;
//	}
//	
//	@ResponseBody
//	@RequestMapping("/cntFollowing")
//	public int cntFollowing(String type, int no) {
//		int re= -1;
//		re = sns_dao.cntFollowing(type, no);
//		return re;
//	}
	
	@RequestMapping("/listSNSImg.do")
	public void listSNSImg () {
	}

	@ResponseBody
	@RequestMapping("/getListSNSImg.do")
	public String getListSNSImg () {
		String str="";
		List<SNSImgVo> list = sns_dao.listSNSImg();
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);		

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return str;
	}

	//--------------------------------

	@RequestMapping("/detailSNS.do")
	public ModelAndView detailSNS (int sns_no) {
		ModelAndView mav = new ModelAndView();	
		mav.addObject("sns_no",sns_no);

		return mav;	
	}
	//--------------------------------

	@ResponseBody
	@RequestMapping("/getIsClicked.do")
	public int getIsClicked (int sns_no,int cust_no, int provider_no) {
		int re = -1;
		HashMap map = new HashMap();
		map.put("sns_no",sns_no);
		map.put("cust_no",cust_no);
		map.put("provider_no",provider_no);
		
		System.out.println("sns_no="+sns_no+"/cust_no="+cust_no+"/provider_no="+provider_no);

		re = sns_dao.isClicked(map);

		return re;
	}

	@ResponseBody
	@RequestMapping("/insertSNSLike.do")
	public int insertSNSLike (int sns_no,int cust_no, int provider_no) {
		int re = -1;
		int like_no = sns_dao.nextNoSNSLike();
		
		SNSLikeVo snslikevo = new SNSLikeVo();
		snslikevo.setLike_no(like_no);
		snslikevo.setSns_no(sns_no);
		
		snslikevo.setCust_no(cust_no);
		snslikevo.setProvider_no(provider_no);

		re= sns_dao.insertSNSLike(snslikevo);
		return re;

	}

	@ResponseBody
	@RequestMapping("/deleteSNSLike.do")
	public int deleteSNSLike (int sns_no,int cust_no, int provider_no) {
		int re = -1;
		HashMap map = new HashMap();
		map.put("sns_no",sns_no);
		map.put("cust_no",cust_no);
		map.put("provider_no",provider_no);

		re = sns_dao.deleteSNSLike(map);

		return re;

	}

	//--------------------------------
	@ResponseBody
	@RequestMapping("/insertSNSReply.do")
	public int insertSNSReply (int sns_no,int cust_no, int provider_no,
			String reply_content) {
		int re = -1;
		
		int reply_no = sns_dao.nextNoSNSReply();
		System.out.println("insertSNSReply 시작 -- reply_no="+reply_no);
		SNSReplyVo snsreplyvo = new SNSReplyVo();
		snsreplyvo.setReply_no(reply_no);
		snsreplyvo.setSns_no(sns_no);
		snsreplyvo.setCust_no(cust_no);
		snsreplyvo.setProvider_no(provider_no);
		snsreplyvo.setReply_content(reply_content);

		re = sns_dao.insertSNSReply(snsreplyvo);

		System.out.println("insertSNSReply 끝 -- re="+re);
		return re;

	}

	//--------------------------------
	@ResponseBody
	@RequestMapping("/getSNS.do")
	public String getSNS (int sns_no) {
		String str="";
		SNSVo snsvo = sns_dao.getSNS(sns_no);
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(snsvo);		

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return str;

	}

	@ResponseBody
	@RequestMapping("/getSNSImg.do")
	public String getSNSImg (int sns_no) {
		String str="";
		List<SNSImgVo> list = sns_dao.getSNSImg(sns_no);
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);		

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return str;

	}

	@ResponseBody
	@RequestMapping("/getSNSReply.do")
	public String getSNSReply (int sns_no) {
		String str="";
		List<SNSReplyVo> list = sns_dao.getSNSReply(sns_no);
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);		

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/getSNSTag.do")
	public String getSNSTag(int sns_no) {
		String str="";
		List<SNSTagVo> list = sns_dao.getSNSTag(sns_no);
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);		

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return str;
	}
	
	
	@ResponseBody
	@RequestMapping("/getSNSLike.do")
	public String getSNSLike (int sns_no) {
		String str="";
		int re = sns_dao.getSNSLike(sns_no);
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(re);		

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return str;

	}

	//--------------------------------

	@ResponseBody
	@RequestMapping("/getCustInfo.do")
	public String getCustInfo(int cust_no) {
		String str="";
		CustomerVo customervo = sns_dao.getCustInfo(cust_no);
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(customervo);		

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/getProvInfo.do")
	public String getProvInfo(int provider_no) {
		String str="";
		ProviderVo providervo = sns_dao.getProvInfo(provider_no);
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(providervo);		

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return str;
	}
	
	
	
	@RequestMapping("/snsSch")
	public void snsSch() {}
	
	@ResponseBody
	@RequestMapping("/snsSchImg")
	public String snsSchImg(@RequestParam(value="keyword",defaultValue = "")String keyword) {
		String str = "";
		HashMap map = new HashMap();
		
		String sns_keyword = null;
		
		if(keyword != null && !keyword.equals("")) {
			sns_keyword = keyword;
			map.put("keyword", sns_keyword);
		}
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(sns_dao.snsSchImg(map));

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("/cntFollower")
	public int cntFollower(String f_type, int f_no) {
		int re = -1;
		re = sns_dao.cntFollower(f_type, f_no);
		return re;
	}
	
	@ResponseBody
	@RequestMapping("/listFollowing")
	public String listFollowing(String type, int no) {
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(sns_dao.listFollowing(type, no));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
	
	@ResponseBody
	@RequestMapping("/listFollower")
	public String listFollower(String f_type, int f_no) {
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(sns_dao.listFollower(f_type, f_no));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
	
	@RequestMapping("/snsFollower")
	public ModelAndView snsFollower(String mode, String type, int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("mode", mode);
		mav.addObject("type", type);
		mav.addObject("no", no);
		return mav;
	}

	@ResponseBody
	@RequestMapping("/listSnsMyPage")
	public String listSnsMyPage(String view_type, int view_no) {
		String str = "";
		int cust_no=-1;
		int provider_no=-1;
		
		if(view_type.equals("customer")) {
			cust_no=view_no;
		}else {
			provider_no=view_no;
		}

		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(sns_dao.listSnsMyPage(cust_no, provider_no));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/deleteFollow")
	public int deleteFollow(String login_type, int login_no, String view_type, int view_no) {
		int re=-1;
		FollowVo vo = new FollowVo(-1, login_type, login_no, view_type, view_no);
		re = sns_dao.deleteFollow(vo);
		return re;
	}
	
	@ResponseBody
	@RequestMapping("/insertFollow")
	public int insertFollow(String login_type, int login_no, String view_type, int view_no) {
		int re=-1;
		int follow_no = sns_dao.getNextFollowNo();
		FollowVo vo = new FollowVo(follow_no, login_type, login_no, view_type, view_no);
		re = sns_dao.insertFollow(vo);
		return re;
	}
	
	@ResponseBody
	@RequestMapping("/isFollow")
	public int isFollow(String login_type, int login_no, String view_type, int view_no) {
		int re = -1;
		FollowVo vo = new FollowVo(-1, login_type, login_no, view_type, view_no);
		re = sns_dao.isFollow(vo);
		return re;
	}
	
	@RequestMapping("/snsMyPageView.do")
	   public ModelAndView snsMyPageView(int cust_no, int provider_no) {
	      ModelAndView mav = new ModelAndView();
	      
	      String view_type = "";
	      int view_no = -1;
	      String nick="";
	      String info="";
	      String profile_img="";
	      
	      if(cust_no>-1) {
	         view_type="customer";
	         view_no = cust_no;
	         CustomerVo vo = user_dao.detailCustomer(cust_no);
	         nick = vo.getCust_nick();
	         info = vo.getCust_info();
	         
	         String img = vo.getCust_img();
	         System.out.println("img : "+img);
	         if(img==null || img.equals("")) {
	            img = "default.png";
	         }
	         
	         profile_img = "cust_img/"+img;
	         
	      }else {
	         view_type="provider";
	         view_no = provider_no;
	         ProviderVo vo = user_dao.detailProvider(provider_no);
	         nick = vo.getPro_nick();
	         info = vo.getPro_info();
	         
	         String img = vo.getPro_img();
	         System.out.println("img : "+img);
	         if(img==null || img.equals("")) {
	            img = "default.png";
	         }
	         
	         profile_img = "prov_img/"+img;
	      }
	      
	      mav.addObject("view_type", view_type);
	      mav.addObject("view_no", view_no);
	      mav.addObject("cntFollower", sns_dao.cntFollower(view_type, view_no));
	      mav.addObject("cntFollowing", sns_dao.cntFollowing(view_type, view_no));
	      
	      mav.addObject("nick", nick);
	      mav.addObject("info", info);
	      mav.addObject("profile_img", profile_img);
	      mav.setViewName("snsMyPageView");
	      return mav;
	}

	
	@RequestMapping(value = "/snsInsertView.do", method = RequestMethod.GET)
	public void snsInsertGET() {
		
	}
	
	@ResponseBody
	@RequestMapping(value =  "/snsInsert")
	public int snsInsertPOST(MultipartHttpServletRequest multi, int cust_no,
			int provider_no, String sns_content, String[] tags) {
		int re = -1;

		String path = multi.getRealPath("images");	
		path += "/img_sns/";
		System.out.println(path);	
		//C:\std_spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\std\images/img_sns/
		
		int sns_no = sns_dao.getNextSNSNo();
		int sns_img_no = sns_dao.getNextSNSImgNo();
		int si_no = sns_img_no;	//기존 sns_img_no 값 유지를 위해 임시변수 생성
		int tag_no = sns_dao.getNextSNSTagNo();
		int tg_no = tag_no;		//기존 tag_no 값 유지를 위해 임시변수 생성
		
		SNSVo sns_vo = new SNSVo(sns_no, sns_content, null, cust_no, provider_no,-1,null,-1,null);
		ArrayList<SNSImgVo> sns_img_vos = new ArrayList<SNSImgVo>();
		ArrayList<SNSTagVo> sns_tag_vos = new ArrayList<SNSTagVo>();
		
		for(int i=0; i<tags.length; i++) {	//sns_tag_vos 만들기
			sns_tag_vos.add(new SNSTagVo(tg_no, tags[i], sns_no));
			tg_no++;
		}
		
		Iterator<String> iter = multi.getFileNames(); 
		MultipartFile mfile = null; 
		String fieldName = "";
		while (iter.hasNext()) { 			//sns_img_vos 만들기
			
			fieldName = (String) iter.next(); 
			mfile = multi.getFile(fieldName);

			String sns_img_name = si_no+".jpg";
			System.out.println(sns_img_name);
			SNSImgVo sns_img_vo = new SNSImgVo(si_no, sns_img_name, sns_no);
			sns_img_vos.add(sns_img_vo);
			
			si_no++;
		}
		
		re = sns_dao.insertSNS(sns_vo, sns_img_vos, sns_tag_vos);	//insert
		System.out.println("re : "+re);
		
		//insert 성공하면 파일을 저장 경로에 복사
		if(re>1) {
			si_no = sns_img_no;
			iter = multi.getFileNames(); 
			while (iter.hasNext()) { 
				fieldName = (String) iter.next(); 
				mfile = multi.getFile(fieldName);
				String sns_img_name = si_no+".jpg";
				
				String safeFile = path + sns_img_name;
				try {
					mfile.transferTo(new File(safeFile));
	            } catch (Exception e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
				si_no++;
			}
		}
		
		return re;
	}
}
