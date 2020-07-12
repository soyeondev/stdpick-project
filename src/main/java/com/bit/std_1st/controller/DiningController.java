package com.bit.std_1st.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bit.std_1st.vo.LoginVo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@SessionAttributes("loginVo")
@Controller
public class DiningController {
	@ModelAttribute("loginVo")
	public LoginVo initLoginVo() {
		return null;
	}

	@RequestMapping("diningSch")
	public void diningSch() {}

	@RequestMapping("diningSch2")
	public void diningSch2() {}
	
	@ResponseBody
	@RequestMapping("/diningList.do")
	public String getDiningList(String enc_query) {
		String str = "";
		ArrayList list = new ArrayList();
		for(int j = 0 ; j < 10 ; j++) {
        String url = "https://search.naver.com/search.naver?date_from=&date_option=0&date_to=&dup_remove=1&nso=&post_blogurl=&post_blogurl_without=&query="+enc_query+"&sm=tab_pge&srchby=all&st=sim&where=post&start="+j+"1";
//        String url = "https://search.naver.com/search.naver?where=post&sm=tab_jum&query=밀플랜비";
        try {
        	Document doc = Jsoup.connect(url).get();
        	Element container = doc.select("#container").get(0);
        	Elements content_all = container.select(".sh_blog_top");
        	
        	for(int i = 0; i < content_all.size(); i++) {
        		HashMap map = new HashMap();

        		Element thumb = content_all.get(i);
        		Element thumb_divs = thumb.select(".thumb").get(0);
        		
        		// 썸네일 이미지0
        		String thumb_nail = thumb_divs.select("img").attr("src");
        		map.put("thumb_nail", thumb_nail);
        		
        		// 게시물 링크
        		String link = thumb_divs.select("a").attr("href");
        		map.put("link", link);
        		
        		// 게시물 등록일0
	    		Element regdate = content_all.select(".txt_inline").get(i);
        		map.put("regdate", regdate.text());
        		
        		// 게시물 제목0
        		Element title = content_all.select(".sh_blog_title").get(i);
        		map.put("title", title.text());
        		
        		// 게시물 내용0
        		Element passage = content_all.select(".sh_blog_passage").get(i);
        		map.put("passage", passage.text());
        		
        		// 블로그 제목0
        		Element blog_name = content_all.select(".txt84").get(i);
        		map.put("blog_name", blog_name.text());
        		
        		// 블로그 링크0
        		Element blog_url = content_all.select(".url").get(i);
        		map.put("blog_url", blog_url.text());
   
        		list.add(map);
        		
        	}
        	
        } catch(Exception e) {
            
        }
        
	}

		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return str;
	}
	
	@RequestMapping("/diningList")
	public void diningList() {}
}
