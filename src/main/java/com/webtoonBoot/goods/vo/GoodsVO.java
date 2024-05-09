package com.webtoonBoot.goods.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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


}
