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
		List<Meter> list_100 = null;

		try {
			list_100 = meterMongo.listMeter();
		} catch (Exception e) {
		}

		return list_100;
	}

	@Override
	public List<Meter2> listMeter2() {
		List<Meter2> list_300 = null;

		try {
			list_300 = meterMongo.listMeter2();
		} catch (Exception e) {
		}

		return list_300;
	}

	@Override
	public List<Meter3> listMeter3() {
		List<Meter3> list_500 = null;

		try {
			list_500 = meterMongo.listMeter3();
		} catch (Exception e) {
		}

		return list_500;
	}

}
