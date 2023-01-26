package com.sp.app.map;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

// 컬렉션(테이블명)
@Document(collection = "300m_all_month")
public class M300_all_month {
	@Id
	private String _id;
	private String type;
	private Object properties;
	private Object geometry;
	public String get_id() {
		return _id;
	}
	public void set_id(String _id) {
		this._id = _id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Object getProperties() {
		return properties;
	}
	public void setProperties(Object properties) {
		this.properties = properties;
	}
	public Object getGeometry() {
		return geometry;
	}
	public void setGeometry(Object geometry) {
		this.geometry = geometry;
	}
	

}
