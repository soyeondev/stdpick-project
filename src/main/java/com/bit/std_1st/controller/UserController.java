package com.bit.std_1st.controller;

import java.io.FileOutputStream;
import java.net.CookieStore;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.std_1st.dao.CafeDao;
import com.bit.std_1st.dao.CustomerDao;
import com.bit.std_1st.dao.ProviderDao;
import com.bit.std_1st.dao.UserDao;
import com.bit.std_1st.vo.CafeVo;
import com.bit.std_1st.vo.CustomerVo;
import com.bit.std_1st.vo.EvtCouponDiscountVo;
import com.bit.std_1st.vo.LoginVo;
import com.bit.std_1st.vo.ProviderVo;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.mail.iap.Response;

@SessionAttributes(value = "loginVo")
@Controller
public class UserController {
	@Autowired
	UserDao user_dao;
	@Autowired
	private CustomerDao dao;
	@Autowired
	CafeDao cafe_dao;

	
	public void setDao(CustomerDao dao) {
		this.dao = dao;
	}

	@Autowired
	private ProviderDao pdao;

	public void setPdao(ProviderDao pdao) {
		this.pdao = pdao;
	}

	@RequestMapping("/memberSuccess")
	public void memberSuccess() {
		
	}
	
	@ModelAttribute("loginVo")
	public LoginVo initLoginVo() {
		return null;
	}
	
	public void setUser_dao(UserDao user_dao) {
		this.user_dao = user_dao;
	}

	public void setCafe_dao(CafeDao cafe_dao) {
		this.cafe_dao = cafe_dao;
	}
	
	@ResponseBody
	@RequestMapping(value = "/check_kakao.do", method = RequestMethod.POST)
	public String check_kakao(Model model, CustomerVo c) throws Exception {
		System.out.println(c.getId());
		Integer cnt = dao.check_id(c);
		String resultvalue;
		if (cnt == 0)
			resultvalue = "S";
		
		else
		{
			resultvalue = "F";
		CustomerVo cv = dao.selectCustomer(c.getId());
		
		
		LoginVo lv = new LoginVo(cv.getId(), cv.getCust_nick(), "customer", cv.getCust_no(),cv.getCust_img());
		model.addAttribute("loginVo", lv);
		}
		System.out.println(resultvalue);
		return resultvalue;
	}
	
	
	@ResponseBody
	@RequestMapping("/countCafePassSale")
	public int countCafePassSale(int cafe_no) {
		int re = -1;
		re = user_dao.countCafePassSale(cafe_no);
		return re;
	}
	
	
	@ResponseBody
	@RequestMapping("/listCafePassSale")
	public String listCafePassSale(int cafe_no, int start, int end) {
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(user_dao.listCafePassSale(cafe_no, start, end));
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}

