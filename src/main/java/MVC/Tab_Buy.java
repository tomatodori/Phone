package MVC;

import java.sql.SQLException;
import java.util.ArrayList;

public class Tab_Buy extends Common implements in_Delete, in_Insert, in_Select, in_Update {

	@Override
	public int Update_Record(GetSet model) {
		// CART_ITEM,ITEM_PHOTO,USER_ID,BUY_TYPE,ITEM_NO,ITEM_PRICE 은 고정 값.
		// 나머지만 바꾸기.
		try {
			conn = DBconn();
			sql = "UPDATE buy SET CART_AMOUNT=?,CARD1=?,CARD2=?,CARD3=?,CARD4=?,TEL1=?,TEL2=?,TEL3=?,NAME=?,CARD_PW=?,ADD1=?,ADD2=?,ADD3=?,ADD4=?,MESSAGE=? WHERE BUY_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, model.getCart_amount());
			pstmt.setString(2, model.getCard1());
			pstmt.setString(3, model.getCard2());
			pstmt.setString(4, model.getCard3());
			pstmt.setString(5, model.getCard4());
			pstmt.setString(6, model.getTel1());
			pstmt.setString(7, model.getTel2());
			pstmt.setString(8, model.getTel3());
			pstmt.setString(9, model.getName());
			pstmt.setString(10, model.getCard_pw());
			pstmt.setString(11, model.getAdd1());
			pstmt.setString(12, model.getAdd2());
			pstmt.setString(13, model.getAdd3());
			pstmt.setString(14, model.getAdd4());
			pstmt.setString(15, model.getMessage());
			pstmt.setInt(16, model.getBuy_no());
			x = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return x;
	}

	@Override
	public GetSet Select_One_Record(String PK) {
		int buy_no = Integer.parseInt(PK);
		ArrayList<GetSet> Record = Select_By_Tuple("buy", "buy_no", buy_no);

		GetSet model = new GetSet();
		for (int i = 0; i < Record.size(); i++)
			model = Record.get(i);

		return model;
	}

	@Override
	public int New_Record(GetSet model) {
		// 구매 테이블에 담을때 장바구니에 있는 해당 레코드를 삭제할 것.
		// 최초 구매테이블에 넣을때는 항상 0부터 시작됨.
		// model.setBuy_type(0); <= 이거 안해도 기본 null 값이 0이라 상관없음.
		try {
			conn = DBconn();
			sql = "INSERT INTO buy VALUES(get_seq('buy_no'),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, model.getBuy_type());
			pstmt.setInt(2, model.getItem_no());
			pstmt.setInt(3, model.getItem_price());
			pstmt.setInt(4, model.getCart_amount());
			pstmt.setString(5, model.getCard1());
			pstmt.setString(6, model.getCard2());
			pstmt.setString(7, model.getCard3());
			pstmt.setString(8, model.getCard4());
			pstmt.setString(9, model.getTel1());
			pstmt.setString(10, model.getTel2());
			pstmt.setString(11, model.getTel3());
			pstmt.setString(12, model.getCart_item());
			pstmt.setString(13, model.getItem_photo());
			pstmt.setString(14, model.getUser_id());
			pstmt.setString(15, model.getName());
			pstmt.setString(16, model.getCard_pw());
			pstmt.setString(17, model.getAdd1());
			pstmt.setString(18, model.getAdd2());
			pstmt.setString(19, model.getAdd3());
			pstmt.setString(20, model.getAdd4());
			pstmt.setString(21, model.getMessage());
			x = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return x;
	}

	@Override
	public void Delete_One_Record(String PK) {
		int buy_no = Integer.parseInt(PK);
		
		Common.Delete_By_PK("buy", buy_no);
		
		Common.Order_Num("buy", buy_no);
		
		Common.Update_Seq("buy");
		
	}
	public int Up_Buy_Type(int buy_no, int buy_type) {
		try {
			conn = DBconn();
			pstmt = conn.prepareStatement("UPDATE buy SET BUY_TYPE=?,BUY_DATE=now() WHERE BUY_NO=?");
			pstmt.setInt(1, buy_type);
			pstmt.setInt(2, buy_no);
			x = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return x;
	}

	public int Cancel_Buy(GetSet model) {

		try {
			conn = DBconn();
			pstmt = conn.prepareStatement("UPDATE buy SET BUY_TYPE=3, MESSAGE=?, BUY_DATE=now() WHERE BUY_NO=?");
			pstmt.setString(1, model.getMessage());
			pstmt.setInt(2, model.getBuy_no());
			x=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return x;
	}

	public ArrayList<GetSet> Page_MyBuy(String user_id, int StartNum) {
		ArrayList<GetSet> Page = new ArrayList<GetSet>();
		int EndNum = StartNum-10 < 0 ? 0 : StartNum-10 ;
		try {
			conn = DBconn();
			sql = "SELECT "
					+ "B.* "
				+ "FROM "
					+ "(SELECT "
						+ "B.*,@rownum:=@rownum+1 AS rnum "
					+ "FROM "
						+ "buy B "
					+ "WHERE "
						+ "(@rownum:=0)=0 "
					+ "AND "
						+ "user_id=? "
					+ "ORDER BY "
						+ "buy_no DESC) B "
				+ "LIMIT ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, EndNum);
			pstmt.setInt(3, StartNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GetSet model = new GetSet();
				model.setBuy_no(rs.getInt(1));
				model.setBuy_type(rs.getInt(2));
				model.setItem_no(rs.getInt(3));
				model.setItem_price(rs.getInt(4));
				model.setCart_amount(rs.getInt(5));
				model.setCard1(rs.getString(6));
				model.setCard2(rs.getString(7));
				model.setCard3(rs.getString(8));
				model.setCard4(rs.getString(9));
				model.setTel1(rs.getString(10));
				model.setTel2(rs.getString(11));
				model.setTel3(rs.getString(12));
				model.setCart_item(rs.getString(13));
				model.setItem_photo(rs.getString(14));
				model.setUser_id(rs.getString(15));
				model.setName(rs.getString(16));
				model.setCard_pw(rs.getString(17));
				model.setAdd1(rs.getString(18));
				model.setAdd2(rs.getString(19));
				model.setAdd3(rs.getString(20));
				model.setAdd4(rs.getString(21));
				model.setMessage(rs.getString(22));
				model.setBuy_date(rs.getDate(23));
				Page.add(model);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return Page;
	}
	public ArrayList<GetSet> Page_BuyType(int buy_type, int StartNum) {
		ArrayList<GetSet> Page = new ArrayList<GetSet>();
		int EndNum = StartNum-10 < 0 ? 0 : StartNum-10 ;
		try {
			conn = DBconn();
			sql = "SELECT "
					+ "B.* "
				+ "FROM "
					+ "(SELECT "
						+ "B.*,@rownum:=@rownum+1 AS rnum "
					+ "FROM "
						+ "buy B "
					+ "WHERE "
						+ "(@rownum:=0)=0 "
					+ "AND "
						+ "buy_type=? "
					+ "ORDER BY "
						+ "buy_no DESC) B "
				+ "LIMIT ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, buy_type);
			pstmt.setInt(2, EndNum);
			pstmt.setInt(3, StartNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GetSet model = new GetSet();
				model.setBuy_no(rs.getInt(1));
				model.setBuy_type(rs.getInt(2));
				model.setItem_no(rs.getInt(3));
				model.setItem_price(rs.getInt(4));
				model.setCart_amount(rs.getInt(5));
				model.setCard1(rs.getString(6));
				model.setCard2(rs.getString(7));
				model.setCard3(rs.getString(8));
				model.setCard4(rs.getString(9));
				model.setTel1(rs.getString(10));
				model.setTel2(rs.getString(11));
				model.setTel3(rs.getString(12));
				model.setCart_item(rs.getString(13));
				model.setItem_photo(rs.getString(14));
				model.setUser_id(rs.getString(15));
				model.setName(rs.getString(16));
				model.setCard_pw(rs.getString(17));
				model.setAdd1(rs.getString(18));
				model.setAdd2(rs.getString(19));
				model.setAdd3(rs.getString(20));
				model.setAdd4(rs.getString(21));
				model.setMessage(rs.getString(22));
				model.setBuy_date(rs.getDate(23));
				Page.add(model);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return Page;
	}
}
