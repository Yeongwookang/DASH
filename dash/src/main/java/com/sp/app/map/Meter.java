package com.sp.app.map;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

// 컬렉션(테이블명)
@Document(collection = "100m")
public class Meter {
	@Id
	private String _id;
	private Object row;
	
	public String getId() {
		return _id;
	}
	public void setId(String _id) {
		this._id = _id;
	}
	public Object getRow() {
		return row;
	}
	public void setRow(Object row) {
		this.row = row;
	}
	
	
	
	

}
