<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fileName=request.getParameter("fileName");

	String filePath = "d:\\upload\\"+fileName;
	FileInputStream in = new FileInputStream(filePath);
	
	//MIME 현재 문서가 어떤 형태의 문서인지 알려줌.
	response.setContentType("application/octet-stream");
	String agent = request.getHeader("User-Agent");
		
	boolean ieBrowser = (agent.indexOf("Trident")>-1)||(agent.indexOf("Edge")>-1);

	if(ieBrowser){
		fileName=URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
	}else{
		fileName=new String(fileName.getBytes("UTF-8"), "iso-8859-1");
	}
	
	//out.print(fileName);
	
	//파일 다운로드는 response 객체를 이용해서 사용자에게 응답
	//페이지를 Header에 붙여서 보낸다.
	out.clear();
	out=pageContext.pushBody();
	
	int start = fileName.lastIndexOf("_");
	String oriName = fileName.substring(start+1);
	
	
	response.setHeader("Content-Disposition", "attachment;filename="+oriName);
	
	BufferedOutputStream buf = new BufferedOutputStream(response.getOutputStream());
	
	
	
	
	int numRead=0;
	byte b[]=new byte[4096];
	while((numRead=in.read(b,0,b.length))!=-1){
		buf.write(b,0,numRead);
	}
	
	buf.flush();
	buf.close();
	in.close();
	
%>

