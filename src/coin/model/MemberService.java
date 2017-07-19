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
			throw new NotExistException("검색하는회원이 미 존재합니다.");
		}
	}
	public static boolean addMember(MemberDTO member) throws MessageException{
		boolean result = false;
		try{
			result = MemberDAO.addMember(member);
			MemberDAO.getMember(member.getId()).setWallet(new WalletDTO(member.getId(), getWalletCoin(member.getId())));
		}catch(SQLException s){
			throw new MessageException("이미 존재하는 ID입니다 다시 시도 하세요");
		}
		return result;
	}
	
	//회원 수정 메소드[MemberDAO의 updateMember()]
	public static boolean updateMember(String memberId, String major) throws SQLException, NotExistException{		
		notExistMember(memberId);
		boolean result = MemberDAO.updateMember(memberId, major);
		if(!result){
			throw new NotExistException("회원 정보 갱신 실패");
		}
		return result;
	}
	
	
	//회원 삭제 메소드[ MemberDAO.deleteMember()]
	public static boolean deleteMember(String memberId) throws SQLException, NotExistException{
		notExistMember(memberId);
		boolean result = MemberDAO.deleteMember(memberId);
		if(!result){
			throw new NotExistException("회원 정보 삭제 실패");
		}
		return result;
	}
	
	// id로 회원 조회
	public static MemberDTO getMember(String memberId) throws SQLException, NotExistException{
		MemberDTO member = MemberDAO.getMember(memberId);
		if(member == null){
			throw new NotExistException("검색하는 회원이 미 존재합니다.");
		}
		return member;
	}
	
	// 모든 회원 조회
	public static ArrayList<MemberDTO> getAllMembers() throws SQLException{
		return MemberDAO.getAllMembers();
	}
	
	// 모든 내코인 정보 조회
	public static ArrayList<WalletCoinDTO> getWalletCoin(String memberId) throws SQLException{
		return MemberDAO.getWalletCoin(memberId);
	}
	
	// 코인이름으로 내코인 정보 조회
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
	
	// 내 코인 정보 업데이트
	public static boolean updateCoin(String memberId, String cName, int amount, int price) throws SQLException, NotExistException{		
		boolean result = MemberDAO.updateCoin(memberId, cName, amount, price);
		if(!result){
			throw new NotExistException("코인 정보 수정 실패");
		}
		return result;
	}
}
