package com.sp.app.map;

import java.util.List;

public interface FilterService {
	public List<All_6months> list_all_6months();
	public List<All_month> list_all_month();
	public List<All_quarter> list_all_quarter();
	
	public List<People_6months> list_people_6months();
	public List<People_month> list_people_month();
	public List<People_quarter> list_people_quarter();
}
