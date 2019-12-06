package com.bit.std_1st.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.bit.std_1st.db.DBManager;
import com.bit.std_1st.vo.CafeReviewImg;
import com.bit.std_1st.vo.CafeVo;
import com.bit.std_1st.vo.Cafe_Chkbox_Vo;
import com.bit.std_1st.vo.Cafe_Img_Vo;
import com.bit.std_1st.vo.Cafe_chkboxVo;
import com.bit.std_1st.vo.CustomerVo;
import com.bit.std_1st.vo.GetPassVo;
import com.bit.std_1st.vo.InqVo;
import com.bit.std_1st.vo.MPCafeVo;
import com.bit.std_1st.vo.PassVo;
import com.bit.std_1st.vo.PaymentVo;
import com.bit.std_1st.vo.ReserCountVo;
import com.bit.std_1st.vo.ReviewAvg;
import com.bit.std_1st.vo.ReviewCount;
import com.bit.std_1st.vo.ReviewVo;
import com.bit.std_1st.vo.RoomReserVo;
import com.bit.std_1st.vo.RoomTimeVo;
import com.bit.std_1st.vo.RoomVo;
import com.bit.std_1st.vo.Room_Time_Vo;
import com.bit.std_1st.vo.StarVo;

@Repository
public class CafeDao {
	public List<CafeVo> cafeListAll(){
		return DBManager.cafeListAll();
	}

	
// cafe
	public int getNextNo_cafe() {
		return DBManager.getNextNo_cafe();
	}
	public int insertCafe(CafeVo c) {
		return DBManager.insertCafe(c);				
	}
// cafe_img
	public int getNextNo_cafe_img() {
		return DBManager.getNextNo_cafe_img();
	}
	public int insert_cafe_img(Cafe_Img_Vo i) {
		return DBManager.insert_cafe_img(i);				
	}
// cafe_chkbox
	public int getNextNo_cafe_chkbox() {
		return DBManager.getNextNo_cafe_chkbox();
	}
	public int insert_cafe_chkbox(Cafe_Chkbox_Vo ch) {
		return DBManager.insert_cafe_chkbox(ch);				
	}
// pass
	public int getNextNo_pass() {
		return DBManager.getNextNo_pass();
	}
	public int insert_pass(PassVo p) {
		return DBManager.insert_pass(p);				
	}
// room
	public int getNextNo_room() {
		return DBManager.getNextNo_room();
	}
	public int insert_room(RoomVo r) {
		return DBManager.insert_room(r);				
	}
// room_time
	public int getNextNo_room_time() {
		return DBManager.getNextNo_room_time();
	}
	public int insert_room_time(Room_Time_Vo rt) {
		return DBManager.insert_room_time(rt);				
	}
//	媛쒕쭏�럹[移댄럹] �떆�옉
	// 媛쒕쭏�럹 �쟾泥대ぉ濡� �닔
	public int cnt_all_mypage(int cust_no) {
		return DBManager.cnt_all_mypage(cust_no);
	}
	public List<MPCafeVo> all_mypage(int cust_no){
		return DBManager.all_mypage(cust_no);
	}
	// 媛쒕쭏�럹 �삁�빟紐⑸줉 �닔
	public int cnt_reserved_mypage(int cust_no) {
		return DBManager.cnt_reserved_mypage(cust_no);
	}

	// 媛쒕쭏�럹 �삁�빟 �썑 湲곌컙留뚮즺 紐⑸줉 �닔
	public int cnt_used_mypage(int cust_no) {
		return DBManager.cnt_used_mypage(cust_no);
	}
	public List<MPCafeVo> used_mypage(int cust_no){
		return DBManager.used_mypage(cust_no);
	}
	
	
	public List<ReserCountVo> getReserCount(int cafe_no) {
		return DBManager.getReserCount(cafe_no);
	}
	
	public CafeVo detailCafe(int cafe_no) {
		return DBManager.detailCafe(cafe_no); 
	}
	
	public int insertGetPassPayment(PaymentVo payment_vo, GetPassVo getpass_vo) {
		return DBManager.insertGetPassPayment(payment_vo, getpass_vo);
	}
	
	public int getNextGetPassNo() {
		return DBManager.getNextGetPassNo();
	}
	
	public PassVo detailPass(int pass_no) {
		return DBManager.detailPass(pass_no);
	}
	
	public int insertReserPayment(PaymentVo payment_vo, ArrayList<RoomReserVo> reser_vo) {
		return DBManager.insertReserPayment(payment_vo, reser_vo);
	}
	
	public int getNextReserNo() {
		return DBManager.getNextReserNo();
	}
	
	public String getNextPayNo() {
		return DBManager.getNextPayNo();
	}
	
