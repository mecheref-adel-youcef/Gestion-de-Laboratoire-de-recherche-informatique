package CRUD;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Select {
    public static void main(String[] args){

        ResultSet resultSet = query("Select count(distinct ndecomm) AS nbCommande from commande,client where email ='g.meddour@esi-sba.dz';");
        if(resultSet!=null)
            System.out.println("not null");
        else
            System.out.println("null");

    }


    public static ResultSet query(String q){
        DB_connection db_connection = new DB_connection();
        Connection connection = db_connection.getConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            //read from db

          statement = connection.createStatement();
          resultSet  = statement.executeQuery(q);
            return  resultSet;
        }
        catch (Exception e){
            return  resultSet;

        }


    }
}
