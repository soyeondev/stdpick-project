package com.bit.std_1st.db;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
import com.bit.std_1st.vo.ProviderVo;
import com.bit.std_1st.vo.ReserCountVo;
import com.bit.std_1st.vo.ReviewAvg;
import com.bit.std_1st.vo.ReviewCount;
import com.bit.std_1st.vo.ReviewVo;
import com.bit.std_1st.vo.RoomReserVo;
import com.bit.std_1st.vo.RoomTimeVo;
import com.bit.std_1st.vo.RoomVo;
import com.bit.std_1st.vo.Room_Time_Vo;
import com.bit.std_1st.vo.StarVo;


public class DBManager {
	private static SqlSessionFactory factory;

	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/bit/std_1st/db/dbConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public static List<CafeVo> cafeListAll(){
		List<CafeVo> list = null;
		SqlSession session = factory.openSession();
		
		list = session.selectList("cafe.listCafeAll");
		session.close();
		
		return list;
	}

	
	
	
// cafe �벑濡�
	public static int getNextNo_cafe() {
		// TODO Auto-generated method stub
		int cafe_no = 0;
		SqlSession session = factory.openSession();
		cafe_no = session.selectOne("cafe.getNextNo_cafe");
		session.close();
		return cafe_no;
	}
	public static int insertCafe(CafeVo c) {
		// TODO Auto-generated method stub
		int re =  -1; 
		SqlSession session = factory.openSession(true);
		re = session.insert("cafe.insertCafe", c);
		
		session.close();
		return re;
	}
// cafe_img �벑濡�
	public static int getNextNo_cafe_img() {
		// TODO Auto-generated method stub
		int cafe_no = 0;
		SqlSession session = factory.openSession();
		cafe_no = session.selectOne("cafe.getNextNo_cafe_img");
		session.close();
		return cafe_no;
	}
	public static int insert_cafe_img(Cafe_Img_Vo i) {
		// TODO Auto-generated method stub
		int re = -1;
		SqlSession session = factory.openSession(true);
		re = session.insert("cafe.insert_cafe_img",i);
		if(re != -1) {
			re = i.getCafe_no();
		}
		session.close();
		return re;
	}
// cafe_chkbox �벑濡�
	public static int getNextNo_cafe_chkbox() {
		// TODO Auto-generated method stub
		int CAFE_CHKBOX_NO = 0;
		SqlSession session = factory.openSession();
		CAFE_CHKBOX_NO = session.selectOne("cafe.getNextNo_cafe_chkbox");
		session.close();
		return CAFE_CHKBOX_NO;
	}
	public static int insert_cafe_chkbox(Cafe_Chkbox_Vo ch) {
		// TODO Auto-generated method stub
		int re = -1;
		SqlSession session = factory.openSession(true);
		re = session.insert("cafe.insert_cafe_chkbox", ch);
		if(re != -1) {
			re = ch.getCafe_no();
		}
		session.close();
		return re;
	}
// pass �벑濡�
	public static int getNextNo_pass() {
		// TODO Auto-generated method stub
		int PASS_NO = 0;
		SqlSession session = factory.openSession();
		PASS_NO = session.selectOne("cafe.getNextNo_pass");
		session.close();
		return PASS_NO;
	}
	public static int insert_pass(PassVo p) {
		// TODO Auto-generated method stub
		int re = -1;
		SqlSession session = factory.openSession(true);
		re = session.insert("cafe.insert_pass", p);
		session.close();
		return re;
	}
// room �벑濡�
	public static int getNextNo_room() {
		// TODO Auto-generated method stub
		int ROOM_NO = 0;
		SqlSession session = factory.openSession();
		ROOM_NO = session.selectOne("cafe.getNextNo_room");
		session.close();
		return ROOM_NO;
	}
	public static int insert_room(RoomVo r) {
		// TODO Auto-generated method stub
		int re = -1;
		SqlSession session = factory.openSession(true);
		re = session.insert("cafe.insert_room", r);
		session.close();
		return re;
	}
// room_time �벑濡�
	public static int getNextNo_room_time() {
		// TODO Auto-generated method stub
		int TIME_NO = 0;
		SqlSession session = factory.openSession();
		TIME_NO = session.selectOne("cafe.getNextNo_room_time");
		session.close();
		return TIME_NO;
	}
	public static int insert_room_time(Room_Time_Vo rt) {
		// TODO Auto-generated method stub
		int re = -1;
		SqlSession session = factory.openSession(true);
		re = session.insert("cafe.insert_room_time", rt);
		session.close();
		return re;
	}
	
//	媛쒕쭏�럹[移댄럹]�떆�옉
	//�쟾泥� 紐⑸줉 移댁슫�듃
	public static int cnt_all_mypage(int cust_no) {
		int re = 0;		
		SqlSession session = factory.openSession();
		re = session.selectOne("cafe.cnt_all_mypage",cust_no);
		session.close();
		return re;
	}
	//�쟾泥� 紐⑸줉 
	public static List<MPCafeVo> all_mypage(int cust_no){
		List<MPCafeVo> list = null;
		SqlSession session = factory.openSession();
		
		list = session.selectList("cafe.all_mypage", cust_no);
		session.close();
		
		return list;
	}

