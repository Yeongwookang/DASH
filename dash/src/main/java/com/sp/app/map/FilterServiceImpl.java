package com.sp.app.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("filter.filterService")
public class FilterServiceImpl implements FilterService {
	@Autowired
	private FilterMongoOperations filterMongo;

	@Override
	public List<All_month> list_all_month() {
		List<All_month> list_all_month = null;

		try {
			list_all_month = filterMongo.all_month();
		} catch (Exception e) {
		}

		return list_all_month;
	}

	@Override
	public List<All_quarter> list_all_quarter() {
		List<All_quarter> list_all_quarter = null;

		try {
			list_all_quarter = filterMongo.all_quarter();
		} catch (Exception e) {
		}

		return list_all_quarter;
	}

	@Override
	public List<All_6months> list_all_6months() {
		List<All_6months> list_all_6months = null;

		try {
			list_all_6months = filterMongo.all_6months();
		} catch (Exception e) {
		}

		return list_all_6months;
	}

	@Override
	public List<People_month> list_people_month() {
		List<People_month> list_people_month = null;

		try {
			list_people_month = filterMongo.people_month();
		} catch (Exception e) {
		}

		return list_people_month;
	}

	@Override
	public List<People_quarter> list_people_quarter() {
		List<People_quarter> list_people_quarter = null;

		try {
			list_people_quarter = filterMongo.people_quarter();
		} catch (Exception e) {
		}

		return list_people_quarter;
	}
	
	@Override
	public List<People_6months> list_people_6months() {
		List<People_6months> list_people_6months = null;

		try {
			list_people_6months = filterMongo.people_6months();
		} catch (Exception e) {
		}

		return list_people_6months;
	}

}
