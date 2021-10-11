package MVC;

import java.sql.*;
import java.util.*;

public class Tab_Cart extends Common implements in_Insert, in_Update, in_Select, in_Delete {

	@Override
	public int New_Record(GetSet model) {
		try {
			conn = DBconn();
			pstmt = conn.prepareStatement("INSERT INTO cart VALUES(get_seq('cart_no'),?,?,?,?,?,?,now())");
			pstmt.setInt(1, model.getItem_no());
			pstmt.setInt(2, model.getItem_price());
			pstmt.setInt(3, model.getCart_amount());
			pstmt.setString(4, model.getCart_item());
			pstmt.setString(5, model.getItem_photo());
			pstmt.setString(6, model.getUser_id());
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
		int cart_no = Integer.parseInt(PK);
		ArrayList<GetSet> Cart = Select_By_Tuple("cart", "cart_no", cart_no);
		
		GetSet OneCart = new GetSet();
		
		for(int i=0;i<Cart.size();i++)//Cart.size == 1;
			OneCart = Cart.get(i);
			
		return OneCart;
	}

	public ArrayList<GetSet> Page_MyCart(String user_id, int StartNum) {
		ArrayList<GetSet> Page = new ArrayList<GetSet>();
		int EndNum = StartNum-10 < 0 ? 0 : StartNum-10 ;
		try {
			conn = DBconn();
			sql = "SELECT "
					+ "C.* "
				+ "FROM "
					+ "(SELECT "
						+ "C.*,@rownum:=@rownum+1 AS rnum "
					+ "FROM "
						+ "cart C "
					+ "WHERE "
						+ "(@rownum:=0)=0 "
					+ "AND "
						+ "user_id=? "
					+ "ORDER BY "
						+ "cart_no DESC) C "
				+ "LIMIT ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, EndNum);
			pstmt.setInt(3, StartNum);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				GetSet model = new GetSet();
				model.setCart_no(rs.getInt(1));
				model.setItem_no(rs.getInt(2));
				model.setItem_price(rs.getInt(3));
				model.setCart_amount(rs.getInt(4));
				model.setCart_item(rs.getString(5));
				model.setItem_photo(rs.getString(6));
				model.setUser_id(rs.getString(7));
				model.setCart_date(rs.getDate(8));
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

	@Override
	public int Update_Record(GetSet model) {
		conn = DBconn();
		// 카트를 UPDATE 할 일 이 있나...?
		// 카트 자체를 업데이트 하기보다는 현재 카트의 수량(cart_amount)가 바뀌었을때를 생각하면 될꺼 같다.
		// Up_Cart_Amount(GetSet model)
		// 여기다가는 CART 에 카드 결제번호 , 같은것을 남기는게 좋겠다.
		//
		return x;
	}

	public int Up_Cart_Amount(GetSet model) {
		try {
			conn = DBconn();
			pstmt = conn.prepareStatement("UPDATE cart SET CART_AMOUNT=? WHERE CART_NO=?");
			pstmt.setInt(1, model.getCart_amount());
			pstmt.setInt(2, model.getCart_no());
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
	
	public void Delete_All_Of_MyCart(String user_id) {
		ArrayList<Integer> Nums = Select_PK_By_Id("cart", user_id);
		
		Delete_By_Id("cart", user_id);
		for (int i = 0; i < Nums.size(); i++)
			Order_Num("cart", Nums.get(i));

		Update_Seq("cart");
	}

	@Override
	public void Delete_One_Record(String PK) {
		int cart_no = Integer.parseInt(PK);
		Delete_By_PK("cart", cart_no);
		Order_Num("cart", cart_no);
		Update_Seq("cart");
	}


}
