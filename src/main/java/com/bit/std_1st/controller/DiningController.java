package com.bit.std_1st.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

	@ResponseBody
	@RequestMapping("/diningList.do")
	public String getDiningList(String enc_query) {
		long start = System.currentTimeMillis();

		String str = "";
		ArrayList list = new ArrayList();

		for(int j = 0 ; j < 1 ; j++) {	// 10 페이지까지 크롤링
			String url = "https://search.naver.com/search.naver?date_from=&date_option=0&date_to=&dup_remove=1&nso=&post_blogurl=&post_blogurl_without=&query="+enc_query+"&sm=tab_pge&srchby=all&st=sim&where=post&start="+j+"1";
			try {
				Document doc = Jsoup.connect(url).get();

				Element container = doc.select("#container").first();
				Elements content_all = container.select(".sh_blog_top");

				for(int i = 0; i < content_all.size(); i++) {
					HashMap map = new HashMap();

					Element thumb = content_all.get(i);

					String blog_li = thumb.toString().replace('"', ' ');
					blog_li = blog_li.replaceAll("(\r\n|\r|\n|\n\r)", "");

					// 썸네일 이미지
					Pattern patn = Pattern.compile("[<].*?src=(.*?)alt.*?[>]");
					Matcher matr = patn.matcher(blog_li);

					while(matr.find()) {
						map.put("thumb_nail", matr.group(1));

						if(matr.group(1) == null) {
							break;
						}
					}

					// 게시물 링크
					patn = Pattern.compile("[<a].*?href=(.*?)target.*?sp_thmb.*?[>]");
					matr = patn.matcher(blog_li);

					while(matr.find()) {
						map.put("link", matr.group(1));

						if(matr.group(1) == null) {
							break;
						}
					}

					// 게시물 등록일
					patn = Pattern.compile(".*?txt_inline.*?>(.*?)<");
					matr = patn.matcher(blog_li);

					while(matr.find()) {
						map.put("regdate", matr.group(1));

						if(matr.group(1) == null) {
							break;
						}
					}

					// 게시물 제목
					patn = Pattern.compile(".*?sh_blog_title.*?>(.*?)</a>");
					matr = patn.matcher(blog_li);

					while(matr.find()) {
						map.put("title", matr.group(1));

						if(matr.group(1) == null) {
							break;
						}
					}

					// 게시물 내용
					patn = Pattern.compile(".*?sh_blog_passage.*?>(.*?)</dd>");
					matr = patn.matcher(blog_li);

					while(matr.find()) {
						map.put("passage", matr.group(1));

						if(matr.group(1) == null) {
							break;
						}
					}

					// 블로그 제목
					patn = Pattern.compile(".*?txt84.*?>(.*?)</a>");
					matr = patn.matcher(blog_li);

					while(matr.find()) {
						map.put("blog_name", matr.group(1));
						if(matr.group(1) == null) {
							break;
						}
					}

					// 블로그 링크
					patn = Pattern.compile(".*?class= url.*?>(.*?)</a>");
					matr = patn.matcher(blog_li);

					while(matr.find()) {
						map.put("blog_url", matr.group(1));
						if(matr.group(1) == null) {
							break;
						}
					}
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
		// 2.773초

		return str;

	}

}
