<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Inserte titulo aqu�</title>
    
<jsp:include page="../../partial/${armarHeader}2.jsp" />

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
   
     
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <div>
        <h4>Lista de Camas Disponibles</h4> 
        </div>
   
       
      </div>
      	
    <div class="">
        <div>
        <div>
        <p class="">Nombre del paciente: ${paciente.getApellido()}, ${paciente.getNombre()}</p>
        <p class="">Motivo del egreso: ${motivoEgreso}</p>
        </div>

		 <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <div>
        		<h6 class="">PASO 2: Elegir la cama</h6>
        </div>
        
        
       
      </div>
	
	  <div class="table-responsive">
		    <table class="table table-bordered table-hover responsive nowrap text-center">
		        <tr>
		            <th class="bg-light" >DESCRIPCION</th>
		            <th class="bg-light" >TIPO</th>
		            <th  class="bg-light">SELECCIONAR</th>
		        </tr>
		        
		        <c:forEach items="${listaCamasDisponiblesTotal}" var="cama">
		            <tr>
		                <td><c:out value="${cama.getDescripcion()}"/></td>
		                <td><c:out value="${cama.getTipoCama().name()}"/></td>
		                
		                <td class="align-middle">
		                
		                <c:if test="${admin}">
						 	<a href="detalleInternacion?numeroDocumento=${paciente.getNumeroDocumento()}&tipoDocumento=${paciente.getTipoDocumento()}&cama=${cama.getId()}" 
		               type="button" class="btn btn-secondary">Seleccionar Cama</a> 
						</c:if>
						
		                <c:if test="${!admin}">
		               <a href="detalleEgreso?idPaciente=${paciente.getId()}&idCama=${cama.getId()}&motivoEgreso=${motivoEgreso}" 
		               type="button" class="btn btn-secondary">Internar</a>
						</c:if>
						
		                
						
		               </td>
		            </tr>
		        </c:forEach>
		        
		    </table>
		</div>

        </div>
    </div>

    
      
    </main>
    
    
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="../assets/dist/js/bootstrap.bundle.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
        <script src="js/dashboard.js"></script></body>
</html>
