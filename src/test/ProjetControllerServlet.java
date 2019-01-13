package test;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class ProjetControllerServlete
 */
@WebServlet("/ProjetControllerServlet")
public class ProjetControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProjetDbUtil projetdbutil;
	
	@Resource(name = "jdbc/projet")
	private DataSource datasource; 
	
	
	@Override
	public void init() throws ServletException {
		super.init();
		// create db utile....and pass in the pool 	datasource
		
		try {
			
			projetdbutil = new ProjetDbUtil(datasource);
			
		}
		catch(Exception e ) {
			throw new ServletException(e);
			
		}
		
		
	}



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		//read the command parameter
		String cmd = request.getParameter("command");
		
		//if the command is missing , the default listing projets
		
		if(cmd == null) cmd="LIST";
		
		
		//retour to the appropriate method
		
		
		
		
		try {
			
			switch(cmd){
			
			// List the projects ....in MVC fashion
			case "LIST" : listprojets(request , response); break;
			case "ADD" :  addprojet(request,response); break;
			case "LOAD" :  loadprojet(request,response); break;
			case "UPDATE" :  updateprojet(request,response); break;
			case "DELETE" :  deleteprojet(request,response); break;
			case "ListEquipe" :  ListEquipe(request,response); break;
				
			}
			
			
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
	}



	private void ListEquipe(HttpServletRequest request, HttpServletResponse response) throws SQLException, Exception, IOException {
		
		
		//get project from the db util
		List<String> ListEquipe = projetdbutil.getListEquipe();
		
		// add project to the request
		request.setAttribute("Equipe_list", ListEquipe);

		//send to the JSP View
		RequestDispatcher dispatcher = request.getRequestDispatcher("/AddProjetForm.jsp");
		dispatcher.forward(request, response);
		
	}



	private void deleteprojet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String idprojet = request.getParameter("projetid");
		projetdbutil.deleteprojet(idprojet);
		
		listprojets(request,response);
		
	}



	private void updateprojet(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		
		int projetid = Integer.parseInt(request.getParameter("projetid"));
		
		String theme = request.getParameter("Theme");
		String desc = request.getParameter("Description");
		String NomEquipe = request.getParameter("Equipe");
		
		Projet projet = new Projet(projetid,theme,desc,NomEquipe);
		
		projetdbutil.updateprojet(projet);
		
		listprojets(request,response);
		
		
	}



	private void loadprojet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String idprojet = request.getParameter("projetid") ;
		
		
		Projet projet = projetdbutil.getprojet(idprojet);
		
		List<String> ListEquipe = projetdbutil.getListEquipe();
		ListEquipe.toString();
		
		request.setAttribute("PROJET", projet);

		request.setAttribute("Equipe_list", ListEquipe);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/UpdateProjet.jsp");
		dispatcher.forward(request, response);
		
		
	}



	private void addprojet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String theme = request.getParameter("Nom");
		String Description = request.getParameter("Description");
		String Equipe = request.getParameter("Equipe");
		
		Projet projet = new Projet(theme,Description,Equipe);
		
		projetdbutil.addprojet(projet); 
				
		listprojets(request,response);
	}



	private void listprojets(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		
		//get project from the db util
		List<Projet> projets = projetdbutil.getProjet();
		
		// add stdent to the request
		request.setAttribute("Projet_list", projets);

		//send to the JSP View
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ListProjets.jsp");
		dispatcher.forward(request, response);
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
