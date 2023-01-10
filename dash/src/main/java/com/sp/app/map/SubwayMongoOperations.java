
package com.sp.app.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

@Service("subway.subwayMongoOperations")
public class SubwayMongoOperations {
	@Autowired
	// private MongoTemplate mongo;
	private MongoOperations mongo;
	
	public long dataCount() {
		long result = 0;
		
		try {
			result = mongo.count(new Query(), Subway.class); // 조건, entityClass
			// result = mongo.count(query, "컬렉션명");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Subway> listScore() {
		List<Subway> list = null;
		
		try {
			list = mongo.findAll(Subway.class);
			
			//Query query = new Query();
			//query.with(Sort.by(Sort.Direction.DESC, "tot"));
			//list = mongo.find(query, Subway.class);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Subway readScore(String name) {
		Subway dto=null;
		
		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("name").is(name));
			dto = mongo.findOne(query, Subway.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
