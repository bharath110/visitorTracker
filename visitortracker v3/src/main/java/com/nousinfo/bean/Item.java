package com.nousinfo.bean;

import javax.persistence.*;


@Entity
@Table(name ="item")
public class Item {
    @Id
    @Column(name = "itemId")
    @GeneratedValue
    private int id;



    @Column(name = "name")
    private  String iName;

    @Column(name = "barCode")
    private String barCode;



    @Column(name = "description")
    private String description;


    @ManyToOne(cascade = CascadeType.ALL,targetEntity = Item.class)
    private Visitor visitor;

    public Visitor getVisitor() {
        return visitor;
    }

    public void setVisitor(Visitor visitor) {
        this.visitor = visitor;
    }

    public String getBarCode() {
        return barCode;
    }

    public void setBarCode(String barCode) {
        this.barCode = barCode;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getiName() {
		return iName;
	}

	public void setiName(String iName) {
		this.iName = iName;
	}

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