	//�쟾泥� �삁�빟 移댁슫�듃
	public static int cnt_reserved_mypage(int cust_no) {
		int re = 0;		
		SqlSession session = factory.openSession();
		re = session.selectOne("cafe.cnt_reserved_mypage",cust_no);
		session.close();
		return re;
	}

	/*
	 * //�쟾泥� 紐⑸줉 public static List<MPCafeVo> reserved_mypage(int cust_no){
	 * List<MPCafeVo> list = null; SqlSession session = factory.openSession();
	 * 
	 * list = session.selectList("cafe.reserved_mypage", cust_no);
	 * 
	 * for(MPCafeVo vo : list) { vo.getMp_cafe_name(); }
	 * 
	 * session.close();
	 * 
	 * return list; }
	 */
	//�쟾泥� 留뚮즺 移댁슫�듃
	public static int cnt_used_mypage(int cust_no) {
		int re = 0;		
		SqlSession session = factory.openSession();
		re = session.selectOne("cafe.cnt_used_mypage",cust_no);
		session.close();
		return re;
	}
	//�쟾泥� 紐⑸줉 
		public static List<MPCafeVo> used_mypage(int cust_no){
			List<MPCafeVo> list = null;
			SqlSession session = factory.openSession();
			
			list = session.selectList("cafe.used_mypage", cust_no);
			session.close();
			
			return list;
		}
	
	
	public static List<ReserCountVo> getReserCount(int cafe_no) {
		List<ReserCountVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("cafe.getReserCount", cafe_no);
		session.close();
		return list;
	}
	
	
	public static CafeVo detailCafe(int cafe_no) {
		CafeVo vo = null;
		SqlSession session = factory.openSession();
		vo = session.selectOne("cafe.detailCafe", cafe_no);
		session.close();
		return vo;
	}
	
	public static int insertGetPassPayment(PaymentVo payment_vo, GetPassVo getpass_vo) {
		int re = -1;
		SqlSession session = factory.openSession();

		re = session.insert("cafe.insertPayment", payment_vo);
		re += session.insert("cafe.insertGetPass", getpass_vo);

		if(re>1) {
			session.commit();
		}
		session.close();
		return re;
	}

	public static int getNextGetPassNo() {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.selectOne("cafe.getNextGetPassNo");
		session.close();
		return re;
	}
	
	public static PassVo detailPass(int pass_no) {
		PassVo vo = null;
		SqlSession session = factory.openSession();
		vo = session.selectOne("cafe.detailPass", pass_no);
		session.close();
		return vo;
	}
	
	public static int insertReserPayment(PaymentVo payment_vo, ArrayList<RoomReserVo> reser_vo) {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.insert("cafe.insertPayment", payment_vo);
		
		for(RoomReserVo rv : reser_vo) {
			re += session.insert("cafe.insertRoomReser", rv);
		}
		
		if(re>1) {
			session.commit();
		}
		session.close();
		return re;
	}
	
	public static int getNextReserNo() {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.selectOne("cafe.getNextReserNo");
		session.close();
		return re;
	}

	public static String getNextPayNo() {
		String re = "";
		SqlSession session = factory.openSession();
		re = session.selectOne("cafe.getNextPayNo");
		session.close();
		return re;
	}
	
	public static List<RoomReserVo> getRoomReser(int cafe_no, String reser_date) {
		List<RoomReserVo> list = null;
		HashMap map = new HashMap();
		map.put("cafe_no", cafe_no);
		map.put("reser_date", reser_date);
		
		SqlSession session = factory.openSession();
		list = session.selectList("cafe.getRoomReser", map);
		
		session.close();
		return list;
	}
	
	public static List<RoomTimeVo> getRoomTime(int room_no) {
		List<RoomTimeVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("cafe.getRoomTime", room_no);
		session.close();
		return list;
	}
	
	public static List<RoomVo> getRoom(int cafe_no) {
		List<RoomVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("cafe.getRoom", cafe_no);
		session.close();
		return list;
	}
	
	//-----------회원가입 //로그인 -----------------------------
	/* 媛쒖씤 �쉶�썝媛��엯 */
	public static void insertCustomer(CustomerVo c) {
		SqlSession session = factory.openSession();
		session.insert("user.insertCustomer",c);
		session.commit();
		session.close();
	}

