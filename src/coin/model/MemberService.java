package coin.model;

import java.sql.SQLException;
import java.util.ArrayList;

import coin.model.dto.MemberDTO;
import member.exception.MessageException;
import member.exception.NotExistException;


public class MemberService {

	//Member - CRUD
	public static void notExistMember(String memberId) throws NotExistException, SQLException{
		MemberDTO member = MemberDAO.getMember(memberId);
		if(member == null){
			throw new NotExistException("�˻��ϴ�ȸ���� �� �����մϴ�.");
		}
	}
	public static boolean addMember(MemberDTO member) throws MessageException{
		boolean result = false;
	//	try{
			result = MemberDAO.addMember(member);
		/*}catch(SQLException s){
			throw new MessageException("�̹� �����ϴ� ID�Դϴ� �ٽ� �õ� �ϼ���");
		}*/
		return result;
	}
	
	//ȸ�� ���� �޼ҵ�[MemberDAO�� updateMember()]
	public static boolean updateMember(String memberId, String major) throws SQLException, NotExistException{		
		notExistMember(memberId);
		boolean result = MemberDAO.updateMember(memberId, major);
		if(!result){
			throw new NotExistException("ȸ�� ���� ���� ����");
		}
		return result;
	}
	
	
	//ȸ�� ���� �޼ҵ�[ MemberDAO.deleteMember()]
	public static boolean deleteMember(String memberId) throws SQLException, NotExistException{
		notExistMember(memberId);
		boolean result = MemberDAO.deleteMember(memberId);
		if(!result){
			throw new NotExistException("ȸ�� ���� ���� ����");
		}
		return result;
	}
	
	public static MemberDTO getMember(String memberId) throws SQLException, NotExistException{
		MemberDTO member = MemberDAO.getMember(memberId);
		if(member == null){
			throw new NotExistException("�˻��ϴ� ȸ���� �� �����մϴ�.");
		}
		return member;
	}
	
	public static ArrayList<MemberDTO> getAllMembers() throws SQLException{
		return MemberDAO.getAllMembers();
	}
}
