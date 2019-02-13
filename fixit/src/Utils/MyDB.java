/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author bhk
 */
public class MyDB {

    String url = "jdbc:mysql://127.0.0.1:3306/fixit";
    String login= "root";
    String password="";
    private Connection connexion;
    private static MyDB instance;
    public MyDB() 
    {
        try {        
            connexion = DriverManager
                    .getConnection(url, login, password);
            System.out.println("Connexion etablie!");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public Connection getConnexion() 
    {
        return connexion;
    }
    
    public static MyDB getInstance()
    {
        if(instance ==null)
            instance =new MyDB();    
       
        return instance;
    }
    
    
}
