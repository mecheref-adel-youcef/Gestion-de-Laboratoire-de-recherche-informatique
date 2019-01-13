package CRUD;

import java.sql.Connection;

public class Update {

    public static void query(String q){
        DB_connection db_connection = new DB_connection();
        Connection connection = db_connection.getConnection();


        try {
            // add to db
            connection.prepareStatement(q).executeUpdate();
        }
        catch (Exception e){

        }


    }
}

