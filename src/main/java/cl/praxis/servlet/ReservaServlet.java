package cl.praxis.servlet;

import cl.praxis.model.Habitacion;
import cl.praxis.model.HabitacionBusiness;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/reservaServlet")
public class ReservaServlet extends HttpServlet {
    private HabitacionBusiness habitacionBusiness = new HabitacionBusiness();
    
    
    /**
     * Maneja la solicitud POST para reservas de habitaciones.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 // Obtiene los parámetros del formulario de reserva
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String medioPago = request.getParameter("medio_pago");
        String diasStr = request.getParameter("dias");
        String fechaEntrada = request.getParameter("fecha_entrada");
        String idHabitacionStr = request.getParameter("idhabitacion");


        try {
        	// Parsea y calcula la reserva
            int diasReserva = diasStr != null ? Integer.parseInt(diasStr) : 0;
            int idHabitacion = idHabitacionStr != null ? Integer.parseInt(idHabitacionStr) : 0;

            Habitacion habitacion = habitacionBusiness.getHabitacionByID(idHabitacion);
            if (habitacion == null) {
                throw new IllegalArgumentException("Habitación no encontrada con ID: " + idHabitacion);
            }
            double valorPagar = habitacionBusiness.calculaValorPagar(idHabitacion, diasReserva);

            // Prepara los datos para mostrar en la página de confirmación
            request.setAttribute("nombre", nombre);
            request.setAttribute("apellido", apellido);
            request.setAttribute("email", email);
            request.setAttribute("medioPago", medioPago);
            request.setAttribute("diasReserva", diasReserva);
            request.setAttribute("fechaEntrada", fechaEntrada);
            request.setAttribute("valorPagar", valorPagar);
            request.setAttribute("nombreHabitacion", habitacion.getNombre());
            request.setAttribute("descripcionHabitacion", habitacion.getDescripcion());

            // Redirige a la página de confirmación
            request.getRequestDispatcher("/procesa.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Por favor ingresa valores válidos para los campos.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}

