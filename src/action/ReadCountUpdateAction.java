package action;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.AllArgsConstructor;
import persistence.BoardDAO;

@AllArgsConstructor
public class ReadCountUpdateAction implements Action {

	private String path;
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		// 페이지 나누기 후에 추가된 정보
		int page = Integer.parseInt(req.getParameter("page"));
		
		//bno 가져오기
		int bno = Integer.parseInt(req.getParameter("bno"));
		
		//검색정보 가져오기
		String criteria = req.getParameter("criteria");
		String keyword = URLEncoder.encode(req.getParameter("keyword"),"utf-8");
		
		
		BoardDAO dao = new BoardDAO();
		//조회수 업데이트
		dao.readCountUpdate(bno);
		
		path+="?bno="+bno+"&page="+page+"&criteria="+criteria+"&keyword="+keyword;
		
		return new ActionForward(path, true);
	
	}

}
