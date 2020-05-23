package ar.edu.unlam.tallerweb1.modelo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Asignacion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long Id;

	private LocalDate fechaIngreso;
	private LocalDateTime horaIngreso;
	private LocalDate fechaEgreso;
	private String motivoEgreso;
	private LocalDateTime horaEgreso;

	@ManyToOne
	@JoinColumn
	private Paciente paciente;

	@ManyToOne
	@JoinColumn
	private Cama cama;

	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}

	public LocalDate getFechaIngreso() {
		return fechaIngreso;
	}

	public void setFechaIngreso(LocalDate fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}

	public LocalDateTime getHoraIngreso() {
		return horaIngreso;
	}

	public void setHoraIngreso(LocalDateTime horaIngreso) {
		this.horaIngreso = horaIngreso;
	}

	public LocalDate getFechaEgreso() {
		return fechaEgreso;
	}

	public void setFechaEgreso(LocalDate fechaEgreso) {
		this.fechaEgreso = fechaEgreso;
	}

	public String getMotivoEgreso() {
		return motivoEgreso;
	}

	public void setMotivoEgreso(String motivoEgreso) {
		this.motivoEgreso = motivoEgreso;
	}

	public LocalDateTime getHoraEgreso() {
		return horaEgreso;
	}

	public void setHoraEgreso(LocalDateTime horaEgreso) {
		this.horaEgreso = horaEgreso;
	}

	public Paciente getPaciente() {
		return paciente;
	}

	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}

	public Cama getCama() {
		return cama;
	}

	public void setCama(Cama cama) {
		this.cama = cama;
	}

}
