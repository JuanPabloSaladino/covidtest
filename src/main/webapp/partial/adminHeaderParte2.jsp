<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/dashboard/">


        <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-dark sticky-top bg-primary flex-md-nowrap p-0 shadow">
    <%--    <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="#">COVIDTEST</a>--%>
    <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="home">
        <img src="img/share2.png" width="35" height="35" class="d-inline-block align-top" alt="logo">
        AsignAR
    </a>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse"
            data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <!--   <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search"> -->
    <ul class="navbar-nav px-3">
    	<li class="nav-item text-nowrap">
				<c:if test="${rol == null}">
				<a href="login" class="btn btn-dark ml-5" role="button"
					aria-disabled="true">Iniciar Sesi�n</a>
				</c:if>	
				<c:if test="${rol != null}">				
				<a href="logout" class="btn btn-dark ml-5" role="button"
					aria-disabled="true">Salir</a>
				</c:if>
       </li>
  	</ul>
</nav>

<div class="container-fluid">

    <div class="row">
    
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse">
            <div class="sidebar-sticky pt-3">
               
                <ul class="nav flex-column">
                    <li class="nav-item mt-3 mb-3">
                        <a class="nav-link" href="admin">
                            <span data-feather="home"></span>
                            Inicio
                        </a>
                    </li>
                    <li class="nav-item mt-3 mb-3">
                        <a class="nav-link" href="cantidadDeCamasDisponibles">
                            <span data-feather="inbox"></span>
                            Disponibilidad Camas
                        </a>
                    </li>
                    <li class="nav-item mt-3 mb-3">
                        <a class="nav-link" href="listaInstituciones">
                            <span data-feather="users"></span>
                            Lista de Instituciones
                        </a>
                    </li>
                          <li class="nav-item mt-3 mb-3">
                        <a class="nav-link" href="listaPacientesInternados">
                            <span data-feather="users"></span>
                            Pacientes Internados
                        </a>
                    </li>
                    <li class="nav-item mt-3 mb-3">
                        <a class="nav-link" href="posiblesinfectados">
                            <span data-feather="users"></span>
                            Lista de Espera
                        </a>
                    </li>
                    <li class="nav-item mt-3 mb-3">
                        <a class="nav-link" href="consultarPaciente">
                            <span data-feather="search"></span>
                            Consultar paciente
                        </a>
                    </li>
                    <li class="nav-item mt-3 mb-3">
                        <a class="nav-link" href="internarPaciente">
                            <span data-feather="user-plus"></span>
                            Internar paciente
                        </a>
                    </li>
                    <li class="nav-item mt-3 mb-3">
                        <a class="nav-link" href="egresarPaciente">
                            <span data-feather="user-minus"></span>
                            Egresar paciente
                        </a>
                    </li>
                    <li class="nav-item mt-3 mb-3">
                        <a class="nav-link" href="listaPacientesInfectados">
                            <span data-feather="users"></span>
                            Pacientes Infectados
                        </a>
                    </li>
                    <li class="nav-item mt-3 mb-3">
                        <a class="nav-link" href="consultarAsignacion">
                            <span data-feather="search"></span>
                            Consultar Asignaci�n
                        </a>
                    </li>
                    <li class="nav-item mt-3 mb-3">
                        <a class="nav-link" href="grafico-pacientes">
                            <span data-feather="bar-chart-2"></span>
                            Reportes
                        </a>
                    </li>
                </ul>
            </div>
            
        </nav>