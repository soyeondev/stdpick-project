package com.bit.std_1st.dao;


import org.springframework.stereotype.Repository;

import com.bit.std_1st.db.DBManager;
import com.bit.std_1st.vo.ProviderVo;

@Repository
public class ProviderDao {

	public void insertProvider(ProviderVo p) {
		DBManager.insertProvider(p);
	}

	public void updateProvider(ProviderVo p) { DBManager.updateProvider(p); }

	public ProviderVo selectProvider(String id) {
		return DBManager.selectProvider(id);
	}
	
	public Integer check_pro_nick(ProviderVo p) {

		System.out.println("pdao"+p.getPro_nick());
		Integer cnt = DBManager.check_pro_nick(p);
		return cnt;
	}
	
	public Integer check_pro_id(ProviderVo p) {
		
		System.out.println("pdao"+p.getId());
		Integer cnt = DBManager.check_pro_id(p);
		return cnt;
	}
}
