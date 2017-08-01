package njau.model;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User implements Serializable {	
	
	private static final long serialVersionUID = 1L;
	private String phone;
	private String password;
	private String mail;
	private String address;	
	private String nickname;
	private String sex;
	private String avatar;
	private String favor;

	public User (){}
	@Id
	@Column(name = "phone", unique = true, nullable = false,length=15)
	public String getPhone (){
		return phone;
	}
	public void setPhone(String phone){
		this.phone=phone;
	}

	@Column(name = "password", unique = false, nullable = false,length=20)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(name = "mail", unique = true,length=30)
	public String getMail (){
		return mail;
	}	
	public void setMail(String mail){
		this.mail=mail;
	}
	@Column(name = "nickname", unique = false,length=36)
	public String getNickname (){
		return nickname;
	}
	public void setNickname(String name){
		this.nickname=name;
	}
	
	@Column(name = "sex", unique = false,length=2)
	public String getSex (){
		return sex;
	}
	public void setSex(String sex){
		this.sex=sex;
	}
	
	@Column(name = "address", unique = false,length=200)
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Column(name = "avatar", unique = false,length=20)
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	@Column(name = "favor", unique = false,length=100)
	public String getFavor() {
		return favor;
	}
	public void setFavor(String favor) {
		this.favor = favor;
	}
	
}