package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.BoardVO;
import domain.PageVO;
import lombok.AllArgsConstructor;
import persistence.BoardDAO;


@AllArgsConstructor
public class ListAction implements Action {

	private String path;
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		int page = 1;
		if(req.getParameter("page")!=null) { //겟파라미터는 항상 스트링으로 받으니까
			page = Integer.parseInt(req.getParameter("page")); // 파스인트!
		}
		
		int amount = 10;
		
		
		//DB작업
		BoardDAO dao = new BoardDAO();
		
		//전체 게시물 수
		int totalRows = dao.getRows();
		
		// 총 페이지 수
		int totalPage = totalRows%10==0 ? totalRows/10 : totalRows/10+1;
		// endPage
		int endPage = (int)(Math.ceil(page/10.0)*amount);
		// startPage
		int startPage = endPage-9;
		
		// 실제 마지막 페이지 구하기
//		int realEnd = (int)(Math.ceil(totalRows/1.0)/10);
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		PageVO pageVO = new PageVO();
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setPage(page);
		pageVO.setTotalPage(totalPage);
		
		
		//페이지 번호에 해당하는 리스트 가져오기
		List<BoardVO> list = dao.getList(page, amount);
		//request객체에 담고 페이지 이동
		req.setAttribute("list", list);
		
		req.setAttribute("pageVO", pageVO);
		
		return new ActionForward(path, false);
	}

}
