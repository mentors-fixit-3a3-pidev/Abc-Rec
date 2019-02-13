/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.sql.Date;
import java.util.Calendar;


/**
 *
 * @author Ahmed Ben Cherifa
 */
public class Contact {
   
    private int id;
    private String sujet;
    private String contenu;
    private String nom;
    private String prenom;
    private String numtelephone;
    private String email;
    private String reponse;
    private String statut  ="en cours";
    private Date datereclamation;

    public Contact() {
    }

    public Contact(int id, String sujet, String contenu, String nom, String prenom, String numtelephone, String email, String reponse,String statut, Date datereclamation) {
        this.id = id;
        this.sujet = sujet;
        this.contenu = contenu;
        this.nom = nom;
        this.prenom = prenom;
        this.numtelephone = numtelephone;
        this.email = email;
        this.reponse = reponse;
        this.statut = statut;
        this.datereclamation = datereclamation;
    }

    public int getId() {
        return id;
    }

    public String getSujet() {
        return sujet;
    }

    public String getContenu() {
        return contenu;
    }

    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getNumtelephone() {
        return numtelephone;
    }

    public String getEmail() {
        return email;
    }

    public String getReponse() {
        return reponse;
    }

    public String getStatut() {
        return statut;
    }

    public Date getDatereclamation() {
        return datereclamation;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setSujet(String sujet) {
        this.sujet = sujet;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public void setNumtelephone(String numtelephone) {
        this.numtelephone = numtelephone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setReponse(String reponse) {
        this.reponse = reponse;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

    public void setDatereclamation(Date datereclamation) {
        this.datereclamation = datereclamation;
    }

    @Override
    public String toString() {
        return "Contact{" + "id=" + id + ", sujet=" + sujet + ", contenu=" + contenu + ", nom=" + nom + ", prenom=" + prenom + ", numtelephone=" + numtelephone + ", email=" + email + ", reponse=" + reponse + ", statut=" + statut + ", datereclamation=" + datereclamation + '}';
    }
    
    
    
    
    
}
