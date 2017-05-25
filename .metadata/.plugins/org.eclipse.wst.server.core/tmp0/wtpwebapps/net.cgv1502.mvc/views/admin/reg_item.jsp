<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.net.URLEncoder" %>
 <c:set var="context" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
function sortCheck(){ 
	 var i=document.insert_item.cate.selectedIndex // 선택항목의 인덱스 번호
	 var sort=document.insert_item.cate.options[i].value // 선택항목 value
	 document.insert_item.item_sort.value=sort
	}
</script>

<style type="text/css">
  	td{border-bottom:1px solid grey;}
  	#admin td{text-align:center; font-weight:bold; }
</style>

<h1>admin board</h1>
<div id="content">
	 
	<form action="${context}/control/item.do" name="insert_item" method="post">
	
	<table  style="border: solid 1px gray; width:100%;border-collapse: collapse; " >				
		<tr><td >상품 사진 </td> <td><input type="file" name=product_image_upload></td></tr>
		<tr><td>상품 종류 </td> <td><input type=text name=item_sort>
		
	<select name=cate onChange="sortCheck()">
		<option value="소주" >소주</option>
		<option value="맥주">맥주</option>
		<option value="양주">양주</option>
		<option value="와인">와인</option>
		<option value="전통주">전통주</option>
	</select>
		</td></tr> <!-- style="text-align:center" -->
		<tr><td>선물용 </td> <td><input type=radio name=present_check value="present_true">선물용
														<input type=radio name=saleType value="일반용" checked=checked>일반
		</td></tr>
	<tr><td>상품 이름 </td> <td><input type=text name=itemName></td></tr>
		<tr><td>상품 용량 </td> <td><input type=text name=capa></td></tr>
		<tr><td>상품 가격 </td> <td><input type=text name=price></td></tr>
		<tr><td>상품 할인률 </td> <td><input type=text name=dcRate></td></tr>
		<tr><td>알콜 </td> <td><input type=text name=alcol></td></tr>
		<tr><td>상품 설명 </td> <td><textarea  cols="50" rows="10" onclick="this.select()" onfocus="this.select()" name="description"></textarea></td></tr>
		<tr><td>상품 상세 이미지 </td> <td><input type="file" name=img_name></td></tr>
		<tr><td>전송 </td> <td><input type="submit" value="Submit"> &nbsp;
		<input type="hidden" name="command" value="add" /> 
		                                            <input type="reset" value="Reset"></td>
		    <tr>
		    <td>
		    	<input type="text" name="itemName" />
		    	</td>
		    </tr>
		    <tr>
		    	<td>전송 </td> <td><input type="submit" value="Submit"> &nbsp;
		<input type="hidden" name="command" value="add" /> 
		                                            <input type="reset" value="Reset"></td>
		    </tr>
	</table>
	</form>
</div>