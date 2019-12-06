package com.bit.std_1st.db;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bit.std_1st.vo.CustomerVo;
import com.bit.std_1st.vo.FollowVo;
import com.bit.std_1st.vo.FollowerVo;
import com.bit.std_1st.vo.ProviderVo;
import com.bit.std_1st.vo.SNSImgVo;
import com.bit.std_1st.vo.SNSLikeVo;
import com.bit.std_1st.vo.SNSReplyVo;
import com.bit.std_1st.vo.SNSTagVo;
import com.bit.std_1st.vo.SNSVo;

public class SNSManager {
	private static SqlSessionFactory factory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/bit/std_1st/db/dbConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
			
		}
	}
	
	//--------------------------------
	
		public static List<SNSImgVo> listSNSImg() {
			List<SNSImgVo> list = null;
			SqlSession session= factory.openSession();
			list=session.selectList("sns.listSNSImg");
			session.close();	
			return list;
		}
		
		//--------------------------------
		
		public static int isClicked(HashMap map) {
			int re = -1;
			SqlSession session = factory.openSession();
			re = session.selectOne("sns.isClicked", map);
			session.close();		
			return re;
		}
		
		public static int insertSNSLike(SNSLikeVo snslikevo) {
			int re = -1;
			SqlSession session = factory.openSession(true);
			re = session.insert("sns.insertSNSLike", snslikevo);
			session.close();		
			return re;
		}
		
		public static int deleteSNSLike(HashMap map) {
			int re = -1;
			SqlSession session = factory.openSession(true);
			re = session.delete("sns.deleteSNSLike", map);
			session.close();		
			return re;
		}
		
		public static int nextNoSNSLike() {
			int re = -1;
			SqlSession session = factory.openSession();
			re = session.selectOne("sns.nextNoSNSLike");
			session.close();		
			return re;
		}
		
		
		//--------------------------------
		
		public static int insertSNSReply(SNSReplyVo snsreplyvo) {
			int re = -1;
			System.out.println("cust_no="+snsreplyvo.getCust_no());
			System.out.println("provider_no="+snsreplyvo.getProvider_no());
			System.out.println("reply_content="+snsreplyvo.getReply_content());
			System.out.println("reply_no="+snsreplyvo.getReply_no());
			System.out.println("sns_no="+snsreplyvo.getSns_no());
			
			SqlSession session = factory.openSession(true);
			re = session.insert("sns.insertSNSReply", snsreplyvo);
			System.out.println("re=>"+re);
			session.close();		
			return re;
		}
			
		public static int nextNoSNSReply() {
			int re = -1;
			SqlSession session = factory.openSession();
			re = session.selectOne("sns.nextNoSNSReply");
			session.close();		
			return re;
		}
		
		
		//--------------------------------
		
		public static int getSNSLike(int sns_no) {
			int re = -1;
			SqlSession session = factory.openSession();
			re = session.selectOne("sns.getSNSLike", sns_no);
			session.close();
			return re;
		}

		public static SNSVo getSNS(int sns_no) {
			SNSVo snsvo = null;
			SqlSession session = factory.openSession();
			snsvo = session.selectOne("sns.getSNS", sns_no);
			session.close();
			return snsvo;
		}
		
		public static List<SNSImgVo> getSNSImg(int sns_no) {
			List<SNSImgVo> list = null;
			SqlSession session = factory.openSession();
			list = session.selectList("sns.getSNSImg", sns_no);
			session.close();
			return list;
		}

		public static List<SNSReplyVo> getSNSReply(int sns_no) {
			List<SNSReplyVo> list = null;
			SqlSession session = factory.openSession();
			list = session.selectList("sns.getSNSReply", sns_no);
			session.close();
			return list;
		}
		
		public static List<SNSTagVo> getSNSTag(int sns_no) {
			List<SNSTagVo> list = null;
			SqlSession session = factory.openSession();
			list = session.selectList("sns.getSNSTag", sns_no);
			session.close();
			return list;
		}
		
		public static CustomerVo getCustInfo(int cust_no) {
			CustomerVo customervo = null;
			SqlSession session = factory.openSession();
			customervo = session.selectOne("sns.getCustInfo", cust_no);
			session.close();
			return customervo;
		}
		
		public static ProviderVo getProvInfo(int provider_no) {
			ProviderVo providervo = null;
			SqlSession session = factory.openSession();
			providervo = session.selectOne("sns.getProvInfo", provider_no);
			session.close();
			return providervo;
		}
	
	
	
	public static List<SNSVo> snsSchImg(HashMap map) {
		List<SNSVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("sns.snsSchImg", map);
		session.close();
		return list;
	}
	
	public static int cntFollowing(String type, int no) {
		int re = -1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("no", no);
		SqlSession session = factory.openSession();
		re = session.selectOne("sns.cntFollowing", map);
		session.close();
		return re;
	}

	public static int cntFollower(String f_type, int f_no) {
		int re = -1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("f_type", f_type);
		map.put("f_no", f_no);
		SqlSession session = factory.openSession();
		re = session.selectOne("sns.cntFollower", map);
		session.close();
		return re;
	}
	
	public static List<FollowerVo> listFollowing(String type, int no) {
		List<FollowerVo> vo = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("no", no);
		SqlSession session = factory.openSession();
		vo = session.selectList("sns.listFollowing", map);
		session.close();
		return vo;
	}
	public static List<FollowerVo> listFollower(String f_type, int f_no) {
		List<FollowerVo> vo = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("f_type", f_type);
		map.put("f_no", f_no);
		SqlSession session = factory.openSession();
		vo = session.selectList("sns.listFollower", map);
		session.close();
		return vo;
	}
	
	public static List<SNSImgVo> listSnsMyPage(int cust_no, int provider_no) {
		List<SNSImgVo> vo = null;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cust_no", cust_no);
		map.put("provider_no", provider_no);
		
		SqlSession session = factory.openSession();
		vo = session.selectList("sns.listSnsMyPage", map);
		session.close();
		return vo;
	}
	
	public static int isFollow(FollowVo vo) {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.selectOne("sns.isFollow", vo);
		session.close();
		return re;
	}

	public static int insertFollow(FollowVo vo) {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.insert("sns.insertFollow", vo);
		session.commit();
		session.close();
		return re;
	}
	public static int deleteFollow(FollowVo vo) {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.delete("sns.deleteFollow", vo);
		session.commit();
		session.close();
		return re;
	}
	
	public static int getNextFollowNo() {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.selectOne("sns.getNextFollowNo");
		session.close();
		return re;
	}
	
	public static int getNextSNSTagNo() {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.selectOne("sns.getNextSNSTagNo");
		session.close();
		return re;
	}
	
	public static int getNextSNSImgNo() {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.selectOne("sns.getNextSNSImgNo");
		session.close();
		return re;
	}
	
	public static int getNextSNSNo() {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.selectOne("sns.getNextSNSNo");
		session.close();
		return re;
	}
	
	public static int insertSNS(SNSVo sns_vo, ArrayList<SNSImgVo> sns_img_vos, ArrayList<SNSTagVo> sns_tag_vos) {
		int re = -1;
		System.out.println("manager 들어옴");
		System.out.println(sns_vo.toString());
		
		HashMap map = new HashMap();
		map.put("sns_no", sns_vo.getSns_no());
		map.put("sns_content", sns_vo.getSns_content());
		map.put("cust_no", sns_vo.getCust_no());
		map.put("provider_no", sns_vo.getProvider_no());
		
		
		SqlSession session = factory.openSession();
		re = session.insert("sns.insertSNS", sns_vo);
		System.out.println("sns insert 성공 : "+re);
		for(SNSImgVo sns_img_vo : sns_img_vos ) {
			re += session.insert("sns.insertSNSImg", sns_img_vo);
		}
		System.out.println("iimg insert 성공 : "+re);
		
		for(SNSTagVo sns_tag_vo : sns_tag_vos ) {
			re += session.insert("sns.insertSNSTag", sns_tag_vo);
		}
		System.out.println("tag insert 성공 : "+re);
		
		
			
		if(re>1) {
			session.commit();
		}
		session.close();
		return re;
	}
}
