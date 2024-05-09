package com.webtoonBoot.goods.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ImageFileVO {
	private int goods_id;
	private int image_id;
	private String fileName;
	private String fileType;
	private String reg_id;
	
	public ImageFileVO() {
	}

	
}
