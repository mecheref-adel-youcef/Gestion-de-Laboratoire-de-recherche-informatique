package test;

public class Personne {
	
	private String Nom;
	private String Prenom;
	private int IdPersonne;
	private String Email;
	
	
	
	
	public Personne(int idPersonne,String nom, String prenom,  String email) {
		super();
		Nom = nom;
		Prenom = prenom;
		IdPersonne = idPersonne;
		Email = email;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public Personne(String nom, String preom, int idPersonne) {
		super();
		Nom = nom;
		Prenom = preom;
		IdPersonne = idPersonne;
	}
	public String getNom() {
		return Nom;
	}
	public void setNom(String nom) {
		Nom = nom;
	}
	public String getPrenom() {
		return Prenom;
	}
	public void setPrenom(String preom) {
		Prenom = preom;
	}
	public int getIdPersonne() {
		return IdPersonne;
	}
	public void setIdPersonne(int idPersonne) {
		IdPersonne = idPersonne;
	}
	
	
}
