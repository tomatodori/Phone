package MVC;

public interface in_Select {
	//파라미터를 String 으로 받으면 파싱해서 int 값도 처리할 수 있기 때문에 
	//좀 더 범용성 있게 쓰기 위해 String으로 지정
	public GetSet Select_One_Record(String PK);
}
