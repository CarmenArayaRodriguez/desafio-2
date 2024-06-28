<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<%@include file="assets/html/head.jsp"%>
<title>Confirmación de Reserva</title>
</head>
<body>
    <%@include file="assets/html/header.jsp"%>
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row justify-content-center">
                <h1>
                    Detalle Solicitud Reserva Habitación: <strong>${nombreHabitacion}</strong>
                </h1>
                <hr />
            </div>
            <div class="container px-4 px-lg-5 mt-5">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Item</th>
                            <th scope="col">Valor</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Nombre</td>
                            <td>${nombre}</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Apellido</td>
                            <td>${apellido}</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Email</td>
                            <td>${email}</td>
                        </tr>
                        <tr>
                            <th scope="row">4</th>
                            <td>Medio Pago</td>
                            <td>${medioPago}</td>
                        </tr>
                        <tr>
                            <th scope="row">5</th>
                            <td>Días</td>
                            <td>${diasReserva}</td>
                        </tr>
                        <tr>
                            <th scope="row">6</th>
                            <td>Fecha Entrada</td>
                            <td>${fechaEntrada}</td>
                        </tr>
                        <tr>
                            <th scope="row">7</th>
                            <td>Valor Pagar</td>
                            <td><strong>CL$ ${valorPagar != null ? Math.round(valorPagar) : "Valor no disponible"}</strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    <%@include file="assets/html/footer.jsp"%>
</body>
</html>


