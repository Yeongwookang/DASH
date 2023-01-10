package com.sp.app.map;

import java.util.List;

public interface SubwayService {
	public long dataCount();
	public List<Subway> listSubway();
	public Subway readSubway(String name);
}
