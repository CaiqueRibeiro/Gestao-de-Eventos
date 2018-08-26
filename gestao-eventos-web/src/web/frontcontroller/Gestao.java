package web.frontcontroller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.util.Resultado;
import dominio.evento.IDominio;
import web.command.ICommand;
import web.command.impl.ConsultarCommand;
import web.command.impl.SalvarCommand;
import web.viewhelper.IViewHelper;
import web.viewhelper.impl.EventoVH;

/**
 * Servlet implementation class Gestao
 */
@WebServlet("/Gestao")
public class Gestao extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static Map<String, ICommand> commands;
	private static Map<String, IViewHelper> vhs;
	
    public Gestao() {
    	
    	commands = new HashMap<String, ICommand>();
    	
    	commands.put("SALVAR", new SalvarCommand());
    	commands.put("CONSULTAR", new ConsultarCommand());
    	
    	vhs = new HashMap<String, IViewHelper>();
    	vhs.put("/gestao-eventos-web/evento/salvar", new EventoVH());
    	vhs.put("/gestao-eventos-web/evento/consultar", new EventoVH());
    	vhs.put("/gestao-eventos-web/evento/alterar", new EventoVH());
    	vhs.put("/gestao-eventos-web/evento/excluir", new EventoVH());
        
     
    }


    protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
    	
    	String uri = request.getRequestURI();
    	
    	String operacao = request.getParameter("operacao");
		
		IViewHelper vh = vhs.get(uri);
		
		IDominio entidade =  vh.getData(request);
				
		ICommand command = commands.get(operacao);
				
		Resultado resultado = command.execute(entidade);
		
		vh.formataView(resultado, request, response);
    	
    }

}
