package model.dao;

import model.bean.studentinfo;
import dbConnection.DBManager;
import dbConnection.StringUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Studentinformation {
    public ArrayList<studentinfo> query(studentinfo student)
    {
        ArrayList<studentinfo> list=new ArrayList<studentinfo>();

        DBManager  db=new DBManager();
        String sql="select * from studentinfo where 1=1 ";
        if(!StringUtil.isEmpty(student.getStudentId())){
            sql+=" and studentid = '"+student.getStudentId()+"'";
        }
        if(!StringUtil.isEmpty(student.getStudentName())){
            sql+=" and sname like '%"+student.getStudentName()+"%'";
        }
        if(!StringUtil.isEmpty(student.getGender())){
            sql+=" and gender = '"+student.getGender()+"'";
        }
        if(!StringUtil.isEmpty(student.getFavorite())){
            sql+=" and favorite like '%"+student.getFavorite()+"%'";
        }
        if(!StringUtil.isEmpty(student.getBirth())){
            sql+=" and birth = '"+student.getBirth()+"'";
        }

        System.out.println(sql);

        try {
            ResultSet rs=db.executeQuery(sql);
            while(rs.next())
            {
                studentinfo s=new studentinfo();
                s.setStudentId(rs.getString("studentid"));
                s.setStudentName(rs.getString("sname"));
                s.setGender(rs.getString("gender"));
                s.setBirth(rs.getString("birth"));
                s.setFavorite(rs.getString("favorite"));
                s.setOldname(rs.getString("oldname"));
                s.setStudentsf(rs.getString("studentsf"));
                s.setNation(rs.getString("nation"));
                s.setContry(rs.getString("contry"));
                s.setOcity(rs.getString("ocity"));
                s.setNcity(rs.getString("ncity"));
                s.setSchool(rs.getString("school"));
                s.setHeight(rs.getString("height"));
                s.setFrom(rs.getString("from"));
                s.setHealth(rs.getString("health"));
                s.setRed(rs.getString("red"));
                s.setWeight(rs.getString("weight"));
                list.add(s);
            }
            rs.close();
            db.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalRows(){
        DBManager  db=new DBManager();
        String sql="select * from studentinfo";
        try {
            ResultSet rs=db.executeQuery(sql);
            //rs.last();
            int totalRows=rs.getRow();
            rs.close();
            db.close();
            return totalRows;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return (Integer) null;
    }

    public ArrayList<studentinfo> getAdminByPage(int page,int pageSize)
    {
        ArrayList<studentinfo> list=new ArrayList<studentinfo>();
        DBManager db=new DBManager();
        int totalPage=(int)Math.ceil(1.0*getTotalRows()/pageSize);
        if(page<1){
            page=1;
        }
        if(page>=totalPage) page=(int)totalPage;
        int offset=(page-1)*pageSize;
        String sql="select * from studentinfo limit "+offset+","+pageSize;
        System.out.println(sql);
        try {
            ResultSet rs=db.executeQuery(sql);
            while(rs.next())
            {
                studentinfo s=new studentinfo();
                s.setStudentId(rs.getString("studentid"));
                s.setStudentName(rs.getString("sname"));
                s.setGender(rs.getString("gender"));
                s.setBirth(rs.getString("birth"));
                s.setFavorite(rs.getString("favorite"));
                list.add(s);
            }
            rs.close();
            db.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }System.out.println(list);
        return list;
    }

    public boolean updateinfo(studentinfo student){
        boolean ret=true;

        DBManager  db=new DBManager();
        String sql="update studentinfo set ";
        sql+=" sname='"+student.getStudentName()+"',";
        sql+=" gender='"+student.getGender()+"',";
        sql+=" birth='"+student.getBirth()+"',";
        sql+=" favorite='"+student.getFavorite()+"',";
        sql+=" oldname='"+student.getOldname()+"',";
        sql+=" studentsf='"+student.getStudentsf()+"',";
        sql+=" nation='"+student.getNation()+"',";
        sql+=" contry='"+student.getContry()+"',";
        sql+=" ocity='"+student.getOcity()+"',";
        sql+=" ncity='"+student.getNcity()+"',";
        sql+=" school='"+student.getSchool()+"',";
        sql+=" height='"+student.getHeight()+"',";
        sql+=" health='"+student.getHealth()+"',";
        sql+=" red='"+student.getRed()+"',";
        sql+=" weight='"+student.getWeight()+"',";
        sql+=" where studentid='"+student.getStudentId()+"'";

        System.out.println(sql);

        try {
            int iCount=db.executeUpdate(sql);
            if (iCount>0)
                ret=true;
            db.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return ret;
    }

    public int deleteStudent(String ids){
        int iCount=0;
        /*
         *
         */
        DBManager  db=new DBManager();
        String sql1="delete from student where studentid in("+ids+")";
        String sql2="delete from studentinfo where studentid in("+ids+")";
        System.out.println(sql1);

        try {
            iCount=db.executeUpdate(sql1)+db.executeUpdate(sql2);
            db.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return iCount;
    }
}
