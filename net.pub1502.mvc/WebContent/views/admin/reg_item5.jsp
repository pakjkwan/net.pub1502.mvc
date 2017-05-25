<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="context" value="${pageContext.request.contextPath}"/>
    <%
    request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
    %>
    <form action="${context}/control/item.do" method="get">
<table>
	<tr>
		<td>
			<input type="text" name="itemName"/>
		</td>
		<td>
			<input type="submit" value="Àü¼Û" />
			<input type="hidden" name="command" value="add" />
		</td>
	</tr>
</table>

</form>