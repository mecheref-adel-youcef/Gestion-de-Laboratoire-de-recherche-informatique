package javaBean;
 
public class VerifyProvidedPassword {
    public static void main(String[] args)
    {
        // User provided password to validate
        String providedPassword = "";
                
        // Encrypted and Base64 encoded password read from database
        String securePassword = "IKCUuWiPpHWQhXrXuuHH3YF7WIJRiPP/qz1YUydZKQo=";
        
        // Salt value stored in database 
        String salt = "kGBZT7nnjsXT11eFP1CVZa760NZZNE";
        
        boolean passwordMatch = PasswordUtils.verifyUserPassword(providedPassword, securePassword, salt);
        
        if(passwordMatch) 
        {
            System.out.println("Provided user password " + providedPassword + " is correct.");
        } else {
            System.out.println("Provided password is incorrect");
        }

    }
}