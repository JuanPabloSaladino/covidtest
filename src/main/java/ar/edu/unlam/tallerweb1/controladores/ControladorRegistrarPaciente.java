package ar.edu.unlam.tallerweb1.controladores;

import javax.servlet.http.HttpServletRequest;

import ar.edu.unlam.tallerweb1.modelo.TipoDocumento;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.Rol;
import ar.edu.unlam.tallerweb1.servicios.ServicioCama;
import ar.edu.unlam.tallerweb1.servicios.ServicioInstitucion;
import ar.edu.unlam.tallerweb1.servicios.ServicioPaciente;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;

@Controller
public class ControladorRegistrarPaciente {

    private ServicioInstitucion servicioInstitucion;
    private ServicioUsuario servicioUsuario;
    private ServicioPaciente servicioPaciente;

    @Autowired
    public ControladorRegistrarPaciente(ServicioInstitucion servicioInstitucion, ServicioCama servicioCama,
                                        ServicioPaciente servicioPaciente, ServicioUsuario servicioUsuario) {
        this.servicioInstitucion = servicioInstitucion;
        this.servicioUsuario = servicioUsuario;
        this.servicioPaciente = servicioPaciente;
    }

    @RequestMapping("/registrarPaciente")
    public ModelAndView registrarPaciente() {

        ModelMap modelo = new ModelMap();

        return new ModelAndView("registrarPaciente", modelo);
    }

    @RequestMapping("/detalleRegistroPaciente")
    public ModelAndView validarRegistroPaciente(

            @ModelAttribute("paciente") Paciente paciente,
            HttpServletRequest request

    ) {

        ModelMap model = new ModelMap();

        if (servicioUsuario.consultarUsuarioPorEmail(paciente.getEmail()) == null &&
                servicioPaciente.consultarPacientePorDoc(paciente.getNumeroDocumento(), paciente.getTipoDocumento()) == null) {

            paciente.setPosibleInfectado(true);

            servicioPaciente.registrarPaciente(paciente);

            String rol = Rol.PACIENTE.name();
            request.getSession().setAttribute("rol", paciente.getRol());

            String nombre = paciente.getNombre();
            String documento = paciente.getNumeroDocumento();
            String email = paciente.getEmail();
            TipoDocumento tipoDocumento = paciente.getTipoDocumento();

            model.put("nombre", nombre);
            model.put("documento", documento);
            model.put("tipoDocumento", tipoDocumento);
            model.put("email", email);

            return new ModelAndView("detalleRegistroPaciente", model);
        } else {

            model.put("error", "Ya existe un usuario registrado con su mail o documento");

            return new ModelAndView("registrarPaciente", model);
        }
    }
}
