package njau.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "status")
public class Status  implements Serializable {
	private String orderid;
	private int now;
	private String submit;
	private String pay;
	private String accept;
	private String complete;
	private int jiange;
	
	public Status(){}
	@Id	
	@Column(name = "orderid", unique = true, nullable = false,length=15)
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	@Column(name = "now", unique = false, nullable = false,length=2)
	public int getNow() {
		return now;
	}	
	public void setNow(int now) {
		this.now = now;
	}
	@Column(name = "submit", unique = false,length=15)
	public String getSubmit() {
		return submit;
	}
	public void setSubmit(String submit) {
		this.submit = submit;
	}
	@Column(name = "pay", unique = false,length=15)
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	@Column(name = "accept", unique = false,length=15)
	public String getAccept() {
		return accept;
	}
	public void setAccept(String accept) {
		this.accept = accept;
	}
	@Column(name = "complete", unique = false,length=15)	
	public String getComplete() {
		return complete;
	}
	public void setComplete(String complete) {
		this.complete = complete;
	}
		
	@Column(name = "jiange", unique = false,length=5)
	public int getJiange() {
		return jiange;
	}
	public void setJiange(int jiange) {
		this.jiange = jiange;
	}
}
