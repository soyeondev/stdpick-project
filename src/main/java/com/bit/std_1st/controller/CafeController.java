package com.bit.std_1st.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bit.std_1st.dao.CafeDao;
import com.bit.std_1st.dao.UserDao;
import com.bit.std_1st.vo.CafeVo;
import com.bit.std_1st.vo.Cafe_Chkbox_Vo;
import com.bit.std_1st.vo.Cafe_Img_Vo;
import com.bit.std_1st.vo.GetPassVo;
import com.bit.std_1st.vo.InqVo;
import com.bit.std_1st.vo.LoginVo;
import com.bit.std_1st.vo.PassVo;
import com.bit.std_1st.vo.PayData;
import com.bit.std_1st.vo.PaymentVo;
import com.bit.std_1st.vo.ReviewVo;
import com.bit.std_1st.vo.RoomReserVo;
import com.bit.std_1st.vo.RoomVo;
import com.bit.std_1st.vo.Room_Time_Vo;
import com.fasterxml.jackson.databind.ObjectMapper;

@SessionAttributes("loginVo")
@Controller
public class CafeController {
	
	int cafe_no = 0;
	String main_img = "";
	static ArrayList<String> FnameList = new ArrayList<String>();
	String[] checked;
	static ArrayList<Integer> room_no_list = new ArrayList<Integer>();
	
	@Autowired
	private CafeDao cafedao;
	@Autowired
	UserDao user_dao;

	public void setCafedao(CafeDao cafedao) {
		this.cafedao = cafedao;
	}

	public void setUser_dao(UserDao user_dao) {
		this.user_dao = user_dao;
	}
	
	

	@ModelAttribute("loginVo")
	public LoginVo initLoginVo() {
		return null;
	}
	
	@RequestMapping("/CafeSuccess")
	public void CafeSuccess() {
		
	}

	@RequestMapping("/NewFile1.do")
	public void NewFile1() {

	}
	
	@ResponseBody
	@RequestMapping("/getCheckboxes")
	public void getCheckboxes(String data) {
		checked = data.split(" ");
	}
	
