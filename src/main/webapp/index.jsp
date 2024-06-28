<%@page import="java.util.List"%>
<%@page import="cl.praxis.model.Habitacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cl.praxis.model.HabitacionBusiness"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// Librerías Requeridas
HabitacionBusiness habitacionBusiness = new HabitacionBusiness();

// Listado de Habitaciones
List<Habitacion> listaHabitaciones = habitacionBusiness.getHabitaciones();
%>

<!DOCTYPE html>
<html lang="es">
<%@include file="assets/html/head.jsp"%>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/assets/css/styles.css">


<body>

	<%@include file="assets/html/header.jsp"%>


		<!-- Section-->
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">

				<div class="row justify-content-center">
					<h1>
						Habitaciones Disponibles (<%=listaHabitaciones.size()%>)
					</h1>
					<hr />
				</div>

				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
    <% for (int x = 0; x < listaHabitaciones.size(); x++) { %>
        <div class="col mb-5">
            <div class="card h-100">
                <img class="card-img-top img-fluid" src="<%=request.getContextPath()%>/<%=listaHabitaciones.get(x).getImagen()%>" alt="<%=listaHabitaciones.get(x).getNombre()%>" style="height: 200px; object-fit: cover;">
                <div class="card-body p-4">
                    <div class="text-center">
                        <h5 class="fw-bolder"><%=listaHabitaciones.get(x).getNombre()%></h5>
                        <p><%=listaHabitaciones.get(x).getDescripcion()%></p>
                        CL$ <%=listaHabitaciones.get(x).getPrecio()%>
                    </div>
                </div>
            </div>
        </div>
    <% } %>
</div>
				
			</div>
		</section>

		<!-- Formulario de reserva -->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <h2>Información de Reserva Habitación</h2>
            <hr/>
            <form method="post" action="reservaServlet">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row g-3">
                <div class="col-md-6">
                    <label for="nombre">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value="${nombre}" required>
                </div>
                <div class="col-md-6">
                    <label for="apellido">Apellido</label>
                    <input type="text" class="form-control" id="apellido" name="apellido" value="${apellido}" required>
                </div>
                <div class="col-md-6">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="${email}" required>
                </div>
                <div class="col-md-3">
                    <label for="medio_pago">Medio de Pago</label>
                    <select class="form-control" id="medio_pago" name="medio_pago" value="${medio_pago}">
                        <option>Contado</option>
                        <option>Tarjeta</option>
                        <option>Transferencia</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="dias">Días</label>
                    <select class="form-control" id="dias" name="dias" value="${dias}">
                        <% for (int i = 1; i <= 30; i++) { %>
                            <option value="<%= i %>"><%= i %></option>
                        <% } %>
                    </select>
                </div>
                <div class="col-md-6">
                        <label for="idhabitacion">Selecciona Habitación</label>
                        <select class="form-control" id="idhabitacion" name="idhabitacion">
                            <% for (Habitacion habitacion : listaHabitaciones) { %>
                                <option value="<%= habitacion.getId() %>"><%= habitacion.getNombre() %> - CL$ <%= habitacion.getPrecio() %></option>
                            <% } %>
                        </select>
                    </div>
                <div class="col-md-3">
                        <label for="fecha_entrada">Fecha Entrada</label>
                        <input type="date" class="form-control" id="fecha_entrada" name="fecha_entrada" required>
                    </div>
                <div class="col-md-6">
                    <button type="submit" class="btn btn-primary">Enviar Solicitud de Reserva</button>
                </div>
            </div>
        </div>
    </form>
            
        </div>
    </section>
		

		<br /> <br />


	<%@include file="assets/html/footer.jsp"%>

</body>
</html>


