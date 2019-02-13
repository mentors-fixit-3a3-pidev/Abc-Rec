/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.sql.Date;

/**
 *
 * @author Ahmed Ben Cherifa
 */
public class Reclamation {
    
    private int id_reclamation;
    private int id_service;
    private int id_utilisateur;
    private String descripption_reclamation;
    private String type; //produit ou prestation
    private Date date_reclamation;
    private String reponse;
    private String statut="en cours";

    public Reclamation( int id_service, int id_utilisateur, String descripption_reclamation, String type, String reponse) {
        this.id_service = id_service;
        this.id_utilisateur = id_utilisateur;
        this.descripption_reclamation = descripption_reclamation;
        this.type = type;
        this.reponse = reponse;
    }
   public Reclamation() {
    }

    public int getId_reclamation() {
        return id_reclamation;
    }

    public int getId_service() {
        return id_service;
    }

    public int getId_utilisateur() {
        return id_utilisateur;
    }

    public String getDescripption_reclamation() {
        return descripption_reclamation;
    }

    public String getType() {
        return type;
    }

    public Date getDate_reclamation() {
        return date_reclamation;
    }

    public String getReponse() {
        return reponse;
    }

    public String getStatut() {
        return statut;
    }

    public void setId_reclamation(int id_reclamation) {
        this.id_reclamation = id_reclamation;
    }

    public void setId_service(int id_service) {
        this.id_service = id_service;
    }

    public void setId_utilisateur(int id_utilisateur) {
        this.id_utilisateur = id_utilisateur;
    }

    public void setDescripption_reclamation(String descripption_reclamation) {
        this.descripption_reclamation = descripption_reclamation;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setDate_reclamation(Date date_reclamation) {
        this.date_reclamation = date_reclamation;
    }

    public void setReponse(String reponse) {
        this.reponse = reponse;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

    @Override
    public String toString() {
        return "Reclamation{" + "id_reclamation=" + id_reclamation + ", id_service=" + id_service + ", id_utilisateur=" + id_utilisateur + ", descripption_reclamation=" + descripption_reclamation + ", type=" + type + ", date_reclamation=" + date_reclamation + ", reponse=" + reponse + ", statut=" + statut + '}';
    }
    
    

   
}
