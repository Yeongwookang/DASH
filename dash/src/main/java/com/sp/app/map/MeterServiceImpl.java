package com.sp.app.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("meter.meterService")
public class MeterServiceImpl implements MeterService {
	@Autowired
	private MeterMongoOperations meterMongo;

	@Override
	public long dataCount() {
		long result = 0;
		try {
			result = meterMongo.dataCount();
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Meter> listMeter() {
		List<Meter> list = null;

		try {
			list = meterMongo.listMeter();
		} catch (Exception e) {
		}

		return list;
	}

}
