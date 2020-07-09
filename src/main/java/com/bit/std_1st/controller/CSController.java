package com.bit.std_1st.controller;

import java.io.File;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.bit.std_1st.dao.CSDao;
import com.bit.std_1st.vo.EvtCouponVo;
import com.bit.std_1st.vo.LoginVo;
import com.bit.std_1st.vo.NoticeVo;
import com.bit.std_1st.vo.QaVo;
import com.fasterxml.jackson.databind.ObjectMapper;

@SessionAttributes("loginVo")
@Controller
public class CSController {

	
	@ModelAttribute("loginVo")
	public LoginVo initLoginVo() {
		return null;
	}
	

	@Autowired
	private CSDao cs_dao;

	public void cs_dao(CSDao cs_dao) {
		this.cs_dao = cs_dao;
	}

	@RequestMapping("/listEvt.do")
	public void listEvt() {

	}

	//----------------------------------------

	//[�씠踰ㅽ듃] 荑좏룿 �떎�슫濡쒕뱶
	@ResponseBody
	@RequestMapping("/insertEvtCoupon.do")
	public int insertEvtCoupon(int cust_no,int evt_no) {
		int re = -1;
		HashMap map = new HashMap();
		map.put("cust_no",cust_no);
		map.put("evt_no",evt_no);
		int isReceived = cs_dao.isReceived(map);
		String next_no = cs_dao.nextNoEvtCoupon()+"";

		EvtCouponVo evtcouponvo = new EvtCouponVo();

		if (isReceived == 1) {
			re = 100;
		} else {
			evtcouponvo.setCust_no(cust_no);
			evtcouponvo.setEvt_no(evt_no);
			evtcouponvo.setIsused("false");
			evtcouponvo.setCoupon_no(next_no);

			re = cs_dao.insertEvtCoupon(evtcouponvo);
		}

		return re;
	}

