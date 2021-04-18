
package com.mycompany.mycart.dao;

import com.mycompany.mycart.entities.User;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
//import org.hibernate.


public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    // get user by email and password---
   public User getuserByEmailAndPassword(String email,String password){
       Session session = null;
       User user = null;
       try {
         
          String query = "from User where userEmail =: e and userPassword=: p";
    
          session =  this.factory.openSession();
          Query q = session.createQuery(query);
          q.setParameter("e", email);
          q.setParameter("p", password);
              //  user = (User) q.getResultList();
      
          
          user = (User) q.getSingleResult();
        session.close();   
       } catch (Exception e) {
           e.printStackTrace();
       }
       
           
        return user;
   } 
    public String getPasswordfromEmailId (String email){
        
         Session session = null;
      // User user = null;
      String user_1 = "";
       try {
         
  
          String query1 = "from User select userPassword where userEmail =: e";
          session =  this.factory.openSession();
          Query q = session.createQuery(query1);
       
          q.setParameter("e", email);
          
              //  user = (User) q.getResultList();
      
          
       //   user = (User) q.getSingleResult();
        user_1 = (String) q.getSingleResult();
        session.close();   
       } catch (Exception e) {
           e.printStackTrace();
       }
       
           
        return user_1;
    }
    
}
/*<h1>Number of Product is <%= list.size()%></h1>
                <%
                    for (Product product : list) {
                        out.println(product.getpPhoto() + "<br>");
                        out.println(product.getpName() + "<br><hr>");
                        out.println(product.getpPrice() + "<br><hr>");
                        out.println(product.getpDesc() + "<br><hr>");
                    }
                %>  */