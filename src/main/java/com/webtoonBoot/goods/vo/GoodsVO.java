package com.webtoonBoot.goods.vo;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GoodsVO {
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int goods_id;
	private String goods_sort;
	private String goods_title;
	private String goods_writer_intro;
	private int goods_price;
	private String goods_delivery_price;
	private Date goods_delivery_date;
	private Date goods_creDate;
	private String goods_fileName;
	private String goods_status;

	public GoodsVO() {
	}


}
