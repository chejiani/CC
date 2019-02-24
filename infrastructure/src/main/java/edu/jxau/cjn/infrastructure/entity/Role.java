package edu.jxau.cjn.infrastructure.entity;

import javax.persistence.*;

import java.io.Serializable;

@Entity
@Table(name = "JAUX_ROLE")
public class Role implements Serializable {
    
    private static final long serialVersionUID = 0L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(length = 15)
    private String name;

    @Column(length = 20)
    private String description;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
