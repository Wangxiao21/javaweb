package njau.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "address")
public class Address  implements Serializable{
	private int id;
	private int userid;
	private String address;
	private String name;
	private String phone;

	public Address(){}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false,length=5)
	public int getId (){
		return id;
	}
	public void setId(int id){
		this.id=id;
	}
	@Column(name = "userid", unique = false, nullable = false,length=5)
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	@Column(name = "address", unique = false, nullable = false,length=50)
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Column(name = "name", unique = false, nullable = false,length=10)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name = "phone", unique = false, nullable = false,length=12)
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

}
