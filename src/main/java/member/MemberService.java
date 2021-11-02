package member;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface MemberService {
	//회원가입
	public void insertMember(MemberVO vo);
	
	//id중복 피하기
	public int idCheck(String id) throws Exception;
	
	//비밀번호 확인
	public int pwCheck(MemberVO vo) throws Exception;
	
	//로그인
	public boolean memberLogin(MemberVO vo, HttpSession session);
	
	//회원 로그인 정보
	public MemberVO viewMember(MemberVO vo);
	
	//로그 아웃
	public void logOut(HttpSession session);
	
		
	//id 가져오면 회원정보도 가져오기
	public MemberVO memberOne(String id);
		
	//관리자 계정 시 필요한 회원관리
	public List<MemberVO> memberList();
		
	//회원 수정
	public void updateMember(MemberVO vo);
		
	//회원 삭제
	public void deleteMember(String id);

}
