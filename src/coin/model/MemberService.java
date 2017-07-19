package coin.model;

import java.sql.SQLException;
import java.util.ArrayList;

import coin.model.dto.MemberDTO;
import coin.model.dto.WalletCoinDTO;
import coin.model.dto.WalletDTO;
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
		try{
			result = MemberDAO.addMember(member);
			MemberDAO.getMember(member.getId()).setWallet(new WalletDTO(member.getId(), getWalletCoin(member.getId())));
		}catch(SQLException s){
			throw new MessageException("�̹� �����ϴ� ID�Դϴ� �ٽ� �õ� �ϼ���");
		}
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
	
	// id�� ȸ�� ��ȸ
	public static MemberDTO getMember(String memberId) throws SQLException, NotExistException{
		MemberDTO member = MemberDAO.getMember(memberId);
		if(member == null){
			throw new NotExistException("�˻��ϴ� ȸ���� �� �����մϴ�.");
		}
		return member;
	}
	
	// ��� ȸ�� ��ȸ
	public static ArrayList<MemberDTO> getAllMembers() throws SQLException{
		return MemberDAO.getAllMembers();
	}
	
	// ��� ������ ���� ��ȸ
	public static ArrayList<WalletCoinDTO> getWalletCoin(String memberId) throws SQLException{
		return MemberDAO.getWalletCoin(memberId);
	}
	
	// �����̸����� ������ ���� ��ȸ
	public static WalletCoinDTO getCoinInfo(String memberId, String coinName) throws SQLException{
		ArrayList<WalletCoinDTO> walletCoin = MemberDAO.getWalletCoin(memberId);
		WalletCoinDTO coinInfo = null;
		for(int i = 0; i<walletCoin.size() ; i++){
			coinInfo = walletCoin.get(i);
			if(coinInfo.getCoinName().equals(coinName)){
				return coinInfo;
			}
		}
		return coinInfo;
	}
	
	// �� ���� ���� ������Ʈ
	public static boolean updateCoin(String memberId, String cName, int amount, int price) throws SQLException, NotExistException{		
		boolean result = MemberDAO.updateCoin(memberId, cName, amount, price);
		if(!result){
			throw new NotExistException("���� ���� ���� ����");
		}
		return result;
	}
}
