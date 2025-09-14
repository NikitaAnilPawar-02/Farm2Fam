package com.entity;

public class ProductDetails {
	private int productID;
	private String productName, productCategory, productStatus, photoName;
	private Double price;

	public ProductDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductDetails(String productName, String productCategory, Double price, String productStatus,
			String photoName) {
		super();
		this.productName = productName;
		this.productCategory = productCategory;
		this.price = price;
		this.productStatus = productStatus;
		this.photoName = photoName;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	@Override
	public String toString() {
		return "ProductDetails [productID=" + productID + ", productName=" + productName + ", productCategory="
				+ productCategory + ", price=" + price + ", productStatus=" + productStatus + ", photoName=" + photoName
				+ "]";
	}

}
