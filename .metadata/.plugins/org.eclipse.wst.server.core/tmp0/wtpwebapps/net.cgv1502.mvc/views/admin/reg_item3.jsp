<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="context" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
function sortCheck(){ 
	 var i=document.insert_item.cate.selectedIndex // �����׸��� �ε��� ��ȣ
	 var sort=document.insert_item.cate.options[i].value // �����׸� value
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
		<tr><td >��ǰ ���� </td> <td><input type="file" name=product_image_upload></td></tr>
		 <tr><td>��ǰ ���� </td> <td><input type=text name=item_sort> 
		
	<select name=cate onChange="sortCheck()">
		<option value="����" >����</option>
		<option value="����">����</option>
		<option value="����">����</option>
		<option value="����">����</option>
		<option value="������">������</option>
	</select>
		</td></tr> <!-- style="text-align:center" -->
		<tr><td>������ </td> <td><input type=radio name=saleType value="present_true">������
														<input type=radio name=saleType value="present_false" checked=checked>�Ϲ�
		</td></tr>
		<tr><td>��ǰ �̸� </td> <td><input type=text name=itemName></td></tr>
		<tr><td>��ǰ �뷮 </td> <td><input type=text name=capa></td></tr>
		<tr><td>��ǰ ���� </td> <td><input type=text name=price></td></tr>
		<tr><td>��ǰ ���η� </td> <td><input type=text name=dcRate></td></tr>
		<tr><td>���� ���� </td> <td><input type=text name=alcol></td></tr> 
		<tr><td>��ǰ ���� </td> 
		<td><textarea  cols="50" rows="10" onclick="this.select()" onfocus="this.select()" name="description"></textarea></td></tr>
		<tr><td>��ǰ �� �̹��� </td> <td><input type="file" name=imgName></td></tr>
		<tr><td>���� </td> <td>
		 	<input type="submit" value="Submit"> &nbsp; 
		 	<input type="reset" value="Reset">
		 	<input type="hidden" name="command" value="add" />
		 </td>
		</tr>		
	</table>
	</form>
</div>