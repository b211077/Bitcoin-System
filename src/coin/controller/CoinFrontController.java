package coin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import coin.model.CoinService;
import coin.model.MemberService;
import coin.model.dto.BtcDTO;
import coin.model.dto.MemberDTO;

public class CoinFrontController extends HttpServlet {
	public CoinFrontController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String command = request.getParameter("command");
		try{
			if(command != null){
				if(command.equals("memberInsert")){//ȸ������
					memberInsert(request, response);
				}
				else if(command.equals("login")){//�α���
					memberLogin(request, response);
				}
				else if(request.getSession().getAttribute("name") != null){//�α��� ���¿����� ����
					if(command.equals("generic")){
						response.sendRedirect("generic.html");
					}
					else if(command.equals("logout")){//�α���
						memberLogout(request, response);
					}
					else if(command.equals("wallet")){//�α���
						response.sendRedirect("wallet.jsp");
					}
				}
				else if(command.equals("btcAll")){					// ��� ��Ʈ���� ���� �˻�
					btcAll(request, response);
				}else if(command.equals("btc")){			// ��¥�� ��Ʈ���� �˻�
					btc(request, response);
				}else if(command.equals("btcInsert")){	// ��Ʈ���� �߰� ���
					btcInsert(request, response);   
				}
				else{
					request.setAttribute("errorMsg", "�α��� �� �̿����ּ���");
					request.getRequestDispatcher("showError.jsp").forward(request, response);
				}
			}else{
				response.sendRedirect("index.jsp");
			}
			
//			else if(command.equals("activistAll")){//��� ��� ����� �˻�
//				activistAll(request, response);
//			}else if(command.equals("activist")){//Ư�� ��� ����� ���� �˻�
//				activist(request, response);
//			}else if(command.equals("activistInsert")){//��� ����� �߰� ���
//				activistInsert(request, response);
//			}else if(command.equals("activistUpdateReq")){//��� ����� ���� ������û
//				activistUpdateReq(request, response);
//			}else if(command.equals("activistUpdate")){//��� ����� ���� ����
//				activistUpdate(request, response);
//			}else if(command.equals("activistDelete")){//��� ����� Ż��[����]
//				activistDelete(request, response);
//			}
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
			request.getRequestDispatcher("showError.jsp").forward(request, response);
			s.printStackTrace();
		}
	}
	

