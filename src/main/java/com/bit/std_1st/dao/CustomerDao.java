package com.bit.std_1st.dao;

import org.springframework.stereotype.Repository;

import com.bit.std_1st.db.DBManager;
import com.bit.std_1st.vo.CustomerVo;

@Repository
public class CustomerDao {

	public void insertCustomer(CustomerVo c) {
		System.out.println("Dao : " + c );
		DBManager.insertCustomer(c);
	}

	public void updateCustomer(CustomerVo c) {
		DBManager.updateCustomer(c);
	}

	public CustomerVo selectCustomer(String id) {
		return DBManager.selectCustomer(id);
	}

	public Integer check_nick(CustomerVo c) {

		System.out.println("dao"+c.getCust_nick());
		Integer cnt = DBManager.check_nick(c);
		return cnt;
	}
	
	public Integer check_id(CustomerVo c) {
		
		System.out.println("dao"+c.getId());
		Integer cnt = DBManager.check_id(c);
		return cnt;
	}
	
	
}
