package com.bit.std_1st.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.std_1st.db.StdManager;
import com.bit.std_1st.vo.CustomerApplyVo;
import com.bit.std_1st.vo.HashTagVo;
import com.bit.std_1st.vo.StdApplyVo;
import com.bit.std_1st.vo.StdVo;

@Repository
public class StdDao {
	public int updateStdHits(int std_no) {
		return StdManager.updateStdHits(std_no);
	}
	
	public int getNextNo() {
		return StdManager.getNextNo();
	}
	
	public int getNextNo_ht() {
		return StdManager.getNextNo_ht();
	}
		
	public void insertStd(StdVo vo) {
		StdManager.insertStd(vo);
	}
	
	public void insertHashTag(HashTagVo vo_hs) {
		// TODO Auto-generated method stub
		StdManager.insertHashTag(vo_hs);
	}

	public int updateStd(StdVo vo) {
		return StdManager.updateStd(vo);
	}

	public List<HashTagVo> getHashTag(int std_no){
		return StdManager.getHashTag(std_no);
	}
		
	public int deleteHashTag(int std_no) {
		// TODO Auto-generated method stub
		return StdManager.deleteHashTag(std_no);
	}

	public int getNextNoApply() {
		// TODO Auto-generated method stub
		return StdManager.getNextNoApply();
	}

	public int insertStdApply(StdApplyVo vo) {
		// TODO Auto-generated method stub
		return StdManager.insertStdApply(vo);
	}

	public List<StdVo> allStd(int cust_no) {
		// TODO Auto-generated method stub
		return StdManager.allStd(cust_no);
	}
	
	public List<StdVo> ingStd(int cust_no) {
		// TODO Auto-generated method stub
		return StdManager.ingStd(cust_no);
	}
	
	public List<StdVo> endStd(int cust_no) {
		// TODO Auto-generated method stub
		return StdManager.endStd(cust_no);
	}
	
	public List<StdVo> myStd(int founder_no) {
		// TODO Auto-generated method stub
		return StdManager.myStd(founder_no);
	}
	
	public List<StdVo> watingStd(int cust_no) {
		// TODO Auto-generated method stub
		return StdManager.watingStd(cust_no);
	}
	
	public List<StdVo> getIngPicker(int std_no) {
		// TODO Auto-generated method stub
		return StdManager.getIngPicker(std_no);
	}

	public List<StdVo> getWtgPicker(int std_no) {
		// TODO Auto-generated method stub
		return StdManager.getWtgPicker(std_no);
	}
	
	public CustomerApplyVo confStd(int cust_no, int apply_no) {
		return StdManager.confStd(cust_no, apply_no);
	}

	public void updateAplyWtg(int apply_no) {
		StdManager.updateAplyWtg(apply_no);
	}
	
	public void deleteAply(int apply_no) {
		StdManager.deleteAply(apply_no);
	}
	
	
	// 한별코드 -------------------------------------------------------------
	

	public List<StdVo> listStd(HashMap map) {
		return StdManager.listStd(map);
	}
	
	public StdVo getStd(int std_no) {
		return StdManager.getStd(std_no);
	}

	public int getCountStd(HashMap map) {
		return StdManager.getCountStd(map);
	}

	public int getStdHits(int std_no) {
		return StdManager.getStdHits(std_no);		
	}





}
