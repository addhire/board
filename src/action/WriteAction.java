package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.BoardVO;
import lombok.AllArgsConstructor;
import persistence.BoardDAO;
import upload.UploadUtil;

@AllArgsConstructor
public class WriteAction implements Action {

	private String path;
	
	
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		//qna_board_write.jsp에서 넘어온 값을 처리를 해야되는 상황.
//								String name = req.getParameter("name");
//								String password = req.getParameter("password");
//								String title = req.getParameter("title");
//								String content = req.getParameter("content");
//								String file = req.getParameter("file");
//								
//								BoardVO vo= new BoardVO();
//								vo.setName(name);
//								vo.setPassword(password);
//								vo.setTitle(title);
//								vo.setContent(content);
//								vo.setTitle(title);
		
		//새로운 방식(첨부파일 때문에.....). request객체를 UploadUtil에 넘겨주기
		UploadUtil uploadUtil = new UploadUtil();
		HashMap<String, String> dataMap = uploadUtil.getItem(req);
		
//		String name = req.getParameter("name");
//		String password = req.getParameter("password");
//		String title = req.getParameter("title");
//		String content = req.getParameter("content");
//		String attach = req.getParameter("attach");
		
		
		//맵에 들어있는 정보를 vo에 담기
		BoardVO vo =new BoardVO();
		vo.setName(dataMap.get("name"));
		vo.setPassword(dataMap.get("password"));
		vo.setTitle(dataMap.get("title"));
		vo.setContent(dataMap.get("content"));
		
		if(dataMap.containsKey("file"))
			vo.setAttach(dataMap.get("file"));
		
		
		//DB작업
		BoardDAO dao = new BoardDAO();
		int result = dao.insertArticle(vo);
		
		if(result==0) {
			path="view/qna_board_write.jsp";
		}
//								BoardDAO dao = new BoardDAO();
//								int result = dao.insertArticle(vo);
		
		//result == 1 ==> 원래 경로 유지
		//result == 0 ==> path는 실패한 페이지로 변경
		
//								if(result>0) {
//									
//								}else {
//									path="view/qna_board_list.jsp";
//								}
		
		
		return new ActionForward(path, true); //매개변수 순서 유의...
	}

}
