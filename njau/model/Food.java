package njau.model;
import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "food")
public class Food implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int id;
	private String type;	
	private String name;
	private float price;	
	private int reserve;
	private String avatar;
	private Shop shop;
	
	public Food (){}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false,length=5)
	public int getId (){
		return id;
	}
	public void setId(int id){
		this.id=id;
	}
	
	@Column(name = "name", unique = false, nullable = false,length=30)
	public String getName (){
		return name;
	}
	public void setName(String name){
		this.name=name;
	}
	@Column(name = "price", unique = false, nullable = false,length=5)	
	public float getPrice (){
		return price;
	}
	public void setPrice(float price){
		this.price=price;
	}

	@ManyToOne(cascade=CascadeType.ALL)           
    @JoinColumn(name="shopid") 
	public Shop getShop (){
		return shop;
	}
	public void setShop(Shop shop){
		this.shop=shop;
	}
	@Column(name = "type", unique = false,length=80)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Column(name = "reserve", unique = false,length=10)
	public int getReserve() {
		return reserve;
	}
	public void setReserve(int reserve) {
		this.reserve = reserve;
	}
	@Column(name = "avatar", unique = false,length=20)
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	
}