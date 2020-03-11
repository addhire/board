package domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
	//DB 테이블의 컬럼과 동일하게! private 까먹지 않기.
public class BoardVO {
	private int bno;
	private String name;
	private String password;
	private String title;
	private String content;
	private String attach;
	private int re_ref;
	private int re_lev;
	private int re_seq;
	private int readcount;
	private Date regdate;
	
	public BoardVO(int number, String name, String title, int readcount, Date regdate) {
		super();
		this.bno = bno;
		this.name = name;
		this.title = title;
		this.readcount = readcount;
		this.regdate = regdate;
	}
	
	
	
}

