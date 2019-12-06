package com.bit.std_1st.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.std_1st.db.UserManager;
import com.bit.std_1st.vo.CafeVo;
import com.bit.std_1st.vo.CustomerVo;
import com.bit.std_1st.vo.EvtCouponDiscountVo;
import com.bit.std_1st.vo.ProvAllSaleVo;
import com.bit.std_1st.vo.ProviderVo;

@Repository
public class UserDao {
	public int countCafePassSale(int cafe_no) {
		return UserManager.countCafePassSale(cafe_no);
	}
	
	public List<ProvAllSaleVo> listCafePassSale(int cafe_no, int start, int end) {
		return UserManager.listCafePassSale(cafe_no, start, end);
	}
	
	public List<ProvAllSaleVo> listProvAllSale(HashMap map) {
		return UserManager.listProvAllSale(map);
	}
	
//	public int listYearIncome(int cafe_no, String startDate) {
//		return UserManager.listYearIncome(cafe_no, startDate);
//	}
	
	public int listMonthIncome(int cafe_no, String startDate, String endDate) {
		return UserManager.listMonthIncome(cafe_no, startDate, endDate);
	}
	
	public List<CafeVo> getProvCafe(int provider_no) {
		return UserManager.getProvCafe(provider_no);
	}
	
	public CustomerVo detailCustomer(int cust_no) {
		return UserManager.detailCustomer(cust_no);
	}
	
	public ProviderVo detailProvider(int provider_no) {
	      return UserManager.detailProvider(provider_no);
	}
	
	public int updateCouponToTrue(String coupon_no) {
		return UserManager.updateCouponToTrue(coupon_no);
	}
	
	public List<EvtCouponDiscountVo> getNotUseCoupon(int cust_no) {
		return UserManager.getNotUseCoupon(cust_no);
	}
}