	public List<RoomReserVo> getRoomReser(int cafe_no, String reser_date) {
		return DBManager.getRoomReser(cafe_no, reser_date);
	}
	
	public List<RoomTimeVo> getRoomTime(int room_no) {
		return DBManager.getRoomTime(room_no);
	}
	
	public List<RoomVo> getRoom(int cafe_no) {
		return DBManager.getRoom(cafe_no);
	}
	
	public List<ReviewVo> reviewList(HashMap map){
		return DBManager.reviewList(map);
	}
	
	public List<CafeVo> cafeListAll(HashMap map){
		return DBManager.cafeListAll(map);
	}

	public List<StarVo> printStar(int cafeno) {
		// TODO Auto-generated method stub
		return DBManager.printStar(cafeno);
	}

	public List<CafeVo> gradeSort(HashMap map) {
		// TODO Auto-generated method stub
		return DBManager.gradeSort(map);
	}
	
	public List<CafeVo> sellSort(HashMap map) {
		// TODO Auto-generated method stub
		return DBManager.sellSort(map);
	}
	
	public List<CafeVo> passPriceSort(HashMap map) {
		// TODO Auto-generated method stub
		return DBManager.passPriceSort(map);
	}
	
	public List<CafeVo> roomPriceSort(HashMap map) {
		// TODO Auto-generated method stub
		return DBManager.roomPriceSort(map);
	}
	
	public List<CafeVo> searchCafe(HashMap map) {
		// TODO Auto-generated method stub
		return DBManager.searchCafe(map);
	}

	public String totalCount() {
		// TODO Auto-generated method stub
		return DBManager.totalCount();
	}
	public String sellCount(HashMap map) {
		// TODO Auto-generated method stub
		return DBManager.sellCount(map);
	}
	public String gradeCount(HashMap map) {
		// TODO Auto-generated method stub
		return DBManager.gradeCount(map);
	}
	public String roomCount(HashMap map) {
		// TODO Auto-generated method stub
		return DBManager.roomCount(map);
	}
	public String passCount(HashMap map) {
		// TODO Auto-generated method stub
		return DBManager.passCount(map);
	}
	
	public CafeVo cafeDetail(int cafe_no){
		return DBManager.cafeDetail(cafe_no);
	}

	public List<PassVo> passList(int cafe_no) {
		// TODO Auto-generated method stub
		return DBManager.passList(cafe_no);
	}
	
	public List<InqVo> inqList(int cafe_no) {
		return DBManager.inqList(cafe_no);
		
	}
	public List<InqVo> inqAllList(HashMap map) {
		return DBManager.inqAllList(map);
		
	}

	public String inqCount(int cafe_no) {
		// TODO Auto-generated method stub
		return DBManager.inqCount(cafe_no);
	}
	
	public int insertInq(HashMap map) {
		return DBManager.insertInq(map);
	}

	public List<ReviewVo> reviewList1St(int cafe_no) {
		// TODO Auto-generated method stub
		return DBManager.reviewList1st(cafe_no);

	}
	
	public String reviewCount(int cafe_no) {
		// TODO Auto-generated method stub
		return DBManager.reviewCount(cafe_no);
	}

	public int insertReview(HashMap map) {
		// TODO Auto-generated method stub
		return DBManager.insertReview(map);
	}

	public CustomerVo getCustomer(int cust_no) {
		// TODO Auto-generated method stub
		return DBManager.getCustomer(cust_no);
	}
	
	public ReviewAvg getTotalAvg(int cafe_no) {
		// TODO Auto-generated method stub
		return DBManager.getTotalAvg(cafe_no);

	}
	
	public List<ReviewCount> getGradeCnt(int cafe_no) {
		// TODO Auto-generated method stub
		return DBManager.getGradeCnt(cafe_no);

	}
	
	public List<CafeReviewImg> getReviewImg(int review_no) {
		return DBManager.getReviewImg(review_no);
		
	}

	public String inserCafeReviewIMG(HashMap map) {
		 System.out.println("다오");
		return DBManager.inserCafeReviewIMG(map);
	}

	public int updateInq(HashMap map) {
		// TODO Auto-generated method stub
		return DBManager.updateInq(map);
	}

	public int updateReview(HashMap map) {
		// TODO Auto-generated method stub
		return DBManager.updateReview(map);
	}

	public List<Cafe_chkboxVo> getChkBox(int cafe_no) {
		// TODO Auto-generated method stub
		return DBManager.getChkBox(cafe_no);
	}


	public List<Cafe_Img_Vo> getCafeIMGS(int cafe_no) {
		// TODO Auto-generated method stub
		return DBManager.getCafeIMGS(cafe_no);
	}
	
}
