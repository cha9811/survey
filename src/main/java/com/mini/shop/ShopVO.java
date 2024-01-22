package com.mini.shop;

public class ShopVO {

	private int goods_id;
	private int goods_price;
	private String goods_content;
	private String goods_img;
	private String goods_brand;
	
	
	
	
	

	@Override
	public String toString() {
		return "ShopVO [goods_id=" + goods_id + ", goods_price=" + goods_price + ", goods_content=" + goods_content
				+ ", goods_img=" + goods_img + ", goods_brand=" + goods_brand + "]";
	}
	
	public String getGoods_brand() {
		return goods_brand;
	}
	public void setGoods_brand(String goods_brand) {
		this.goods_brand = goods_brand;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_content() {
		return goods_content;
	}
	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}
	public String getGoods_img() {
		return goods_img;
	}
	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}
	
	
}
