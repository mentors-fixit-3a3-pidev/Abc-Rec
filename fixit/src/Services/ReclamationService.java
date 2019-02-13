/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import Entities.Reclamation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Utils.MyDB;
import java.text.DateFormat;
import java.util.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author Ahmed Ben Cherifa
 */
public class ReclamationService {
    
    private Connection connection;
    private PreparedStatement ps;
    
    public ReclamationService() 
    {
        connection= MyDB.getInstance().getConnexion();
    }
    
    

    public void ajouterreclamation(Reclamation r) 
    {
    PreparedStatement ps = null;
       
                String statut="en cours";

        String req = "INSERT INTO reclamation (Id_utilisateur,Id_service,description_reclamation,reponse,statut,type,date_reclamation,id_reclamation)"
                + "VALUES (?,?,?,?,?,?,now(),null)";
        try {
                ps = connection.prepareStatement(req);
                ps.setInt(1,  r.getId_utilisateur());
                ps.setInt(2,  r.getId_service());
                ps.setString(3,  r.getDescripption_reclamation());
                ps.setString(4,  r.getReponse());
                ps.setString(5,  statut);
                ps.setString(6,  r.getType());
                
                ps.executeUpdate();
                System.out.println("Ajouter avec succes.");
            } catch (SQLException ex) 
            {
            ex.printStackTrace();
            }    
    }
    
    
    public void traiterreclamation(int id) 
    {

    try {
            PreparedStatement ps = connection.prepareStatement("update  reclamation   set statut = 'traitee' where id_reclamation = ?");
                        ps.setInt(1,id);

          
            ps.executeUpdate();
            System.out.println("\nModification avec succes.");
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }     
    }

    public void supprimerreclamation(Reclamation r) 
    {
        try {
            PreparedStatement pst = connection.prepareStatement("DELETE FROM reclamation WHERE id_reclamation=?");
            pst.setInt(1, r.getId_reclamation());
            pst.executeUpdate();   
            
            } 
        catch (SQLException ex) 
            {
            ex.getLocalizedMessage();
            }       
    }
   public void afficherLesReclamations()
   {
        ArrayList<Reclamation> resultat = new ArrayList<>();
        
        try {
            Statement st = connection.createStatement();
            ResultSet res= st.executeQuery("select * from reclamation");
            while(res.next()){
                Reclamation r = new Reclamation();
                r.setId_reclamation(res.getInt("id_reclamation"));
                r.setId_utilisateur(res.getInt(2));
                r.setDescripption_reclamation(res.getString(3));
                r.setId_service(res.getInt(4));
                r.setDate_reclamation(res.getDate(5));
                r.setReponse(res.getString(6));
                r.setType(res.getString(7));
                r.setStatut(res.getString(8));
                resultat.add(r);
            }
            resultat.forEach((t) -> {
                System.out.println(t);
            });
            
        } catch (SQLException ex) {
            Logger.getLogger(ReclamationService.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
   
       public ArrayList<Reclamation> recherche(Date d){
        ArrayList<Reclamation> resultat = new ArrayList<>();
        
        try {
            Statement st = connection.createStatement();
            DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
            String dd=df.format(d);
            ResultSet res= st.executeQuery("select * from reclamation where date_reclamation='"+dd+"'");
            while(res.next()){
                Reclamation r = new Reclamation();
                r.setId_reclamation(res.getInt("id_reclamation"));
                r.setId_utilisateur(res.getInt(2));
                r.setDescripption_reclamation(res.getString(3));
                r.setId_service(res.getInt(4));
                r.setDate_reclamation(res.getDate(5));
                r.setReponse(res.getString(6));
                r.setType(res.getString(7));
                r.setStatut(res.getString(8));
                resultat.add(r);
                
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ReclamationService.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return resultat;
    }


    
    
}