	/* 媛쒖씤 �젙蹂� �닔�젙 */
	public static void updateCustomer(CustomerVo c) {
		SqlSession session = factory.openSession();
		session.update("user.updateCustomer",c);
		session.commit();
		session.close();
	}

	public static CustomerVo selectCustomer(String id) {
		SqlSession session = factory.openSession();
		return session.selectOne("user.selectCustomer", id);
	}

	/* 媛쒖씤 �땳�꽕�엫 以묐났 泥댄겕 */
	public static Integer check_nick(CustomerVo c) {
		try(SqlSession session = factory.openSession()){
            System.out.println("session:"+session);
            
        }catch(Exception e){
            e.printStackTrace();
        }
		
		SqlSession session = factory.openSession();
		Integer cnt = session.selectOne("user.check_nick",c);
		session.close();
		return cnt;
	}
	
	
	/* 媛쒖씤 �븘�씠�뵒 以묐났 泥댄겕 */
	public static Integer check_id(CustomerVo c) {
		try(SqlSession session = factory.openSession()){
            
        }catch(Exception e){
            e.printStackTrace();
        }
		
		SqlSession session = factory.openSession();
		Integer cnt = session.selectOne("user.check_id",c);
		session.close();
		return cnt;
	}
	
	
	
	/* �궗�뾽�옄 �쉶�썝媛��엯 */
	public static void insertProvider(ProviderVo p) {
		SqlSession session = factory.openSession();
		session.insert("user.insertProvider",p);
		session.commit();
		session.close();
	}

	/* �궗�뾽�옄 �젙蹂� �닔�젙 */
	public static void updateProvider(ProviderVo p) {
		SqlSession session = factory.openSession();
		session.update("user.updateProvider",p);
		session.commit();
		session.close();
	}

	public static ProviderVo selectProvider(String id) {
		SqlSession session = factory.openSession();
		return session.selectOne("user.selectProvider", id);
	}
	
	/* �궗�뾽�옄 �땳�꽕�엫 以묐났 �솗�씤 */
	public static Integer check_pro_nick(ProviderVo p) {
		try(SqlSession session = factory.openSession()){
            System.out.println("session:"+session);
            
        }catch(Exception e){
            e.printStackTrace();
        }
		
		SqlSession session = factory.openSession();
		Integer cnt = session.selectOne("user.check_pro_nick",p);
		session.close();
		return cnt;
	}
	
	/* �궗�뾽�옄 �븘�씠�뵒 以묐났 泥댄겕 */
	public static Integer check_pro_id(ProviderVo p) {
		try(SqlSession session = factory.openSession()){
            System.out.println("session:"+session);
            
        }catch(Exception e){
            e.printStackTrace();
        }
		
		SqlSession session = factory.openSession();
		Integer cnt = session.selectOne("user.check_pro_id",p);
		session.close();
		return cnt;
	}
	
	
	
	//---------------------카페 상세 / 목록 -----------------------
	
	public static List<CafeVo> cafeListAll(HashMap map){
		List<CafeVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("cafe.listCafeAll",map);
		session.close();
		
		return list;
	}

	public static List<StarVo> printStar(int cafeno) {
		List<StarVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("cafe.printStar",cafeno);
		session.close();
		
		return list;
	}

	public static List<CafeVo> gradeSort(HashMap map) {
		List<CafeVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("cafe.gradeSort",map);
		session.close();
		
		return list;
	}
	
	public static List<CafeVo> sellSort(HashMap map) {
		List<CafeVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("cafe.sellSort",map);
		session.close();
		
		return list;
	}
	
	public static List<CafeVo> roomPriceSort(HashMap map) {
		List<CafeVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("cafe.roomPriceSort",map);
		session.close();
		
		return list;
	}
	
	public static List<CafeVo> passPriceSort(HashMap map) {
		List<CafeVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("cafe.passPriceSort",map);
		session.close();
		
		return list;
	}
	
	public static List<CafeVo> searchCafe(HashMap map) {
		List<CafeVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("cafe.searchCafe",map);
		session.close();
		
		return list;
	}

	public static String totalCount() {
		String str = null;
		SqlSession session = factory.openSession();
		str = session.selectOne("cafe.totalCount");
		session.close();
		
		return str;
	}
	public static String sellCount(HashMap map) {
		String str = null;
		SqlSession session = factory.openSession();
		str = session.selectOne("cafe.sellCount",map);
		session.close();
		
		return str;
	}
	public static String gradeCount(HashMap map) {
		String str = null;
		SqlSession session = factory.openSession();
		str = session.selectOne("cafe.gradeCount",map);
		session.close();
		
		return str;
	}
	public static String roomCount(HashMap map) {
		String str = null;
		SqlSession session = factory.openSession();
		str = session.selectOne("cafe.roomCount",map);
		session.close();
		
		return str;
	}
	public static String passCount(HashMap map) {
		String str = null;
		SqlSession session = factory.openSession();
		str = session.selectOne("cafe.passCount",map);
		session.close();
		
		return str;
	}
	
