package MVC;

import java.sql.Date;

/* 프로젝트에 사용할 테이블의 모든 속성을  private [데이터 타입] [속성 이름]; 으로 선언하고
 * 프로젝트에서 GetSet 클래스를 생성자로 불러와 속성의 값을 넣고 가져올 수 있게끔 속성마다
 * Getter & Setter 메소드 선언.
 * 테이블과 테이블간에 중복되는 속성은 '//private String user_id;' 처럼 앞에 '//'을 붙여
 * 주석처리 해놓았다.
 */
public class GetSet {

	// SHOP_USER 테이블
	private String user_id;
	private String user_pw;
	private String user_name;
	private String mail1;
	private String mail2;
	private String tel1;
	private String tel2;
	private String tel3;
	private String add1;
	private String add2;
	private String add3;
	private String add4;
	private String year;
	private String month;
	private String day;
	private Date join_date;

	// ITEM 테이블
	private int item_no;
	private int item_price;
	private String item_name;
	private String item_group;
	private String item_option;
	private String item_photo;
	private String item_desc;
	private Date item_date;

	// CART 테이블
	private int cart_no;
	// private int item_no;
	// private int item_price;
	private int cart_amount;
	private String cart_item;
	// private String user_id;
	private Date cart_date;

	// BUY 테이블
	private int buy_no;
	private int buy_type;
	// private int item_no;
	// private int item_price;
	// private int cart_amount;
	private String card1;
	private String card2;
	private String card3;
	private String card4;
	// private int tel1;
	// private int tel2;
	// private int tel3;
	// private String cart_item;
	// private String user_id;
	private String name;
	private String card_pw;
	// private String add1;
	// private String add2;
	// private String add3;
	// private String add4;
	private String message;
	private Date buy_date;
	
	// BOARD 테이블
	private int board_no;
	private int ref;
	private int board_type;
	private int hidden;
	private int readcount;
	// private String user_id;
	private String title;
	private String board_photo;
	private String content;
	private Date reg_date;

	// SHOP_USER 테이블 getter&setter
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getMail1() {
		return mail1;
	}

	public void setMail1(String mail1) {
		this.mail1 = mail1;
	}

	public String getMail2() {
		return mail2;
	}

	public void setMail2(String mail2) {
		this.mail2 = mail2;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getAdd1() {
		return add1;
	}

	public void setAdd1(String add1) {
		this.add1 = add1;
	}

	public String getAdd2() {
		return add2;
	}

	public void setAdd2(String add2) {
		this.add2 = add2;
	}

	public String getAdd3() {
		return add3;
	}

	public void setAdd3(String add3) {
		this.add3 = add3;
	}

	public String getAdd4() {
		return add4;
	}

	public void setAdd4(String add4) {
		this.add4 = add4;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	// ITEM 테이블 getter&setter
	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public int getItem_price() {
		return item_price;
	}

	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_group() {
		return item_group;
	}

	public void setItem_group(String item_group) {
		this.item_group = item_group;
	}

	public String getItem_option() {
		return item_option;
	}

	public void setItem_option(String item_option) {
		this.item_option = item_option;
	}

	public String getItem_photo() {
		return item_photo;
	}

	public void setItem_photo(String item_photo) {
		this.item_photo = item_photo;
	}

	public String getItem_desc() {
		return item_desc;
	}

	public void setItem_desc(String item_desc) {
		this.item_desc = item_desc;
	}

	public Date getItem_date() {
		return item_date;
	}

	public void setItem_date(Date item_date) {
		this.item_date = item_date;
	}

	// CART 테이블 getter&setter
	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public int getCart_amount() {
		return cart_amount;
	}

	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}

	public String getCart_item() {
		return cart_item;
	}

	public void setCart_item(String cart_item) {
		this.cart_item = cart_item;
	}
	public Date getCart_date() {
		return cart_date;
	}

	public void setCart_date(Date cart_date) {
		this.cart_date = cart_date;
	}

	// BUY 테이블 getter&setter
	public int getBuy_no() {
		return buy_no;
	}

	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}

	public int getBuy_type() {
		return buy_type;
	}

	public void setBuy_type(int buy_type) {
		this.buy_type = buy_type;
	}

	public String getCard1() {
		return card1;
	}

	public void setCard1(String card1) {
		this.card1 = card1;
	}

	public String getCard2() {
		return card2;
	}

	public void setCard2(String card2) {
		this.card2 = card2;
	}

	public String getCard3() {
		return card3;
	}

	public void setCard3(String card3) {
		this.card3 = card3;
	}

	public String getCard4() {
		return card4;
	}

	public void setCard4(String card4) {
		this.card4 = card4;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCard_pw() {
		return card_pw;
	}

	public void setCard_pw(String card_pw) {
		this.card_pw = card_pw;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	public Date getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}

	// BOARD 테이블 getter&setter
	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getBoard_type() {
		return board_type;
	}

	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}

	public int getHidden() {
		return hidden;
	}

	public void setHidden(int hidden) {
		this.hidden = hidden;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBoard_photo() {
		return board_photo;
	}

	public void setBoard_photo(String board_photo) {
		this.board_photo = board_photo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}


}
