package com.sp.app.marker;

import java.util.List;


public interface MarkerService {
	public List<Marker> listMarker();
	public List<Marker> listMarker(String keyword);
}
