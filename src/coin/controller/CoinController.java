package coin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coin.model.CoinService;
import coin.model.dto.BtcDTO;

public class CoinController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String command = request.getParameter("command");
		try{
			if(command.equals("btcAll")){					// ��� ��Ʈ���� ���� �˻�
				btcAll(request, response);
			}else if(command.equals("btc")){			// ��¥�� ��Ʈ���� �˻�
				btc(request, response);
			}else if(command.equals("btcInsert")){	// ��Ʈ���� �߰� ���
				btcInsert(request, response);
			}
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
			request.getRequestDispatcher("showError.jsp").forward(request, response);
			s.printStackTrace();
		}
	}
	
	// ��� ��Ʈ���� �˻�
	public void btcAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			request.setAttribute("btcAll", CoinService.getAllBtc());
			url = "coinList.jsp";
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	// ��¥�� ���� ��Ʈ���� �˻� 
	public void btc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			request.setAttribute("btc", CoinService.getBtc(request.getParameter("btcDay")));
			url = "btcDetail.jsp";
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	

	// ��Ʈ���� ������ ����
	protected void btcInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		
		String date = request.getParameter("date");
		int lastPrice = request.getParameter("lastPrice");
		int volume = request.getParameter("volume");
		int eid = request.getParameter("eid");
		
		BtcDTO btc = new BtcDTO(date, lastPrice, volume, eid);
		try{
			boolean result = CoinService.addBtc(btc);
			if(result){
				request.setAttribute("btc", btc);
				request.setAttribute("successMsg", "���� �Ϸ�");
				url = "btcDetail.jsp";
			}else{
				request.setAttribute("errorMsg", "�ٽ� �õ��ϼ���");
			}
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
