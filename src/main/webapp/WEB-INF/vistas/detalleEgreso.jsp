<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Inserte titulo aqu�</title>
    
<jsp:include page="../../partial/${armarHeader}2.jsp" />


<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
	
	
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	
		<h4>Detalle del Egreso</h4>
	
	</div>
	
	<div >
			<br>
	
           	<h5 >Datos del Paciente</h5> 
           		
       		<br>
			
			<p>Apellido y Nombre: ${paciente.getApellido()}, ${paciente.getNombre()}</p> 
			
			<p >Documento: ${paciente.getNumeroDocumento()} (${paciente.getTipoDocumento().name()})</p>
			
			<br>
			
			<h5>Datos del Egreso</h5> 
           		
       		<br>
			
			<p >Fecha y Hora de Egreso: ${horaEgreso}</p>
			
			<p>Motivo de Egreso: ${asignacion.getMotivoEgreso()}</p>

			
			<br>
	
			<div
			class="pt-3 pb-2">
	
			<a href="panel" class="btn btn-primary">Inicio</a>
	
		</div>
	
	</div>
	<div class="form-group">
	
		<c:if test="${not empty error}">
			<h4>
				<span>${error}</span>
			</h4>
			<br>
		</c:if>
	</div>
	</div>

</main>


<jsp:include page="../../../partial/footer.jsp" />