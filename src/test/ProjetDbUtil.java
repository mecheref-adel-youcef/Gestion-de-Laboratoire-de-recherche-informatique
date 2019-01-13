package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class ProjetDbUtil {
	
	private DataSource datasource;

	public ProjetDbUtil(DataSource datasource) {
		super();
		this.datasource = datasource;
	}
	
	public List<Projet> getProjet() throws Exception{
		
		List<Projet> Projets = new ArrayList<>();
		
		Connection myCon = null;
		Statement mySt = null;
		ResultSet myRs = null;
		
		try {
			
			// get Connection to the data base
			
			myCon = datasource.getConnection();
			
			// Create sql statemnet
			
			String sql = "SELECT * FROM Projet , Equipe Where Projet.IdEquipe=Equipe.IdEquipe";
			mySt = myCon.createStatement();
			
			//execute sql statement
			
			myRs = mySt.executeQuery(sql);
			
			//process the result set
			Projet TempProjet ;
			
			while(myRs.next()) {
				
				//Retrive data from result set
			     int IdProjet = myRs.getInt("IdProjet");
				 String Nom = myRs.getString("Nom");
				 String Description = myRs.getString("Description") ;
				 
				 String NomEquipe = myRs.getString("Equipe.Nom");
			    
				
				//create new projet object
			      TempProjet = new Projet(IdProjet,Nom,Description,NomEquipe);
				
				//add it to the list students
				Projets.add(TempProjet);
				
				
			}
			
			// close JDBC Object
			
			
		}
		finally {
			
			close(myCon,mySt,myRs);
		}
		
	
			
			return Projets; }

	private void close(Connection myCon, Statement mySt, ResultSet myRs) {
		
		try {
			if(myCon != null) myCon.close();
			if(mySt != null) mySt.close();
			if(myRs != null) myRs.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
	}

	public void addprojet(Projet projet) throws SQLException {
		
		Connection myCon = null;
		PreparedStatement mySt = null;
		ResultSet myRs = null;
			
		
		try {
			
			//get db connection
			myCon = datasource.getConnection();
			
			//creat sql for insert
			//Creat sql for select IdEquipe
			String sql1 = "SELECT IdEquipe From Equipe WHERE Nom =?";
			
			mySt = myCon.prepareStatement(sql1);
			mySt.setString(1, projet.getNomEquipe());
			myRs = mySt.executeQuery();
		
			
			if(myRs.next()) {
				
				String sql ="insert into Projet"+"(Nom,Description,IdEquipe)"+"values (?, ?, ?)";
				mySt = myCon.prepareStatement(sql);
				//set the parameter for project
				
				mySt.setString(1, projet.getTheme());
				mySt.setString(2, projet.getDescription());
				mySt.setInt(3, myRs.getInt("IdEquipe"));
				//execute sql insert
				mySt.execute();
				}
			
			
		}
		finally {
			
			close(myCon,mySt,myRs);
		}
		
	}

	public Projet getprojet(String id) throws Exception {
		
		Connection myCon = null;
		PreparedStatement mySt = null ;
		ResultSet myRs = null;
		Projet projet = null ;
		
		try {
			
			int idprojet = Integer.parseInt(id);
			
			myCon = datasource.getConnection();
			
			String sql = "SELECT * FROM Projet,Equipe WHERE IdProjet=?";
			
			mySt = myCon.prepareStatement(sql);
			
			mySt.setInt(1, idprojet);
			
			
			myRs = mySt.executeQuery();
			
			if(myRs.next()) {
				
				
				String Nom = myRs.getString("Nom");
				String desc = myRs.getString("Description");
				int IdEquipe = myRs.getInt("IdEquipe");
				
			    sql ="SELECT Nom FROM Equipe WHERE IdEquipe=?";
				mySt = myCon.prepareStatement(sql);
				//set the parameter for project
				
				mySt.setInt(1, IdEquipe);
				
				//execute sql insert
				myRs = mySt.executeQuery();
			
				if(myRs.next())  
				
				
				
			projet = new Projet(idprojet,Nom,desc,myRs.getString("Nom"));
				
			   
			}
			
			return projet;
		
		}
		finally {
			
			close(myCon,mySt,myRs);
			
		}
		
	}

	public void updateprojet(Projet projet) throws SQLException {
		
		Connection myCon = null;
		PreparedStatement mySt = null;
		ResultSet myRs = null;
		
		try {
			
			myCon = datasource.getConnection();
			
			String sql="select IdEquipe from Equipe where Nom=?";
			
			
			mySt = myCon.prepareStatement(sql);
			
			mySt.setString(1, projet.getNomEquipe());
			myRs = mySt.executeQuery();
			
			if(myRs.next()) {
				
				sql = "update Projet "+"set Nom=?, Description=?, IdEquipe=? "+"where IdProjet=?";
				mySt = myCon.prepareStatement(sql);
				mySt.setString(1, projet.getTheme());
				mySt.setString(2, projet.getDescription());
				mySt.setInt(3, myRs.getInt("IdEquipe"));
				mySt.setInt(4, projet.getIdProjet());
				mySt.execute();
				
			}
			
			
			
		}
		finally {
			
			close(myCon,mySt,myRs);
			
		}
		
		
		
		
	}

	public void deleteprojet(String idprojet) throws Exception {
		
		Connection myCon = null ;
		PreparedStatement mySt = null ;
		
		try {
			
			myCon = datasource.getConnection();
			
			String sql = "delete from Projet where IdProjet=? ";
			
			mySt = myCon.prepareStatement(sql);
			mySt.setInt(1, Integer.parseInt(idprojet));
			mySt.execute();
			
			
		}
		finally {
			
			close(myCon,mySt,null);
		}
		
		
		
	}

	public List<String> getListEquipe() throws SQLException {
		// TODO Auto-generated method stub
		
		Connection myCon = null;
		Statement mySt = null;
		ResultSet myRs = null;
		List<String> listequip = new ArrayList<>();		
				
		try {
			
			myCon = datasource.getConnection();
			String Equipe = null;
			
			String sql = "SELECT Nom FROM Equipe";
			mySt = myCon.createStatement();
			myRs=mySt.executeQuery(sql);
			
			while(myRs.next()) {
				
			 listequip.add(myRs.getString("Nom"));
				
				
			}
			
		}
		
		finally {
			
			close(myCon,mySt,myRs);
			
		}
		
		return listequip;
	}
		
	}
	


