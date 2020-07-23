package com.bit.std_1st.controller;

import com.bit.std_1st.vo.LoginVo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@SessionAttributes("loginVo")
@Controller
public class DiningController_jsoup {

	@ResponseBody
	@RequestMapping("/diningList_j.do")
	public String getDiningList(String enc_query) {
		long start = System.currentTimeMillis();

		String str = "";
		ArrayList list = new ArrayList();
		for(int j = 0 ; j < 10 ; j++) {	// 10 페이지까지 크롤링
			String url = "https://search.naver.com/search.naver?date_from=&date_option=0&date_to=&dup_remove=1&nso=&post_blogurl=&post_blogurl_without=&query="+enc_query+"&sm=tab_pge&srchby=all&st=sim&where=post&start="+j+"1";
			try {
				Document doc = Jsoup.connect(url).get();
				Element container = doc.select("#container").first();
				Elements content_all = container.select(".sh_blog_top");

				for(int i = 0; i < content_all.size(); i++) {
					HashMap map = new HashMap();

					Element content = content_all.get(i);
					Element thumb_divs = content.select(".thumb").first();

					// 썸네일 이미지
					String thumb_nail = thumb_divs.select("img").attr("src");
					map.put("thumb_nail", thumb_nail);

					// 게시물 링크
					String link = thumb_divs.select("a").attr("href");
					map.put("link", link);

					// 게시물 등록일
					Element regdate = content.select(".txt_inline").first();
					map.put("regdate", regdate.text());

					// 게시물 제목
					Element title = content.select(".sh_blog_title").first();
					map.put("title", title.text());

					// 게시물 내용
					Element passage = content.select(".sh_blog_passage").first();
					map.put("passage", passage.text());

					// 블로그 제목
					Element blog_name = content.select(".txt84").first();
					map.put("blog_name", blog_name.text());

					// 블로그 링크
					Element blog_url = content_all.select(".url").first();
					map.put("blog_url", blog_url.text());

					list.add(map);

				}

			} catch(Exception e) {
				e.printStackTrace();
			}

		}

		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		long end = System.currentTimeMillis();
		System.out.println("실행시간: "+(end - start )/1000.0 +"초");
		// 3.037초

		return str;

	}

}
