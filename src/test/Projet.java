package test;

/**
 * @author marouane
 *
 */
public class Projet {
	
	private int IdProjet ;
	private String Theme ;
	private String Description ;
	private int IdEquipe ;
    private int Chef ;
    private  String NomEquipe;
    
    
    //Constructor
    
    
    
	public Projet(int idProjet, String theme, String description, int idEquipe) {
		super();
		IdProjet = idProjet;
		Theme = theme;
		Description = description;
		IdEquipe = idEquipe;
		
	}
	
	public Projet(int idProjet, String theme, String description, String NomEquipe) {
		super();
		IdProjet = idProjet;
		Theme = theme;
		Description = description;
		this.NomEquipe = NomEquipe;
		
	}
	

	public String getNomEquipe() {
		return NomEquipe;
	}

	public void setNomEquipe(String nomEquipe) {
		NomEquipe = nomEquipe;
	}

	public Projet() {
		
	}



	public Projet( String theme, String description, int idEquipe) {
		super();
		
		Theme = theme;
		Description = description;
		IdEquipe = idEquipe;
		
	}
	
	
	public Projet( String theme, String description, String NomEquipe) {
		super();
		
		Theme = theme;
		Description = description;
		this.NomEquipe=NomEquipe;
		
		
	}
	public Projet( int idprojet,String theme, String description) {
		super();
		IdProjet = idprojet;
		Theme = theme;
		Description = description;
		
		
	}
	
    //Getter ans Setter
    
	public int getIdProjet() {
		return IdProjet;
	}

	public void setIdProjet(int idProjet) {
		IdProjet = idProjet;
	}

	public String getTheme() {
		return Theme;
	}

	public void setTheme(String theme) {
		Theme = theme;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public int getIdEquipe() {
		return IdEquipe;
	}

	public void setIdEquipe(int idEquipe) {
		IdEquipe = idEquipe;
	}

	public int getChef() {
		return Chef;
	}

	public void setChef(int chef) {
		Chef = chef;
	}



	@Override
	public String toString() {
		return "Projet [IdProjet=" + IdProjet + ", Theme=" + Theme + ", Description=" + Description + "]";
	}
	
	
	
}
