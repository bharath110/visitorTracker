package com.nousinfo.bean;


import java.util.Date;
import java.util.List;
import javax.persistence.*;


@Entity
@Table(name ="visitor")
public class Visitor {
    @Id
    @Column(name = "visitorId")
    @GeneratedValue
    private int id;

   	@Column(name = "name",nullable = false)
    private  String name;

    @Column(name = "mobile" ,nullable = false)
    private String mobile;


    @Column(name = "email")
    private String email;

    @Column(name = "fromPlace" ,nullable = false)
    private String fromPlace;

    @Column(name = "purpose" ,nullable = false)
    private String purpose;

    @Column(name = "meetingPerson" ,nullable = false)
    private String meetingPerson;

    @Column(name = "location" ,nullable = false)
    private String location;

    @Column(name = "active" ,nullable = true)
    private int active = 1;
    
   

    @Column(name = "checkInTime" )
    private Date checkInTime = new Date();
    
    @Column(name = "checkOutTime" ,nullable = true)
    private Date checkOutTime;
    
    @Column(name = "isCheckedOut" )
    private boolean isCheckedOut = false;
    
    
    @Lob
    @Column(name="visitorPic")
    private byte[] visitorPic;
    
  
	public boolean isCheckedOut() {
		return isCheckedOut;
	}

	public void setCheckedOut(boolean isCheckedOut) {
		this.isCheckedOut = isCheckedOut;
	}

	public byte[] getVisitorSign() {
		return visitorSign;
	}

    public String getFromPlace() {
		return fromPlace;
	}

	public void setFromPlace(String fromPlace) {
		this.fromPlace = fromPlace;
	}
	public void setVisitorSign(byte[] visitorSign) {
		this.visitorSign = visitorSign;
	}

	@Lob
    @Column(name="visitorSign")
    private byte[] visitorSign;


    public Date getCheckInTime() {
		return checkInTime;
	}

	public void setCheckInTime(Date checkInTime) {
		this.checkInTime = checkInTime;
	}

	public Date getCheckOutTime() {
		return checkOutTime;
	}

	public void setCheckOutTime(Date checkOutTime) {
		this.checkOutTime = checkOutTime;
	}

	public byte[] getVisitorPic() {
		return visitorPic;
	}

	public void setVisitorPic(byte[] visitorPic) {
		this.visitorPic = visitorPic;
	}

	@OneToMany(cascade = CascadeType.ALL)
    private List<Item> items;

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    @JoinTable(
            name = "visitorItem",
            joinColumns = @JoinColumn(name = "visitorId"),
            inverseJoinColumns = @JoinColumn(name = "itemId")
    )
    public List<Item> getItems() {
        return items;

    }

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

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

  

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getMeetingPerson() {
        return meetingPerson;
    }

    public void setMeetingPerson(String meetingPerson) {
        this.meetingPerson = meetingPerson;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
