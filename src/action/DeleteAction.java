package action;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;

import lombok.AllArgsConstructor;
import persistence.BoardDAO;

@AllArgsConstructor
public class DeleteAction implements Action {

	private String path;
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		// qna_board_pwdCheck.jsp에서 넘긴 값 가져오기
		String password = req.getParameter("password");
		int bno = Integer.parseInt(req.getParameter("bno")); //히든으로 가져왔으니까.

		// 페이지 나누기 후에 추가된 정보
		int page = Integer.parseInt(req.getParameter("page"));
		
		//검색정보 가져오기
		String criteria = req.getParameter("criteria");
		String keyword = URLEncoder.encode(req.getParameter("keyword"),"utf-8");
		
		
		// DB작업 - 비밀번호 확인
		BoardDAO dao = new BoardDAO();
		int result = dao.passwordCheck(bno, password);
		
		
		
		// 비밀번호가 맞지 않으면 원래 페이지로 돌려보내기
		if(result==0) {
			path="view/qna_board_pwdCheck.jsp?bno="+bno+"&page="+page+"&criteria="+criteria+"&keyword="+keyword;
		}else {
			if(!criteria.isEmpty()) {
				//검색에서 온 경우 path 재설정
				path = "qSearch.do?bno="+"&page="+page+"&criteria="+criteria+"&keyword="+keyword;
				
			}else {
				
				//비밀번호가 맞으면 삭제 작업 진행 진행 후 리스트 보여주기
				path += "?page="+page;
			}
			
			
			
			
			result = dao.deleteArticle(bno);
		}
		return new ActionForward(path, true);
	}

}
