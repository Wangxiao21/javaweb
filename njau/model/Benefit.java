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
@Table(name = "benefit")
public class Benefit implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int id;		
	private String context;	
	private String type;
	private int value;
	private Shop shop;
	
	public Benefit (){}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false,length=10)
	public int getId (){
		return id;
	}
	public void setId(int id){
		this.id=id;
	}
	@ManyToOne(cascade=CascadeType.ALL)           
    @JoinColumn(name="shopid") 
	public Shop getShop(){
		return shop;
	}
	public void setShop(Shop shop){
		this.shop=shop;
	}
	@Column(name = "context",length=60)
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	@Column(name = "type",length=30)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Column(name = "value",length=3)
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	
	
}