	@ResponseBody
	@RequestMapping("/listProvAllSale")
	public String listProvAllSale(int provider_no, int start, int end, 
			String searchColumn,String oper, String keyword) {
		String str = "";

		HashMap map = new HashMap();
		map.put("provider_no", provider_no);
		map.put("start", start);
		map.put("end", end);
		map.put("searchColumn", searchColumn);
		map.put("oper", oper);
		map.put("keyword", keyword);
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(user_dao.listProvAllSale(map));
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	
	@ResponseBody
	@RequestMapping("/listYearIncome")
	public int listYearIncome(int cafe_no, String startDate, String endDate) {
		
		Date d_start = new Date(startDate);
		Date d_end = new Date(endDate);
		String start = new SimpleDateFormat("yyMMdd").format(d_start);
		String end = new SimpleDateFormat("yyMMdd").format(d_end);		
		int income = user_dao.listMonthIncome(cafe_no, start, end);
		return income;
	}
	
	
	@ResponseBody
	@RequestMapping("/listMonthIncome")
	public ArrayList<Integer> listMonthIncome(int cafe_no, String startDate, String endDate) {
		int[] date = {31,28,31,30,31,30,31,31,30,31,30,31};
					//1  2  3  4  5  6  7  8  9  10 11 12월
		ArrayList<Integer> income = new ArrayList<Integer>();
		String[] arr_startDate = startDate.split("/");
		String[] arr_endDate = endDate.split("/");
		
		int startDate_year = Integer.parseInt(arr_startDate[0]);
		int startDate_month = Integer.parseInt(arr_startDate[1]);
		int startDate_date = Integer.parseInt(arr_startDate[2]);
		int endDate_year = Integer.parseInt(arr_endDate[0]);
		int endDate_month = Integer.parseInt(arr_endDate[1]);
		int endDate_date = Integer.parseInt(arr_endDate[2]);
		int gap_year = endDate_year - startDate_year;
		
		int label_count = endDate_month - startDate_month + 1 + gap_year*12;  //개월수 계산
																//11 - 11 + 1 + 12 = 13
		int sy = startDate_year;
		int sm = startDate_month;	//11
		int sd = startDate_date;
		int ed = endDate_date;

		for(int i=0; i<label_count; i++) {
			if(sm > 12 ) {
				sm -= 12;	
				sy += 1;
			}

			Date d_start = new Date(sy, sm-1, 1);
			Date d_end = new Date(sy, sm-1, date[sm-1]);
			
			if(i==0) {
				d_start = new Date(sy, sm-1, sd);
			}else if(i==label_count-1) {
				d_end = new Date(sy, sm-1, ed);
			}
			
			String start = new SimpleDateFormat("yyMMdd").format(d_start);
			String end = new SimpleDateFormat("yyMMdd").format(d_end);
			sm++;
			
			income.add(user_dao.listMonthIncome(cafe_no, start, end));
		}

		return income;
	}
	
	
	@ResponseBody
	@RequestMapping("/getProvCafe")
	public String getProvCafe(int provider_no) {
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(user_dao.getProvCafe(provider_no));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	
	@ResponseBody
	@RequestMapping("/detailCustomer")
	public String detailCustomer(int cust_no) {
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(user_dao.detailCustomer(cust_no));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}

	@ResponseBody
	@RequestMapping("/getNotUseCoupon")
	public String getNotUseCoupon(int cust_no) {
		String str = "";

		List<EvtCouponDiscountVo> list = user_dao.getNotUseCoupon(cust_no);

		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(list);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;

	}

	@RequestMapping("/provSaleListView.do")
	public void provSaleListView() {

	}

	@RequestMapping("/provMyCafeView.do")
	public ModelAndView provMyCafeView(int cafe_no) {
		ModelAndView mav = new ModelAndView();
		CafeVo vo = cafe_dao.detailCafe(cafe_no);

		mav.addObject("cafe_no",cafe_no);
		mav.addObject("cafe_name",vo.getCafe_name());
		return mav;
	}

	@RequestMapping("/provMyPageView.do")
	public void provMyPageView() {

	}

	/* 개인 회원가입 */
	@RequestMapping(value = "/insertCustomer", method = RequestMethod.POST)
	public String insertCustomer(CustomerVo c, HttpServletRequest request) throws Exception {
		System.out.println(c.getCust_name());
		/* c.setCust_no(5); */
		System.out.println(c);
		String path = request.getRealPath("/cust_img");
		System.out.println(path);
		MultipartFile file = c.getUpload();
		System.out.println(file);
		String fname = "";
		
		
		fname = file.getOriginalFilename();
		
		System.out.println("넌뭐냐 정체가" + fname);
		if(file.isEmpty()) {
			fname = "default.png";
			System.out.println(fname);
			System.out.println("잎들어옴");
		}else {
			fname = "";
			fname = System.currentTimeMillis() + file.getOriginalFilename();
			try {
				byte data[] = file.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + fname);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
		}
				
		
	
		c.setCust_img(fname);
		// g.setFname(fname);

		dao.insertCustomer(c);
		return "memberSuccess";
	}

	/* 사업자 회원 가입 */
	@RequestMapping(value = "/insertProvider", method = RequestMethod.POST)
	public String insertProvider(ProviderVo p, HttpServletRequest request) throws Exception {
		System.out.println(p.getPro_name());
		System.out.println(p);
		String path = request.getRealPath("cust_img");
		System.out.println(path);
		MultipartFile file = p.getUpload1();
		String fname = "";
		if(file.isEmpty()) {
			fname = "default.png";
			System.out.println(fname);
			System.out.println("잎들어옴");
		}else {
			fname = "";
			fname = System.currentTimeMillis() + file.getOriginalFilename();
			try {
				byte data[] = file.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + fname);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
		}
		
		p.setPro_img(fname);
		// g.setFname(fname);
	
		pdao.insertProvider(p);
		return "memberSuccess";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView profile(ModelAndView mv, @ModelAttribute("loginVo") LoginVo lv) throws Exception {
		if (lv.getRole().equals("customer")) {
			mv.setViewName("/memberpersonalmodify");
			mv.addObject("member", dao.selectCustomer(lv.getId()));
		} else {
			mv.setViewName("/memberprovidermodify");
			mv.addObject("member", pdao.selectProvider(lv.getId()));
		}

		return mv;
	}

	/* 개인 정보 수정 */
	@RequestMapping(value = "modifyPersonal", method = RequestMethod.POST)
	public String modifyPersonal(Model model, CustomerVo c, HttpServletRequest request) throws Exception {
		System.out.println(c.getCust_name());
		/* c.setCust_no(5); */
		
		String orginName  = c.getCust_img();
		System.out.println("원본파일" + orginName);
		
		String path = request.getRealPath("cust_img");
		System.out.println(path);
		MultipartFile file = c.getUpload();
		String fname ="";
		
		if(file.isEmpty()) {
			fname = orginName;
			System.out.println(fname);
			System.out.println("잎들어옴");
		}else {
			fname = System.currentTimeMillis() + file.getOriginalFilename();
			c.setCust_img(fname);
			// g.setFname(fname);
			try {
				byte data[] = file.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + fname);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
		}
		
		dao.updateCustomer(c);
		System.out.println(c.getCust_no());
		
		LoginVo lv = new LoginVo(c.getId(), c.getCust_nick(), "customer", c.getCust_no(),c.getCust_img());
		System.out.println(lv);
		model.addAttribute("loginVo", lv);

		return "/index";
	}

	/* 사업자 정보 수정 */
	@RequestMapping(value = "modifyProvider", method = RequestMethod.POST)
	public String modifyProvider(Model model, ProviderVo p, HttpServletRequest request) throws Exception {
		System.out.println(p.getPro_name());

		String orginName  = p.getPro_img();
		System.out.println("원본파일" + orginName);
		
		String path = request.getRealPath("cust_img");
		System.out.println(path);
		MultipartFile file = p.getUpload1();
		String fname = "";
		if(file.isEmpty()) {
			fname = orginName;
			System.out.println(fname);
			System.out.println("잎들어옴");
		}else {
			fname = System.currentTimeMillis() + file.getOriginalFilename();
			p.setPro_img(fname);
			// g.setFname(fname);
			try {
				byte data[] = file.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + fname);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
		}
		
		
		pdao.updateProvider(p);
		LoginVo lv = new LoginVo(p.getId(), p.getPro_nick(), "provider", p.getProvider_no(),p.getPro_img());
		model.addAttribute("loginVo", lv);

		return "/index";
	}

	/* 로그인 */
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public Map<String, Object> login(Model model, @RequestBody Map<String, String> member) throws Exception {
		Map<String, Object> result = new HashMap<>();
		
		
		try {
			if (Integer.parseInt(member.get("type")) == 1) {
				CustomerVo cv = dao.selectCustomer(member.get("id"));
				if (cv.getPwd().equals(member.get("pwd"))) {
					LoginVo lv = new LoginVo(cv.getId(), cv.getCust_nick(), "customer", cv.getCust_no(),cv.getCust_img());
					model.addAttribute("loginVo", lv);
					result.put("loginVo", lv);
					result.put("result", 0);
				} else {
					result.put("result", 2); // 비번이 틀림
				}
			} else {
				ProviderVo pv = pdao.selectProvider(member.get("id"));
				if (pv.getPwd().equals(member.get("pwd"))) {
					LoginVo lv = new LoginVo(pv.getId(), pv.getPro_nick(), "provider", pv.getProvider_no(),pv.getPro_img());
					model.addAttribute("loginVo", lv);
					result.put("loginVo", lv);
					result.put("result", 0);
				} else {
					result.put("result", 2); // 비번이 틀림
				}
			}
		} catch (Exception e) {
			result.put("result", 1); // id가 없음
		}

		return result;
	}

	/* 로그아웃 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(ModelAndView mv, SessionStatus status,HttpServletRequest request,HttpServletResponse response) throws Exception {
		status.setComplete();
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(int i=0;i<cookies.length;i++) {
				System.out.println(cookies[i].getName());
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
		
		mv.setViewName("/index");
		mv.addObject("loginVo", null);
		return mv;
	}

	/* 개인 닉네임 중복 체크 */
	@ResponseBody
	@RequestMapping(value = "/check_nick.do", method = RequestMethod.POST)
	public String check_nick(CustomerVo c) throws Exception {
		Integer cnt = dao.check_nick(c);
		String resultvalue;
		if (cnt == 0)
			resultvalue = "S";
		else
			resultvalue = "F";

		// resultvalue="F";
		System.out.println(resultvalue);
		return resultvalue;
	}

	/* 개인 아이디 중복 체크 */
	@ResponseBody
	@RequestMapping(value = "/check_id.do", method = RequestMethod.POST)
	public String check_id(CustomerVo c) throws Exception {
		Integer cnt = dao.check_id(c);
		String resultvalue;
		if (cnt == 0)
			resultvalue = "S";
		else
			resultvalue = "F";

		// resultvalue="F";
		System.out.println(resultvalue);
		return resultvalue;
	}

	/* 사업자 닉네임 중복 체크 */
	@ResponseBody
	@RequestMapping(value = "/check_pro_nick.do", method = RequestMethod.POST)
	public String check_pro_nick(ProviderVo p) throws Exception {
		Integer cnt = pdao.check_pro_nick(p);
		String resultvalue;
		if (cnt == 0)
			resultvalue = "S";
		else
			resultvalue = "F";

		// resultvalue="F";
		System.out.println(resultvalue);
		return resultvalue;
	}

	/* 사업자 아이디 중복 체크 */
	@ResponseBody
	@RequestMapping(value = "/check_pro_id.do", method = RequestMethod.POST)
	public String check_pro_id(ProviderVo p) throws Exception {
		Integer cnt = pdao.check_pro_id(p);
		String resultvalue;
		if (cnt == 0)
			resultvalue = "S";
		else
			resultvalue = "F";

		// resultvalue="F";
		System.out.println(resultvalue);
		return resultvalue;
	}

	/*
	 * 회원 가입 완료 화면
	 * 
	 * @RequestMapping("/memberok") public void memberok() { }
	 */

}
