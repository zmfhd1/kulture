package member;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface MemberDAO {
	//회원가입
	public void insertmember(MemberVO vo);
	
	//id 입력시 회원정보 가져오기
	public MemberVO memberone(String id);
	
	//id중복 피하기
	public int idCheck(String id) throws Exception;
	
	//비밀번호 확인
	public int pwCheck(MemberVO vo) throws Exception;
	
	//로그인
	public boolean memberlogin(MemberVO vo);
	
	//회원로그인 정보
	public MemberVO viewmember(MemberVO vo);
	
	//로그아웃
	public void logout(HttpSession session);
	
	//관리자 계정 시 필요한 회원관리
	public List<MemberVO> memberlist();
	
	//회원 수정
	public void updatemember(MemberVO vo);
	
	//회원 삭제
	public void deletemember(String id);

}
