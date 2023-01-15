
package com.sp.app.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

@Service("meter.meterMongoOperations")
public class MeterMongoOperations {
	@Autowired
	// private MongoTemplate mongo;
	private MongoOperations mongo;
	
	public long dataCount() {
		long result = 0;
		
		try {
			result = mongo.count(new Query(), Meter.class); // 조건, entityClass
			// result = mongo.count(query, "컬렉션명");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Meter> listMeter() {
		List<Meter> list_100 = null;
		
		try {
			list_100 = mongo.findAll(Meter.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list_100;
	}
	
	public List<Meter2> listMeter2() {
		List<Meter2> list_300 = null;
		
		try {
			list_300 = mongo.findAll(Meter2.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list_300;
	}
	
	public List<Meter3> listMeter3() {
		List<Meter3> list_500 = null;
		
		try {
			list_500 = mongo.findAll(Meter3.class);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list_500;
	}

}
