package com.bit.std_1st.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;

import com.bit.std_1st.vo.CustomerVo;
import com.bit.std_1st.vo.EvtCouponVo;
import com.bit.std_1st.vo.EvtVo;
import com.bit.std_1st.vo.NoticeVo;
import com.bit.std_1st.vo.ProviderVo;
import com.bit.std_1st.vo.QaVo;

@Controller
public class CSManager {

	private static SqlSessionFactory factory;

	static {

		try {
			Reader reader = Resources.getResourceAsReader("com/bit/std_1st/db/dbConfig.xml");

			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}

	}

	public static List<NoticeVo> listNotice(HashMap map){

		List<NoticeVo> list = null;
		SqlSession session= factory.openSession();
		list=session.selectList("cs.listNotice", map);
		session.close();

		return list;
	}
	
	public static List<QaVo> listQa(HashMap map){

		List<QaVo> list = null;
		SqlSession session= factory.openSession();
		list=session.selectList("cs.listQa",map);
		session.close();

		return list;
	}
	
	public static QaVo getQa(int qa_no){
		
		QaVo qavo = null;
		SqlSession session= factory.openSession();
		qavo=session.selectOne("cs.getQa",qa_no);
		session.close();
		
		return qavo;
	}
	
	public static NoticeVo getNotice(int notice_no){
		
		NoticeVo noticevo = null;
		SqlSession session= factory.openSession();
		noticevo=session.selectOne("cs.getNotice",notice_no);
		session.close();
		
		return noticevo;
	}


	public static int getCountNotice(HashMap map){
		int re = 0;
		SqlSession session = factory.openSession();
		re = session.selectOne("cs.getCountNotice",map);
		session.close();
		return re;
	}
	
	public static int getCountQa(HashMap map){
		int re = 0;
		SqlSession session = factory.openSession();
		re = session.selectOne("cs.getCountQa",map);
		session.close();
		return re;
	}
	
	public static int nextNoQa(){
		int re = 0;
		SqlSession session = factory.openSession();
		re = session.selectOne("cs.nextNoQa");
		session.close();
		return re;
	}
	
	public static CustomerVo getCustomer(int cust_no) {
		CustomerVo customervo = null;
		SqlSession session= factory.openSession();
		customervo = session.selectOne("cs.getCustomer",cust_no);
		session.close();
		
		return customervo;
	}
	
	public static ProviderVo getProvider(int provider_no) {
		ProviderVo providervo = null;
		SqlSession session= factory.openSession();
		providervo = session.selectOne("cs.getProvider",provider_no);
		session.close();
		
		return providervo;
	}
	
	public static int insertQa(QaVo qavo) {
		int re = 0;
		SqlSession session = factory.openSession();
		re = session.insert("cs.insertQa",qavo);
		session.commit();
		session.close();
		return re;		
	}
	
	public static int updateQa(QaVo qavo) {
		int re = 0;
		SqlSession session = factory.openSession();
		re = session.update("cs.updateQa",qavo);
		session.commit();
		session.close();
		return re;		
	}
	
	public static List<EvtVo> listEvt(HashMap map){
		List<EvtVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("cs.listEvt", map);
		session.close();
		return list;
	}

	public static EvtVo getEvt(int evt_no) {
		// TODO Auto-generated method stub
		EvtVo e = null;
		HashMap map = new HashMap();
		map.put("evt_no", evt_no);
		SqlSession session = factory.openSession();
		e = session.selectOne("cs.getEvt",map);
		session.close();
		return e;
	}
	
	public static int getCountEvt() {
		int re = 0;
		SqlSession session = factory.openSession();
		re = session.selectOne("cs.getCountEvt");
		session.close();
		return re;
	}
	
	public static int insertEvtCoupon(EvtCouponVo evtcouponvo) {
		int re = 0;
		SqlSession session = factory.openSession();
		re = session.insert("cs.insertEvtCoupon",evtcouponvo);
		session.commit();
		session.close();
		return re;		
	}
	
	public static int nextNoEvtCoupon(){
		int re = 0;
		SqlSession session = factory.openSession();
		re = session.selectOne("cs.nextNoEvtCoupon");
		session.close();
		return re;
	}
	
	public static int isReceived(HashMap map) {
		int re =0;
		SqlSession session = factory.openSession();
		re = session.selectOne("cs.isReceived", map);
		session.close();
		return re;
	}
	
	public static int updateHits(int notice_no) {
		int re =0;
		SqlSession session = factory.openSession(true);
		re = session.update("cs.updateHits", notice_no);
		session.close();
		return re;
	}

}
