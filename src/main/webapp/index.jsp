<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <%
        Date CreationTime=new Date(session.getCreationTime());

        Date LastAccTime=new Date(session.getLastAccessedTime());

        //Set attribute method need to use craete attribute as well as value

        String UsernameAttribute=new String("UserID"); // attribute 
        String UserID=new String("Vishal");//value

        String CountAttribute=new String("VisitCount");//atrribute
        Integer vscount=new Integer(0);

        String title=new String("Hello");

        if(session.isNew())
        {
             title="Welcome to MIT";    
            session.setAttribute(UsernameAttribute, UserID);
            session.setAttribute(CountAttribute, vscount);

        }
        else
        {
             title= "Hi...Student How are you?";
            //need to get attribute first because system need to know current visit 
            //cout of the user
            vscount=(Integer)session.getAttribute(CountAttribute);
            vscount=vscount+1;
            session.setAttribute(UsernameAttribute, UserID);
            session.setAttribute(CountAttribute, vscount);
        }
    %>
 
<h1 style=" color: blue"> Session Tracking Information</h1>
<table>
        <tr>
            <td> Session id :</td>
            <td><% out.print(session.getId());%> </td>
        </tr>

        <tr>
            <td> Creation Time: </td>
            <td> <%=CreationTime%> </td>
        </tr>
        <tr>
            <td> Last Access Time: </td>
            <td> <%=LastAccTime%> </td>
        </tr>
        <tr>
            <td> User Name: </td>
            <td>  <%=UserID %></td>
        </tr>
        <tr>
            <td>Visit Count: </td>
            <td> <%=vscount%></td>
        </tr>
        <tr>
            <td> Msg: </td>
            <td> <%=title %> </td>
        </tr>
 
</table>
 
 
 
</body>
</html>