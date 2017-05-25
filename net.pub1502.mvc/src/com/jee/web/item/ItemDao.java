package com.jee.web.item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jee.web.global.Command;
import com.jee.web.global.DBmanager;


public class ItemDao {
	private static ItemDao instance ;
	private Connection cn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public static ItemDao getInstance(){
		if(instance == null){
			instance = new ItemDao();
		}
		return instance;
	}
	private ItemDao (){
		cn = DBmanager.getConnection();
	}
	
	public void insertItem(ItemVo ivo){
		try {
			String sql = "insert into item";
			sql += "\n (item_no, item_name, price, pd_date, capa, alcol, description, pd_org, sale_type, dc_rate)";
			sql += "\n values";
			sql += "(seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			
			pst = cn.prepareStatement(sql);
			pst.setString(1, ivo.getImgName());
			pst.setInt(2, ivo.getPrice());
			pst.setString(3, ivo.getPdDate());
			pst.setInt(4, ivo.getCapa());
			pst.setInt(5, ivo.getAlcol());
			pst.setString(6, ivo.getDescription());
			pst.setString(7, ivo.getPdOrg());
			pst.setString(8, ivo.getSaleType());
			pst.setInt(9, ivo.getDcRate());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public List<ItemVo> getItemList(){
		List<ItemVo> list = new ArrayList<ItemVo>();
		try {
			String sql = "select * from item";
			st = cn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				ItemVo ivo = new ItemVo();
				ivo.setAlcol(rs.getInt("alcol"));
				ivo.setCapa(rs.getInt("capa"));
				
				ivo.setDcRate(rs.getInt("dc_rate"));
				ivo.setDescription(rs.getString("description"));
				
				ivo.setItemName(rs.getString("item_name"));
				ivo.setItemNO(rs.getInt("item_no"));
				ivo.setPdDate(rs.getString("pd_date"));
				list.add(ivo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int getTotalCount(){
		int count=0;
		try {
			String sql = "select count(*) as count from item";
			st = cn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()){
				count = rs.getInt("count");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return count;
	}
	public ItemVo getOneItemByID(Command command){
		ItemVo ivo = new ItemVo();
		try {
			String sql = "select * from item where item_no ="+command.getKeyword();
			st = cn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()){
				ivo.setItemNO(rs.getInt("item_no"));
				ivo.setItemName(rs.getString("item_name"));
				ivo.setPrice(rs.getInt("price"));
				ivo.setPdDate(rs.getString("pd_date"));
				ivo.setCapa(rs.getInt("capa"));
				ivo.setAlcol(rs.getInt("alcol"));
				ivo.setDescription(rs.getString("description"));
				ivo.setPdOrg(rs.getString("pd_org"));
				ivo.setSaleType(rs.getString("sale_type"));
				ivo.setDcRate(rs.getInt("dc_rate"));
			
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ivo;
	}
	public List<ItemVo> getItemSearch(Command command){
		List<ItemVo> list = new ArrayList<ItemVo>();
		ItemVo ivo = new ItemVo();
		try {
			String sql = "select * from item ";
			sql += "\n where ? = ?";
			pst = cn.prepareStatement(sql);
			pst.setString(1, command.getKeyField());
			pst.setString(2, command.getKeyword());
			rs = pst.executeQuery();
			while(rs.next()){
				ivo.setItemNO(rs.getInt("item_no"));
				ivo.setItemName(rs.getString("item_name"));
				ivo.setPrice(rs.getInt("price"));
				ivo.setPdDate(rs.getString("pd_date"));
				ivo.setCapa(rs.getInt("capa"));
				ivo.setAlcol(rs.getInt("alcol"));
				ivo.setDescription(rs.getString("description"));
				ivo.setPdOrg(rs.getString("pd_org"));
				ivo.setSaleType(rs.getString("sale_type"));
				ivo.setDcRate(rs.getInt("dc_rate"));
			
				list.add(ivo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int getSearchCount(Command command){
		int count = 0;
		try {
			String sql = "select count(*) as count from item where ? = ?";
			pst = cn.prepareStatement(sql);
			pst.setString(1, command.getKeyField());
			pst.setString(2, command.getKeyword());
			rs = pst.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
}
