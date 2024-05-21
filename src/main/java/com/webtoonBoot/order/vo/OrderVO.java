package com.webtoonBoot.order.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component("orderVO")
public class OrderVO {
	private int order_seq_num;
	private int order_id;
	private int goods_id;

	private String goods_title;
	private int goods_price;
	private String goods_fileName;
	private int order_goods_qty;
	private String delivery_state; 
	
	private String member_id;
	private String order_hp;
	private String receiver_name;
	private String receiver_hp1;
	private String delivery_address;
	private String pay_method;
	private String card_com_name;
	private String pay_order_hp_num;
	private String card_pay_month;
	
	private String pay_order_time;
	
	
	
	
}
