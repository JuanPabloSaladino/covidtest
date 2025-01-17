<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Inserte titulo aqu�</title>
    
<jsp:include page="../../partial/${armarHeader}2.jsp" />

<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<style>
#myInput {
	background-image: url('/css/searchicon.png');
	/* Add a search icon to input */
	background-position: 10px 12px; /* Position the search icon */
	background-repeat: no-repeat; /* Do not repeat the icon image */
	width: 100%; /* Full-width */
	font-size: 16px; /* Increase font-size */
	padding: 12px 20px 12px 40px; /* Add some padding */
	border: 1px solid #ddd; /* Add a grey border */
	margin-bottom: 12px; /* Add some space below the input */
}

#myTable {
	border-collapse: collapse; /* Collapse borders */
	width: 100%; /* Full-width */
	border: 1px solid #ddd; /* Add a grey border */
	font-size: 18px; /* Increase font-size */
}

#myTable th, #myTable td {
	text-align: left; /* Left-align text */
	padding: 12px; /* Add padding */
}

#myTable tr {
	/* Add a bottom border to all table rows */
	border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
	/* Add a grey background color to the table header and on hover */
	background-color: #f1f1f1;
}
</style>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

				<div class="container">

					<br>
					<h1>Gesti�n de Pacientes</h1>
					<br> <br>
					<h2>Lista de Posibles Infectados</h2>
					<div class="container">


						<input type="text" id="myInput" onkeyup="myFunction()"
							placeholder="Ingrese la prioridad a buscar"><br>
						<table
							class="table table-bordered table-hover responsive nowrap text-center align-middle"
							id="myTable">
							<tr class="text-center align-middle">
								<th scope="col">Nombre</th>
								<th scope="col">Documento</th>
								<th scope="col">Edad</th>
								<th scope="col">Infectado</th>
								<th scope="col">Prioridad</th>
								<th scope="col">Acciones</th>

							</tr>
							<c:forEach items="${poInfectados}" var="paciente">
								<tr>
									<td class="align-middle"><c:out
											value="${paciente.getApellido()}, ${paciente.getNombre()}" /></td>
									<td class="align-middle"><c:out
											value="${paciente.getNumeroDocumento()} (${paciente.getTipoDocumento().name()})" /></td>
									<td class="align-middle"><c:out
											value="${paciente.getEdad()}" /></td>

									<c:if test="${paciente.getInfectado() == true}">
										<td class="align-middle"><c:out value="Si" /></td>
									</c:if>
									<c:if test="${paciente.getInfectado() != true}">
										<td class="align-middle"><c:out value="Posible" /></td>
									</c:if>



									<style>
span {
	display: inline-block;
	width: 15px;
	height: 15px;
	margin-left: 6px;
	background-color: #555;
}
</style>

									<c:if test="${paciente.getPrioridad() == 5}">
										<td class="align-middle"><c:out value="Baja " /> <span
											class="rounded-circle bg-success"></span></td>
									</c:if>
									<c:if test="${paciente.getPrioridad() == 4}">
										<td class="align-middle"><c:out value="Baja" /> <span
											class="rounded-circle bg-success"></span></td>
									</c:if>
									<c:if test="${paciente.getPrioridad() == 3}">
										<td class="align-middle"><c:out value="Media" /> <span
											class="rounded-circle bg-warning"></span></td>
									</c:if>
									<c:if test="${paciente.getPrioridad() == 2}">
										<td class="align-middle"><c:out value="Alta " /> <span
											class="rounded-circle bg-danger"></span></td>
									</c:if>
									<c:if test="${paciente.getPrioridad() == 1}">
										<td class="align-middle"><c:out value="Alta" /> <span
											class="rounded-circle bg-danger"></span></td>
									</c:if>

									<td class="align-middle">
										<div class="float-none"
											style="margin-right: -5px; margin-top: 5px; /* margin-left: -30px"
											* />
										<form action="crearMensaje" method=post>
											<input class="invisible" type="hidden" id="id" name="id"
												value="${paciente.getId()}"> <input
												class="btn btn-primary" type="submit" value="Enviar Mensaje">
										</form>
										</div>
									</td>
							</c:forEach>
						</table>

						<div />
			</main>
		</div>
	</div>
	<script>
		
	</script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
	</script>
	<script src="../assets/dist/js/bootstrap.bundle.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
	<script src="js/dashboard.js"></script>
	<script>
		function myFunction() {
			// Declare variables
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("myTable");
			tr = table.getElementsByTagName("tr");

			// Loop through all table rows, and hide those who don't match the search query
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[4];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>
</body>
</html>