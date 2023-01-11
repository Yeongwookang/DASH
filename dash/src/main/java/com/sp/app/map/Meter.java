package com.sp.app.map;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

// 컬렉션(테이블명)
@Document(collection = "500m")
public class Meter {
	@Id
	private String id;
	private List<List<List<List<Double>>>> coordinates;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public List<List<List<List<Double>>>> getCoordinates() {
		return coordinates;
	}
	public void setCoordinates(List<List<List<List<Double>>>> coordinates) {
		this.coordinates = coordinates;
	}

}
