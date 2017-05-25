<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<form onload="javascript:onloadProcess()" name="boardInsertForm" method="post" action="boardInsert.do" >
	<input type="hidden" name="num" value="num">
	
	<table border="1">
		<tr>
			<th align="center" colspan="2" bgcolor="#eeeeee" height=50>
				<font size=5><b>글 쓰 기</b></font>
			</th>
		</tr>
		
		<tr>
			<th width="100" align="center">작성자</th>
			<td width="600">
				<input type="text" id="boardWriter" name="boardWriter" 
						size="100" value="${param.boardWriter}" readonly >
			</td>
		</tr>
		<tr>
			<th align="center">글제목</th>
			<td>
				<input type="text" id="boardTitle" name="boardTitle" size="100">
			</td>
		</tr>
		<tr>
		<th align="center">글내용</th>
			<td>
				<textarea name="boardContent" rows="20" cols="75"></textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글쓰기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="목록보기" onClick="window.location.href='boardList.do'">
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	function onloadProcess() {
		alert("onloadProcess()...");
		boardInsertForm.subject.focus( );
	}
</script>