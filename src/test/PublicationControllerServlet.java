package test;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;



/**
 * Servlet implementation class PublicationControllerServlet
 */
@WebServlet("/PublicationControllerServlet")
@MultipartConfig(maxFileSize = 16177215)

public class PublicationControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PublicationDbUtil publicationdbutil;
	
	@Resource(name = "jdbc/projet")
	private DataSource datasource; 
	
	 private static final int BUFFER_SIZE = 4096; 
	
	public void init(ServletConfig config) throws ServletException {
		
		
		try {
			
			publicationdbutil = new PublicationDbUtil(datasource);
			
			
		}
		catch(Exception e ) {
			throw new ServletException(e);
			
		}
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		
	
	String cmd = request.getParameter("cmd");
	String Id = request.getParameter("IdPublication");
	System.out.println(cmd);
	System.out.println(Id);
	
	if(cmd==null) cmd="LIST";
	switch(cmd){
	
	// List the projects ....in MVC fashion
	case "LIST" : listpublication(request, response);break;
	case "DOWN" : {
		try {
		System.out.println(cmd+"  Download");
		System.out.println(Id+"   /////////////");
			downprojet(request,response);
			listpublication(request,response); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		}break;
	case "LOAD" :{
		System.out.println("   //////load///////");
		loadpublication(request,response);	break;	
	}
	case "DOWN2" :{
		System.out.println("   //////down///////");
		
	}
	case "DELETE" :{
		System.out.println("   //////DELETE///////");
		deletepublication(request,response);	break;	
	}
	//default  :  listpublication(request,response); break;
		
	}
	
		
	
}
		
	

	private void deletepublication(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("IdPublication");
		System.out.println("Delete pub id "+id);
		publicationdbutil.deletepublication(id);
		listpublication(request,response);
	}

	private void downprojet(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		
		
		Publication pub = publicationdbutil.getPublication(request.getParameter("IdPublication"));
		System.out.println("select fait");
		String filePath = pub.getFileName()+"."+pub.getExtension();
		System.out.println(filePath);
		
		System.out.println(pub.getFileName());
		System.out.println(pub.getIdPublication());
		String fileName = pub.getFileName();
		int fileLength = pub.getPublication().available();
		byte[] buffer = new byte[BUFFER_SIZE];
        
        //	Publication pub = publicationdbutil.getPub(request.getParameter("IdPublication"));
		

		
		 
			   
			   // set content properties and header attributes for the response
               //response.setContentType(mimeType);
              // response.setContentLength(fileLength);
			 //  ServletContext context = getServletContext();
			  
			// sets MIME type for the file download
               String contentType = "text/plain";//"application/pdf";//pub.getFileType();
               System.out.println("Content type --> "+pub.getExtension());//context.getMimeType(fileName);
              /* if (mimeType == null) {        
                   mimeType = "application/octet-stream";
               }  */  
			   
            // set content properties and header attributes for the response
               response.setHeader("Content-Type", contentType);
               
               response.setHeader("Content-Length", String.valueOf(pub.getBlob()));
     
               response.setHeader("Content-Disposition", "inline; filename=\"" + filePath + "\"");
               
               // For big BLOB data.
               Blob fileData = pub.getBlob();
               InputStream is = fileData.getBinaryStream();
               byte[] bytes = new byte[1024];
               int bytesRead;
     
               while ((bytesRead = is.read(bytes)) != -1) {
                   // Write image data to Response.
                   response.getOutputStream().write(bytes, 0, bytesRead);
               }
               is.close();
     
          
	
	}
			
		
		
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		
		String cmd=null;
		cmd=request.getParameter("cmd");
		System.out.println(cmd);
		System.out.println("ADD publication method");
		
		
		switch(cmd) {
		
		case "ADD":  try {
				addpublication(request , response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}break;
			
			
			
			
	
		case "LOAD" :{
			System.out.println("LOAD publication method 3");
			loadpublication(request, response);	break;	
		}
		case "UPDATE" :{
			System.out.println("UPDATE publication method 3");
			updatepublication(request, response);	break;	
		}
		default :listpublication(request, response);
		System.out.println("ADD publication method 4");break;
		}
		
			/*addpublication(request , response);
			listpublication(request , response);*/
		
		/*	String cmd = request.getParameter("cmd");
			if(cmd==null) cmd = "LIST";
			
			
			try {
				
				switch(cmd){
				
				// List the projects ....in MVC fashion
				case "LIST" : listpublication(request , response); break;
				case "ADD" : addpublication(request , response); break;
				
					
				}
				
				
				
			} catch (Exception e) {
				throw new ServletException(e);
			}
			*/
		
	}

	private void updatepublication(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("id --> "+id);
    	String titre = null;
    	titre = request.getParameter("titre");
    	String type = null;
    	type = request.getParameter("type");
    	String[] auteurs = null;
    	auteurs = request.getParameterValues("Auteurs");
    	System.out.println(auteurs);
     if(auteurs!=null) {
    	for(int i=0; i<auteurs.length;i++) {
    		System.out.println(auteurs[i]);
    		
    	}
     }
				
     
     String date = null;
 	date = request.getParameter("date");
 	System.out.println("la date :--> "+date);
 	String resume = null;
 	resume = request.getParameter("Resume");
 	String contenttype = null;
 	Publication pub = null;
 	 Part filePart=null;
 	String FileName= null; 
 	long size ;
 	
 	InputStream inputStream = null;	
 	 filePart = request.getPart("Attachement");
 	 System.out.println(filePart.getName());
 	 size = filePart.getSize();
 	 System.out.println("size  ->> " + size);
 	 
 			if (size != 0) {
 				
 			
 				FileName = extractFileName(filePart);
 				
 				
 				contenttype = filePart.getContentType();
 				//System.out.println(filePart.getName());
 				//System.out.println(filePart.getSize());
 			//	System.out.println(filePart.getContentType());
 			
 			//	String[] list = FileName.split(".");
 				
 				
 				if(FileName!=null) {	
 					String filename = FileName.split("\\.")[0]; 
 					String extension = FileName.split("\\.")[1];
 	
 					System.out.println(filename);
 					System.out.println(extension);
 					inputStream = filePart.getInputStream();
 					pub = new Publication(id,titre,resume,date,type,auteurs,1,filename,inputStream,extension);
 					System.out.println("Fin add pub 0");
 					try {
						publicationdbutil.updatepublication(pub);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
 					System.out.println("Fin add pub 1");
 				}

 			}
 			else {
 				
 				pub = new Publication(id,titre,resume,date,auteurs,type,1);
 				try {
					publicationdbutil.updatepublication(pub);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
 				System.out.println("test else");

 			}
 			System.out.println("Fin add pub 2");
 			listpublication(request, response);
 			System.out.println("Fin add pub 3");
     
		
		
		
		
		listpublication(request,response);
		
	}

	private void loadpublication(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("ADD publication method 5");
		String id = request.getParameter("IdPublication");
		Publication pub = null;
		try {
			 pub = publicationdbutil.getPublication(id);
			 System.out.println(pub.getAuteurs()[0]+"AAAAAAAAA");
			 System.out.println(pub.getAuteurs()[1]+"AAAAAAAAA");
			 System.out.println(pub.getFileName());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("publication", pub);
		try {
			request.setAttribute("Personne_list", ListPersonne(request, response));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/EditPublication.jsp");
		dispatcher.forward(request, response);
		
	}

	private void listpublication(HttpServletRequest request, HttpServletResponse response) {
		
	List<Publication> List_Publication = publicationdbutil.listPublication();
		
		request.setAttribute("List_Publication", List_Publication);
		try {
			request.setAttribute("Personne_list", ListPersonne(request, response));
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/ArticleView.jsp");
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
	private void addpublication(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException, SQLException {
		
		
		System.out.println("ADD publication method 7");
	String titre = null;
	titre = request.getParameter("titre");
	String type = null;
	type = request.getParameter("type");
	String[] auteurs = null;
	auteurs = request.getParameterValues("Auteurs");
	System.out.println(auteurs);
 if(auteurs!=null) {
	for(int i=0; i<auteurs.length;i++) {
		System.out.println(auteurs[i]);
		
	}
 }
	
	String date = null;
	date = request.getParameter("date");
	System.out.println("la date :--> "+date);
	String resume = null;
	resume = request.getParameter("Resume");
	String contenttype = null;
	Publication pub = null;
	 Part filePart=null;
	String FileName= null; 
	long size ;
	
	InputStream inputStream = null;	
	 filePart = request.getPart("Attachement");
	 System.out.println(filePart.getName());
	 size = filePart.getSize();
	 System.out.println("size  ->> " + size);
	 
			if (size != 0) {
				
			
				FileName = extractFileName(filePart);
				
				
				contenttype = filePart.getContentType();
				//System.out.println(filePart.getName());
				//System.out.println(filePart.getSize());
			//	System.out.println(filePart.getContentType());
			
			//	String[] list = FileName.split(".");
				
				
				if(FileName!=null) {	
					String filename = FileName.split("\\.")[0]; 
					String extension = FileName.split("\\.")[1];
	
					System.out.println(filename);
					System.out.println(extension);
					inputStream = filePart.getInputStream();
					pub = new Publication(titre,resume,date,type,auteurs,1,filename,inputStream,extension);
					System.out.println("Fin add pub 0");
					publicationdbutil.AddPublication(pub);
					System.out.println("Fin add pub 1");
				}

			}
			else {
				
				pub = new Publication(titre,resume,date,auteurs,type,1);
				publicationdbutil.AddPublication(pub);
				System.out.println("test else");

			}
			System.out.println("Fin add pub 2");
			listpublication(request, response);
			System.out.println("Fin add pub 3");
	}
	
	private String extractFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }
	
	private List<Personne> ListPersonne(HttpServletRequest request, HttpServletResponse response) throws SQLException, Exception, IOException {
		
		
		//get project from the db util
		List<Personne> ListPersonne = publicationdbutil.getListPersonne();
		
		// add project to the request
		return ListPersonne;
	}

}