	@ResponseBody()
	@RequestMapping("/getCafeIMGS")
	public String getCafeIMGS(int cafe_no) {
		String re = null;
		try {
			ObjectMapper mapper = new ObjectMapper();
			re = mapper.writeValueAsString(cafedao.getCafeIMGS(cafe_no));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}

	@ResponseBody
	@RequestMapping(value = "/upload.do", method = RequestMethod.POST)
	public String requestupload2(MultipartHttpServletRequest mtfRequest) {

		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String src = mtfRequest.getParameter("src");

		String path = "/cafe_img/";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // �썝蹂� �뙆�씪 紐�
			long fileSize = mf.getSize(); // �뙆�씪 �궗�씠利�
			String real = mtfRequest.getRealPath(path);

			String safeFile = real + System.currentTimeMillis() + originFileName;
			String fname = safeFile;
			fname = fname.substring(real.length());
			FnameList.add(fname);
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		String firstIMG = FnameList.get(0); // == main_img

		String SecondIMG = FnameList.get(1);
		String ThirdIMG = FnameList.get(2);
		String FourthIMG = FnameList.get(3);

		System.out.println("--------------------------");

		return "redirect:/requestupload2";
	}

	@ResponseBody
	@RequestMapping(value = "/insertCafe", method = RequestMethod.GET)
	public String insertCafe(CafeVo c) {
		return "insertCafe";
	}

	@ResponseBody
	@RequestMapping(value = "/insertCafe", method = RequestMethod.POST)
	public String insertCafeSubmit(CafeVo c, HttpSession session) {
		String re = "";

		cafe_no = cafedao.getNextNo_cafe();
		c.setCafe_no(cafe_no);
	
		c.setMain_img(FnameList.get(0));
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			re = mapper.writeValueAsString(cafedao.insertCafe(c));
			System.out.println("rere �쟾:" + re);

			if (!(re.equals("-1"))) {
				re = cafe_no + "";
				// -------------------------------------------
				session.setAttribute("cafe_no", cafe_no);
				// -------------------------------------------
			} else {
				re = "insertCafe";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return re;
	}

	// [CAFE_CHKBOX]
	@ResponseBody
	@RequestMapping("/insert_cafe_chkbox")
	public String insert_cafe_chkbox(HttpServletRequest request) {
		String re = null;
		cafe_no = (int) request.getSession().getAttribute("cafe_no");
		try {

			for (int i = 0; i < checked.length; i++) {
				Cafe_Chkbox_Vo ch = new Cafe_Chkbox_Vo();

				ch.setCafe_chkbox_no(cafedao.getNextNo_cafe_chkbox());
				ch.setCafe_chkbox_name(checked[i]);
				ch.setCafe_no(cafe_no);

				ObjectMapper mapper = new ObjectMapper();
				re = mapper.writeValueAsString(cafedao.insert_cafe_chkbox(ch));

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}

	// [CAFE_IMG]
	@ResponseBody
	@RequestMapping("/insert_cafe_img")
	public String insert_cafe_img(HttpServletRequest request) {
		cafe_no = (int) request.getSession().getAttribute("cafe_no");
		String re = null;
		try {
			for (int j = 1; j <= 3; j++) {
				Cafe_Img_Vo i = new Cafe_Img_Vo();

				i.setCafe_img_no(cafedao.getNextNo_cafe_img());
				i.setCafe_img_name(FnameList.get(j));
				i.setCafe_no(cafe_no);
				
				ObjectMapper mapper = new ObjectMapper();
				re = mapper.writeValueAsString(cafedao.insert_cafe_img(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}

	// [CAFE_PASS]
	@ResponseBody
	@RequestMapping(value = "/insert_pass", method = RequestMethod.POST)
	public String insert_pass(String[] pass_content, int[] price, HttpServletRequest request) {
		cafe_no = (int) request.getSession().getAttribute("cafe_no");
		String re = null;

		try {
			for (int i = 0; i < pass_content.length; i++) {
				PassVo p = new PassVo();

				p.setPass_no(cafedao.getNextNo_pass());
				p.setPass_content(pass_content[i]);
				p.setPrice(price[i]);
				p.setCafe_no(cafe_no);

				ObjectMapper mapper = new ObjectMapper();
				re = mapper.writeValueAsString(cafedao.insert_pass(p));				
			}
			System.out.println("insert_pass �셿猷�!");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return re;
	}

//	[CAFE_ROOM]
	@ResponseBody
	@RequestMapping(value = "/insert_room", method = RequestMethod.POST)
	public int insert_room(String[] room_name, HttpServletRequest request) {
		cafe_no = (int) request.getSession().getAttribute("cafe_no");
		int re = -1;
		try {

			for (int i = 0; i < room_name.length; i++) {
				RoomVo r = new RoomVo();
				int room_no = cafedao.getNextNo_room();
				r.setRoom_no(room_no);
				r.setRoom_name(room_name[i]);
				r.setCafe_no(cafe_no);

				ObjectMapper mapper = new ObjectMapper();
				re = Integer.parseInt(mapper.writeValueAsString(cafedao.insert_room(r)));
				if (re != -1) {
					re = room_no;
					room_no_list.add(room_no);

				}
			}
			System.out.println("insert_room �셿猷�!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}

	// [CAFE_ROOM_TIME]
	@ResponseBody
	@RequestMapping(value = "/insert_room_time", method = RequestMethod.POST)
	public int insert_room_time(int[] start_time, int[] end_time, int[] time_price) {

		int re = -1;
		try {

			for (int i = 0; i < start_time.length; i++) {
				Room_Time_Vo rt = new Room_Time_Vo();

				rt.setTime_no(cafedao.getNextNo_room_time());
				rt.setStart_time(start_time[i]);
				rt.setEnd_time(end_time[i]);
				rt.setTime_price(time_price[i]);
				rt.setRoom_no(room_no_list.get(i));

				ObjectMapper mapper = new ObjectMapper();
				re = Integer.parseInt(mapper.writeValueAsString(cafedao.insert_room_time(rt)));

			}
			System.out.println("insert_room_time �셿猷�!");
			room_no_list.clear();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	

	@ResponseBody
	@RequestMapping("/mailSender")
	public String mailSender(String email, String cust_name, String product, int resultPrice)
			throws AddressException, MessagingException {
		String host = "smtp.naver.com";
		final String username = "jatket2";
		final String password = "gmlwls!!@@";
		int port = 465; // 포트번호

		// 메일 내용
		String recipient = email; // 받는 사람의 메일주소를 입력해주세요.
		String subject = "스투더픽 결제정보"; // 메일 제목 입력해주세요.
		String body = "[ " + cust_name + "님이 구매하신 정보 ]\n"; // 메일 내용 입력해주세요.
		body += product + "\n";
		body += "결제가격 : " + resultPrice + "원\n\n";
		body += "스투더픽을 이용해주셔서 감사합니다.";

		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성

		// SMTP 서버 정보 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		// Session 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;

			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});

		session.setDebug(false); // for debug
		Message mimeMessage = new MimeMessage(session); // MimeMessage 생성
		mimeMessage.setFrom(new InternetAddress("jatket@naver.com"));
		// 발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.

		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		// 수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음
		mimeMessage.setSubject(subject); // 제목셋팅
		mimeMessage.setText(body); // 내용셋팅
		Transport.send(mimeMessage); // javax.mail.Transport.send() 이용 }
		System.out.println(email + " 발송 성공");
		return "발송 성공";
	}

	@ResponseBody
	@RequestMapping("/getReserCount")
	public String getReserCount(int cafe_no) {
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.getReserCount(cafe_no));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}

	@ResponseBody
	@RequestMapping("/detailCafe")
	public String detailCafe(int cafe_no) {
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.detailCafe(cafe_no));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}

	@ResponseBody
	@RequestMapping("/insertGetPassPayment")
	public String insertGetPassPayment(int resultPrice, String coupon_no, int cust_no, int pass_no, int amount) {
		// payment insert ==================================================
		// pay_no 구하기 : max+1값
		String pay_no = cafedao.getNextPayNo();

		Date today = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");
		String str_today = dateFormat.format(today);

		// pay_no가 없을 경우(결제 건이 0개일때), 오늘날짜가 아닐 경우 : 오늘날짜+001
		if (pay_no.equals("1")) { // pay_no가 null 일때 : 결제 건이 0개일 때
			pay_no = str_today + "0001";
		} else {
			String db_pay_no = pay_no.substring(0, 6);

			if (!db_pay_no.equals(str_today)) {
				pay_no = str_today + "0001";
			}
		}

		PaymentVo payment_vo = new PaymentVo(pay_no, "카카오페이", resultPrice, coupon_no, cust_no);

		// get_pass insert
		int getpass_no = cafedao.getNextGetPassNo();
		GetPassVo getpass_vo = new GetPassVo(getpass_no, pass_no, pay_no, amount);
		int re = cafedao.insertGetPassPayment(payment_vo, getpass_vo);

		if (re > 1) {
			// 쿠폰 썼으면 '사용함'으로 update
			if (!coupon_no.equals("") && coupon_no != null) {
				user_dao.updateCouponToTrue(coupon_no);
			}
		}
		return re + "";
	}

	@RequestMapping("/paymentResultView.do")
	public ModelAndView paymentResultView(String msg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		return mav;
	}

	@ResponseBody
	@RequestMapping("/insertReserPayment")
	public String insertReserPayment(int resultPrice, String coupon_no, int cust_no, String resultDate,
			String resultTime, int resultPerson) {
		// payment insert ==================================================
		// pay_no 구하기 : max+1값
		String pay_no = cafedao.getNextPayNo();

		Date today = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");
		String str_today = dateFormat.format(today);

		// pay_no가 없을 경우(결제 건이 0개일때), 오늘날짜가 아닐 경우 : 오늘날짜+001
		if (pay_no.equals("1")) { // pay_no가 null 일때 : 결제 건이 0개일 때
			pay_no = str_today + "0001";
		} else {
			String db_pay_no = pay_no.substring(0, 6);

			if (!db_pay_no.equals(str_today)) {
				pay_no = str_today + "0001";
			}
		}

		PaymentVo payment_vo = new PaymentVo(pay_no, "카카오페이", resultPrice, coupon_no, cust_no);

		// room_reser insert
		// ================================================================
		ArrayList<RoomReserVo> reser_vo = new ArrayList<RoomReserVo>();
		int reser_no = cafedao.getNextReserNo();

		// room_no, reser_start, resert_time 구하기
		String[] arr = resultTime.split(",");

		int room_no = 0;
		int reser_start = 0;
		int reser_time = 0;
		int prev_time = -1; // 이전 인덱스의 시간값 저장

		for (int i = 0; i < arr.length; i++) {
			// arr[i]가 시간 일때
			if (arr[i].endsWith("00AM") || arr[i].endsWith("00PM")) {
				int time = Integer.parseInt(arr[i].split(":")[0]); // 시간 숫자만 뽑기
				if (arr[i].endsWith("00PM") && time != 12) { // 오후는 +12시. 12시는 12:00PM이기 때문에 -12안함
					time += 12; // 오후1시 ->13시 , 오후5시->17시
				}

				if (prev_time == -1) { // 저장해놓은 이전 시간 값이 없다면..
					prev_time = time;
					reser_start = time; // 얘가 시작시간!
					reser_time++; // 1시간 추가

				} else {
					if (prev_time + 1 == time) { // 이어진 시간이라면
						prev_time = time;
						reser_time++; // 1시간 추가

					} else { // 띄어진 시간이면 vo넣고 다시 시작시간 설정
						reser_vo.add(new RoomReserVo(reser_no, room_no, resultDate, reser_start, reser_time,
								resultPerson, pay_no, null, null));
						reser_no++;
						prev_time = time;
						reser_start = time;
						reser_time = 1;
					}
				}
			} else { // arr[i]가 룸번호일 때
				if (i != 0) { // vo넣고 변수 초기화하고 room_no 다시 설정
					reser_vo.add(new RoomReserVo(reser_no, room_no, resultDate, reser_start, reser_time, resultPerson,
							pay_no, null, null));
					reser_no++;
					// 초기화
					prev_time = -1;
					reser_time = 0;
				}
				room_no = Integer.parseInt(arr[i]);
			}
		} // for문 끝
		reser_vo.add(new RoomReserVo(reser_no, room_no, resultDate, reser_start, reser_time, resultPerson, pay_no, null,
				null));

		int re = cafedao.insertReserPayment(payment_vo, reser_vo);

		if (re > 1) {
			// 쿠폰 썼으면 '사용함'으로 update
			if (!coupon_no.equals("") && coupon_no != null) {
				user_dao.updateCouponToTrue(coupon_no);
			}
		}

		return re + "";
	}

	@ResponseBody
	@RequestMapping("/detailPass")
	public String detailPass(int pass_no) {
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.detailPass(pass_no));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}

	@RequestMapping("/paymentGetPassView.do")
	public ModelAndView paymentGetPassView(int cafe_no, int pass_no, int amount) {
		ModelAndView mav = new ModelAndView();

		CafeVo cafe_vo = cafedao.detailCafe(cafe_no);
		PassVo pass_vo = cafedao.detailPass(pass_no);

		int totalPrice = pass_vo.getPrice() * amount;

		mav.addObject("cafe_no", cafe_no);
		mav.addObject("cafe_name", cafe_vo.getCafe_name());
		mav.addObject("main_img", cafe_vo.getMain_img());

		mav.addObject("pass_no", pass_no);
		mav.addObject("amount", amount);
		mav.addObject("totalPrice", totalPrice);

		return mav;
	}

	@RequestMapping("/paymentReserRoomView.do")
	public ModelAndView paymentReserRoomView(int cafe_no, String resultDate, String resultTime, String[] printTime,
			int resultPerson, int totalPrice) {

		ModelAndView mav = new ModelAndView();

		CafeVo vo = cafedao.detailCafe(cafe_no);

		mav.addObject("cafe_no", cafe_no);
		mav.addObject("cafe_name", vo.getCafe_name());
		mav.addObject("main_img", vo.getMain_img());

		mav.addObject("resultDate", resultDate);
		mav.addObject("resultTime", resultTime);
		mav.addObject("resultPerson", resultPerson);
		mav.addObject("totalPrice", totalPrice);

		String printStr = "";
		for (String r : printTime) {
			if (r.endsWith("00PM") || r.endsWith("00AM")) { // 시간
				printStr += r + " ";
			} else { // 룸번호
				printStr += "/ " + r + " : ";
			}
		}
		printStr = printStr.replaceFirst("/ ", "");

		mav.addObject("printStr", printStr);

		return mav;
	}

	@RequestMapping("/getCustCoupon")
	public String getCustCoupon() {
		String str = "";

		return str;
	}

	@RequestMapping("/insertPayment")
	public String insertPayment() {
		String str = "";

		return str;
	}

	@RequestMapping("/reserRoomView.do")
	public ModelAndView reserRoom(int cafe_no) {
		ModelAndView mav = new ModelAndView();

		CafeVo vo = cafedao.detailCafe(cafe_no);
		mav.addObject("cafe_no", cafe_no);
		mav.addObject("cafe_name", vo.getCafe_name());
		mav.addObject("main_img", vo.getMain_img());

		return mav;
	}

	@ResponseBody
	@RequestMapping("/getRoomReser")
	public String getRoomReser(int cafe_no, String reser_date) {
		String str = "";

		List<RoomReserVo> list = cafedao.getRoomReser(cafe_no, reser_date);

		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(list);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}

	@ResponseBody
	@RequestMapping("/getRoomTime")
	public String getRoomTime(int room_no) {
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.getRoomTime(room_no));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}

	@ResponseBody
	@RequestMapping("/getRoom")
	public String getRoom(int cafe_no) {
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.getRoom(cafe_no));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}

	@ResponseBody
	@RequestMapping(value = "requestupload2.do", method = RequestMethod.POST)
	public String requestupload2(MultipartHttpServletRequest mtfRequest, int cafe_no, int cust_no) {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String src = mtfRequest.getParameter("src");

		String path = "/cafe_img/";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈
			String real = mtfRequest.getRealPath(path);
			String safeFile = real + System.currentTimeMillis() + originFileName;
			String fname = safeFile;
			fname = fname.substring(real.length());

			try {
				mf.transferTo(new File(safeFile));

				HashMap map = new HashMap();
				map.put("fname", fname);
				String str = cafedao.inserCafeReviewIMG(map);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return "redirect:/requestupload2";
	}

	@RequestMapping("/custMyPage2.do")
	public void custMyPage2() {

	}

	@RequestMapping("/custMyPage.do")
	public void custMyPage() {

	}

	@RequestMapping("/NewFile.do")
	public void NewFile() {

	}

	@RequestMapping("/insertLicenseNumber.do")
	public void insertLicenseNumber() {

	}

	@RequestMapping("/insertLicenseNumber2.do")
	public void insertLicenseNumber2() {

	}





	@RequestMapping("/seatMap.do")
	public void seatMap() {

	}

	@RequestMapping("/indextest2.do")
	public void indextest() {

	}

	@RequestMapping("/blank_page")
	public void blank_page() {

	}

	@ResponseBody
	@RequestMapping("/printStar")
	public String printStar(int cafeno) {

		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.printStar(cafeno));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/gradeSort")
	public String gradeSort(String sido, String gugun, String keyword, String start, String end) {
		String cafe_loc;
		if (gugun.equals("전체")) {
			cafe_loc = sido;
		} else {
			cafe_loc = sido + " " + gugun;
		}

		HashMap map = new HashMap();
		map.put("cafe_loc", cafe_loc);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		String str = "";
		try {

			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.gradeSort(map));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/sellSort")
	public String sellSort(String sido, String gugun, String keyword, String start, String end) {
		String cafe_loc;
		if (gugun.equals("전체")) {
			cafe_loc = sido;
		} else {
			cafe_loc = sido + " " + gugun;
		}

		HashMap map = new HashMap();
		map.put("cafe_loc", cafe_loc);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.sellSort(map));
			System.out.println(str);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/passPriceSort")
	public String passPriceSort(String sido, String gugun, String keyword, String start, String end) {
		String cafe_loc;
		if (gugun.equals("전체")) {
			cafe_loc = sido;
		} else {
			cafe_loc = sido + " " + gugun;
		}

		HashMap map = new HashMap();
		map.put("cafe_loc", cafe_loc);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		String str = "";
		try {
			System.out.println("이용권" + start + " : " + end);

			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.passPriceSort(map));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/roomPriceSort")
	public String roomPriceSort(String sido, String gugun, String keyword, String start, String end) {
		String cafe_loc;
		if (gugun.equals("전체")) {
			cafe_loc = sido;
		} else {
			cafe_loc = sido + " " + gugun;
		}

		HashMap map = new HashMap();
		map.put("cafe_loc", cafe_loc);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		String str = "";
		try {
			System.out.println("룸" + start + " : " + end);
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.roomPriceSort(map));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/searchCafe")
	public String searchCafe(String sido, String gugun, String keyword, String start, String end) {
		String cafe_loc;
		if (gugun.equals("전체")) {
			cafe_loc = sido;
		} else {
			cafe_loc = sido + " " + gugun;
		}

		HashMap map = new HashMap();
		map.put("cafe_loc", cafe_loc);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.searchCafe(map));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/totalCount")
	public String totalCount() {
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.totalCount());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/sellCount")
	public String sellCount(String sido, String gugun, String keyword, String start, String end) {
		String cafe_loc;
		if (gugun.equals("전체")) {
			cafe_loc = sido;
		} else {
			cafe_loc = sido + " " + gugun;
		}

		HashMap map = new HashMap();
		map.put("cafe_loc", cafe_loc);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.sellCount(map));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/gradeCount")
	public String gradeCount(String sido, String gugun, String keyword, String start, String end) {
		String cafe_loc;
		if (gugun.equals("전체")) {
			cafe_loc = sido;
		} else {
			cafe_loc = sido + " " + gugun;
		}
		
		HashMap map = new HashMap();
		map.put("cafe_loc", cafe_loc);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.gradeCount(map));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/passCount")
	public String passCount(String sido, String gugun, String keyword, String start, String end) {
		String cafe_loc;
		if (gugun.equals("전체")) {
			cafe_loc = sido;
		} else {
			cafe_loc = sido + " " + gugun;
		}

		HashMap map = new HashMap();
		map.put("cafe_loc", cafe_loc);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.passCount(map));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/roomCount")
	public String roomCount(String sido, String gugun, String keyword, String start, String end) {
		String cafe_loc;
		if (gugun.equals("전체")) {
			cafe_loc = sido;
		} else {
			cafe_loc = sido + " " + gugun;
		}

		HashMap map = new HashMap();
		map.put("cafe_loc", cafe_loc);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.roomCount(map));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/cafeListAll")
	public String cafeListAll(String start, String end) {
		String str = "";
		try {
			HashMap map = new HashMap();
			map.put("start", start);
			map.put("end", end);
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.cafeListAll(map));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
	}

	@RequestMapping("/cafeList1.do")
	public Model cafeList1(@ModelAttribute("loginVo") LoginVo lv, Model model) {
		model.addAttribute("loginVo", lv);
		return model;
	}

	@RequestMapping("/cafeList.do")
	public void cafeList() {

	}

	@ResponseBody
	@RequestMapping("/inqCount")
	public String countCafePassSale(int cafe_no) {
		String re = "";
		re = cafedao.inqCount(cafe_no);
		return re;
	}

	@ResponseBody
	@RequestMapping("/updateInq")
	public String updateInq(String text, int inq_no) {
		String str = "";
		HashMap map = new HashMap();
		map.put("text", text);
		map.put("inq_no", inq_no);
		int re = cafedao.updateInq(map);
		if (re > 0) {
			str = "답변을 달았습니다";
		} else {
			str = "답변 등록 실패";
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/updateReview")
	public String updateReview(String text, int review_no) {
		String str = "";
		HashMap map = new HashMap();
		map.put("text", text);
		map.put("review_no", review_no);
		int re = cafedao.updateReview(map);
		if (re > 0) {
			str = "답변을 달았습니다";
		} else {
			str = "답변 등록 실패";
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/insertInq")
	public String insertInq(int cafe_no, String content, int cust_no, String issecret) {
		String str = "";
		HashMap map = new HashMap();
		map.put("cafe_no", cafe_no);
		map.put("content", content);
		map.put("cust_no", cust_no);
		map.put("issecret", issecret);

		int re = cafedao.insertInq(map);

		if (re > 0) {
			str = "등록완료";
		} else {
			str = "등록실패";
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/inqAllList")
	public String listCafePassSale(int cafe_no, int start, int end) {
		String str = "";
		HashMap map = new HashMap();
		map.put("cafe_no", cafe_no);
		map.put("start", start);
		map.put("end", end);
		for (InqVo vo : cafedao.inqAllList(map)) {
		}
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.inqAllList(map));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}

	@ResponseBody
	@RequestMapping("/chkbox")
	public String chkbox(int cafe_no) {
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.getChkBox(cafe_no));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}

	@RequestMapping("/cafeDetail23.do")
	public ModelAndView cafeDetail23(int cafe_no, int cust_no) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("cafe", cafedao.cafeDetail(cafe_no));
		mav.addObject("pass", cafedao.passList(cafe_no));
		mav.addObject("inqs", cafedao.inqList(cafe_no));
		mav.addObject("cust", cafedao.getCustomer(cust_no));
		mav.addObject("total", cafedao.getTotalAvg(cafe_no));

		return mav;
	}
	
	@RequestMapping("/cafeInsert.do")
	public void cafeInsert() {
		
	}

	@RequestMapping("/cafeDetail2.do")
	public ModelAndView cafeDetail2(int cafe_no, int cust_no) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("cafe", cafedao.cafeDetail(cafe_no));
		mav.addObject("pass", cafedao.passList(cafe_no));
		mav.addObject("inqs", cafedao.inqList(cafe_no));
		/* mav.addObject("review",cafedao.reviewList1St(cafe_no)); */
		mav.addObject("cust", cafedao.getCustomer(cust_no));
		mav.addObject("total", cafedao.getTotalAvg(cafe_no));
		/* mav.addObject("chkbox", cafedao.getChkBox(cafe_no)); */

		return mav;
	}

	@RequestMapping("/cafeManage.do")
	public ModelAndView cafeManage(int cafe_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("cafe", cafedao.cafeDetail(cafe_no));
		mav.addObject("pass", cafedao.passList(cafe_no));
		mav.addObject("inqs", cafedao.inqList(cafe_no));
		/* mav.addObject("review",cafedao.reviewList1St(cafe_no)); */
		/* mav.addObject("cust", cafedao.getCustomer(cust_no)); */
		mav.addObject("total", cafedao.getTotalAvg(cafe_no));

		return mav;
	}

	@RequestMapping("/blank1.do")
	public void blank1() {

	}

	@RequestMapping("/cafeInsert2.do")
	public void cafeInsert2() {

	}

	@RequestMapping("/cafeInsert3.do")
	public void cafeInsert3() {

	}

	@RequestMapping("/cafeInsert4.do")
	public void cafeInsert4() {

	}



	@ResponseBody
	@RequestMapping("/reviewList")
	public String reviewList(int cafe_no, int start, int end) {
		String str = "";
		HashMap map = new HashMap();
		map.put("cafe_no", cafe_no);
		map.put("start", start);
		map.put("end", end);

		for (ReviewVo vo : cafedao.reviewList(map)) {
			System.out.println(vo);
		}
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.reviewList(map));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}

	@ResponseBody
	@RequestMapping("/reviewCount")
	public String reviewCount(int cafe_no) {
		String re = "";
		re = cafedao.reviewCount(cafe_no);
		System.out.println("리뷰또딸까운뜨" + re);
		return re;
	}

	@ResponseBody
	@RequestMapping("/insertReview")
	public String insertReview(String review_content, int grade, int cafe_no, int cust_no) {
		String str = "";
		HashMap map = new HashMap();
		map.put("review_content", review_content);
		map.put("grade", grade);
		map.put("cafe_no", cafe_no);
		map.put("cust_no", cust_no);

		int re = cafedao.insertReview(map);

		if (re > 0) {
			str = "등록완료";
		} else {
			str = "등록실패";
		}

		return str;
	}

	@ResponseBody
	@RequestMapping("/getGradeCnt")
	public String getGradeCnt(int cafe_no) {

		String str = "";

		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.getGradeCnt(cafe_no));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}

	@ResponseBody
	@RequestMapping("/getReviewImg")
	public String getReviewImg(int review_no) {
		String str = "";

		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(cafedao.getReviewImg(review_no));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}

	@RequestMapping(value = "/uploadIMG", method = RequestMethod.POST)
	@ResponseBody
	public String upload(MultipartFile[] files) {
		String str = "ㅎㅇ";
		List<MultipartFile> list = null;
		MultipartFile[] filse = files;
		System.out.println(filse.length);
		System.out.println(files.length);
		return str;

	}

}
