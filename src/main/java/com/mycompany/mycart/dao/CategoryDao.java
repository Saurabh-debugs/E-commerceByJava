package com.mycompany.mycart.dao;


import com.mycompany.mycart.entities.Category;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class CategoryDao {

    private SessionFactory factory;
    private int catId;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    // Save the category to the database
    public int saveCategory(Category cat) {

        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int catId = (int) session.save(cat);
        tx.commit();
        session.close();

        return catId;

    }
    public List<Category> getCategories(){
        Session s = this.factory.openSession();
        Query Query = s.createQuery("from Category");
       List<Category> list =  Query.getResultList();
       return list;
    }
    public Category getCategoryById(int cid){
        Category cat = null;
        try {
            Session session = this.factory.openSession();
            cat = session.get(Category.class, cid);
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }
}
