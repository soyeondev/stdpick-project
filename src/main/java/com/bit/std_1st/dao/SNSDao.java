package com.bit.std_1st.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.std_1st.db.SNSManager;
import com.bit.std_1st.vo.CustomerVo;
import com.bit.std_1st.vo.FollowVo;
import com.bit.std_1st.vo.FollowerVo;
import com.bit.std_1st.vo.ProviderVo;
import com.bit.std_1st.vo.SNSImgVo;
import com.bit.std_1st.vo.SNSLikeVo;
import com.bit.std_1st.vo.SNSReplyVo;
import com.bit.std_1st.vo.SNSTagVo;
import com.bit.std_1st.vo.SNSVo;

@Repository
public class SNSDao {
	
	public List<SNSImgVo> listSNSImg (){
		return SNSManager.listSNSImg();
	}

	//--------------------------------
	
	public int isClicked(HashMap map) {
		return SNSManager.isClicked(map);
	}

	public int insertSNSLike(SNSLikeVo snslikevo) {
		return SNSManager.insertSNSLike(snslikevo);
	}
	
	public int deleteSNSLike(HashMap map) {
		return SNSManager.deleteSNSLike(map);
	}
	
	public int nextNoSNSLike() {
		return SNSManager.nextNoSNSLike();
	}
	
	//--------------------------------
	
	public int nextNoSNSReply() {
		return SNSManager.nextNoSNSReply();
	}
	
	public int insertSNSReply(SNSReplyVo snsreplyvo) {
		return SNSManager.insertSNSReply(snsreplyvo);
	}
	
	//--------------------------------
	
	public SNSVo getSNS(int sns_no) {
		// TODO Auto-generated method stub
		return SNSManager.getSNS(sns_no);
	}
	
	public List<SNSImgVo> getSNSImg(int sns_no) {
		// TODO Auto-generated method stub
		return SNSManager.getSNSImg(sns_no);
	}
	
	public List<SNSReplyVo> getSNSReply(int sns_no) {
		// TODO Auto-generated method stub
		return SNSManager.getSNSReply(sns_no);
	}
	
	public List<SNSTagVo> getSNSTag(int sns_no) {
		// TODO Auto-generated method stub
		return SNSManager.getSNSTag(sns_no);
	}
	
	public int getSNSLike(int sns_no) {
		return SNSManager.getSNSLike(sns_no);
	}
	
	//--------------------------------
	
	public CustomerVo getCustInfo(int cust_no) {
		return SNSManager.getCustInfo(cust_no);
	}
	
	public ProviderVo getProvInfo(int provider_no) {
		return SNSManager.getProvInfo(provider_no);
	}
	
	public static List<SNSVo> snsSchImg(HashMap map){
		return SNSManager.snsSchImg(map);
	}
	
	public int cntFollower(String f_type, int f_no) {
		return SNSManager.cntFollower(f_type, f_no);
	}
	public int cntFollowing(String type, int no) {
		return SNSManager.cntFollowing(type, no);
	}
	public List<FollowerVo> listFollowing(String type, int no) {
		return SNSManager.listFollowing(type, no);
	}
	public List<FollowerVo> listFollower(String f_type, int f_no) {
		return SNSManager.listFollower(f_type, f_no);
	}
	public List<SNSImgVo> listSnsMyPage(int cust_no, int provider_no) {
		return SNSManager.listSnsMyPage(cust_no, provider_no);
	}
	
	public int isFollow(FollowVo vo) {
		return SNSManager.isFollow(vo);
	}

	public int insertFollow(FollowVo vo) {
		return SNSManager.insertFollow(vo);
	}
	public int deleteFollow(FollowVo vo) {
		return SNSManager.deleteFollow(vo);
	}
	public int getNextFollowNo() {
		return SNSManager.getNextFollowNo();
	}
	
	public int getNextSNSTagNo() {
		return SNSManager.getNextSNSTagNo();
	}
	public int getNextSNSImgNo() {
		return SNSManager.getNextSNSImgNo();
	}
	
	public int getNextSNSNo() {
		return SNSManager.getNextSNSNo();
	}
	public int insertSNS(SNSVo sns_vo, ArrayList<SNSImgVo> sns_img_vos,  ArrayList<SNSTagVo> sns_tag_vos) {
		return SNSManager.insertSNS(sns_vo, sns_img_vos, sns_tag_vos);
	}
}
