package com.sp.app.map;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

// 컬렉션(테이블명)
@Document(collection = "meter")
public class Meter {
	@Id
	private String ID;
	private String subwayName;
	private String line;
	private String lat;
	private String lon;
	private String[] coordinates;
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getSubwayName() {
		return subwayName;
	}
	public void setSubwayName(String subwayName) {
		this.subwayName = subwayName;
	}
	public String getLine() {
		return line;
	}
	public void setLine(String line) {
		this.line = line;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String[] getCoordinates() {
		return coordinates;
	}
	public void setCoordinates(String[] coordinates) {
		this.coordinates = coordinates;
	}
	
}
