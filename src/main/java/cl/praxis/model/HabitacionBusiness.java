package cl.praxis.model;

import java.util.ArrayList;
import java.util.List;

public class HabitacionBusiness {
    private List<Habitacion> habitaciones;

    public HabitacionBusiness() {
        this.habitaciones = new ArrayList<Habitacion>();
        habitaciones.add(new Habitacion(1, "Habitación 1, Simple", "Habitacion Clásica con cama extragrande, vistas al océano y balcón", "/assets/img/d1.jpg", 10000, 1, 30));
        habitaciones.add(new Habitacion(2, "Habitación 2, Doble Simple", "Habitación Clasica con 2 camas grandes o dobles, vistas al océano y balcón", "/assets/img/d2.jpg", 20000, 2, 20));
        habitaciones.add(new Habitacion(3, "Habitación 3, Doble Normal", "Habitación Superior en planta alta con vistas al océano y 2 camas dobles", "/assets/img/d3.jpg", 30000, 2, 40));
        habitaciones.add(new Habitacion(4, "Habitación 4, Doble King", "Suite Executive en planta superior con cama extragrande y vistas al océano", "/assets/img/d4.jpg", 45000, 1, 40));
        habitaciones.add(new Habitacion(5, "Habitación 5, Doble King", "Suite Executive en planta superior con cama extragrande y vistas al océano", "/assets/img/d5.jpg", 50000, 1, 30));
        habitaciones.add(new Habitacion(6, "Habitación 6, Doble King", "Suite Executive en planta superior con cama extragrande y vistas al océano", "/assets/img/d6.jpg", 60000, 2, 40));
        habitaciones.add(new Habitacion(7, "Habitación 7, Doble King", "Suite Executive en planta superior con cama extragrande y vistas al océano", "/assets/img/d7.jpg", 70000, 1, 50));
        habitaciones.add(new Habitacion(8, "Habitación 8, Doble Simple", "Suite Executive en planta superior con cama extragrande y vistas al océano", "/assets/img/d8.jpg", 80000, 2, 20));
    }
    
    /**
     * Devuelve la lista completa de habitaciones disponibles.
     */
    public List<Habitacion> getHabitaciones() {
        return habitaciones;
    }

    /**
     * Devuelve una habitación específica por su ID.
     */
    public Habitacion getHabitacionByID(int id) {
        for (Habitacion h : habitaciones) {
            if (h.getId() == id) {
                return h;
            }
        }
        
     // Retorna null si no se encuentra la habitación
        return null; 
    }

    /**
     * Calcula el valor total a pagar basado en el número de días reservados y el ID de la habitación.
     */
    public double calculaValorPagar(int id, int dias) {
        Habitacion h = getHabitacionByID(id);
        if (h == null) {
            throw new IllegalArgumentException("Habitación no encontrada con ID: " + id);
        }
        return h.getPrecio() * dias;
    }
}