	//[�씠踰ㅽ듃] �씠踰ㅽ듃 紐⑸줉
	@ResponseBody
	@RequestMapping("/getListEvt.do")
	public String getListEvt(@RequestParam(value="start",defaultValue = "1")int start,
			@RequestParam(value="end",defaultValue = "5")int end) {
		String str = "";
		HashMap map = new HashMap();

		map.put("start",start);
		map.put("end",end);

		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cs_dao.listEvt(map));
		}catch (Exception e) {
			e.printStackTrace();
		}
		return str;
	}

	//[�씠踰ㅽ듃] �씠踰ㅽ듃 �긽�꽭	
	@RequestMapping("/detailEvt.do")
	public ModelAndView detailEvt(int evt_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("e", cs_dao.getEvt(evt_no));
		return mav;
	}

	//[�씠踰ㅽ듃] �씠踰ㅽ듃 寃뚯떆湲� 媛쒖닔 移댁슫�듃 
	@ResponseBody
	@RequestMapping("/getCountEvt.do")
	public int getCountEvt() {
		int re = -1;
		re=cs_dao.getCountEvt();

		return re;
	}


	//----------------------------------------

	//[怨듭��궗�빆] �뙆�씪 �떎�슫濡쒕뱶瑜� �쐞�븳 硫붿냼�뱶 
	@RequestMapping("/down")	
	public ResponseEntity<Resource> down(int notice_no, HttpServletRequest request) {
		/*�뙆�씪紐낆씠 �븳湲��씪 寃쎌슦 �뙆�씪�씠 源⑥��뒗 �쁽�긽 諛쒖깮�븿 二쇱쓽*/
		NoticeVo notice_vo = cs_dao.getNotice(notice_no);
		String fname = notice_vo.getNotice_filename();		
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/uploadFile/");

		String formatName = fname.substring(fname.lastIndexOf("." ) + 1);
		File file = new File(path+"/"+fname);


		InputStream is  = null ;
		try{
			is =  org.apache.commons.io.FileUtils.openInputStream(file);
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		Resource resource = new InputStreamResource(is);		 
		String contentType = "application/octet-stream";
		return ResponseEntity.ok()
				.contentType(MediaType.parseMediaType(contentType))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" +
						fname + "\"")
				.body(resource);	
	}

	//[怨듭��궗�빆] 紐⑸줉 戮묒븘�삤湲�
	@RequestMapping("/listNotice.do")
	public void listNotice() {

	}

	//[怨듭��궗�빆] 紐⑸줉 戮묒븘�삤湲�
	@ResponseBody
	@RequestMapping("/getListNotice.do")
	public String getListNotice(@RequestParam(value="searchfield",defaultValue = "")String searchfield,
			@RequestParam(value="keyword",defaultValue = "")String keyword,
			@RequestParam(value="start",defaultValue = "1")int start,
			@RequestParam(value="end",defaultValue = "5")int end) {

		String str="";
		HashMap map = new HashMap();

		String s_keyword=null;
		String s_searchfield=null;

		if(keyword != null && !keyword.equals("")) {
			s_keyword = keyword;
			map.put("keyword", s_keyword);			
		}

		if(searchfield != null && !searchfield.equals("")) {
			s_searchfield = searchfield;
			map.put("searchfield",s_searchfield);
		}

		map.put("start",start);
		map.put("end",end);

		List<NoticeVo> list = cs_dao.listNotice(map);
		ObjectMapper mapper = new ObjectMapper();

		try {
			str = mapper.writeValueAsString(list);		

		} catch (Exception e) {
			// TODO: handle exception

			System.out.println(e.getMessage());
		}

		return str;

	}

	//[怨듭��궗�빆] 怨듭��궗�빆 寃뚯떆湲� 媛쒖닔 移댁슫�듃 
	@ResponseBody
	@RequestMapping("/getCountNotice.do")
	public int getCountNotice(@RequestParam(value="searchfield",defaultValue = "")String searchfield,
			@RequestParam(value="keyword",defaultValue = "")String keyword) {
		int re =-1;

		HashMap map = new HashMap();

		String s_keyword=null;
		String s_searchfield=null;

		if(keyword != null && !keyword.equals("")) {
			s_keyword = keyword;
			map.put("keyword", s_keyword);			
		}

		if(searchfield != null && !searchfield.equals("")) {
			s_searchfield = searchfield;
			map.put("searchfield",s_searchfield);
		}

		re=cs_dao.getCountNotice(map);
		return re;
	}

	//[怨듭��궗�빆] 怨듭��궗�빆 �긽�꽭
	@RequestMapping("/detailNotice.do")
	public ModelAndView detailNotice(int notice_no) {

		ModelAndView mav = new ModelAndView();

		int re = cs_dao.updateHits(notice_no);
		
		mav.addObject("n", cs_dao.getNotice(notice_no));
		mav.addObject("n1", cs_dao.getNotice(notice_no-1));
		mav.addObject("n2", cs_dao.getNotice(notice_no+1));
		return mav;

	}

	//----------------------------------------

	//[QnA] 紐⑸줉 戮묒븘�삤湲� 
	@RequestMapping("/listQa.do")
	public void listQa () {

	}

	//[QnA] 紐⑸줉 戮묒븘�삤湲� 
	@ResponseBody
	@RequestMapping("/getListQa.do")
	public String getListQa(@RequestParam(value="searchfield",defaultValue = "")String searchfield,
			@RequestParam(value="keyword",defaultValue = "")String keyword,
			@RequestParam(value="start",defaultValue = "1")int start,
			@RequestParam(value="end",defaultValue = "5")int end) {

		String str="";
		HashMap map = new HashMap();

		String s_keyword=null;
		String s_searchfield=null;

		if(keyword != null && !keyword.equals("")) {
			s_keyword = keyword;
			map.put("keyword", s_keyword);			
		}

		if(searchfield != null && !searchfield.equals("")) {
			s_searchfield = searchfield;
			map.put("searchfield",s_searchfield);
		}

		map.put("start",start);
		map.put("end",end);

		List<QaVo> list = cs_dao.listQa(map);
		ObjectMapper mapper = new ObjectMapper();

		try {
			str = mapper.writeValueAsString(list);		

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

		return str;

	}

	//[QnA] QnA 寃뚯떆湲� 媛쒖닔 移댁슫�듃 
	@ResponseBody
	@RequestMapping("/getCountQa.do")
	public int getCountQa(@RequestParam(value="searchfield",defaultValue = "")String searchfield,
			@RequestParam(value="keyword",defaultValue = "")String keyword) {
		int re =-1;

		HashMap map = new HashMap();

		String s_keyword=null;
		String s_searchfield=null;

		if(keyword != null && !keyword.equals("")) {
			s_keyword = keyword;
			map.put("keyword", s_keyword);			
		}

		if(searchfield != null && !searchfield.equals("")) {
			s_searchfield = searchfield;
			map.put("searchfield",s_searchfield);
		}

		re=cs_dao.getCountQa(map);

		return re;
	}

	//[QnA] QnA �긽�꽭 
	@RequestMapping("/detailQa.do")
	public ModelAndView detailQa(int qa_no, int b_level) {

		ModelAndView mav = new ModelAndView();

		mav.addObject("q", cs_dao.getQa(qa_no));
		mav.addObject("b_level",b_level);
		return mav;

	}

	//[QnA] QnA 臾몄쓽 �럹�씠吏� 
	@RequestMapping(value="insertQa.do", method = RequestMethod.GET)
	public ModelAndView insertQa(int cust_no,int provider_no) {

		ModelAndView mav = new ModelAndView();

		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yy/MM/dd");

		mav.addObject("c",cs_dao.getCustomer(cust_no));
		mav.addObject("p",cs_dao.getProvider(provider_no));
		
		mav.addObject("sysdate",sf.format(nowTime));

		return mav;
	}

	//[QnA] QnA 臾몄쓽 �럹�씠吏� 
	@ResponseBody
	@RequestMapping(value="insertQa.do", method = RequestMethod.POST)
	public ModelAndView insertQuestion (QaVo qavo) {

		ModelAndView mav = new ModelAndView("redirect:/listQa.do");
		qavo.setQa_no(cs_dao.nextNoQa());
		qavo.setB_ref(qavo.getQa_no());
		qavo.setB_level(1);
		qavo.setB_step(0);

		int re = cs_dao.insertQa(qavo);

		return mav;

	}

	//[QnA] QnA �닔�젙  �럹�씠吏� 
	@RequestMapping(value="updateQa.do", method = RequestMethod.GET)
	public ModelAndView updateQa(int qa_no) {

		ModelAndView mav = new ModelAndView();		
		mav.addObject("q", cs_dao.getQa(qa_no));
		return mav;
	}

	//[QnA] QnA �닔�젙  �럹�씠吏� 
	@ResponseBody
	@RequestMapping(value="updateQa.do", method = RequestMethod.POST)
	public ModelAndView updateQuestion (int qa_no, int cust_no,int b_level, String qa_title, String qa_content
			,int provider_no) {
		QaVo qavo = new QaVo();

		ModelAndView mav = new ModelAndView("redirect:/detailQa.do?qa_no="+qa_no+"&b_level="+b_level);
		qavo.setQa_no(qa_no);
		qavo.setCust_no(cust_no);
		qavo.setProvider_no(provider_no);
		qavo.setQa_title(qa_title);
		qavo.setQa_content(qa_content);

		int re = cs_dao.updateQa(qavo);

		return mav;

	}

}
