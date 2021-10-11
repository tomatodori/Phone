package MVC;

import java.sql.*;
import java.util.*;

public class Common {
	public static Connection conn;
	public static PreparedStatement pstmt;
	public static ResultSet rs;
	public static int x;
	public static String sql;
	public static int RowCount;

	public static Connection DBconn() {
		try{ 
			String url="jdbc:mysql://localhost:3306/ezen_project";
			String user="ezen";
			String password="1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url,user,password);
		}catch(Exception e){ 
		}
		return conn;
	}

	public static int RowCount(String Table) {
		try {
			conn = DBconn();
			sql = "SELECT COUNT(*) FROM " + Table;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				RowCount = rs.getInt(1);
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
		return RowCount;
	}

	public static int MaxNo(String Table) {
		int MaxSeq = 0;
		try {
			conn = DBconn();
			sql = "SELECT MAX(" + Table + "_NO) FROM " + Table;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				MaxSeq = rs.getInt(1);
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
		return MaxSeq;
	}

	public static int RefCount(int ref) {
		try {
			conn = DBconn();
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM board WHERE REF=?");
			pstmt.setInt(1, ref);
			rs=pstmt.executeQuery();
			if(rs.next())
				RowCount = rs.getInt(1);
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
		return RowCount;
	}

	public static int MaxRef() {
		int MaxRef = 0;
		try {
			conn = DBconn();
			pstmt = conn.prepareStatement("SELECT ifnull(MAX(REF),0) FROM board");
			rs = pstmt.executeQuery();
			if (rs.next())
				MaxRef = rs.getInt(1);
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
		return MaxRef;
	}

	public static int UserCheck(GetSet model) {
		try {
			conn = DBconn();
			pstmt = conn.prepareStatement("SELECT USER_PW FROM shop_user WHERE USER_ID=?");
			pstmt.setString(1, model.getUser_id());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(model.getUser_pw())) {
					if(model.getUser_id().equals("admin")) 
						x = 3;
					else
						x = 2;
				}else
					x = 1;
			} else
				x = 0;
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
		return x;
	}

	public static ArrayList<Integer> Select_PK_By_Id(String Table, String user_id) {
		ArrayList<Integer> PK_List = new ArrayList<Integer>();
		try {
			conn = DBconn();
			sql = "SELECT " + Table + "_NO FROM " + Table + " WHERE USER_ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PK_List.add(rs.getInt(1));
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
		return PK_List;
	}
	public static ArrayList<Integer> Select_PK_By_Ref(int ref){
		ArrayList<Integer> PK_List = new ArrayList<Integer>();
		try {
			conn=DBconn();
			pstmt=conn.prepareStatement("SELECT BOARD_NO FROM board where ref = ?");
			pstmt.setInt(1, ref);
			rs=pstmt.executeQuery();
			while(rs.next())
				PK_List.add(rs.getInt(1));
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
		return PK_List;
	}

	public static ArrayList<GetSet> Select_By_Tuple(String Table, String tuple, int value) {
		ArrayList<GetSet> Query = new ArrayList<GetSet>();
		try {
			conn = DBconn();
			sql = "SELECT * FROM " + Table + " WHERE " + tuple + " = " + value;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GetSet model = new GetSet();
				switch (Table) {
				case "shop_user":
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
					break;
				case "item":
					model.setItem_no(rs.getInt(1));
					model.setItem_price(rs.getInt(2));
					model.setItem_name(rs.getString(3));
					model.setItem_group(rs.getString(4));
					model.setItem_option(rs.getString(5));
					model.setItem_photo(rs.getString(6));
					model.setItem_desc(rs.getString(7));
					model.setItem_date(rs.getDate(8));
					break;
				case "cart":
					model.setCart_no(rs.getInt(1));
					model.setItem_no(rs.getInt(2));
					model.setItem_price(rs.getInt(3));
					model.setCart_amount(rs.getInt(4));
					model.setCart_item(rs.getString(5));
					model.setItem_photo(rs.getString(6));
					model.setUser_id(rs.getString(7));
					model.setCart_date(rs.getDate(8));
					break;
				case "buy":
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
					break;
				case "board":
					model.setBoard_no(rs.getInt(1));
					model.setRef(rs.getInt(2));
					model.setBoard_type(rs.getInt(3));
					model.setHidden(rs.getInt(4));
					model.setReadcount(rs.getInt(5));
					model.setUser_id(rs.getString(6));
					model.setTitle(rs.getString(7));
					model.setBoard_photo(rs.getString(8));
					model.setContent(rs.getString(9));
					model.setReg_date(rs.getDate(10));
					break;
				}
				Query.add(model);
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
		return Query;
	}

	public static ArrayList<GetSet> Select_By_Tuple(String Table, String tuple, String value) {
		// 넘어온 리터럴 값을 그대로 sql문에 넣게 되면 오류가 발생하기 때문에 ' '를 추가해준다.
		// ex) select * from dual where id = ezen; [X] 에러
		// => select * from dual where id = 'ezen'; [O] 정상실행
		value = "'" + value + "'";
		ArrayList<GetSet> Query = new ArrayList<GetSet>();
		try {
			conn = DBconn();
			sql = "SELECT * FROM " + Table + " WHERE " + tuple + " = " + value;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GetSet model = new GetSet();
				switch (Table) {
				case "shop_user":
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
					break;
				case "item":
					model.setItem_no(rs.getInt(1));
					model.setItem_price(rs.getInt(2));
					model.setItem_name(rs.getString(3));
					model.setItem_group(rs.getString(4));
					model.setItem_option(rs.getString(5));
					model.setItem_photo(rs.getString(6));
					model.setItem_desc(rs.getString(7));
					model.setItem_date(rs.getDate(8));
					break;
				case "cart":
					model.setCart_no(rs.getInt(1));
					model.setItem_no(rs.getInt(2));
					model.setItem_price(rs.getInt(3));
					model.setCart_amount(rs.getInt(4));
					model.setCart_item(rs.getString(5));
					model.setItem_photo(rs.getString(6));
					model.setUser_id(rs.getString(7));
					model.setCart_date(rs.getDate(8));
					break;
				case "buy":
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
					break;
				case "board":
					model.setBoard_no(rs.getInt(1));
					model.setRef(rs.getInt(2));
					model.setBoard_type(rs.getInt(3));
					model.setHidden(rs.getInt(4));
					model.setReadcount(rs.getInt(5));
					model.setUser_id(rs.getString(6));
					model.setTitle(rs.getString(7));
					model.setBoard_photo(rs.getString(8));
					model.setContent(rs.getString(9));
					model.setReg_date(rs.getDate(10));
					break;
				}
				Query.add(model);
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
		return Query;
	}
	
	public static void Update_Seq(String Table) {
		int no =Common.MaxNo(Table);
		
		if(no==0) {
			switch (Table) {
			case "item":
				no = 9999;
				break;
			case "cart":
				no = 19999;
				break;
			case "buy":
				no = 29999;
				break;
			case "board":
				no = 39999;
			}
		}
		
		String PK = Table+"_no";
		
		try {
			conn=DBconn();
			sql="UPDATE sequences SET no = ? where seq_name=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, PK);
			pstmt.executeUpdate();
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
	}

	public static void Order_Num(String Table, int PK) {
		try {
			String NO = Table + "_no";
			conn = DBconn();
			sql = "UPDATE " + Table + " SET " + NO + " = " + NO + "-1 WHERE " + NO + " > ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, PK);
			pstmt.executeUpdate();
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
	}

	public static void Order_Referenced_Num(String Table, int PK, String Ref_Table) {
		/*
		 * 시나리오 : 상품번호가 12345(=item_no=12345) 인 상품을 장바구니(cart)테이블에 담았다고 가정한다. 상품이 소진되거나
		 * 문제가 생겨 상품을 삭제하게 되었다. 그렇다면
		 * 
		 * 
		 */
		String NO = Table + "_no";
		try {
			conn = DBconn();
			sql = "UPDATE " + Ref_Table + " SET " + NO + " = " + NO + "-1 WHERE " + NO + " > " + PK;
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
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
	}

	public static void Order_Ref(int Delete_Board_Ref) {

		try {
			conn = DBconn();
			pstmt = conn.prepareStatement("UPDATE board SET REF=REF-1 WHERE REF>?");
			pstmt.setInt(1, Delete_Board_Ref);
			pstmt.executeUpdate();
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
	}

	public static void Delete_By_Id(String Table, String user_id) {
		try {
			conn = DBconn();
			sql = "DELETE FROM " + Table + " WHERE USER_ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.executeUpdate();
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

	}

	public static void Delete_By_PK(String Table, int PK) {
		try {
			conn = DBconn();
			sql = "DELETE FROM " + Table + " WHERE " + Table + "_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, PK);
			pstmt.executeUpdate();
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
	}

	public static int RowCount(String Table, String Tuple, String value) {
		try {
			conn = DBconn();
			sql = "SELECT COUNT(*) FROM " + Table + " WHERE " + Tuple + " = '" + value + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				RowCount = rs.getInt(1);
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
		return RowCount;
	}

	public static int RowCount(String Table, String Tuple, int value) {
		try {
			conn = DBconn();
			sql = "SELECT COUNT(*) FROM " + Table + " WHERE " + Tuple + " = " + value;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				RowCount = rs.getInt(1);
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
		return RowCount;
	}

	public static int RowCount(String Table, String Tuple1, String value1, String Tuple2, String value2) {
		try {
			conn = DBconn();
			sql = "SELECT COUNT(*) FROM " + Table + " WHERE " + Tuple1 + " = '" + value1 + "' AND " + Tuple2 + " = '"
					+ value2 + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				RowCount = rs.getInt(1);
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
		return RowCount;
	}

	public static int RowCount(String Table, String Tuple1, String value1, String Tuple2, int value2) {
		try {
			conn = DBconn();
			sql = "SELECT COUNT(*) FROM " + Table + " WHERE " + Tuple1 + " = '" + value1 + "' AND " + Tuple2 + " = "
					+ value2;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				RowCount = rs.getInt(1);
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
		return RowCount;
	}

	public static int RowCount(String Table, String Tuple1, int value1, String Tuple2, int value2) {
		try {
			conn = DBconn();
			sql = "SELECT COUNT(*) FROM " + Table + " WHERE " + Tuple1 + " = " + value1 + " AND " + Tuple2 + " = "
					+ value2;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				RowCount = rs.getInt(1);
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
		return RowCount;
	}

	public static int RowCount_Target(String Table, String Tuple, String target) {

		try {
			conn = DBconn();
			sql = "SELECT COUNT(*) FROM " + Table + " WHERE " + Tuple + " LIKE '%" + target + "%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				RowCount = rs.getInt(1);
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
		return RowCount;
	}

	public static ArrayList<GetSet> Page(String Table, int StartNum) {
		ArrayList<GetSet> Page = new ArrayList<GetSet>();
		int EndNum = (Table.equals("item")) ? StartNum - 8 : StartNum - 10;
		if(EndNum < 0)
			EndNum=0;
		try {
			conn = DBconn();
			sql = "SELECT "
					+ "T.* "
				+ "FROM "
					+ "(SELECT "
						+ "T.*,@rownum:=@rownum+1 AS rnum "
					+ "FROM "
						+Table+" T "
					+ "WHERE "
						+ "(@rownum:=0)=0 "
					+ "ORDER BY "
						+Table+"_no desc) T "
					+ "LIMIT "
						+ "?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, EndNum);
			pstmt.setInt(2, StartNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GetSet model = new GetSet();
				switch (Table) {
				case "shop_user":
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
					break;
				case "item":
					model.setItem_no(rs.getInt(1));
					model.setItem_price(rs.getInt(2));
					model.setItem_name(rs.getString(3));
					model.setItem_group(rs.getString(4));
					model.setItem_option(rs.getString(5));
					model.setItem_photo(rs.getString(6));
					model.setItem_desc(rs.getString(7));
					model.setItem_date(rs.getDate(8));
					break;
				case "cart":
					model.setCart_no(rs.getInt(1));
					model.setItem_no(rs.getInt(2));
					model.setItem_price(rs.getInt(3));
					model.setCart_amount(rs.getInt(4));
					model.setCart_item(rs.getString(5));
					model.setItem_photo(rs.getString(6));
					model.setUser_id(rs.getString(7));
					model.setCart_date(rs.getDate(8));
					break;
				case "buy":
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
					break;
				case "board":
					model.setBoard_no(rs.getInt(1));
					model.setRef(rs.getInt(2));
					model.setBoard_type(rs.getInt(3));
					model.setHidden(rs.getInt(4));
					model.setReadcount(rs.getInt(5));
					model.setUser_id(rs.getString(6));
					model.setTitle(rs.getString(7));
					model.setBoard_photo(rs.getString(8));
					model.setContent(rs.getString(9));
					model.setReg_date(rs.getDate(10));
					break;
				}
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
