// Name: Prasad Khedekar  G# - G00973357

package swe642.assgn4.jdbc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import swe642.assgn4.jdbc.db.ConnectionFactory;
import swe642.assgn4.jdbc.db.ConnectionUtils;
import swe642.assgn4.jdbc.beans.StudentBean;
import swe642.assgn4.jdbc.beans.DataBean;

public class StudentDao {

	public StudentDao() {}

	private static ConnectionFactory cf = new ConnectionFactory();
	private static Connection conn = cf.createConnection();

	public StudentBean findStudent(int studId) {

		StudentBean student = new StudentBean();

		try {
			String sql = "Select * from Student where studId = ?";

			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setInt(1, studId);

			ResultSet rs = pstm.executeQuery();

			while (rs.next()){
				int studentId = rs.getInt(1);
				String studName = rs.getString(2);
				String studAddr = rs.getString(3);
				String studCity = rs.getString(4);
				String studState = rs.getString(5);
				int studZip = rs.getInt(6);
				String studTel = rs.getString(7);
				String studEmail = rs.getString(8);
				String studUrl = rs.getString(9);
				String studDate = rs.getString(10);
				String studLiked = rs.getString(11);
				String studInterest = rs.getString(12);
				String gradMonth = rs.getString(13);
				int gradYear = rs.getInt(14);
				String comments = rs.getString(15);
				String studReco = rs.getString(16);
				String studData = rs.getString(17);
				student.setStudId(studentId);
				student.setStudName(studName);
				student.setStudAddr(studAddr);
				student.setStudCity(studCity);
				student.setStudState(studState);
				student.setStudZip(studZip);
				student.setStudTel(studTel);
				student.setStudEmail(studEmail);
				student.setStudUrl(studUrl);
				student.setStudDate(studDate);
				student.setStudLiked(studLiked);
				student.setStudInterest(studInterest);
				student.setGradMonth(gradMonth);
				student.setGradYear(gradYear);
				student.setComments(comments);
				student.setStudReco(studReco);
				student.setStudData(studData);
			}
		} catch (Exception e){
			System.out.println("Error");
			e.printStackTrace();
		}

		return student;
	}

	public void insertStudent(StudentBean student) {
		String sql = "insert into Student values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement pstm = conn.prepareStatement(sql);

			pstm.setInt(1, student.getStudId());
			pstm.setString(2, student.getStudName());
			pstm.setString(3, student.getStudAddr());
			pstm.setString(4, student.getStudCity());
			pstm.setString(5, student.getStudState());
			pstm.setInt(6, student.getStudZip());
			pstm.setString(7, student.getStudTel());
			pstm.setString(8, student.getStudEmail());
			pstm.setString(9, student.getStudUrl());
			pstm.setString(10, student.getStudDate());
			pstm.setString(11, student.getStudLiked());
			pstm.setString(12, student.getStudInterest());
			pstm.setString(13, student.getGradMonth());
			pstm.setInt(14, student.getGradYear());
			pstm.setString(15, student.getComments());
			pstm.setString(16, student.getStudReco());
			pstm.setString(17, student.getStudData());

			pstm.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Error");
			e.printStackTrace();
		}
	}
}
