//create sequence member_seq_wid;
//CREATE TABLE member (
//       mid          			VARCHAR2(30)  PRIMARY KEY,
//       mname               	VARCHAR2(30) NOT NULL,
//       pw         				VARCHAR2(30) NOT NULL,
//       email                	VARCHAR2(50) NOT NULL,
//       wid						NUMBER(5) NOT NULL
//);
package coin.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;

import coin.model.dto.MemberDTO;
import coin.model.util.DBUtil;

public class MemberDAO {
	static ResourceBundle sql = DBUtil.getResourceBundle();

	public static boolean addMember(MemberDTO member) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql.getString("addMember"));
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPw());
			pstmt.setString(4, member.getEmail());
			int result = pstmt.executeUpdate();
			
			pstmt = con.prepareStatement(sql.getString("addWallet1"));
			pstmt.setString(1, member.getId());
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(sql.getString("addWallet2"));
			pstmt.setString(1, member.getId());
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(sql.getString("addWallet3"));
			pstmt.setString(1, member.getId());
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(sql.getString("addWallet4"));
			pstmt.setString(1, member.getId());
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(sql.getString("addWallet5"));
			pstmt.setString(1, member.getId());
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(sql.getString("addWallet6"));
			pstmt.setString(1, member.getId());
			pstmt.executeUpdate();
			
			if (result == 1) {
				return true;
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}

	// ����
	// ����� id�� �ֿ� ��� ���� �����ϱ�
	public static boolean updateMember(String memberId, String major) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement("update member set major=? where member_id=?");
			pstmt.setString(1, major);
			pstmt.setString(2, memberId);

			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}

	// ??? ����
	// sql - delete from member where member_id=?
	public static boolean deleteMember(String memberId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("delete from member where member_id=?");
			pstmt.setString(1, memberId);
			int result = pstmt.executeUpdate();
			if (result == 1) {
				return true;
			}
		} finally {
			DBUtil.close(con, pstmt);
		}
		return false;
	}

	// id�� �ش� ������� ��� ���� ��ȯ
	public static MemberDTO getMember(String memberId) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MemberDTO member = null;

		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql.getString("getMember"));
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				member = new MemberDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4));
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return member;
	}

	// ???��� ����� �˻��ؼ� ��ȯ
	// sql - select * from member
	public static ArrayList<MemberDTO> getAllMembers() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MemberDTO> list = null;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from member");
			rset = pstmt.executeQuery();

			list = new ArrayList<MemberDTO>();
			while (rset.next()) {
				list.add(new MemberDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4)));
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return list;
	}
}
