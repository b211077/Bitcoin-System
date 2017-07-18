package coin.model;

import java.sql.SQLException;
import java.util.ArrayList;

import coin.exception.NotExistException;
import coin.model.dto.BtcDTO;

public class CoinService {

	public static void notExistProbono(String date) throws NotExistException, SQLException{
		BtcDTO btc = BtcDAO.getBtc(date);
		if(btc == null){
			throw new NotExistException("�˻����� ��ɱ�� ������ �����ϴ�.");
		}
	}
	
	// ��� ��Ʈ���� ���� ��ȯ
	public static ArrayList<BtcDTO> getAllBtc() throws SQLException{
		return BtcDAO.getAllBtc();
	}
	
	// ��¥�� ��Ʈ���� �˻�
	public static BtcDTO getBtc(String date) throws SQLException, NotExistException{
		BtcDTO btc = BtcDAO.getBtc(date);
		if(btc == null){
			throw new NotExistException("�˻��Ͻ� ��ɱ�� ������ �����ϴ�.");
		}
		return btc;
	}
	
	// ���ο� ��Ʈ���� ����
	public static boolean addBtc(BtcDTO btc) throws SQLException{
		return BtcDAO.addBtc(btc);
	}
}
