package test;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

public class PublicationDbUtil {
	
	private DataSource datasource;

	public PublicationDbUtil(DataSource datasource) {
		super();
		this.datasource = datasource;
	}
	
	

	public List<Publication> listPublication(){
		
		List<Publication> pubs = new ArrayList<>(); 
	
		Connection myCon = null;
		Statement mySt = null;
		ResultSet myRs = null;
		ResultSet myPrs = null;
		PreparedStatement myPr = null;
		
		 try {
			 String sql = "Select * From Publication";
			myCon = datasource.getConnection();
			mySt = myCon.createStatement();
			myRs = mySt.executeQuery(sql);
			 
			
			Publication pub ;
			
			while(myRs.next()) 
			{
				
				int IdPublication = myRs.getInt("IdPublication");
				String Titre = myRs.getString("Titre");
				String description = myRs.getString("Description");
				 String date = myRs.getString("La_Date");
				 String TypeFile = myRs.getString("FileType");
			     String TypePub = myRs.getString("TypePub"); 
				 int IdPersonne = myRs.getInt("IdPersonne"); 
			/*	 sql = "SELECT Nom,Prenom from Personne Where IdPersonne = ?";
				 myPr=myCon.prepareStatement(sql);
				 myPr.setInt(1,IdPersonne);
				 myPrs = myPr.executeQuery();*/
				 
				 
				 
				 pub = new Publication(IdPublication, Titre, description, date , TypePub, IdPersonne, TypeFile);
				 pubs.add(pub);
				
				
			}
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return pubs;
	}
private void close(Connection myCon, Statement mySt, ResultSet myRs) {
		
		try {
			if(myCon != null) myCon.close();
			if(mySt != null) mySt.close();
			if(myRs != null) myRs.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
	}



public void AddPublication(Publication pub) throws SQLException {
	
		Connection myCon = null;
		PreparedStatement mySt = null;
		ResultSet myRs = null;
		
		try {
			
			myCon = datasource.getConnection();
			String sql = "INSERT INTO Publication (Titre, Description, IdPersonne, publication, TypePub, FileType, FileName) values (?, ?, ?, ?, ?, ?, ?) ";
			String sql2= "SELECT LAST_INSERT_ID()";
			mySt = myCon.prepareStatement(sql);
			mySt.setString(1, pub.getTitre());
			mySt.setString(2, pub.getDescription());
			mySt.setInt(3, pub.getIdPersonne());
			mySt.setBlob(4, pub.getPublication());
			mySt.setString(5, pub.getTypePublication());
			mySt.setString(6, pub.getExtension());
			mySt.setString(7, pub.getFileName());
			
			mySt.execute();
			
			myRs=mySt.executeQuery(sql2);
			int id = 0;
			if(myRs.next()) {
			 id = myRs.getInt("LAST_INSERT_ID()");
				}
			System.out.println("IdPublication"+id);
			
			addauteur(id,pub.getAuteurs());
			
			
		}
		finally {
			
			close(myCon,mySt,null);
			
		}
	
}



private void addauteur(int idPublication, String[] auteurs) throws SQLException {
	
	Connection myCon = null;
	PreparedStatement mySt = null;
	ResultSet myRs = null;
	
	try {
		int length = auteurs.length;
		myCon = datasource.getConnection();
		
		for(int i=0;i<length;i++) {
		String sql = "INSERT INTO Auteurs (IdPublication, IdPersonne) values (?, ?)";
		String sql2 = "SELECT IdPersonne FROM Personne Where Nom like ? and Prenom like ? ";
		String np = auteurs[i];
		String[] items = np.split(" ");
		System.out.println(items[0]);
		System.out.println(items[1]);
		mySt = myCon.prepareStatement(sql2);
		mySt.setString(1,"%"+items[0]+"%" );
		mySt.setString(2,"%"+items[1]+"%" );
		myRs = mySt.executeQuery();
	int id =0;
		if(myRs.next()) {
		id = myRs.getInt("IdPersonne");
		System.out.println("Idpersonne "+id);
		mySt = myCon.prepareStatement(sql);
		mySt.setInt(1, idPublication);
		mySt.setInt(2, id);
		mySt.execute();
		}

		
		}
	}
	finally {
		
		close(myCon,mySt,null);
		
	}
	
}



public Publication getPublication(String parameter) throws SQLException {
	
	Connection myCon = null;
	PreparedStatement mySt = null;
	ResultSet myRs = null;
	ResultSet myRss = null;
	Publication pub = null ;
	InputStream in = null;
	try {
		
		int id = Integer.parseInt(parameter);
		
		myCon=datasource.getConnection();
		String sql = "Select * from Publication Where IdPublication = ?";
		mySt = myCon.prepareStatement(sql);
		mySt.setInt(1, id);
		myRs = mySt.executeQuery();
		String[] list = new String[10] ;
		int i =0;
		
		if(myRs.next()) {
			
			int IdPublication = myRs.getInt("IdPublication");
			 String filename = myRs.getString("FileName");
			 String filetype = myRs.getString("FileType");
			 String titre = myRs.getString("Titre");
			 String date = myRs.getString("La_Date");
			 String desc = myRs.getString("Description");
			 String typepub = myRs.getString("TypePub");
			 int IdPersonnepub = myRs.getInt("IdPersonne");
			 
			 Blob bl = myRs.getBlob("publication");
		//	 System.out.println(bl.length()+" ffffffff");
			 
			 
			 if(bl!=null) in = bl.getBinaryStream();
			 
			 
			sql = "Select IdPersonne from Auteurs Where IdPublication = ?";
			mySt = myCon.prepareStatement(sql);
			mySt.setInt(1, IdPublication);
			myRs = mySt.executeQuery();
			while(myRs.next()) {
				int  idPersonne = myRs.getInt("IdPersonne");
				
				sql = "Select Nom,Prenom from Personne Where IdPersonne = ?";
				mySt = myCon.prepareStatement(sql);
				mySt.setInt(1, idPersonne);
				myRss= mySt.executeQuery();
				
				if(myRss.next()) {
					
					list[i] = myRss.getString("Nom")+" "+myRss.getString("Prenom");i++;
				}
				
				
			}
			 pub = new Publication(IdPublication,titre,desc,date,typepub,list,IdPersonnepub, filename, in, filetype);
	
		}

		
		
	}
	finally {
		
		close(myCon,mySt,myRs);
		
	}
return pub; }



public List<Personne> getListPersonne() throws SQLException {
	
	Connection myCon = null;
	Statement mySt = null;
	ResultSet myRs = null;
	List<Personne> listpersonne = new ArrayList<>();
	Personne per = null;
	
	 String Nom;
	 String Prenom;
	 int IdPersonne;
			
	try {
		
		myCon = datasource.getConnection();
		String Personne = null;
		
		String sql = "SELECT Nom,Prenom,IdPersonne  FROM Personne";
		mySt = myCon.createStatement();
		myRs=mySt.executeQuery(sql);
		
		while(myRs.next()) {
		
			Nom = myRs.getString("Nom");
			Prenom = myRs.getString("Prenom");
			IdPersonne = myRs.getInt("IdPersonne");
			per = new Personne(Nom,Prenom,IdPersonne);
			listpersonne.add(per);
			
			
		}
		
	}
	
	finally {
		
		close(myCon,mySt,myRs);
		
	}
	
	return listpersonne;
}



public void deletepublication(String id) {
	
	Connection myCon = null ;
	PreparedStatement mySt = null ;
	
	try {
		
		try {
			myCon = datasource.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String sql = "delete from Publication where IdPublication=? ";
		
		try {
			mySt = myCon.prepareStatement(sql);
			mySt.setInt(1, Integer.parseInt(id));
			mySt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	finally {
		
		close(myCon,mySt,null);
	}
	
}



public void updatepublication(Publication pub) throws SQLException {
	
	Connection myCon = null;
	PreparedStatement mySt = null;
	ResultSet myRs = null;
	
	try {
		
		myCon = datasource.getConnection();
		
		String sql;//="select IdEquipe from Equipe where Nom=?";
		
		
	//	mySt = myCon.prepareStatement(sql);
		
	//	mySt.setString(1, projet.getNomEquipe());
		//myRs = mySt.executeQuery();
		
		
			
			sql = "update Publication "+"set Titre=?, Description=?, IdPersonne=?, publication=?, TypePub=?, FileType=?, FileName=? "+"where IdPublication=?";
	//Titre, Description, IdPersonne, publication, TypePub, FileType, FileName
			mySt = myCon.prepareStatement(sql);
			mySt.setString(1, pub.getTitre());
			mySt.setString(2, pub.getDescription());
			mySt.setInt(3, pub.getIdPersonne());
			mySt.setBlob(4, pub.getPublication());
			mySt.setString(5, pub.getTypePublication());
			mySt.setString(6, pub.getExtension());
			mySt.setString(7, pub.getFileName());
			mySt.execute();
			
		
		
		
		
	}
	finally {
		
		close(myCon,mySt,myRs);
		
	}
	
	
	
	
}












public Publication getPub(String parameter) throws SQLException {
	
	Connection myCon = null;
	PreparedStatement mySt = null;
	ResultSet myRs = null;
	ResultSet myRss = null;
	Publication pub = null ;
	InputStream in = null;
	Blob bl=null;
	try {
		
		int id = Integer.parseInt(parameter);
		
		myCon=datasource.getConnection();
		String sql = "Select * from Publication Where IdPublication = ?";
		mySt = myCon.prepareStatement(sql);
		mySt.setInt(1, id);
		myRs = mySt.executeQuery();
		String[] list = new String[10] ;
		int i =0;
		
		if(myRs.next()) {
			
		
			 String filename = myRs.getString("FileName");
			 String filetype = myRs.getString("FileType");
			 String contenttype = myRs.getString("ContentType");
			
			 
			  bl = myRs.getBlob("publication");
		//	 System.out.println(bl.length()+" ffffffff");
			 
			 
			
			 
			 
			
				
				
			
			 pub = new Publication(filename,bl, contenttype,filetype);
	
		}

		
		
	}
	finally {
		
		close(myCon,mySt,myRs);
		
	}
return pub; }













}
