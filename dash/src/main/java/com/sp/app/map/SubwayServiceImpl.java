package com.sp.app.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("subway.subwayService")
public class SubwayServiceImpl implements SubwayService {
	@Autowired
	private SubwayMongoOperations subwayMongo;

	@Override
	public long dataCount() {
		long result = 0;
		try {
			result = subwayMongo.dataCount();
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Subway> listSubway() {
		List<Subway> list = null;

		try {
			list = subwayMongo.listSubway();
		} catch (Exception e) {
		}

		return list;
	}

	@Override
	public Subway readSubway(String name) {
		Subway dto = null;

		try {
			dto = subwayMongo.readSubway(name);
		} catch (Exception e) {
		}

		return dto;
	}
}
