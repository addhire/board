package action;

public class BoardActionFactory {
	private static BoardActionFactory baf;
//싱글톤 관련 작업.
	private BoardActionFactory() {}
	public static BoardActionFactory getInstance() {
		if(baf==null) {
			baf = new BoardActionFactory();
		}
		return baf;
	}
	
	Action action = null;
	public Action action(String cmd) {
		
		if(cmd.equals("/qWrite.do")) {
			action = new WriteAction("qList.do");
		}else if(cmd.equals("/qList.do")) {
			action = new ListAction("view/qna_board_list.jsp");
		}else if(cmd.equals("/qHitUpdate.do")) {
			action = new ReadCountUpdateAction("qView.do");
		}else if(cmd.equals("/qView.do")) {
			action = new ViewAction("view/qna_board_view.jsp");
		}else if(cmd.equals("/qModify.do")) {
			action = new ModifyAction("view/qna_board_modify.jsp");
		}else if(cmd.equals("/qUpdate.do")) {
			action = new UpdateAction("qView.do");
		}else if(cmd.equals("/qDelete.do")) {
			action = new DeleteAction("qList.do");
		}else if(cmd.equals("/qReplyView.do")) {
			action = new ReplyViewAction("view/qna_board_reply.jsp");
		}else if(cmd.equals("/qReply.do")) {
			action = new ReplyAction("qList.do");
		}else if(cmd.equals("/qSearch.do")) {
			action = new SearchAction("view/qna_board_list.jsp");
			
		}
		
		return action;
	}
	
}
