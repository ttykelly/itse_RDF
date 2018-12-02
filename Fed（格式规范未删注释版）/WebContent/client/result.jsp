<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.io.BufferedReader"
    import="java.io.IOException"
	import="java.io.InputStreamReader"
	import="java.io.PrintWriter"
	import="java.io.FileInputStream"
	import="java.io.FileReader"
	import="java.net.Socket"
	import="java.util.Scanner"
	import="java.io.BufferedWriter"
	import="java.io.File"
	import="java.io.FileWriter"
    import="java.io.OutputStream"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

	Socket client =null; 
	BufferedWriter writer=null;		
	BufferedReader input=null;
	OutputStream os= null;
	String keyword="ls\n"+request.getParameter("keyword");
	System.out.println(keyword);
	try {
		client=new Socket("47.92.162.51", 8008);
		os = client.getOutputStream();
		os.write(keyword.getBytes());
		os.flush();
		client.shutdownOutput();
        input = new BufferedReader(new InputStreamReader(client.getInputStream()));
        writer = new BufferedWriter(new FileWriter(new File(".\\xh.txt"),true));
        String line;
        while (true) { 
            line = input.readLine();
			if(line==null) {
            	break;	
            }
            System.out.println("搜索结果：" + line);
            writer.write(line+"\r\n");   
            
    	}
	}catch (Exception e) {
    	e.printStackTrace();
    }
	finally {
		if(client!=null)
        	client.close();
		if(writer!=null)
        	writer.close();
		if(input!=null)
        	input.close();
		if(os!=null){
			os.close();
		}
    }

%>
<%
	try(BufferedReader bufferedReader = new BufferedReader(new FileReader(".\\xh.txt"))){
    	String txt;
    	while((txt = bufferedReader.readLine()) != null) {
        %><%=txt %><br/><%
        		//System.out.print(txt);
		}
	}catch (Exception e) {
		e.printStackTrace();
	}

%>
</body>
</html>