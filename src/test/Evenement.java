package test;

public class Evenement {
	
	private int IdEvenement ;
	private String DateDebut ;
	private String DateFin ;
	private String Lieu ;
	private String Titre ;
	private String  Photo ; /*lien du photo*/
	private String Description ; 
	private float latitude ;
	private float longitude ;
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	public Evenement(int idEvenement, String dateDebut, String dateFin, String lieu, String titre, 
			String description, float latitude, float longitude) {
		super();
		IdEvenement = idEvenement;
		DateDebut = dateDebut;
		DateFin = dateFin;
		Lieu = lieu;
		Titre = titre;
		//Photo = photo;
		Description = description;
		this.latitude = latitude;
		this.longitude = longitude;
	}






	public Evenement(String titre,String dateDebut, String dateFin, String description,String lieu,float latitude,
			float longitude) {
		super();
		DateDebut = dateDebut;
		DateFin = dateFin;
		Lieu = lieu;
		Titre = titre;
		Description = description;
		this.latitude = latitude;
		this.longitude = longitude;
	}






	public int getIdEvenement() {
		return IdEvenement;
	}
	public void setIdEvenement(int idEvenement) {
		IdEvenement = idEvenement;
	}
	public String getDateDebut() {
		return DateDebut;
	}
	public void setDateDebut(String dateDebut) {
		DateDebut = dateDebut;
	}
	public String getDateFin() {
		return DateFin;
	}
	public void setDateFin(String dateFin) {
		DateFin = dateFin;
	}
	public String getLieu() {
		return Lieu;
	}
	public void setLieu(String lieu) {
		Lieu = lieu;
	}
	public String getTitre() {
		return Titre;
	}
	public void setTitre(String titre) {
		Titre = titre;
	}
	public String getPhoto() {
		return Photo;
	}
	public void setPhoto(String photo) {
		Photo = photo;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
	public float getLongitude() {
		return longitude;
	}
	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}
	
	

}
