package com.travel.seoul.service;

import java.util.List;


public interface ApiService {
	String attractionAPI(String urlStr, String select, String value, String numOfRows, String apiType, String status_dt);
}

