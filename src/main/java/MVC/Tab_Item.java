package MVC;

import java.sql.*;
import java.util.*;

public class Tab_Item extends Common implements in_Insert, in_Update, in_Select, in_Delete {

	@Override
	public int New_Record(GetSet model) {
		try {
			conn = DBconn();
			pstmt = conn.prepareStatement("INSERT INTO item VALUES(get_seq('item_no'),?,?,?,?,?,?,now())");
			pstmt.setInt(1, model.getItem_price());
			pstmt.setString(2, model.getItem_name());
			pstmt.setString(3, model.getItem_group());
			pstmt.setString(4, model.getItem_option());
			pstmt.setString(5, model.getItem_photo());
			pstmt.setString(6, model.getItem_desc());
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
	public int Update_Record(GetSet model) {
		try {
			conn = DBconn();
			String sql = "UPDATE item SET ITEM_PRICE=?,ITEM_NAME=?,ITEM_GROUP=?,ITEM_OPTION=?,ITEM_PHOTO=?,ITEM_DESC=? WHERE ITEM_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, model.getItem_price());
			pstmt.setString(2, model.getItem_name());
			pstmt.setString(3, model.getItem_group());
			pstmt.setString(4, model.getItem_option());
			pstmt.setString(5, model.getItem_photo());
			pstmt.setString(6, model.getItem_desc());
			pstmt.setInt(7, model.getItem_no());
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
		// Delete 할 Record의 Primary Key를 String 값으로 받아온다.
		// 지금 Item 테이블의 Record를 삭제하는 것이므로 파싱.
		int item_no = Integer.parseInt(PK);
		// "item" 테이블에서 item_no = item_no인 Record 삭제.
		Delete_By_PK("item", item_no);
		// "item" 테이블에서 item_no > ? 인 Record의 인덱스 값 -1 씩해서
		// 인덱스 값의 공백을 삭제.
		Order_Num("item", item_no);
		/*
		 * 시나리오 
		 * 1. 사용자 A 가 105번 상품을 장바구니에 담았다. 
		 * 2. 사용자 B 는 105번 상품을 구매하하였다. 
		 * 3. 관리자가 103번 상품을 삭제하였다. 
		 * 4. 삭제한 상품의 상품번호보다 뒷 번호의 상품번호를 기존의 상품번호에서 땡긴다. 
		 * 	ex) 104 => 103, 105 => 104, 106 => 105... 
		 * 5. 사용자 A,B 가 선택할때의 105번 상품과 현재의 105번 상품이 다른 상품이 되버린다. 
		 * -솔루션 
		 * => 105번 상품을 삭제할때 cart 테이블과 buy 테이블에서 상품번호가 
		 * 105번 상품보다 뒷 번호 상품(106,107...)들의 상품번호를 -1 씩 해서 땡긴다.
		 */
		
		
		
		
		Order_Referenced_Num("item", item_no, "cart");
		Order_Referenced_Num("item", item_no, "buy");
		// 마지막으로 item 테이블에 새로 입력될 상품에게 부여될 시퀀스를
		// 현재 테이블의 Record 수를 검색해 조건에 맞게 다시 생성한다.
		Update_Seq("item");
	}

	@Override
	public GetSet Select_One_Record(String PK) {

		int item_no = Integer.parseInt(PK);

		// 물론 ArrayList 안쓰고 그냥 GetSet을 반환하는 Method를 바로 만들 수 있지만
		// 기존에 만들어놓은 메소드를 활용해서 GetSet 클래스를 하나 생성해 값을 리턴 시키겠다.
		ArrayList<GetSet> Item = Select_By_Tuple("item", "item_no", item_no);

		GetSet OneItem = new GetSet();

		for (int i = 0; i < Item.size(); i++)
			OneItem = Item.get(i);

		return OneItem;
	}
	
	public int Select_Group_Count(String group) {
		/*
		 * int GroupCount = 0; try { conn=DBconn();
		 * sql="SELECT COUNT(*) FROM ITEM WHERE ITEM_GROUP='"+group+"'";
		 * pstmt=conn.prepareStatement(sql); rs=pstmt.executeQuery(); if(rs.next())
		 * GroupCount=rs.getInt(1); } catch (SQLException e) { e.printStackTrace(); }
		 * finally { try { rs.close(); pstmt.close(); conn.close(); } catch
		 * (SQLException e) { e.printStackTrace(); } }
		 */
		// Common 클래스에 조건에 따라 정의 함으로 써 이렇게 코드를 줄일 수 있음.
		// 사실상 호출할 필요 없이 Front에서 호출하면 됨.
		int GroupCount = RowCount("item", "item_group", group);
		return GroupCount;
	}

	public ArrayList<GetSet> Page_ItemGroup(String item_group, int StartNum) {
		ArrayList<GetSet> Page = new ArrayList<GetSet>();
		int EndNum = StartNum-8 < 0 ? 0 : StartNum-8 ;
		try {
			conn = DBconn();
			sql = "SELECT "
					+ "I.* "
				+ "FROM "
					+ "(SELECT "
						+ "I.*,@rownum:=@rownum+1 AS rnum "
					+ "FROM "
						+ "item I "
					+ "WHERE "
						+ "(@rownum:=0)=0 "
					+ "AND "
						+ "item_group=? "
					+ "ORDER BY "
						+ "item_no desc) I "
					+ "LIMIT "
						+ "?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, item_group);
			pstmt.setInt(2, EndNum);
			pstmt.setInt(3, StartNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GetSet model = new GetSet();
				model.setItem_no(rs.getInt(1));
				model.setItem_price(rs.getInt(2));
				model.setItem_name(rs.getString(3));
				model.setItem_group(rs.getString(4));
				model.setItem_option(rs.getString(5));
				model.setItem_photo(rs.getString(6));
				model.setItem_desc(rs.getString(7));
				model.setItem_date(rs.getDate(8));
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

	public ArrayList<GetSet> Page_ItemName(String item_name, int StartNum) {
		ArrayList<GetSet> Page = new ArrayList<GetSet>();
		int EndNum = StartNum-8 < 0 ? 0 : StartNum-8 ;
		try {
			conn = DBconn();
			sql = "SELECT "
					+ "I.* "
				+ "FROM "
					+ "(SELECT "
						+ "I.*,@rownum:=@rownum+1 AS rnum "
					+ "FROM "
						+ "item I "
					+ "WHERE "
						+ "(@rownum:=0)=0 "
					+ "AND "
						+ "item_name LIKE '%"+item_name+"%' "
					+ "ORDER BY "
						+ "item_no desc) I "
					+ "LIMIT "
						+ "?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, EndNum);
			pstmt.setInt(2, StartNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GetSet model = new GetSet();
				model.setItem_no(rs.getInt(1));
				model.setItem_price(rs.getInt(2));
				model.setItem_name(rs.getString(3));
				model.setItem_group(rs.getString(4));
				model.setItem_option(rs.getString(5));
				model.setItem_photo(rs.getString(6));
				model.setItem_desc(rs.getString(7));
				model.setItem_date(rs.getDate(8));
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
