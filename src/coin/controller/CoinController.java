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
		System.out.println("----------  -------");
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
		String d = request.getParameter("data");
		String[] data = d.split(",");
		String date = null;
		int price, volume, eid;
		
		try{
			for (int i = 0; i < data.length; i++) {
				date = data[i].split("/")[0];
				price = Integer.parseInt(data[i].split("/")[1]);
				volume = Integer.parseInt(data[i].split("/")[2]);
				eid = Integer.parseInt(data[i].split("/")[3]);
				BtcDTO btc = new BtcDTO(date, price, volume, eid);
				boolean result = CoinService.addBtc(btc);
				
				if(result){
					request.setAttribute("btc", btc);
					request.setAttribute("successMsg", "���� �Ϸ�");
					//url = "btcDetail.jsp";
				}else{
					request.setAttribute("errorMsg", "�ٽ� �õ��ϼ���");
				}
			}
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
