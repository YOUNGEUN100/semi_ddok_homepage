package com.example.mini.dao;

import java.util.HashMap;

public interface SmartMarketService {
	//상품 조회
	HashMap<String, Object> searchSmartMarketList(HashMap<String, Object> map) throws Exception;
}
