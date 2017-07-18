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
				if(command.equals("memberInsert")){//회원가입
					memberInsert(request, response);
				}
				else if(command.equals("login")){//로그인
					memberLogin(request, response);
				}
				else if(request.getSession().getAttribute("name") != null){//로그인 상태에서만 가능
					if(command.equals("generic")){
						response.sendRedirect("generic.html");
					}
					else if(command.equals("logout")){//로그인
						memberLogout(request, response);
					}
					else if(command.equals("wallet")){//로그인
						response.sendRedirect("wallet.jsp");
					}
				}
				else if(command.equals("btcAll")){					// 모든 비트코인 정보 검색
					btcAll(request, response);
				}else if(command.equals("btc")){			// 날짜별 비트코인 검색
					btc(request, response);
				}else if(command.equals("btcInsert")){	// 비트코인 추가 등록
					btcInsert(request, response);   
				}
				else{
					request.setAttribute("errorMsg", "로그인 후 이용해주세요");
					request.getRequestDispatcher("showError.jsp").forward(request, response);
				}
			}else{
				response.sendRedirect("index.jsp");
			}
			
//			else if(command.equals("activistAll")){//모든 재능 기부자 검색
//				activistAll(request, response);
//			}else if(command.equals("activist")){//특정 재능 기부자 정보 검색
//				activist(request, response);
//			}else if(command.equals("activistInsert")){//재능 기부자 추가 등록
//				activistInsert(request, response);
//			}else if(command.equals("activistUpdateReq")){//재능 기부자 정보 수정요청
//				activistUpdateReq(request, response);
//			}else if(command.equals("activistUpdate")){//재능 기부자 정보 수정
//				activistUpdate(request, response);
//			}else if(command.equals("activistDelete")){//재능 기부자 탈퇴[삭제]
//				activistDelete(request, response);
//			}
		}catch(Exception s){
			request.setAttribute("errorMsg", s.getMessage());
			request.getRequestDispatcher("showError.jsp").forward(request, response);
			s.printStackTrace();
		}
	}
	

//	//모두 ProbonoProject 검색 메소드
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
//	//모든 재능 기부자 검색 - 검색된 데이터 출력 화면[activistList.jsp]
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
//	//재능 기부자 검색 
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

	//재능 기부자 가입 메소드
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
				request.setAttribute("successMsg", "가입 완료");
				url = "login.html";
			}else{
				request.setAttribute("errorMsg", "다시 시도하세요");
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
			HttpSession session = request.getSession();//세션 생성
			
			session.setAttribute("member", member);
			session.setAttribute("name", member.getName());
			session.setAttribute("id", member.getId());
			System.out.println("세션의 id값 : "+((MemberDTO)session.getAttribute("member")).getId());
			
			request.setAttribute("successMsg", "로그인 성공");
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
			request.setAttribute("successMsg", "로그아웃 성공");
			url = "index.jsp";
		}catch(Exception s){
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	// 모든 비트코인 검색
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
		
		// 날짜에 따른 비트코인 검색 
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
		
		// 비트코인 데이터 삽입
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
						request.setAttribute("successMsg", "삽입 완료");
					}else{
						request.setAttribute("errorMsg", "다시 시도하세요");
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
//			request.setAttribute("successMsg", "로그아웃 성공");
//			url = "index.jsp";
//		}catch(Exception s){
//			s.printStackTrace();
//			request.setAttribute("errorMsg", s.getMessage());
//		}
//		
//		request.getRequestDispatcher(url).forward(request, response);
//	}
	
	
	
//	//재능 기부자 수정 요구
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
//	//재능 기부자 수정 - 상세정보 확인 jsp[activistDetail.jsp]
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
//	//재능 기부자 삭제
//	public void activistDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String url = "showError.jsp";
//		try {
//			String activistId = request.getParameter("activistId");
//			if(ProbonoService.deleteActivist(activistId)){
//				request.setAttribute("activistAll", ProbonoService.getAllActivists());
//				url = "activistList.jsp";
//			}else{
//				request.setAttribute("errorMsg", "재 실행 해 주세요");
//			}
//		}catch(Exception s){
//			request.setAttribute("errorMsg", "진행중인 Probono Project가 있어 지금은 탈퇴가 불가합니다");
//		}
//		request.getRequestDispatcher(url).forward(request, response);
//	}
//
}
