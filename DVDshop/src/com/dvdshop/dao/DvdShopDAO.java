package com.dvdshop.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.dvdshop.vo.DvdInfo;
import com.dvdshop.vo.MemberVO;
import com.ibatis.sqlmap.client.SqlMapClient;

import iba.MySqlMapClient;

public class DvdShopDAO {
	
	SqlMapClient smc;
	
	public DvdShopDAO() {
		smc = MySqlMapClient.getSqlMapInstance();
	}
	
	public List<DvdInfo> mainMovie() {
		
		List<DvdInfo> list=null;
		try {
		
			 list = smc.queryForList("dvd.mainMovie");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
		
	}
	
	public List<DvdInfo> genreMovie(Map<String, String> map) {
		List<DvdInfo> list=null;
		try {
			list = smc.queryForList("dvd.genreMovie",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return list;
	}
	
	public boolean memberJoin (MemberVO vo) {
		
		try {
			smc.insert("dvd.memberJoin", vo);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public String memberLogin(String id) {
		String pass = null;
		try {
			pass = (String) smc.queryForObject("dvd.memberLogin", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pass;
	}
	
	public DvdInfo  dvdDetail(String detail) {
		
		DvdInfo info=null;
		try {
			info = (DvdInfo) smc.queryForObject("dvd.dvdDetail", detail);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return info;
	}
	
	public boolean dvdRental(Map<String, String>map) {
		try {
			smc.insert("dvd.dvdRental",map);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean dvdStock(String code) {
		
		try {
			smc.update("dvd.dvdStock",code);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
}
