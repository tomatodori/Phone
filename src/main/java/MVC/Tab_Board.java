package MVC;

import java.sql.*;
import java.util.*;

public class Tab_Board extends Common implements in_Insert, in_Update, in_Select, in_Delete {

	@Override
	public int New_Record(GetSet model) {
		int MaxRef = MaxRef();
		if(model.getRef()==0) {
			model.setRef(MaxRef + 1);
		}
		
		try {
			conn = DBconn();
			pstmt = conn.prepareStatement("INSERT INTO board VALUES(get_seq('board_no'),?,?,?,0,?,?,?,?,now())");
			pstmt.setInt(1, model.getRef());
			pstmt.setInt(2, model.getBoard_type());
			pstmt.setInt(3, model.getHidden());
			pstmt.setString(4, model.getUser_id());
			pstmt.setString(5, model.getTitle());
			pstmt.setString(6, model.getBoard_photo());
			pstmt.setString(7, model.getContent());
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
			pstmt = conn.prepareStatement("UPDATE board SET TITLE=?,BOARD_PHOTO=?,CONTENT=?,HIDDEN=? WHERE BOARD_NO=?");
			pstmt.setString(1, model.getTitle());
			pstmt.setString(2, model.getBoard_photo());
			pstmt.setString(3, model.getContent());
			pstmt.setInt(4, model.getHidden());
			pstmt.setInt(5, model.getBoard_no());
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

		GetSet model = Select_One_Record(PK);

		int ref = model.getRef(); // 9
		
		System.out.println("ref : "+ref);
		
		int RefCount = Common.RefCount(ref); // 2 
		
		System.out.println("RefCount : "+RefCount); 
		
		int board_no = Integer.parseInt(PK); //40009
		
		System.out.println("board_no : "+board_no);
		
		
		ArrayList<Integer> ref_nums = new ArrayList<Integer>();
		
		System.out.println("ref_nums.size() : "+ref_nums.size());
		
		// RefCount 가 1 보다 크다면 관련된 답글이 한개 이상 존재한다는 것
		// 하지만 관리자가 자신의 답글을 삭제할때는 하나만 삭제해야함.
		// 그러므로 관리자 답글 삭제할 경우에는 관련글 삭제하면 안됨!
		if(RefCount>1 && model.getUser_id()!="admin") {
			System.out.println("조건절 통과!,답글까지 삭제하는 메소드 실행");
			// ref 가 ? 인 게시글의 정보를 모두 가져온다.
			ref_nums=Common.Select_PK_By_Ref(ref);
			// ref 가 ? 인 게시글의 갯수만큼 board_no 가 ? 인 게시글 삭제.
			for(int i=0;i<ref_nums.size();i++) {
				Delete_By_PK("board", ref_nums.get(i));
				System.out.println("ref_nums.get(i) : "+ref_nums.get(i));
			}
			// ref 가 ? 인 게시글의 갯수만큼 board_no 가 ? 인 게시글 번호 정렬.
			for(int i=0;i<ref_nums.size();i++) {
				Order_Num("board", ref_nums.get(i));
				System.out.println("ref_nums.get(i) : "+ref_nums.get(i));
			}
		}else {
			// RefCount 가 1보다 크지 않다면(1 밖에 경우의 수가 없음) 그러므로 하나의 record만 삭제하는 메소드 실행.
			System.out.println("하나만 삭제함.");
			Delete_By_PK("board", board_no);
			Order_Num("board", board_no);
		}
		Order_Ref(ref);
		Update_Seq("board");
	}

	@Override
	public GetSet Select_One_Record(String PK) {
		int board_no = Integer.parseInt(PK);
		GetSet model = new GetSet();
		ArrayList<GetSet> OneBoard = Select_By_Tuple("board", "board_no", board_no);

		for (int i = 0; i < OneBoard.size(); i++)
			model = OneBoard.get(i);

		return model;
	}

	public void ReadPlus(int board_no) {
		try {
			conn = DBconn();
			pstmt = conn.prepareStatement("UPDATE board SET READCOUNT=READCOUNT+1 WHERE BOARD_NO=?");
			pstmt.setInt(1, board_no);
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

	public void Switch_Hidden(int board_no) {
		String PK = Integer.toString(board_no);

		GetSet model = Select_One_Record(PK);

		int hidden = model.getHidden();

		if (hidden == 0)
			hidden = 1;
		else
			hidden = 0;

		try {
			conn = DBconn();
			pstmt = conn.prepareStatement("UPDATE board SET HIDDEN=? WHERE BOARD_NO=?");
			pstmt.setInt(1, hidden);
			pstmt.setInt(2, board_no);
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

	public int MaxNo_BoardType(int board_type) {
		int RowCount = 0;
		try {
			conn = DBconn();
			pstmt = conn.prepareStatement("SELECT MAX(BOARD_NO) FROM board WHERE BOARD_TYPE=?");
			pstmt.setInt(1, board_type);
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

	public ArrayList<GetSet> Page_BoardType(int StartNum, int board_type) {
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
						+ "board B "
					+ "WHERE "
						+ "(@rownum:=0)=0 "
					+ "AND "
						+ "board_type=? "
					+ "ORDER BY "
						+ "ref desc, board_no) B "
				+ "LIMIT ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_type);
			pstmt.setInt(2, EndNum);
			pstmt.setInt(3, StartNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GetSet model = new GetSet();
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

	public ArrayList<GetSet> Page_MyBoard(String user_id, int board_type, int StartNum) {
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
						+ "board B "
					+ "WHERE "
						+ "(@rownum:=0)=0 "
					+ "AND "
						+ "board_type=? "
					+ "AND "
						+ "user_id=? "
					+ "ORDER BY "
						+ "ref desc, board_no) B "
				+ "LIMIT ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_type);
			pstmt.setString(2, user_id);
			pstmt.setInt(3, EndNum);
			pstmt.setInt(4, StartNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GetSet model = new GetSet();
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

	public ArrayList<GetSet> Page_Title(String title, int board_type, int StartNum) {
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
						+ "board B "
					+ "WHERE "
						+ "(@rownum:=0)=0 "
					+ "AND "
						+ "board_type=? "
					+ "AND "
						+ "title LIKE '%"+title+"%' "
					+ "ORDER BY "
						+ "ref desc, board_no) B "
				+ "LIMIT ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_type);
			pstmt.setInt(2, EndNum);
			pstmt.setInt(3, StartNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GetSet model = new GetSet();
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

	public int RowCount_Target(String title, int board_type) {
		try {
			conn = DBconn();
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM board WHERE TITLE LIKE '%"+title+"%' AND BOARD_TYPE=?");
			pstmt.setInt(1, board_type);
			rs=pstmt.executeQuery();
			if(rs.next())
				RowCount=rs.getInt(1);
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
	
	public ArrayList<GetSet> User_Boards(String user_id){
		ArrayList<GetSet> User_Boards = new ArrayList<GetSet>();
		try {
			conn = DBconn();
			sql = "SELECT * FROM board WHERE USER_ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GetSet model = new GetSet();
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
				User_Boards.add(model);
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
		return User_Boards;
	}
}
