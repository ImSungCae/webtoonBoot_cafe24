package com.webtoonBoot.goods.vo;

import java.sql.Date;

public class GoodsVO {
	private int goods_id;
	private String goods_sort;
	private String goods_title;
	private String goods_writer_intro;
	private int goods_price;
	private String goods_delivery_price;
	private Date goods_delivery_date;
	private Date goods_credate;
	private String goods_fileName;
	private String goods_status;
	private String goods_creDate;

	public GoodsVO() {
	}

	public String getGoods_status() {
		return goods_status;
	}

	public void setGoods_status(String goods_status) {
		this.goods_status = goods_status;
	}

	public int getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}

	public String getGoods_sort() {
		return goods_sort;
	}

	public void setGoods_sort(String goods_sort) {
		this.goods_sort = goods_sort;
	}

	public String getGoods_title() {
		return goods_title;
	}

	public void setGoods_title(String goods_title) {
		this.goods_title = goods_title;
	}

	public String getGoods_writer_intro() {
		return goods_writer_intro;
	}

	public void setGoods_writer_intro(String goods_writer_intro) {
		this.goods_writer_intro = goods_writer_intro;
	}

	public int getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}

	public String getGoods_delivery_price() {
		return goods_delivery_price;
	}

	public void setGoods_delivery_price(String goods_delivery_price) {
		this.goods_delivery_price = goods_delivery_price;
	}

	public Date getGoods_delivery_date() {
		return goods_delivery_date;
	}

	public void setGoods_delivery_date(Date goods_delivery_date) {
		this.goods_delivery_date = goods_delivery_date;
	}

	public Date getGoods_credate() {
		return goods_credate;
	}

	public void setGoods_credate(Date goods_credate) {
		this.goods_credate = goods_credate;
	}

	public String getGoods_fileName() {
		return goods_fileName;
	}

	public void setGoods_fileName(String goods_fileName) {
		this.goods_fileName = goods_fileName;
	}

	public String getGoods_creDate() {
		return goods_creDate;
	}

	public void setGoods_creDate(String goods_creDate) {
		this.goods_creDate = goods_creDate;
	}

}
