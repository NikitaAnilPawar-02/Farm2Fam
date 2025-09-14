package com.DAO;

import java.util.*;
import com.entity.ProductDetails;

public interface ProductDAO {
	public boolean addproducts(ProductDetails p);

	public List<ProductDetails> getAllProduct();

	public ProductDetails getProductById(int id);

	public boolean updateEditProducts(ProductDetails p);

	public boolean deleteProducts(int id);

	public List<ProductDetails> getNewVegetables();

	public List<ProductDetails> getNewFruits();

	public List<ProductDetails> getAllVegetables();

	public List<ProductDetails> getAllFruits();

	public List<ProductDetails> getProductBySearch(String ch);

}
