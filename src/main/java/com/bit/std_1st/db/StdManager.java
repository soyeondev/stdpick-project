package com.bit.std_1st.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bit.std_1st.vo.CustomerApplyVo;
import com.bit.std_1st.vo.HashTagVo;
import com.bit.std_1st.vo.StdApplyVo;
import com.bit.std_1st.vo.StdVo;

public class StdManager {
	private static SqlSessionFactory factory;
	static {
		try {
			Reader reader 
			= Resources.getResourceAsReader("com/bit/std_1st/db/dbConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
			
		}
		
	}
	public static int updateStdHits(int std_no) {
		int re = 0;
		SqlSession session = factory.openSession(true);
		re = session.update("std.updateStdHits",std_no);
		session.close();
		return re;
	}
	
	public static int getNextNo() {
		int no = -1;
		SqlSession session = factory.openSession();
		no = session.selectOne("std.getNextNo");
		session.close();
		return no;
	}
	
	public static int getNextNo_ht() {
		int no = -1;
		SqlSession session = factory.openSession();
		no = session.selectOne("std.getNextNo_ht");
		session.close();
		return no;
	}
	
	public static void insertStd(StdVo vo) {
		SqlSession session = factory.openSession();
		session.insert("std.insertStd", vo);
		session.commit();
		session.close();
	}
	
	public static void insertHashTag(HashTagVo vo_hs) {
		SqlSession session = factory.openSession();
		session.insert("std.insertHashTag", vo_hs);
		session.commit();
		session.close();
	}

	public static int updateStd(StdVo vo) {
		int re = 0;
		SqlSession session = factory.openSession();
		re = session.insert("std.updateStd", vo);
		session.commit();
		session.close();
		return re;
	}

//	public static int updateHashTag(HashTagVo vo_hs) {
//		int re = -1;
//		SqlSession session = factory.openSession();
//		re = session.update("std.updateHashTag", vo_hs);
//		session.commit();
//		session.close();
//		return re;
//	}
	

	public static List<HashTagVo> getHashTag(int std_no) {
		// TODO Auto-generated method stub
		List<HashTagVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("std.getHashTag", std_no);
		session.close();
		return list;
	}

	public static int deleteHashTag(int std_no) {
		// TODO Auto-generated method stub
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.delete("std.deleteHashTag", std_no);
		session.commit();
		session.close();
		return re;
	}


	public static int getNextNoApply() {
		// TODO Auto-generated method stub
		int no = 0;
		SqlSession session = factory.openSession();
		no = session.selectOne("std.getNextNoApply");
		session.close();
		return no;
	}

	public static int insertStdApply(StdApplyVo vo) {
		// TODO Auto-generated method stub
		int re = -1;
		
		SqlSession session = factory.openSession();
		System.out.println(vo.getApply_no());
		System.out.println(vo.getCust_no());
		System.out.println(vo.getStd_no());
		System.out.println(vo.getApply_content());
		re = session.insert("std.insertStdApply", vo);
		System.out.println("insertStdApply성공");
		session.commit();
		session.close();
		return re;
	}

	public static List<StdVo> allStd(int cust_no) {
		// TODO Auto-generated method stub
//		System.out.println("selectMyStd 매니저인1");
		List<StdVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("std.allStd", cust_no);
//		System.out.println("selectMyStd 매니저인2");
		session.close();
		return list;
	}
	
	public static List<StdVo> ingStd(int cust_no){
//		System.out.println("ingStd 매니저인1");
		List<StdVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("std.ingStd", cust_no);
//		System.out.println("ingStd 매니저인2");
		session.close();
		return list;
	}
	
	public static List<StdVo> endStd(int cust_no){
//		System.out.println("endStd 매니저인1");
		List<StdVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("std.endStd", cust_no);
//		System.out.println("endStd 매니저인2");
		session.close();
		return list;		
	}
	
	public static List<StdVo> myStd(int founder_no){
//		System.out.println("myStd 매니저인1");
		List<StdVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("std.myStd", founder_no);
//		System.out.println("myStd 매니저인2");
		session.close();
		return list;		
	}
	
	public static List<StdVo> watingStd(int cust_no){
//		System.out.println("watingStd 매니저인1");
		List<StdVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("std.watingStd", cust_no);
//		System.out.println("watingStd 매니저인2");
		session.close();
		return list;		
	}
	
	public static List<StdVo> getIngPicker(int std_no){
//		System.out.println("getIngPicker 매니저인1");
		HashMap map = new HashMap();
		map.put("std_no", std_no);
		List<StdVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("std.getIngPicker", map);
//		System.out.println("getIngPicker 매니저인2");
		session.close();
		return list;		
	}	
	
	public static List<StdVo> getWtgPicker(int std_no){
//		System.out.println("getWtgPicker 매니저인1");
		HashMap map = new HashMap();
		map.put("std_no", std_no);
		List<StdVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("std.getWtgPicker", map);
//		System.out.println("getWtgPicker 매니저인2");
		session.close();
		return list;		
	}
	
	public static CustomerApplyVo confStd(int cust_no, int apply_no) {
//		System.out.println("confStd 매니저인1");
		CustomerApplyVo custaplyvo = null;
		HashMap map = new HashMap();
		map.put("cust_no", cust_no);
		map.put("apply_no", apply_no);
		SqlSession session = factory.openSession();
		custaplyvo = session.selectOne("std.confStd", map);
//		System.out.println("confStd 매니저인2");
		session.close();
		return custaplyvo;
	}

	public static void updateAplyWtg(int apply_no) {
		System.out.println("manager updateAplyWtg인1");
		SqlSession session = factory.openSession();
		session.update("std.updateAplyWtg", apply_no);
		System.out.println("manager updateAplyWtg인2");
		session.commit();
		session.close();
	}
	
	public static void deleteAply(int apply_no) {
		System.out.println("manager deleteAply인1");
		SqlSession session = factory.openSession();
		session.update("std.deleteAply", apply_no);
		System.out.println("manager deleteAply인2");
		session.commit();
		session.close();
	}
	
	// 한별코드
	
	public static List<StdVo> listStd(HashMap map){
		List<StdVo> list = null;
		SqlSession session= factory.openSession();
		list=session.selectList("std.listStd",map);
		session.close();	

		return list;
	}
	
	public static StdVo getStd(int std_no) {
		StdVo stdvo = null;
		SqlSession session = factory.openSession();
		stdvo = session.selectOne("std.getStd", std_no);
		session.close();
		return stdvo;
	}


	public static int getCountStd(HashMap map)
	{
		int re = 0;
		SqlSession session = factory.openSession();
		re = session.selectOne("std.getCountStd",map);
		session.close();
		return re;
	}

	public static int getStdHits(int std_no) {
		int re = 0;
		SqlSession session = factory.openSession();
		re = session.selectOne("std.getStdHits",std_no);
		session.close();
		return re;
	}
	

}
