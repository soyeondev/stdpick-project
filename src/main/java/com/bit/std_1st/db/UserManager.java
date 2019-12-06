package com.bit.std_1st.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bit.std_1st.vo.CafeVo;
import com.bit.std_1st.vo.CustomerVo;
import com.bit.std_1st.vo.EvtCouponDiscountVo;
import com.bit.std_1st.vo.ProvAllSaleVo;
import com.bit.std_1st.vo.ProviderVo;
public class UserManager {
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
	
	
	public static int countCafePassSale(int cafe_no) {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.selectOne("user.countCafePassSale", cafe_no);
		session.close();
		return re;
	}
	
	public static List<ProvAllSaleVo> listCafePassSale(int cafe_no, int start, int end) {
		List<ProvAllSaleVo> list = null;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cafe_no", cafe_no);
		map.put("start", start);
		map.put("end", end);
		
		SqlSession session = factory.openSession();
		list = session.selectList("user.listCafePassSale", map);
		session.close();
		return list;
		
	}
	
	
	public static List<ProvAllSaleVo> listProvAllSale(HashMap map) {
		List<ProvAllSaleVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("user.listProvAllSale", map);
		session.close();
		return list;
		
	}
	
	public static int listMonthIncome(int cafe_no, String startDate, String endDate) {
		int re = -1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cafe_no", cafe_no);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		SqlSession session = factory.openSession();
		re = session.selectOne("user.listMonthIncome", map);
		session.close();
		return re;
		
	}
	
	
	
	public static List<CafeVo> getProvCafe(int provider_no) {
		List<CafeVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("user.getProvCafe", provider_no);
		session.close();
		return list;
		
	}
	
	public static CustomerVo detailCustomer(int cust_no) {
		CustomerVo vo = null;
		SqlSession session = factory.openSession();
		vo = session.selectOne("user.detailCustomer", cust_no);
		session.commit();
		session.close();
		return vo;
		
	}
	
	public static ProviderVo detailProvider(int provider_no) {
	      ProviderVo vo = null;
	      SqlSession session = factory.openSession();
	      vo = session.selectOne("user.detailProvider", provider_no);
	      session.close();
	      return vo;
	      
	   }
	
	public static int updateCouponToTrue(String coupon_no) {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.update("user.updateCouponToTrue", coupon_no);
		session.commit();
		session.close();
		return re;
	}
	
	public static List<EvtCouponDiscountVo> getNotUseCoupon(int cust_no) {
		List<EvtCouponDiscountVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("user.getNotUseCoupon", cust_no);
		session.close();
		return list;
	}
	

}
