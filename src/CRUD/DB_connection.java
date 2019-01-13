package CRUD;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB_connection {

    public static void main(String[] args){
        DB_connection db_connection = new DB_connection();
        System.out.println(db_connection.getConnection());

    }

    public Connection getConnection(){
        Connection connection = null;
       /* Statement statement = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;*/
        try {

            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root","nafi");


            // add to db
           // connection.prepareStatement("").executeUpdate();


            //read from db
          /*
          statement = connection.createStatement();
          resultSet  = statement.executeQuery("");
            while (resultSet.next()){
                // code
            }
            */



        }
        catch (Exception e){
            System.out.println(e);
        }
        return connection;
    }
}
