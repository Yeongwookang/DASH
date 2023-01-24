
package com.sp.app.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.stereotype.Service;

@Service("filter.filterMongoOperations")
public class FilterMongoOperations {
	@Autowired
	// private MongoTemplate mongo;
	private MongoOperations mongo;
	
	public List<All_6months> all_6months() {
		List<All_6months> list_all_6months = null;
		
		try {
			list_all_6months = mongo.findAll(All_6months.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list_all_6months;
	}
	
	public List<All_month> all_month() {
		List<All_month> all_month = null;
		
		try {
			all_month = mongo.findAll(All_month.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return all_month;
	}
	
	public List<All_quarter> all_quarter() {
		List<All_quarter> all_quarter = null;
		
		try {
			all_quarter = mongo.findAll(All_quarter.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return all_quarter;
	}
	
	public List<People_6months> people_6months() {
		List<People_6months> people_6months = null;
		
		try {
			people_6months = mongo.findAll(People_6months.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return people_6months;
	}
	
	public List<People_month> people_month() {
		List<People_month> people_month = null;
		
		try {
			people_month = mongo.findAll(People_month.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return people_month;
	}
	
	public List<People_quarter> people_quarter() {
		List<People_quarter> people_quarter = null;
		
		try {
			people_quarter = mongo.findAll(People_quarter.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return people_quarter;
	}
	
	public List<BikeCount_6months> bikeCount_6months() {
		List<BikeCount_6months> bikeCount_6months = null;
		
		try {
			bikeCount_6months = mongo.findAll(BikeCount_6months.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bikeCount_6months;
	}
	
	public List<BikeCount_month> bikeCount_month() {
		List<BikeCount_month> bikeCount_month = null;
		
		try {
			bikeCount_month = mongo.findAll(BikeCount_month.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bikeCount_month;
	}
	
	public List<BikeCount_quarter> bikeCount_quarter() {
		List<BikeCount_quarter> bikeCount_quarter = null;
		
		try {
			bikeCount_quarter = mongo.findAll(BikeCount_quarter.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bikeCount_quarter;
	}
	

}