//	//��� ProbonoProject �˻� �޼ҵ�
//	public void probonoProjectAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String url = "showError.jsp";
//		try {
//			request.setAttribute("probonoProjectAll", ProbonoService.getAllProbonoProjects());
//			url = "probonoProjectList.jsp";
//		}catch(Exception s){
//			request.setAttribute("errorMsg", s.getMessage());
//		}
//		request.getRequestDispatcher(url).forward(request, response);
//	}
//	
//	//???
//	//��� ��� ����� �˻� - �˻��� ������ ��� ȭ��[activistList.jsp]
//	public void activistAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String url = "showError.jsp";
//		try {
//			request.setAttribute("activistAll", ProbonoService.getAllActivists());
//			url = "activistList.jsp";
//		}catch(Exception s){
//			request.setAttribute("errorMsg", s.getMessage());
//		}
//		request.getRequestDispatcher(url).forward(request, response);
//	}
//	
//	//��� ����� �˻� 
//	public void activist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String url = "showError.jsp";
//		try {
//			request.setAttribute("activist", ProbonoService.getActivist(request.getParameter("activistId")));
//			url = "activistDetail.jsp";
//		}catch(Exception s){
//			request.setAttribute("errorMsg", s.getMessage());
//		}
//		request.getRequestDispatcher(url).forward(request, response);
//	}
//	

	//��� ����� ���� �޼ҵ�
	protected void memberInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		
		MemberDTO member = new MemberDTO(id, name, pw, email);

		try{
			boolean result = MemberService.addMember(member);
			if(result){
				request.setAttribute("member", member);
				request.setAttribute("successMsg", "���� �Ϸ�");
				url = "login.html";
			}else{
				request.setAttribute("errorMsg", "�ٽ� �õ��ϼ���");
			}
		}catch(Exception s){
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	protected void memberLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
		try{
			MemberDTO member = MemberService.getMember(id);
			HttpSession session = request.getSession();//���� ����
			
			session.setAttribute("member", member);
			session.setAttribute("name", member.getName());
			session.setAttribute("id", member.getId());
			System.out.println("������ id�� : "+((MemberDTO)session.getAttribute("member")).getId());
			
			request.setAttribute("successMsg", "�α��� ����");
			url = "index.jsp";
		}catch(Exception s){
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}
	protected void memberLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "showError.jsp";
		
		try{
			request.getSession(true).invalidate();
			request.setAttribute("successMsg", "�α׾ƿ� ����");
			url = "index.jsp";
		}catch(Exception s){
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		
		request.getRequestDispatcher(url).forward(request, response);
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
			String d = request.getParameter("hiddenData");
			String[] data = d.split(",");
			String date = null;
			double price, volume;
			int eid;
			
			try{
				for (int i = 0; i < data.length; i++) {
					date = data[i].split("/")[0];
					price = Double.parseDouble(data[i].split("/")[1]);
					volume = Double.parseDouble(data[i].split("/")[2]);
					eid = Integer.parseInt(data[i].split("/")[3]);
					BtcDTO btc = new BtcDTO(date, price, volume, eid);
					boolean result = CoinService.addBtc(btc);
					
					if(result){
						request.setAttribute("btc", btc);
						request.setAttribute("successMsg", "���� �Ϸ�");
					}else{
						request.setAttribute("errorMsg", "�ٽ� �õ��ϼ���");
					}
				}
			}catch(Exception s){
				s.printStackTrace();
				request.setAttribute("errorMsg", s.getMessage());
			}
		}
	
	
//	protected void btcInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String url = "showError.jsp";
//		
//		String command = request.getParameter("command");
//		
//		String array = request.getParameter("array");
//		
//		try{
//			System.out.println(command+"------------"+array);
//			
//			
//			request.getSession(true).invalidate();
//			request.setAttribute("successMsg", "�α׾ƿ� ����");
//			url = "index.jsp";
//		}catch(Exception s){
//			s.printStackTrace();
//			request.setAttribute("errorMsg", s.getMessage());
//		}
//		
//		request.getRequestDispatcher(url).forward(request, response);
//	}
	
	
	
//	//��� ����� ���� �䱸
//	public void activistUpdateReq(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String url = "showError.jsp";
//		try {
//			request.setAttribute("activist", ProbonoService.getActivist(request.getParameter("activistId")));
//			url = "activistUpdate.jsp";
//		}catch(Exception s){
//			request.setAttribute("errorMsg", s.getMessage());
//		}
//		request.getRequestDispatcher(url).forward(request, response);
//	}
//
//	//???
//	//��� ����� ���� - ������ Ȯ�� jsp[activistDetail.jsp]
//	public void activistUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String url = "showError.jsp";
//		try {
//			String activistId = request.getParameter("activistId");
//			String major = request.getParameter("major");
//			ProbonoService.updateActivist(activistId, major);
//			request.setAttribute("activist", ProbonoService.getActivist(request.getParameter("activistId")));
//			url = "activistDetail.jsp";
//		}catch(Exception s){
//			request.setAttribute("errorMsg", s.getMessage());
//		}
//		request.getRequestDispatcher(url).forward(request, response);
//	}
//	
//	//???
//	//��� ����� ����
//	public void activistDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String url = "showError.jsp";
//		try {
//			String activistId = request.getParameter("activistId");
//			if(ProbonoService.deleteActivist(activistId)){
//				request.setAttribute("activistAll", ProbonoService.getAllActivists());
//				url = "activistList.jsp";
//			}else{
//				request.setAttribute("errorMsg", "�� ���� �� �ּ���");
//			}
//		}catch(Exception s){
//			request.setAttribute("errorMsg", "�������� Probono Project�� �־� ������ Ż�� �Ұ��մϴ�");
//		}
//		request.getRequestDispatcher(url).forward(request, response);
//	}
//
}
