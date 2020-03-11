package domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class PageVO {

	private int page; //사용자가 선택한 페이지 번호
	private int startPage; //현재 화면에 보여줄 첫번째 페이지
	private int endPage; //현재 화면에 보여줄 마지막 페이지
	private int totalPage; //전체 페이지 수
	
}
