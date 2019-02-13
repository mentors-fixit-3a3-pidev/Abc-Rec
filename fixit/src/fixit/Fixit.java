/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fixit;

import Services.ReclamationService;
import Entities.Reclamation;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Utils.MyDB;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 *
 * @author Ahmed Ben Cherifa
 */
public class Fixit {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            // TODO code application logic here
            
            Reclamation r1 = new Reclamation(11, 25, "jjjj", "yy", "response");
            Reclamation r2 = new Reclamation(24, 86, "karriimmm", "uhr", "no response");

            ReclamationService rs = new ReclamationService();
            //rs.ajouterreclamation(r2);
            // rs.traiterreclamation(3);
            // rs.supprimerreclamation(r1);
            
            /////////////------
            SimpleDateFormat sdfSource = new SimpleDateFormat(
                    "yyyy-MM-dd");

            // parse the string into Date object
            Date date =  sdfSource.parse("2019-02-13");
            
            System.out.println("\nAfficher toutes les reclamaions:");
            rs.afficherLesReclamations();
            
            System.out.println("\nRecherche par date 2019-02-13");
            rs.recherche(date).forEach((t) -> {System.out.println(t);});
            
        } catch (ParseException ex) {
            Logger.getLogger(Fixit.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    

}
