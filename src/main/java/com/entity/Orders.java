package com.entity;

public class Orders {
	private int productID, userID,quantity;
	private String order_id, userName, email, fulladd, productName, paymentType;
	private Double price, total_price, sub_total;
	private Long phnno;

	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFulladd() {
		return fulladd;
	}

	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getTotal_price() {
		return total_price;
	}

	public void setTotal_price(Double total_price) {
		this.total_price = total_price;
	}

	public Double getSub_total() {
		return sub_total;
	}

	public void setSub_total(Double sub_total) {
		this.sub_total = sub_total;
	}

	public Long getPhnno() {
		return phnno;
	}

	public void setPhnno(Long phnno) {
		this.phnno = phnno;
	}

	@Override
	public String toString() {
		return "Orders [productID=" + productID + ", userID=" + userID + ", quantity=" + quantity + ", order_id="
				+ order_id + ", userName=" + userName + ", email=" + email + ", fulladd=" + fulladd + ", productName="
				+ productName + ", paymentType=" + paymentType + ", price=" + price + ", total_price=" + total_price
				+ ", sub_total=" + sub_total + ", phnno=" + phnno + "]";
	}

	
}
