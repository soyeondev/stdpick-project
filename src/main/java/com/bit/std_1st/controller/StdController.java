package com.bit.std_1st.controller;

import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.std_1st.dao.StdDao;
import com.bit.std_1st.vo.HashTagVo;
import com.bit.std_1st.vo.LoginVo;
import com.bit.std_1st.vo.StdApplyVo;
import com.bit.std_1st.vo.StdVo;
import com.fasterxml.jackson.databind.ObjectMapper;

@SessionAttributes("loginVo")
@Controller
public class StdController {
	@Autowired
	private StdDao std_dao;
	
	public void setStd_dao(StdDao std_dao) {
		this.std_dao = std_dao;
	}
	@ModelAttribute("loginVo")
	public LoginVo initLoginVo() {
		return null;
	}
	
	
	@ResponseBody
	@RequestMapping("/updateStdHit")
	public String updateStdHit(int std_no) {
	
		std_dao.updateStdHits(std_no);
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(std_dao.getStdHits(std_no));

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
		
	}
	
	
	@RequestMapping("/StuderSuccess")
	public void StuderSuccess() {
		
	}
	
	@RequestMapping("/StuderApplySuccess")
	public void StuderApplySuccess() {
		
	}
	
	
	@RequestMapping(value = "/insertStd", method = RequestMethod.GET)
	public ModelAndView insertStd() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("insertStd");
		return mav;
	}


	@RequestMapping(value = "/insertStd", method = RequestMethod.POST)
	public ModelAndView insertStd(StdVo vo,int founder_no, HashTagVo vo_hs, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:StuderSuccess?cust_no="+founder_no);
		System.out.println(founder_no);
		MultipartFile file = vo.getUpload();
		// path 변수에 stdpick_img폴더의 경로를 받아옴
		String path = request.getRealPath("images/std_img/upload");
		// 선택된 파일의 원래이름을 받아아와서 출력
		// 내가 지정하고 싶은 파일이름을 fname의 값에 넣어줌
		String fname = "";
		if(file.isEmpty()) {
			fname = "std_default.PNG";
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
		
		// vo에 파일이름을 실어줌
		vo.setStd_image(fname);

		vo.setStd_no(std_dao.getNextNo());
		vo.setFounder_no(founder_no);
		vo.setStd_hits(0);
		std_dao.insertStd(vo);

		String tag_str = vo_hs.getTag_content();
		String tag_arr[] = tag_str.split("#");
		for (int i = 1; i < tag_arr.length; i++) {
			HashTagVo vo_for = new HashTagVo();
			vo_for.setTag_no(std_dao.getNextNo_ht());
			vo_for.setStd_no(std_dao.getNextNo() - 1);
			vo_for.setTag_content(tag_arr[i]);
			std_dao.insertHashTag(vo_for);
		}
		
		return mav;
		
	}
	
	
	
	
	 @RequestMapping(value="/updateStd", method=RequestMethod.GET)
	 public ModelAndView updateStd(int std_no) {
		 List<HashTagVo> list = std_dao.getHashTag(std_no);
		 StdVo vo_std = std_dao.getStd(std_no);

		 String str_hs = "";
		 for(int i = 0; i < list.size(); i++) {
			 str_hs += "#"+list.get(i).getTag_content()+" ";
		 }
		 
		 String str_loc = "";
		 str_loc = vo_std.getStd_loc();
		 String []data = str_loc.split("-");
		 
		 ModelAndView mav = new ModelAndView();

		 mav.addObject("s", vo_std);
		 mav.addObject("sido", data[0]);
		 mav.addObject("sigu", data[1]);
		 mav.addObject("h", str_hs);
		 mav.setViewName("updateStd");
		 return mav;
	 }
	 
		@RequestMapping("/updateStd.do")
		public void updateStd() {
		}

		@RequestMapping(value = "/updateStdPost", method = RequestMethod.POST)
		public ModelAndView updateStdPost(StdVo s, HashTagVo vo_hs, HttpServletRequest request) {
			int re = -1;
			int re_del = -1;
			String oldName = s.getStd_image();
			// 내가 저장할 폴더의 이름을 getrealpath해서 가져옴
			System.out.println("founder_no: "+s.getFounder_no());
			String path = request.getRealPath("images/std_img/upload");
			System.out.println(path);
			String fname = null;
			// input file에서 가져온값이 vo의 upload에 들어감
			MultipartFile upload = s.getUpload();
			s.setStd_hits(0);
			
			if(upload.isEmpty()) {
				fname = oldName;
			}else {
				fname = System.currentTimeMillis() + upload.getOriginalFilename();
				
				try {
					// 새로바뀐 upload를 불러와서 getBytes()만 해주면
					byte[] data = upload.getBytes();
					FileOutputStream fos = new FileOutputStream(path + "/" + fname);
					fos.write(data);
					fos.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
			
			s.setStd_image(fname);
			
			// update 가 성공하고 나서
			re = std_dao.updateStd(s);
			System.out.println("re: " + re);
			if (re == 1) {
				String tag_str = vo_hs.getTag_content();
				String tag_arr[] = tag_str.split("#");
				// 기존에 있던 헤시태그 지우고 다시 넣기
				re_del = std_dao.deleteHashTag(s.getStd_no());
				System.out.println("re_del: "+re_del);
				for (int i = 1; i < tag_arr.length; i++) {
					System.out.println(tag_arr[i]);
					HashTagVo vo_for = new HashTagVo();
					vo_for.setTag_no(std_dao.getNextNo_ht());
					vo_for.setStd_no(s.getStd_no());
					vo_for.setTag_content(tag_arr[i]);
					std_dao.insertHashTag(vo_for);
				}

			}

			ModelAndView mav = new ModelAndView();
				
			mav.setViewName("custMyPage");
			return mav;

		}
	
	@ResponseBody
	@RequestMapping(value = "/insertHash", method = RequestMethod.POST)
	public int insertHash(HashTagVo vo) {
		int r_ht = -1;
		return r_ht;
	}

	@RequestMapping("/updateAplyWtg.do")
	public ModelAndView updateAplyWtg(int apply_no) {
		System.out.println("apply_no: " + apply_no);
		ModelAndView mav = new ModelAndView();
		std_dao.updateAplyWtg(apply_no);
		mav.addObject("apply_no", apply_no);
		mav.setViewName("manageStd");
		return mav;

	}

	@RequestMapping("/deleteAply.do")
	public ModelAndView deleteAplyIng(int apply_no) {
		ModelAndView mav = new ModelAndView();
		std_dao.deleteAply(apply_no);
		mav.addObject("apply_no", apply_no);
		mav.setViewName("manageStd");
		return mav;

	}
	
	@RequestMapping(value = "/applyStd", method = RequestMethod.GET)
	public ModelAndView applyStd(int std_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("s", std_no);
		mav.setViewName("applyStd");
		return mav;
	}
	
	@RequestMapping(value = "/applyStdTst", method = RequestMethod.POST)
	public ModelAndView applyStdPost(StdApplyVo vo) {
		ModelAndView mav = new ModelAndView("redirect:StuderApplySuccess?std_no="+vo.getStd_no()+"&isClosed=-1");
		int re = -1;

		vo.setApply_no(std_dao.getNextNoApply());
		re = std_dao.insertStdApply(vo);
		
		return mav;
		
	}

	@RequestMapping("/confStdWtg")
	public void confStd() {
	}


	@RequestMapping("/manageStd")
	public ModelAndView manageStd(int std_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("s", std_dao.getStd(std_no));
		mav.setViewName("manageStd");
		return mav;
	}

	@ResponseBody
	@RequestMapping("/getIngPicker")
	public String getIngPicker(int std_no) {
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(std_dao.getIngPicker(std_no));

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}

	@ResponseBody
	@RequestMapping("/getWtgPicker")
	public String getWtgPicker(int std_no) {
		String str = "";
		try {
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(std_dao.getWtgPicker(std_no));

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}

	@RequestMapping("/confStdWtg.do")
	public ModelAndView confStdWtg(int cust_no, int apply_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("s", std_dao.confStd(cust_no, apply_no));
		return mav;
	}

	@RequestMapping("/confStdIng.do")
	public ModelAndView confStdIng(int cust_no, int apply_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("s", std_dao.confStd(cust_no, apply_no));
		return mav;
	}

	int pageSIZE = 5;
	// 한화면에 보여줄 레코드의 수

	int totalRecord = 0;
	// 전체레코드의 수

	int totalPage = 1;
	// 전체페이지의 수

	@RequestMapping("/listStd.do")
	public void listStd() {
	}

	@ResponseBody
	@RequestMapping("/getListStd.do")
	public String getListStd(@RequestParam(value="sido",defaultValue = "")String sido,
			@RequestParam(value="gugun",defaultValue = "")String gugun,
			@RequestParam(value="keyword",defaultValue = "")String keyword,
			@RequestParam(value="start",defaultValue = "1")int start,
			@RequestParam(value="end",defaultValue = "5")int end) {

		String str="";
		HashMap map = new HashMap();

		String s_keyword=null;
		String s_sido=null;
		String s_gugun=null;		
				
		if(sido.equals("시/도 선택")) {
			s_sido=null;
			s_gugun=null;	
		}
		
		if(keyword != null && !keyword.equals("")) {
			s_keyword = keyword;
			map.put("keyword", s_keyword);			
		}

		if((sido != null && !sido.equals("")) && !sido.equals("시/도 선택")) {
			s_sido = sido;
			s_gugun = gugun;
			map.put("local",s_sido+"-"+s_gugun);
		}
		
		map.put("start",start);
		map.put("end",end);
		
		List<StdVo> list = std_dao.listStd(map);
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
	@RequestMapping("/getCountStd.do")
	public int getCountStd(@RequestParam(value="sido",defaultValue = "")String sido,
			@RequestParam(value="gugun",defaultValue = "")String gugun,
			@RequestParam(value="keyword",defaultValue = "")String keyword) {
		int re =-1;
		
		HashMap map = new HashMap();

		String s_keyword=null;
		String s_sido=null;
		String s_gugun=null;		
				
		if(sido.equals("시/도 선택")) {
			s_sido=null;
			s_gugun=null;	
		}
		
		if(keyword != null && !keyword.equals("")) {
			s_keyword = keyword;
			map.put("keyword", s_keyword);			
		}

		if((sido != null && !sido.equals("")) && !sido.equals("시/도 선택")) {
			s_sido = sido;
			s_gugun = gugun;
			map.put("local",s_sido+"-"+s_gugun);
		}
		
		re = std_dao.getCountStd(map);
		return re;        
	}



	@RequestMapping("/detailStd.do")
	public ModelAndView detailStd(int std_no,int isClosed) {
	List<HashTagVo> list = std_dao.getHashTag(std_no);
	ModelAndView mav = new ModelAndView();
	String str_hs = "";
	for(int i = 0; i < list.size(); i++) {
	   str_hs += "#"+list.get(i).getTag_content()+" ";
	}
	          
	mav.addObject("s", std_dao.getStd(std_no));
	mav.addObject("h", str_hs);
	mav.addObject("isClosed",isClosed);
	return mav;
	      }
}
