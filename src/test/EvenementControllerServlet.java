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
import javax.websocket.Session;

/**
 * Servlet implementation class EvenementControllerServlet
 */
@WebServlet("/EvenementControllerServlet")
public class EvenementControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
private EvenementDbUtil evenementdbutil;
	
	@Resource(name = "jdbc/projet")
	private DataSource datasource; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		
try {
			
			evenementdbutil = new EvenementDbUtil(datasource);
			
			
		}
		catch(Exception e ) {
			throw new ServletException(e);
			
		}
	}

    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cmd = request.getParameter("cmd");
		
		System.out.println(cmd);
		
		
		if(cmd==null) cmd="LIST";
		switch(cmd){
		
		// list evenement ....in MVC fashion
			case "LIST" : listevenement(request, response);break;
			case "ADD" :  addevenement(request,response); break;
			case "LOAD" :  loadevenement(request,response); break;
			case "DELETE" :  deleteevenement(request,response); break;
			case "EDIT" :  editevenement(request,response); break;
			case "UPDATE" :  updatevenement(request,response); break;
			case "RECH" :  rechercherevenement(request,response); break;
			case "PARTICIPE" :  participeevenement(request,response); break;
			case "NONPARTICIPE" :  nonparticipeevenement(request,response); break;
			case "ALL" :  allevenement(request,response); break;
		
	     }

	
	}


	private void nonparticipeevenement(HttpServletRequest request, HttpServletResponse response) {
		
		String idevenet = request.getParameter("IdEvenement");
		String idper = (String)(request.getSession().getAttribute("IdPersonne"));
		
		try {
			evenementdbutil.setnonparticipant(idevenet,idper);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//request.setAttribute("participe", idevenet);
		listevenement(request, response);
		
	}



	private void allevenement(HttpServletRequest request, HttpServletResponse response) {
		
		String idevent = request.getParameter("IdEvenement");
		String Titre = request.getParameter("Titre");
		List<Personne> list = null;
		try {
			list = evenementdbutil.allparticipants(idevent);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        
		request.setAttribute("Participants", list);
		request.setAttribute("Titre", Titre);
		System.out.println("listssssssssss");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ListParticipantsEvenement.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}



	private void participeevenement(HttpServletRequest request, HttpServletResponse response) {
		
		String idevenet = request.getParameter("IdEvenement");
		String idper = (String)(request.getSession().getAttribute("IdPersonne"));
		
		try {
			evenementdbutil.setparticipant(idevenet,idper);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//request.setAttribute("participe", idevenet);
		listevenement(request, response);
		
		
		
	}



	private void rechercherevenement(HttpServletRequest request, HttpServletResponse response) {
		
		String var = request.getParameter("recherche");
		System.out.println(var);
		
		
		List<Evenement> List_Evenement = null;
		try {
			List_Evenement = evenementdbutil.rechercherevenement(var);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println(List_Evenement.toString());
		
		request.setAttribute("List_Evenement", List_Evenement);
		
		
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/ListEvenement.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}



	private void updatevenement(HttpServletRequest request, HttpServletResponse response) {
		
		int id = Integer.parseInt(request.getParameter("IdEvenement"));
		
		String titre = request.getParameter("titre");
		String dateDebut = request.getParameter("dateDebut");
		String dateFin = request.getParameter("dateFin");
		String Description = request.getParameter("Description");
	    String Lieu = request.getParameter("Lieu");
	    String laltitude = request.getParameter("laltitude");
	    String longitude = request.getParameter("longitude");
	    float la = Float.parseFloat(laltitude);
	    float lo = Float.parseFloat(longitude);
		
		
		
		Evenement event = new Evenement(id, dateDebut, dateFin, Lieu , titre,
				 Description,la,lo);
		
		
		
		
		try {
			evenementdbutil.updateevenement(event);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		listevenement(request,response);
		
	}



	private void editevenement(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("IdEvenement") ;
		
		
		Evenement event = null;
		try {
			event = evenementdbutil.getevenement(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		request.setAttribute("Evenement", event);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/EditEvenement.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}



	private void deleteevenement(HttpServletRequest request, HttpServletResponse response) {
		
		String idevent = request.getParameter("IdEvenement");
		try {
			evenementdbutil.deleteevenement(idevent);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		listevenement(request,response);
		
	}



	private void loadevenement(HttpServletRequest request, HttpServletResponse response) {
		
		
String idevent = request.getParameter("IdEvenement") ;
		
		
		Evenement event = null;
		try {
			event = evenementdbutil.getevenement(idevent);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		request.setAttribute("Event", event);

		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/EvenementView.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}



	private void addevenement(HttpServletRequest request, HttpServletResponse response) {
		
		
		String titre = request.getParameter("titre");
		String dateDebut = request.getParameter("dateDebut");
		String dateFin = request.getParameter("dateFin");
		String Description = request.getParameter("Description");
	    String Lieu = request.getParameter("Lieu");
	    String laltitude = request.getParameter("laltitude");
	    String longitude = request.getParameter("longitude");
	    float la = Float.parseFloat(laltitude);
	    float lo = Float.parseFloat(longitude);
		
		
		
		Evenement event = new Evenement(titre,dateDebut,dateFin,Description,Lieu,la,lo);
		
		try {
			evenementdbutil.addevenement(event);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
				
		listevenement(request,response);
		
	}



	private void listevenement(HttpServletRequest request, HttpServletResponse response) {
		
		
		
List<Evenement> List_Evenement = evenementdbutil.listevenement();
		
		request.setAttribute("List_Evenement", List_Evenement);
		
		
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/ListEvenement.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

}
