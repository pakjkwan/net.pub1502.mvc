<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="../../css/board.css" />
<script type="text/javascript" src="../../js/board.js"></script>
<script type="text/javascript">
	function boardUpdateSubmit(boardNo) {
		alert("boardNo = "+ boardNo);
		window.location.href = "boardUpdateParam.do?boardNo=" + boardNo ;
	}
</script>

<h1>Board List</h1>

<form name="boardListForm" method="post" action="boardList.do" >
	<input type="hidden" id="pageNum" name="pageNum" >

	<table>
		<tr>
			<td align="left">&nbsp;
				<font size="4" color="#0000ff">건수 :</font>
				<font size="4" color="#ff0000">${totalRecord}</font>
			</td>
			<td colspan=4 align="right">
				<input type="radio" name="searchKey" value="boardTitle" checked="checked">글제목
				<input type="radio" name="searchKey" value="boardWriter">작성자
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="searchValue" value="">
				<input type="button" onclick="javascript:boardListFormSubmit(1)" value=" 검 색 "> &nbsp;
			</td>
		</tr>
		<tr><td colspan=5 align="center"><hr></td></tr>
		
		<tr>
			<td class="td_title" width=100 align=center>순번</td>
			<td class="td_title" width=350 align=center>게시글 제목</td>
			<td class="td_title" width=100 align=center>작성자</td>
			<td class="td_title" width=100 align=center>작성일자</td>
			<td class="td_title" width=100 align=center>조회수</td>
		</tr>
		<tr><td colspan=5 align="center"><hr></td></tr>
		
		<c:forEach var="bean" items="${boardBeanList}" varStatus="status">
			<c:if test="${status.index >= pageBean.start-1 && status.index <= pageBean.end-1}">
				<tr onMouseOver="style.backgroundColor='#cccccc'" onMouseOut="style.backgroundColor=''">
					<td align=center>${bean.boardNo}</td>
					<td align=left>
						<a href="javascript:boardUpdateSubmit(${bean.boardNo})">${bean.boardTitle}</a>
						<c:if test="${bean.regStep >= 0}">
							( <a href="#"><font color="blue">${bean.regStep}</font></a> )
						</c:if>
					</td>
					<td align=center>${bean.boardWriter}</td>
					<td align=center>${bean.regDate}</td>
					<td align=center>${bean.readCount}</td>
				</tr>
			</c:if>
		</c:forEach>

		<tr height="30">
			<td colspan="5" align="center">
				${pageBean.pageSize}, &nbsp;&nbsp; ${pageBean.totalRecord}, 
				&nbsp;&nbsp; ${pageBean.pageNum}, &nbsp;&nbsp;
				<font color="red">[ ${pageBean.start}, &nbsp;&nbsp;${pageBean.end} ]</font>, 
				&nbsp;&nbsp; ${pageBean.startPage}, &nbsp;&nbsp;
				${pageBean.endPage}, &nbsp;&nbsp; ${pageBean.totalPage}
			</td>
		</tr>
		<tr height="30">
			<td colspan="5" align="center">
				<c:if test="${pageBean.startPage - pageBean.pageSize > 0 }">
					<a href="javascript:boardListFormSubmit(${pageBean.startPage-1})">이전</a>
					&nbsp;&nbsp;&nbsp;
				</c:if>

				<c:forEach var="i" begin="${pageBean.startPage}" end="${pageBean.endPage}" step="1">
					<c:if test="${i == pageBean.pageNum}">
						<a href="javascript:boardListFormSubmit(${i})">
							<font color="red">&nbsp;${i}&nbsp;</font>
						</a>
					</c:if>
					<c:if test="${i != pageBean.pageNum}">
						<a href="javascript:boardListFormSubmit(${i})">
							<font color="blue">&nbsp;${i}&nbsp;</font>
						</a>
					</c:if>
				</c:forEach>

				<c:if test="${pageBean.startPage + pageBean.pageSize <= pageBean.totalPage}">
					&nbsp;&nbsp;&nbsp;
					<a href="javascript:boardListFormSubmit(${pageBean.startPage + 10})">다음</a>
				</c:if>	
			</td>
		</tr>

		<tr height="50">
			<td colspan="5" align="center">
				<h3><a href="${context }/control/board.do?command=write">게시글 등록</a></h3>
							</td>
		</tr>
	</table>
</form>
