package test;

import java.io.InputStream;
import java.sql.Blob;
import java.util.Date;

import javax.servlet.http.Part;

public class Publication {
	
	private int IdPublication;
	private String Titre;
	private String Description;
	private String[] Auteurs;
	
	public String[] getAuteurs() {
		return Auteurs;
	}



	public void setAuteurs(String[] auteurs) {
		Auteurs = auteurs;
	}



	private String DatePublication;
	private String TypePublication; 
	private int IdPersonne;
	private String FileName;
	
	private InputStream Publication;
	private String FileType; 
	private String Extension ;
	private Blob blob;
	
	
	
	public Blob getBlob() {
		return blob;
	}



	public void setBlob(Blob blob) {
		this.blob = blob;
	}



	public Publication(int idPublication, String fileName, InputStream publication, String extension) {
		super();
		IdPublication = idPublication;
		FileName = fileName;
		Publication = publication;
		Extension = extension;
	}



	public Publication(int idPublication, String titre, String description, String datePublication,
			String typePublication,String[] auteurs, int idPersonne, String fileName, InputStream publication,
			String extension) {
		super();
		IdPublication = idPublication;
		Titre = titre;
		Description = description;
		DatePublication = datePublication;
		TypePublication = typePublication;
		IdPersonne = idPersonne;
		FileName = fileName;
		Publication = publication;
		Auteurs  = auteurs;
		Extension = extension;
	}



	public Publication(String fileName, Blob publication, String fileType, String extension) {
		super();
		FileName = fileName;
		blob = publication;
		FileType = fileType;
		Extension = extension;
	}



	public Publication(String titre, String description, String datePublication,String[] auteurs, 
			String typePublication, int idPersonne) {
		super();
		Titre = titre;
		Description = description;
		Auteurs = auteurs;
		DatePublication = datePublication;
		TypePublication = typePublication;
		IdPersonne = idPersonne;
	}
	public Publication(int id,String titre, String description, String datePublication,String[] auteurs, 
			String typePublication, int idPersonne) {
		super();
		IdPublication = id;
		Titre = titre;
		Description = description;
		Auteurs = auteurs;
		DatePublication = datePublication;
		TypePublication = typePublication;
		IdPersonne = idPersonne;
	}


	public Publication(String titre, String description, String date,String typePublication,String[] auteurs, int idPersonne,
			String fileName, InputStream publication, String extension) {
		super();
		Titre = titre;
		Description = description;
		TypePublication = typePublication;
		IdPersonne = idPersonne;
		FileName = fileName;
		Publication = publication;
		Extension = extension;
		Auteurs = auteurs;
		DatePublication = date;
	}



	public String getFileName() {
		return FileName;
	}



	public void setFileName(String fileName) {
		FileName = fileName;
	}



	public String getExtension() {
		return Extension;
	}



	public void setExtension(String extension) {
		Extension = extension;
	}



	public String getFileType() {
		return FileType;
	}



	public void setFileType(String fileType) {
		FileType = fileType;
	}



	public Publication(int idPublication, String titre, String description,
			String datePublication, String typePublication, int idPersonne,String filetype) {
		super();
		IdPublication = idPublication;
		Titre = titre;
		Description = description;
		
		DatePublication = datePublication;
		TypePublication = typePublication;
		IdPersonne = idPersonne;
		FileType = filetype;
	}
	
	

	public Publication(String titre, String description, String typePublication, int idPersonne, InputStream publication,String Type) {
		super();
		Titre = titre;
		Description = description;
		TypePublication = typePublication;
		IdPersonne = idPersonne;
		Publication = publication;
		FileType = Type;
	}



	public InputStream getPublication() {
		return Publication;
	}



	public void setPublication(InputStream publication) {
		Publication = publication;
	}



	public Publication(int idPublication, String titre, String description, String lienPublication,
			String datePublication, String typePublication, String nom, String prenom) {
		super();
		IdPublication = idPublication;
		Titre = titre;
		Description = description;
		
		DatePublication = datePublication;
		TypePublication = typePublication;
		FileName = nom;
		
	}



	public Publication(int idPublication, String titre, String description, String filename,
			String datePublication, String typePublication, int idPersonne, String extension, String prenom) {
		super();
		IdPublication = idPublication;
		Titre = titre;
		Description = description;
		FileName = filename;
		DatePublication = datePublication;
		TypePublication = typePublication;
		IdPersonne = idPersonne;
		Extension = extension;
		
	}



	public int getIdPublication() {
		return IdPublication;
	}

	public void setIdPublication(int idPublication) {
		IdPublication = idPublication;
	}

	public String getTitre() {
		return Titre;
	}

	public void setTitre(String titre) {
		Titre = titre;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	

	public String getDatePublication() {
		return DatePublication;
	}

	public void setDatePublication(String datePublication) {
		DatePublication = datePublication;
	}

	public String getTypePublication() {
		return TypePublication;
	}

	public void setTypePublication(String typePublication) {
		TypePublication = typePublication;
	}

	public int getIdPersonne() {
		return IdPersonne;
	}

	public void setIdPersonne(int idPersonne) {
		IdPersonne = idPersonne;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Id "+IdPublication+" Titre "+ Titre +" Description "+Description+" Date "+DatePublication+" Type "+TypePublication+""+" IdPersonne "+IdPersonne+" Nom "+FileName+" Prenom "
				+"\n" ;
	}



	public String getNom() {
		return FileName;
	}



	public void setNom(String nom) {
		FileName = nom;
	}




	
	
	
	
	
	
	
	

}
