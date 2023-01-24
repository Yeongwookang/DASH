package com.sp.app.map;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

// 컬렉션(테이블명)
@Document(collection = "bikeCount_6months")
public class BikeCount_6months {
	@Id
	private String _id;
	private String name;
	private String line;
	private String lat;
	private String lon;
	private String addr;
	private String month;
	private String station_id;
	private String total_count;
	private String total_min;
	private String total_km;
	public String get_id() {
		return _id;
	}
	public void set_id(String _id) {
		this._id = _id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getStation_id() {
		return station_id;
	}
	public void setStation_id(String station_id) {
		this.station_id = station_id;
	}
	public String getTotal_count() {
		return total_count;
	}
	public void setTotal_count(String total_count) {
		this.total_count = total_count;
	}
	public String getTotal_min() {
		return total_min;
	}
	public void setTotal_min(String total_min) {
		this.total_min = total_min;
	}
	public String getTotal_km() {
		return total_km;
	}
	public void setTotal_km(String total_km) {
		this.total_km = total_km;
	}
	
	
}
