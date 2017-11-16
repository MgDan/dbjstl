<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
<!--primero se añaden las librerias jstl que son las que estan arriba 
NOTA: asegurarse que la libreria java esta incluida-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <!--con este establecemos conexion con datasource
         url es donde esta alojada la base de datos
        debe estar el driver de mysql en la libreria si no no funcionara-->
        <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/usuarios" user="root" password="123" var="con"/>
        
        <!-- aqui hacemos el query -->
        <sql:query dataSource="${con}" var="result">
            select * from usuarios;
        </sql:query>
            
            
              
        <!-- iteramos el resultado -->
        <c:forEach var="filas" items="${result.rows}" >
            <c:out value="${filas.id}" />
            <c:out value="${filas.name}" />
        </c:forEach>
    </body>
</html>
