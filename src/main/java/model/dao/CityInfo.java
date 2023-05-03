package model.dao;

import model.bean.Provinc;
import dbConnection.DBManager;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CityInfo {
    public List<Provinc> findByProvinceName(String province){
        ArrayList<Provinc> list=new ArrayList<Provinc>();

        DBManager db=new DBManager();
        String sql="select * from city where province='"+province+"'";
        System.out.println(sql);
        ResultSet rs=null;
        try {
            rs = db.executeQuery(sql);
            while(rs.next()){
                Provinc Pcity=new Provinc();
                Pcity.setCity(rs.getString("cityName"));
                list.add(Pcity);
            }
            rs.close();
            db.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
