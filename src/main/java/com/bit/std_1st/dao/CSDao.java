package com.bit.std_1st.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.std_1st.db.CSManager;
import com.bit.std_1st.vo.CustomerVo;
import com.bit.std_1st.vo.EvtCouponVo;
import com.bit.std_1st.vo.EvtVo;
import com.bit.std_1st.vo.NoticeVo;
import com.bit.std_1st.vo.ProviderVo;
import com.bit.std_1st.vo.QaVo;

@Repository
public class CSDao {

	public List<NoticeVo> listNotice(HashMap map) {
		return CSManager.listNotice(map);
	}
	
	public List<QaVo> listQa(HashMap map) {
		return CSManager.listQa(map);
	}
	
	public QaVo getQa(int qa_no) {
		return CSManager.getQa(qa_no);
	}
	
	public NoticeVo getNotice(int notice_no) {
		return CSManager.getNotice(notice_no);
	}

	public int getCountNotice(HashMap map) {
		return CSManager.getCountNotice(map);
	}
	
	public int getCountQa(HashMap map) {
		return CSManager.getCountQa(map);
	}
	
	public int nextNoQa() {
		return CSManager.nextNoQa();
	}
	
	public CustomerVo getCustomer(int cust_no) {
		return CSManager.getCustomer(cust_no);
	}
	
	public ProviderVo getProvider(int provider_no) {
		return CSManager.getProvider(provider_no);
	}
	
	public int insertQa(QaVo qavo) {
		return CSManager.insertQa(qavo);
	}
	
	public int updateQa(QaVo qavo) {
		return CSManager.updateQa(qavo);
	}
	
	public List<EvtVo> listEvt(HashMap map){
		return CSManager.listEvt(map);
	}

	public EvtVo getEvt(int evt_no) {
		// TODO Auto-generated method stub
		return CSManager.getEvt(evt_no);
	}
	public int getCountEvt() {
		return CSManager.getCountEvt();
	}
	
	public int insertEvtCoupon(EvtCouponVo evtcouponvo) {
		return CSManager.insertEvtCoupon(evtcouponvo);
	}
	
	public int nextNoEvtCoupon() {
		return CSManager.nextNoEvtCoupon();
	}
	
	public int isReceived(HashMap map) {
		return CSManager.isReceived(map);
	}
	
	public int updateHits(int notice_no) {
		return CSManager.updateHits(notice_no);
	}
}
