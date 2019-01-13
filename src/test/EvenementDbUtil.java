package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class EvenementDbUtil {
	
	private DataSource datasource;

	public EvenementDbUtil(DataSource datasource) {
		super();
		this.datasource = datasource;
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

	public List<Evenement> listevenement() {
		
		List<Evenement> events = new ArrayList<>(); 
		
		Connection myCon = null;
		Statement mySt = null;
		ResultSet myRs = null;
		ResultSet myPrs = null;
		PreparedStatement myPr = null;
		
		 try {
			 String sql = "Select * From Evenement";
			myCon = datasource.getConnection();
			mySt = myCon.createStatement();
			myRs = mySt.executeQuery(sql);
			 
			
			Evenement event ;
			
			while(myRs.next()) 
			{
				
				int IdEvenement = myRs.getInt("IdEvenement");
				String DateDebut = myRs.getString("DateDebut");
				String DateFin = myRs.getString("DateFin");
				 String Lieu = myRs.getString("Lieu");
				 String Titre = myRs.getString("Titre");
			    // String Photo = myRs.getString("Photo");
			     String Description = myRs.getString("Description");
			     
			     float latitude = myRs.getInt("latitude");
			     float longitude = myRs.getInt("longitude");
			/*	 sql = "SELECT Nom,Prenom from Personne Where IdPersonne = ?";
				 myPr=myCon.prepareStatement(sql);
				 myPr.setInt(1,IdPersonne);
				 myPrs = myPr.executeQuery();*/
				 
				 
				 
				 event = new Evenement(IdEvenement, DateDebut, DateFin, Lieu , Titre,
						  Description,latitude,longitude);
				 events.add(event);
				
				
			}
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		
		
		return events;
	}

	public void addevenement(Evenement event) throws SQLException {
		
		Connection myCon = null;
		PreparedStatement mySt = null;
		ResultSet myRs = null;
			
		
		try {
			
			//get db connection
			myCon = datasource.getConnection();
			
			//creat sql for insert
			//Creat sql for select IdEquipe
			String sql = "insert into Evenement"+"(DateDebut,DateFin,Lieu,Titre,Description,latitude,longitude)"+"values (?, ?, ?, ?, ?, ?, ?)";
			
			mySt = myCon.prepareStatement(sql);
			mySt.setString(1, event.getDateDebut()); //event.getDateDebut()
			mySt.setString(2, event.getDateFin()); //event.getDateFin()
			mySt.setString(3, event.getLieu());
			mySt.setString(4, event.getTitre());
			mySt.setString(5, event.getDescription());
			mySt.setFloat(6, event.getLatitude());
			mySt.setFloat(7, event.getLongitude());
			mySt.execute();
		
		}
		finally {
			
			close(myCon,mySt,null);
		}
		
	}

	public Evenement getevenement(String idevent) throws SQLException {
		
		Connection myCon = null;
		PreparedStatement mySt = null ;
		ResultSet myRs = null;
		Evenement event = null ;
		
		try {
			
			int id = Integer.parseInt(idevent);
			
			myCon = datasource.getConnection();
			
			String sql = "SELECT * FROM Evenement WHERE IdEvenement=?";
			
			mySt = myCon.prepareStatement(sql);
			
			mySt.setInt(1, id);
			
			
			myRs = mySt.executeQuery();
			
			if(myRs.next()) {
				
				
			//	int IdEvenement = myRs.getInt("IdEvenement");
				String DateDebut = myRs.getString("DateDebut");
				String DateFin = myRs.getString("DateFin");
				 String Lieu = myRs.getString("Lieu");
				 String Titre = myRs.getString("Titre");
			    // String Photo = myRs.getString("Photo");
			     String Description = myRs.getString("Description");
			     
			     float latitude = myRs.getFloat("latitude");
			     float longitude = myRs.getFloat("longitude");
				
				//execute sql insert
				myRs = mySt.executeQuery();
			  	
			event = new Evenement(id, DateDebut, DateFin, Lieu , Titre,
					  Description,latitude,longitude);
				
			   
			}
			
			return event;
		
		}
		finally {
			
			close(myCon,mySt,myRs);
			
		}
		
		
		
	}

	public void deleteevenement(String idevent) throws SQLException {
		
		
		Connection myCon = null ;
		PreparedStatement mySt = null ;
		
		try {
			
			myCon = datasource.getConnection();
			
			String sql = "delete from Evenement where IdEvenement=? ";
			
			mySt = myCon.prepareStatement(sql);
			mySt.setInt(1, Integer.parseInt(idevent));
			mySt.execute();
			
			
		}
		finally {
			
			close(myCon,mySt,null);
		}
		
	}

	public void updateevenement(Evenement event) throws SQLException {
		

		Connection myCon = null;
		PreparedStatement mySt = null;
		ResultSet myRs = null;
		
		try {
			
			myCon = datasource.getConnection();
			
			//String sql="select IdEquipe from Equipe where Nom=?";
			
			
		
				
				String sql = "update Evenement "+"set DateDebut=?, DateFin=?, Lieu=?, Titre=?, Description=?, latitude=?, longitude=? "+"where IdEvenement=?";
				mySt = myCon.prepareStatement(sql);
				mySt.setString(1, "2018-06-02"); //event.getDateDebut()
				mySt.setString(2, "2019-01-22"); //event.getDateFin()
				mySt.setString(3, event.getLieu());
				mySt.setString(4, event.getTitre());
				mySt.setString(5, event.getDescription());
				mySt.setFloat(6, event.getLatitude());
				mySt.setFloat(7, event.getLongitude());
				mySt.setInt(8, event.getIdEvenement());
				mySt.execute();
				

			
		}
		finally {
			
			close(myCon,mySt,myRs);
			
		}
		
		
	}

	public List<Evenement>  rechercherevenement(String var) throws SQLException {
		
List<Evenement> events = new ArrayList<>(); 
		
		Connection myCon = null;
		PreparedStatement mySt = null;
		ResultSet myRs = null;
		
		
		 try {
			 String sql = "Select * From Evenement where Titre LIKE ? or Description like ? or Lieu like ? or DateDebut like ? or DateFin like ?";
			myCon = datasource.getConnection();
			mySt = myCon.prepareStatement(sql);
			mySt.setString(1, "%"+var+"%");
			mySt.setString(2, "%"+var+"%");
			mySt.setString(3, "%"+var+"%");
			mySt.setString(4, "%"+var+"%");
			mySt.setString(5, "%"+var+"%");
			myRs = mySt.executeQuery();
			 
			
			Evenement event ;
			
			while(myRs.next()) 
			{
				
				int IdEvenement = myRs.getInt("IdEvenement");
				System.out.println(IdEvenement);
				String DateDebut = myRs.getString("DateDebut");
				String DateFin = myRs.getString("DateFin");
				 String Lieu = myRs.getString("Lieu");
				 String Titre = myRs.getString("Titre");
			    // String Photo = myRs.getString("Photo");
			     String Description = myRs.getString("Description");
			     
			     float latitude = myRs.getInt("latitude");
			     float longitude = myRs.getInt("longitude");
			/*	 sql = "SELECT Nom,Prenom from Personne Where IdPersonne = ?";
				 myPr=myCon.prepareStatement(sql);
				 myPr.setInt(1,IdPersonne);
				 myPrs = myPr.executeQuery();*/
				 
				 
				 
				 event = new Evenement(IdEvenement, DateDebut, DateFin, Lieu , Titre,
						  Description,latitude,longitude);
				 events.add(event);
				
				
			}
		} finally  {
			
			close(myCon,mySt,myRs);
		}
		
		 return events;
		
	}

	public void setparticipant(String idevenet, String idper) throws SQLException {
		
		Connection myCon = null;
		PreparedStatement mySt = null;
		
		
		
		 try {
			String sql = "insert into Participe"+"(IdEvenement,IdPersonne)"+"values (?, ?)";
			myCon = datasource.getConnection();
			mySt = myCon.prepareStatement(sql);
			mySt.setInt(1, Integer.parseInt(idevenet));
			mySt.setInt(2, Integer.parseInt(idper));
			
			mySt.execute();
			 
			
			
				
				
			
		} finally  {
			
			close(myCon,mySt,null);
		}
		
	}

	
	public List<Personne> allparticipants(String idevent) throws SQLException {
		
		
		
		
		Connection myCon = null;
		PreparedStatement mySt = null;
		ResultSet myRs = null;
		ResultSet myRss = null;
		
		 
		List <Personne> list = new ArrayList<Personne>() ;
		 
		
		
			String sql;
			try {
			
				sql = "select IdPersonne from Participe where IdEvenement = ? ";
				myCon = datasource.getConnection();
				mySt = myCon.prepareStatement(sql);
				mySt.setInt(1, Integer.parseInt(idevent));

				myRs = mySt.executeQuery();
				System.out.println("exec ");
				while(myRs.next()) {
					System.out.println("while ");
					
					sql = "select Nom,Prenom,Email from Personne where IdPersonne = ? ";
					mySt = myCon.prepareStatement(sql);
					mySt.setInt(1, myRs.getInt("IdPersonne"));
					myRss = mySt.executeQuery();
					int idp = myRs.getInt("IdPersonne");
					System.out.println(idp);
					if(myRss.next()) {
						System.out.println("if ");
						System.out.println(myRss.getString("Nom"));
						String nom = myRss.getString("Nom");
						String prenom = myRss.getString("Prenom");
						String email = myRss.getString("Email");
						Personne p = new Personne(idp,nom,prenom,email);
						System.out.println(p.getEmail());
						list.add(p);
						
					}
					
					
					} 
				
				
			
		} finally  {
			
			close(myCon,mySt,myRss);
			close(null,null,myRs);
		}
		
		 return list;
		
	}

	public void setnonparticipant(String idevenet, String idper) throws SQLException {
		
		Connection myCon = null;
		PreparedStatement mySt = null;
		
		
		
		 try {
			String sql = "delete from Participe where IdEvenement=? and IdPersonne=? ";
			myCon = datasource.getConnection();
			mySt = myCon.prepareStatement(sql);
			mySt.setInt(1, Integer.parseInt(idevenet));
			mySt.setInt(2, Integer.parseInt(idper));
			
			mySt.execute();
			 
			
			
				
				
			
		} finally  {
			
			close(myCon,mySt,null);
		}
		
	}

}
