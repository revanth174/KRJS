<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link  rel="stylesheet"
	href="cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css"></link>




<link href="<c:url value="/resources/css/footer.css" />"
	rel="stylesheet">





<%-- <link href="<c:url value="/resources/css/remarks.css" />"
	rel="stylesheet"> --%>



<title>krjs-${title }</title>
</head>
<body>

	<div class="container">
		<table id="datatable">
			<thead>
				<tr>
					<th>ID</th>
					<th>City</th>
					<th>Country</th>
					<th>Continent</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>Montería</td>
					<td>Colombia</td>
					<td>South America</td>
				</tr>
				<tr>
					<td>2</td>
					<td>Birmingham</td>
					<td>United Kingdom</td>
					<td>Europe</td>
				</tr>
				<tr>
					<td>3</td>
					<td>Bangalore</td>
					<td>India</td>
					<td>Asia</td>
				</tr>
				<tr>
					<td>4</td>
					<td>Tokyo</td>
					<td>Japan</td>
					<td>Asia</td>
				</tr>
				<tr>
					<td>5</td>
					<td>Kuala Lumpur</td>
					<td>Malaysia</td>
					<td>Asia</td>
				</tr>
				<tr>
					<td>6</td>
					<td>Rio de Janeiro</td>
					<td>Brazil</td>
					<td>South America</td>
				</tr>
				<tr>
					<td>7</td>
					<td>Ipoh</td>
					<td>Malaysia</td>
					<td>Asia</td>
				</tr>
				<tr>
					<td>8</td>
					<td>Tawau</td>
					<td>Malaysia</td>
					<td>Asia</td>
				</tr>
				<tr>
					<td>9</td>
					<td>Hiroshima</td>
					<td>Japan</td>
					<td>Asia</td>
				</tr>
				<tr>
					<td>10</td>
					<td>Cannes</td>
					<td>France</td>
					<td>Europe</td>
				</tr>
				<tr>
					<td>11</td>
					<td>London</td>
					<td>United Kingdom</td>
					<td>Europe</td>
				</tr>
				<tr>
					<td>12</td>
					<td>Saku</td>
					<td>Japan</td>
					<td>Asia</td>
				</tr>
				<tr>
					<td>13</td>
					<td>Nice</td>
					<td>France</td>
					<td>Europe</td>
				</tr>

				<tr>
					<td>14</td>
					<td>Manchester</td>
					<td>United Kingdom</td>
					<td>Europe</td>
				</tr>
				<tr>
					<td>15</td>
					<td>Salvador</td>
					<td>Brazil</td>
					<td>South America</td>
				</tr>

				<tr>
					<td>16</td>
					<td>Cali</td>
					<td>Colombia</td>
					<td>South America</td>
				</tr>
				<tr>
					<td>17</td>
					<td>Chennai</td>
					<td>India</td>
					<td>Asia</td>
				</tr>
				<tr>
					<td>18</td>
					<td>Brasília</td>
					<td>Brazil</td>
					<td>South America</td>
				</tr>
				<tr>
					<td>19</td>
					<td>Mumbai</td>
					<td>India</td>
					<td>Asia</td>
				</tr>
				<tr>
					<td>20</td>
					<td>Paris</td>
					<td>France</td>
					<td>Europe</td>
				</tr>
				<tr>
					<td>21</td>
					<td>Bello</td>
					<td>Colombia</td>
					<td>South America</td>
				</tr>
			</tbody>
		</table>

	</div>
	<%@ include file="./shared/footer.jsp"%>

</body>
	
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript"
	src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#datatable").dataTable();
		});
	</script>

</html>