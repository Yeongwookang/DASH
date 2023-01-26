package com.sp.app.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("meter.meterService")
public class MeterServiceImpl implements MeterService {
	@Autowired
	private MeterMongoOperations meterMongo;

	@Override
	public List<M100_all_6months> M100_all_6months() {
		List<M100_all_6months> M100_all_6months = null;

		try {
			M100_all_6months = meterMongo.M100_all_6months();
		} catch (Exception e) {
		}

		return M100_all_6months;
	}

	@Override
	public List<M100_all_month> M100_all_month() {
		List<M100_all_month> M100_all_month = null;

		try {
			M100_all_month = meterMongo.M100_all_month();
		} catch (Exception e) {
		}

		return M100_all_month;
	}

	@Override
	public List<M100_all_quarter> M100_all_quarter() {
		List<M100_all_quarter> M100_all_quarter = null;

		try {
			M100_all_quarter = meterMongo.M100_all_quarter();
		} catch (Exception e) {
		}

		return M100_all_quarter;
	}

	@Override
	public List<M100_bike_6months> M100_bike_6months() {
		List<M100_bike_6months> M100_bike_6months = null;

		try {
			M100_bike_6months = meterMongo.M100_bike_6months();
		} catch (Exception e) {
		}

		return M100_bike_6months;
	}

	@Override
	public List<M100_bike_month> M100_bike_month() {
		List<M100_bike_month> M100_bike_month = null;

		try {
			M100_bike_month = meterMongo.M100_bike_month();
		} catch (Exception e) {
		}

		return M100_bike_month;
	}

	@Override
	public List<M100_bike_quarter> M100_bike_quarter() {
		List<M100_bike_quarter> M100_bike_quarter = null;

		try {
			M100_bike_quarter = meterMongo.M100_bike_quarter();
		} catch (Exception e) {
		}

		return M100_bike_quarter;
	}

	@Override
	public List<M100_people_6months> M100_people_6months() {
		List<M100_people_6months> M100_people_6months = null;

		try {
			M100_people_6months = meterMongo.M100_people_6months();
		} catch (Exception e) {
		}

		return M100_people_6months;
	}

	@Override
	public List<M100_people_month> M100_people_month() {
		List<M100_people_month> M100_people_month = null;

		try {
			M100_people_month = meterMongo.M100_people_month();
		} catch (Exception e) {
		}

		return M100_people_month;
	}

	@Override
	public List<M100_people_quarter> M100_people_quarter() {
		List<M100_people_quarter> M100_people_quarter = null;

		try {
			M100_people_quarter = meterMongo.M100_people_quarter();
		} catch (Exception e) {
		}

		return M100_people_quarter;
	}
	
	
	
	
	
	
	

	@Override
	public List<M300_all_6months> M300_all_6months() {
		List<M300_all_6months> M300_all_6months = null;

		try {
			M300_all_6months = meterMongo.M300_all_6months();
		} catch (Exception e) {
		}

		return M300_all_6months;
	}

	@Override
	public List<M300_all_month> M300_all_month() {
		List<M300_all_month> M300_all_month = null;

		try {
			M300_all_month = meterMongo.M300_all_month();
		} catch (Exception e) {
		}

		return M300_all_month;
	}

	@Override
	public List<M300_all_quarter> M300_all_quarter() {
		List<M300_all_quarter> M300_all_quarter = null;

		try {
			M300_all_quarter = meterMongo.M300_all_quarter();
		} catch (Exception e) {
		}

		return M300_all_quarter;
	}

	@Override
	public List<M300_bike_6months> M300_bike_6months() {
		List<M300_bike_6months> M300_bike_6months = null;

		try {
			M300_bike_6months = meterMongo.M300_bike_6months();
		} catch (Exception e) {
		}

		return M300_bike_6months;
	}

	@Override
	public List<M300_bike_month> M300_bike_month() {
		List<M300_bike_month> M300_bike_month = null;

		try {
			M300_bike_month = meterMongo.M300_bike_month();
		} catch (Exception e) {
		}

		return M300_bike_month;
	}

	@Override
	public List<M300_bike_quarter> M300_bike_quarter() {
		List<M300_bike_quarter> M300_bike_quarter = null;

		try {
			M300_bike_quarter = meterMongo.M300_bike_quarter();
		} catch (Exception e) {
		}

		return M300_bike_quarter;
	}

	@Override
	public List<M300_people_6months> M300_people_6months() {
		List<M300_people_6months> M300_people_6months = null;

		try {
			M300_people_6months = meterMongo.M300_people_6months();
		} catch (Exception e) {
		}

		return M300_people_6months;
	}

	@Override
	public List<M300_people_month> M300_people_month() {
		List<M300_people_month> M300_people_month = null;

		try {
			M300_people_month = meterMongo.M300_people_month();
		} catch (Exception e) {
		}

		return M300_people_month;
	}

	@Override
	public List<M300_people_quarter> M300_people_quarter() {
		List<M300_people_quarter> M300_people_quarter = null;

		try {
			M300_people_quarter = meterMongo.M300_people_quarter();
		} catch (Exception e) {
		}

		return M300_people_quarter;
	}
	
	
	
	
	

	@Override
	public List<M500_all_6months> M500_all_6months() {
		List<M500_all_6months> M500_all_6months = null;

		try {
			M500_all_6months = meterMongo.M500_all_6months();
		} catch (Exception e) {
		}

		return M500_all_6months;
	}

	@Override
	public List<M500_all_month> M500_all_month() {
		List<M500_all_month> M500_all_month = null;

		try {
			M500_all_month = meterMongo.M500_all_month();
		} catch (Exception e) {
		}

		return M500_all_month;
	}

	@Override
	public List<M500_all_quarter> M500_all_quarter() {
		List<M500_all_quarter> M500_all_quarter = null;

		try {
			M500_all_quarter = meterMongo.M500_all_quarter();
		} catch (Exception e) {
		}

		return M500_all_quarter;
	}

	@Override
	public List<M500_bike_6months> M500_bike_6months() {
		List<M500_bike_6months> M500_bike_6months = null;

		try {
			M500_bike_6months = meterMongo.M500_bike_6months();
		} catch (Exception e) {
		}

		return M500_bike_6months;
	}

	@Override
	public List<M500_bike_month> M500_bike_month() {
		List<M500_bike_month> M500_bike_month = null;

		try {
			M500_bike_month = meterMongo.M500_bike_month();
		} catch (Exception e) {
		}

		return M500_bike_month;
	}

	@Override
	public List<M500_bike_quarter> M500_bike_quarter() {
		List<M500_bike_quarter> M500_bike_quarter = null;

		try {
			M500_bike_quarter = meterMongo.M500_bike_quarter();
		} catch (Exception e) {
		}

		return M500_bike_quarter;
	}

	@Override
	public List<M500_people_6months> M500_people_6months() {
		List<M500_people_6months> M500_people_6months = null;

		try {
			M500_people_6months = meterMongo.M500_people_6months();
		} catch (Exception e) {
		}

		return M500_people_6months;
	}

	@Override
	public List<M500_people_month> M500_people_month() {
		List<M500_people_month> M500_people_month = null;

		try {
			M500_people_month = meterMongo.M500_people_month();
		} catch (Exception e) {
		}

		return M500_people_month;
	}

	@Override
	public List<M500_people_quarter> M500_people_quarter() {
		List<M500_people_quarter> M500_people_quarter = null;

		try {
			M500_people_quarter = meterMongo.M500_people_quarter();
		} catch (Exception e) {
		}

		return M500_people_quarter;
	}

	

}
