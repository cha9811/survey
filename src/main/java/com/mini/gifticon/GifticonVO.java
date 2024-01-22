package com.mini.gifticon;

public class GifticonVO {

	private int gifticon_id;
//	private String gifticon_name;
	private String goods_content;
	private String gifticon_img;
	private int member_id;
	private String date;

	public int getGifticon_id() {
		return gifticon_id;
	}

	public void setGifticon_id(int gifticon_id) {
		this.gifticon_id = gifticon_id;
	}

	public String getGifticon_img() {
		return gifticon_img;
	}

	public void setGifticon_img(String gifticon_img) {
		this.gifticon_img = gifticon_img;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "GifticonVO [gifticon_id=" + gifticon_id + ", goods_content=" + goods_content + ", gifticon_img="
				+ gifticon_img + ", member_id=" + member_id + ", date=" + date + "]";
	}

	public String getGoods_content() {
		return goods_content;
	}

	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}



	
	
}
