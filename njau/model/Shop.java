package njau.model;
import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import javax.persistence.Table;

@Entity
@Table(name = "shop")
public class Shop implements Serializable {
	private static final long serialVersionUID = 6177417450707400228L; 
	private int id;
	private String address;
	private String tags;
	private String name;
	private String password;
	private String telephone;
	private String userphone;
	private float star;
	private int speed;
	private String avatar;
	private String opentime;
	private String license;
	private int status;
	private String tips;
	private int delivercost;
	private int mincost;
	private Set<Food> foods;
	private Set<Benefit> benefits;
	public Shop (){}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false,length=5)
	public int getId (){
		return id;
	}
	public void setId(int id){
		this.id=id;
	}

    @OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="shop")    
    public Set<Food> getFoods() {
        return foods;
    }
    public void setFoods(Set<Food> foods) {
        this.foods=foods;
    }
    @OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="shop")
    public Set<Benefit> getBenefits() {
		return benefits;
	}
	public void setBenefits(Set<Benefit> benefits) {
		this.benefits = benefits;
	}

	@Column(name = "address", unique = false,length=150)
	public String getAddress (){
		return address;
	}
	public void setAddress(String address){
		this.address=address;
	}	
	@Column(name = "name", unique = true, nullable = false,length=60)
	public String getName (){
		return name;
	}
	public void setName(String name){
		this.name=name;
	}

	@Column(name = "password", unique = false, nullable = false,length=20)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(name = "star", unique = false, length=3)
	public float getStar() {
		return star;
	}
	public void setStar(float star) {
		this.star = star;
	}
	@Column(name = "speed", unique = false,length=5)
	public int getSpeed() {
		return speed;
	}
	public void setSpeed(int speed) {
		this.speed = speed;
	}

	
	@Column(name = "opentime", unique = false,length=20)
	public String getOpentime() {
		return opentime;
	}
	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}

	
	@Column(name = "status", unique = false,length=2)
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	@Column(name = "tags", unique = false,length=50)
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}

	@Column(name = "telephone", unique = false,nullable=false,length=15)
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	@Column(name = "userphone", unique = false,nullable=false,length=15)
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	@Column(name = "avatar", unique = false,length=20)
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@Column(name = "license", unique = false,length=20)
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}

	@Column(name = "tips", unique = false,length=300)
	public String getTips() {
		return tips;
	}
	public void setTips(String tips) {
		this.tips = tips;
	}

	@Column(name = "delivercost", unique = false,length=5)
	public int getDelivercost() {
		return delivercost;
	}
	public void setDelivercost(int delivercost) {
		this.delivercost = delivercost;
	}

	@Column(name = "mincost", unique = false,length=5)
	public int getMincost() {
		return mincost;
	}
	public void setMincost(int mincost) {
		this.mincost = mincost;
	}
}