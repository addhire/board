package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import action.BoardActionFactory;
import action.ListAction;

@WebServlet("*.do")
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		
//		System.out.println(cmd); cmd를 콘솔에서 출력하면 그냥 /*.do가 나옴
//		앞에 주소가 막 오면  qList.do 이렇게 남기고 cmd를 잘라줄 듯.
//		qList.do랑 같으니 팩토리 페이지에서 19행 실행. 그럼 ListAction객체가 생성. 
//		view/qna_board_list.jsp 가 보임.
		
		BoardActionFactory baf = BoardActionFactory.getInstance();
		Action action = baf.action(cmd); //이게 팩토리의 15행 메소드를 실행하는 듯
		// 여기에 담긴 게 <new ListAction("view/qna_board_list.jsp");>
// 아 그래서 저쪽 15행 메소드가 Action타입의 action을 리턴해주겠네. 그걸 여기 34행 action에 담고.
		
		ActionForward af = null;
// 다시 그 담은 33액션이 execute를 해서 그걸 36 af에 담는다.	execute가 뭐지? 어디서 나온거지?
// 아 execute는  인터페이스  Action의 메소드이다.*
// execute는 왜 액션 포워드 타입이지?		???????
		try {
			af=action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
// af가 isRedirect라는 말은 또 뭐지?		
		if(af.isRedirect()) {
			response.sendRedirect(af.getPath());
		}else {
			RequestDispatcher rd=request.getRequestDispatcher(af.getPath());
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