	public static CafeVo cafeDetail(int cafe_no) {
		CafeVo cafevo = null;
		SqlSession session = factory.openSession();
		cafevo = session.selectOne("cafe.cafeDetail",cafe_no);
		session.close();
		
		return cafevo;
	}

	public static List<PassVo> passList(int cafe_no) {
		List<PassVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("cafe.passList",cafe_no);
		session.close();
		
		return list;
	}
	
	public static List<InqVo> inqList(int cafe_no) {
		List<InqVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("cafe.inqList",cafe_no);
		session.close();
		
		return list;
	}
	
	public static List<InqVo> inqAllList(HashMap map) {
		List<InqVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("cafe.inqAllList",map);
		session.close();
		
		return list;
	}

	public static String inqCount(int cafe_no) {
		String cnt = "";
		SqlSession session = factory.openSession();
		cnt = session.selectOne("cafe.inqCount",cafe_no);
		session.close();
		
		return cnt;
	}
	public static int insertInq(HashMap map) {
		int re = -1;
		SqlSession session = factory.openSession();
		re =  session.insert("cafe.insertInq", map);
		session.commit();
		session.close();
		
		return re;
	}
	public static List<ReviewVo> reviewList(HashMap map) {
		List<ReviewVo> list = null;
		SqlSession session = factory.openSession();
		list =  session.selectList("cafe.reviewList", map);
		session.commit();
		session.close();
		
		return list;
	}

	public static List<ReviewVo> reviewList1st(int cafe_no) {
		// TODO Auto-generated method stub
		List<ReviewVo> list = null;
		SqlSession session = factory.openSession();
		list =  session.selectList("cafe.reviewList1st", cafe_no);
		session.commit();
		session.close();
		
		return list;
	}
	
	public static String reviewCount(int cafe_no) {
		String cnt = "";
		SqlSession session = factory.openSession();
		cnt = session.selectOne("cafe.reviewCount",cafe_no);
		session.close();
		
		return cnt;
	}

	public static int insertReview(HashMap map) {
		int re = -1;
		SqlSession session = factory.openSession();
		re =  session.insert("cafe.insertReview", map);
		session.commit();
		session.close();
		
		return re;
	}

	public static CustomerVo getCustomer(int cust_no) {
		CustomerVo custvo = null;
		SqlSession session = factory.openSession();
		custvo = session.selectOne("cafe.getCustomer",cust_no);
		session.close();
		
		return custvo;
	}
	
	public static ReviewAvg getTotalAvg(int cafe_no){
		ReviewAvg avg = null;
		SqlSession session = factory.openSession();
		avg =  session.selectOne("cafe.getTotalAvg", cafe_no);
		session.close();
		
		return avg;
	}
	
	public static List<ReviewCount> getGradeCnt(int cafe_no){
		List<ReviewCount> list = null;
		SqlSession session = factory.openSession();
		list =  session.selectList("cafe.getGradeCnt", cafe_no);
		session.close();
		
		return list;
	}
	
	public static List<CafeReviewImg> getReviewImg(int review_no){
		List<CafeReviewImg> list = null;
		SqlSession session = factory.openSession();
		list =  session.selectList("cafe.getReviewImg", review_no);
		session.close();
		
		return list;
		
	}

	public static String inserCafeReviewIMG(HashMap map) {
		String str = "";
		int re = -1;
		SqlSession session = factory.openSession();
		re =  session.insert("cafe.inserCafeReviewIMG", map);
		session.commit();
		session.close();
		
		str = re+"";
		return str;
	}

	public static int updateInq(HashMap map) {
		int re = -1;
		SqlSession session = factory.openSession();
		re =  session.update("cafe.updateInq", map);
		session.commit();
		session.close();
		
		return re;
	}

	public static int updateReview(HashMap map) {
		// TODO Auto-generated method stub
		int re = -1;
		SqlSession session = factory.openSession();
		re =  session.update("cafe.updateReview", map);
		session.commit();
		session.close();
		
		return re;
	}

	public static List<Cafe_chkboxVo> getChkBox(int cafe_no) {
		List<Cafe_chkboxVo> list = null;
		SqlSession session = factory.openSession();
		list =  session.selectList("cafe.getChkBox", cafe_no);
		session.close();
		
		return list;
	}




	public static List<Cafe_Img_Vo> getCafeIMGS(int cafe_no) {
		List<Cafe_Img_Vo> list = null;
		SqlSession session = factory.openSession();
		list =  session.selectList("cafe.getCafeIMGS", cafe_no);
		session.close();
		
		return list;
	}

}
