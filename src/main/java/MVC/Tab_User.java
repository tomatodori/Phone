package MVC;

import java.sql.*;
import java.util.*;

public class Tab_User extends Common implements in_Insert, in_Update, in_Select, in_Delete {

	@Override
	public int New_Record(GetSet model) {
		try {
			conn = DBconn();
			pstmt = conn.prepareStatement("INSERT INTO shop_user VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW())");
			pstmt.setString(1, model.getUser_id());
			pstmt.setString(2, model.getUser_pw());
			pstmt.setString(3, model.getUser_name());
			pstmt.setString(4, model.getMail1());
			pstmt.setString(5, model.getMail2());
			pstmt.setString(6, model.getTel1());
			pstmt.setString(7, model.getTel2());
			pstmt.setString(8, model.getTel3());
			pstmt.setString(9, model.getAdd1());
			pstmt.setString(10, model.getAdd2());
			pstmt.setString(11, model.getAdd3());
			pstmt.setString(12, model.getAdd4());
			pstmt.setString(13, model.getYear());
			pstmt.setString(14, model.getMonth());
			pstmt.setString(15, model.getDay());
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
		String user_id = PK;
		Out_Of_User(user_id);

	}

	public void Out_Of_User(String user_id) {
		// 회원 탈퇴 하기전, 현재까지 회원이 작성한 게시글, 생성한 장바구니들의 PrimaryKey, 작성된 게시글들의 REF값을
		// Integer 배열로 가져와서 저장.
		ArrayList<GetSet> user_boards = Select_By_Tuple("board", "user_id", user_id);
		ArrayList<Integer> board_nums = Select_PK_By_Id("board", user_id);
		ArrayList<Integer> cart_nums = Select_PK_By_Id("cart", user_id);
		ArrayList<Integer> buy_nums = Select_PK_By_Id("buy", user_id);
		
		ArrayList<Integer> ripple_board_nums =Delete_Ripple(user_id);
		
		for(int i=0;i<ripple_board_nums.size();i++)
			board_nums.add(ripple_board_nums.get(i));
		
		for(int i : board_nums)
			System.out.println(i);
		
		// 해당 게시글에 ref값을 저장하는 가변길이 Integer배열을 생성한다.
		ArrayList<Integer> ref_nums = new ArrayList<Integer>();

		for (int i = 0; i < user_boards.size(); i++)
			ref_nums.add(user_boards.get(i).getRef());

		// Delete from "Table" where user_id=? 쿼리를 통해
		// 각각의 테이블에서 해당 회원의 정보를 모두 삭제한다.
		Delete_By_Id("shop_user", user_id);
		Delete_By_Id("cart", user_id);
		Delete_By_Id("buy", user_id);
		Delete_By_Id("board", user_id);

		// 삭제한 뒤 빵꾸난 인덱스들을 아까 가져온 배열을 사용, 삭제한 횟수 만큼 반복해서 다시 메꿔준다.
		for (int i = 0; i < board_nums.size(); i++)
			Order_Num("board", board_nums.get(i));

		for (int i = 0; i < ref_nums.size(); i++)
			Order_Ref(ref_nums.get(i));

		for (int i = 0; i < cart_nums.size(); i++)
			Order_Num("cart", cart_nums.get(i));

		for (int i = 0; i < buy_nums.size(); i++)
			Order_Num("buy", buy_nums.get(i));

		
		// 다음 게시글,카트 생성에 쓰일 Sequence를 현재의 행 갯수에 맞춰 Drop 후 다시 생성.
		Update_Seq("cart");
		Update_Seq("buy");
		Update_Seq("board");
	}
	public ArrayList<Integer> Delete_Ripple(String user_id) {
		
		ArrayList<Integer> Ripple_Nums = Ripple_Nums(user_id);
		
		for(int i=0;i<Ripple_Nums.size();i++) 
			Common.Delete_By_PK("board", Ripple_Nums.get(i));
		
		return Ripple_Nums;
	}
	public ArrayList<Integer> Ripple_Nums(String user_id){
		ArrayList<Integer> Ripple_Nums = new ArrayList<Integer>();
		try {
			conn=DBconn();
			pstmt=conn.prepareStatement("SELECT BOARD_NO FROM board WHERE USER_ID<>? AND REF IN (SELECT REF FROM board WHERE USER_ID=?)");
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_id);
			rs=pstmt.executeQuery();
			while(rs.next()) 
				Ripple_Nums.add(rs.getInt(1));
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
		return Ripple_Nums;
	}

	@Override
	public int Update_Record(GetSet model) {
		try {
			conn = DBconn();
			pstmt = conn.prepareStatement(
					"UPDATE shop_user SET USER_PW=?,USER_NAME=?,MAIL1=?,MAIL2=?,TEL1=?,TEL2=?,TEL3=?,ADD1=?,ADD2=?,ADD3=?,ADD4=?,YEAR=?,MONTH=?,DAY=? WHERE USER_ID=?");
			pstmt.setString(1, model.getUser_pw());
			pstmt.setString(2, model.getUser_name());
			pstmt.setString(3, model.getMail1());
			pstmt.setString(4, model.getMail2());
			pstmt.setString(5, model.getTel1());
			pstmt.setString(6, model.getTel2());
			pstmt.setString(7, model.getTel3());
			pstmt.setString(8, model.getAdd1());
			pstmt.setString(9, model.getAdd2());
			pstmt.setString(10, model.getAdd3());
			pstmt.setString(11, model.getAdd4());
			pstmt.setString(12, model.getYear());
			pstmt.setString(13, model.getMonth());
			pstmt.setString(14, model.getDay());
			pstmt.setString(15, model.getUser_id());
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
		String user_id = PK;

		ArrayList<GetSet> OneUser_info = Select_By_Tuple("shop_user", "user_id", user_id);

		GetSet model = new GetSet();

		for (int i = 0; i < OneUser_info.size(); i++)
			model = OneUser_info.get(i);

		return model;
	}

	public String FindPW(GetSet model) {

		String user_pw = "";

		try {
			conn = DBconn();
			sql = "SELECT USER_PW FROM shop_user WHERE USER_NAME=? AND USER_ID=? AND MAIL1=? AND MAIL2=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, model.getUser_name());
			pstmt.setString(2, model.getUser_id());
			pstmt.setString(3, model.getMail1());
			pstmt.setString(4, model.getMail2());
			rs = pstmt.executeQuery();
			if (rs.next())
				user_pw = rs.getString(1);
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
		return user_pw;
	}

	public String FindID(GetSet model) {

		String user_id = "";

		try {
			conn = DBconn();
			sql = "SELECT USER_ID FROM shop_user WHERE USER_NAME=? AND MAIL1=? AND MAIL2=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, model.getUser_name());
			pstmt.setString(2, model.getMail1());
			pstmt.setString(3, model.getMail2());
			rs = pstmt.executeQuery();
			if (rs.next())
				user_id = rs.getString(1);
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
		return user_id;
	}

	public ArrayList<GetSet> Page(int StartNum) {
		ArrayList<GetSet> Page = new ArrayList<GetSet>();
		int EndNum = StartNum-10 < 0 ? 0 : StartNum-10 ;
		try {
			conn = DBconn();
			sql = "SELECT "
					+ "U.* "
				+ "FROM "
					+ "(SELECT "
						+ "U.*,@rownum:=@rownum+1 AS rnum "
					+ "FROM "
						+ "shop_user U "
					+ "WHERE "
						+ "(@rownum:=0)=0 "
					+ "ORDER BY "
						+ "join_date DESC) U "
				+ "LIMIT ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, EndNum);
			pstmt.setInt(2, StartNum);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				GetSet model = new GetSet();
				model.setUser_id(rs.getString(1));
				model.setUser_pw(rs.getString(2));
				model.setUser_name(rs.getString(3));
				model.setMail1(rs.getString(4));
				model.setMail2(rs.getString(5));
				model.setTel1(rs.getString(6));
				model.setTel2(rs.getString(7));
				model.setTel3(rs.getString(8));
				model.setAdd1(rs.getString(9));
				model.setAdd2(rs.getString(10));
				model.setAdd3(rs.getString(11));
				model.setAdd4(rs.getString(12));
				model.setYear(rs.getString(13));
				model.setMonth(rs.getString(14));
				model.setDay(rs.getString(15));
				model.setJoin_date(rs.getDate(16));
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
