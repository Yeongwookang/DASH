
package com.sp.app.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.stereotype.Service;

@Service("meter.meterMongoOperations")
public class MeterMongoOperations {
	@Autowired
	// private MongoTemplate mongo;
	private MongoOperations mongo;
	
	public List<M100_all_6months> M100_all_6months() {
		List<M100_all_6months> M100_all_6months = null;
		
		try {
			M100_all_6months = mongo.findAll(M100_all_6months.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M100_all_6months;
	}
	
	public List<M100_all_month> M100_all_month() {
		List<M100_all_month> M100_all_month = null;
		
		try {
			M100_all_month = mongo.findAll(M100_all_month.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M100_all_month;
	}
	
	public List<M100_all_quarter> M100_all_quarter() {
		List<M100_all_quarter> M100_all_quarter = null;
		
		try {
			M100_all_quarter = mongo.findAll(M100_all_quarter.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M100_all_quarter;
	}
	
	public List<M100_bike_6months> M100_bike_6months() {
		List<M100_bike_6months> M100_bike_6months = null;
		
		try {
			M100_bike_6months = mongo.findAll(M100_bike_6months.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M100_bike_6months;
	}
	
	public List<M100_bike_month> M100_bike_month() {
		List<M100_bike_month> M100_bike_month = null;
		
		try {
			M100_bike_month = mongo.findAll(M100_bike_month.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M100_bike_month;
	}
	
	public List<M100_bike_quarter> M100_bike_quarter() {
		List<M100_bike_quarter> M100_bike_quarter = null;
		
		try {
			M100_bike_quarter = mongo.findAll(M100_bike_quarter.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M100_bike_quarter;
	}
	
	public List<M100_people_6months> M100_people_6months() {
		List<M100_people_6months> M100_people_6months = null;
		
		try {
			M100_people_6months = mongo.findAll(M100_people_6months.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M100_people_6months;
	}
	
	public List<M100_people_month> M100_people_month() {
		List<M100_people_month> M100_people_month = null;
		
		try {
			M100_people_month = mongo.findAll(M100_people_month.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M100_people_month;
	}
	
	public List<M100_people_quarter> M100_people_quarter() {
		List<M100_people_quarter> M100_people_quarter = null;
		
		try {
			M100_people_quarter = mongo.findAll(M100_people_quarter.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M100_people_quarter;
	}
	
	
	
	
	public List<M300_all_6months> M300_all_6months() {
		List<M300_all_6months> M300_all_6months = null;
		
		try {
			M300_all_6months = mongo.findAll(M300_all_6months.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M300_all_6months;
	}
	
	public List<M300_all_month> M300_all_month() {
		List<M300_all_month> M300_all_month = null;
		
		try {
			M300_all_month = mongo.findAll(M300_all_month.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M300_all_month;
	}
	
	public List<M300_all_quarter> M300_all_quarter() {
		List<M300_all_quarter> M300_all_quarter = null;
		
		try {
			M300_all_quarter = mongo.findAll(M300_all_quarter.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M300_all_quarter;
	}
	
	public List<M300_bike_6months> M300_bike_6months() {
		List<M300_bike_6months> M300_bike_6months = null;
		
		try {
			M300_bike_6months = mongo.findAll(M300_bike_6months.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M300_bike_6months;
	}
	
	public List<M300_bike_month> M300_bike_month() {
		List<M300_bike_month> M300_bike_month = null;
		
		try {
			M300_bike_month = mongo.findAll(M300_bike_month.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M300_bike_month;
	}
	
	public List<M300_bike_quarter> M300_bike_quarter() {
		List<M300_bike_quarter> M300_bike_quarter = null;
		
		try {
			M300_bike_quarter = mongo.findAll(M300_bike_quarter.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M300_bike_quarter;
	}
	
	public List<M300_people_6months> M300_people_6months() {
		List<M300_people_6months> M300_people_6months = null;
		
		try {
			M300_people_6months = mongo.findAll(M300_people_6months.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M300_people_6months;
	}
	
	public List<M300_people_month> M300_people_month() {
		List<M300_people_month> M300_people_month = null;
		
		try {
			M300_people_month = mongo.findAll(M300_people_month.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M300_people_month;
	}
	
	public List<M300_people_quarter> M300_people_quarter() {
		List<M300_people_quarter> M300_people_quarter = null;
		
		try {
			M300_people_quarter = mongo.findAll(M300_people_quarter.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M300_people_quarter;
	}
	
	
	
	
	public List<M500_all_6months> M500_all_6months() {
		List<M500_all_6months> M500_all_6months = null;
		
		try {
			M500_all_6months = mongo.findAll(M500_all_6months.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M500_all_6months;
	}
	
	public List<M500_all_month> M500_all_month() {
		List<M500_all_month> M500_all_month = null;
		
		try {
			M500_all_month = mongo.findAll(M500_all_month.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M500_all_month;
	}
	
	public List<M500_all_quarter> M500_all_quarter() {
		List<M500_all_quarter> M500_all_quarter = null;
		
		try {
			M500_all_quarter = mongo.findAll(M500_all_quarter.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M500_all_quarter;
	}
	
	public List<M500_bike_6months> M500_bike_6months() {
		List<M500_bike_6months> M500_bike_6months = null;
		
		try {
			M500_bike_6months = mongo.findAll(M500_bike_6months.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M500_bike_6months;
	}
	
	public List<M500_bike_month> M500_bike_month() {
		List<M500_bike_month> M500_bike_month = null;
		
		try {
			M500_bike_month = mongo.findAll(M500_bike_month.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M500_bike_month;
	}
	
	public List<M500_bike_quarter> M500_bike_quarter() {
		List<M500_bike_quarter> M500_bike_quarter = null;
		
		try {
			M500_bike_quarter = mongo.findAll(M500_bike_quarter.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M500_bike_quarter;
	}
	
	public List<M500_people_6months> M500_people_6months() {
		List<M500_people_6months> M500_people_6months = null;
		
		try {
			M500_people_6months = mongo.findAll(M500_people_6months.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M500_people_6months;
	}
	
	public List<M500_people_month> M500_people_month() {
		List<M500_people_month> M500_people_month = null;
		
		try {
			M500_people_month = mongo.findAll(M500_people_month.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M500_people_month;
	}
	
	public List<M500_people_quarter> M500_people_quarter() {
		List<M500_people_quarter> M500_people_quarter = null;
		
		try {
			M500_people_quarter = mongo.findAll(M500_people_quarter.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return M500_people_quarter;
	}
	

}
