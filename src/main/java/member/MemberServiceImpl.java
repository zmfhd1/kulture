package member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

@Service("memberservice2")
@Primary
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO dao;

	//회원가입
	@Override
	public void insertMember(MemberVO vo) {
		MemberVO result = dao.memberone(vo.getId());
		if(result == null) {
			dao.insertmember(vo);
		}
		
	}
	//id 중복 피하기
	@Override
	public int idCheck(String id) throws Exception {
		return dao.idCheck(id);
	}
	
	//비밀번호 확인
	@Override
	public int pwCheck(MemberVO vo) throws Exception {
		int count = dao.pwCheck(vo);
		return count;
	}
	//로그인
	@Override
	public boolean memberLogin(MemberVO vo, HttpSession session) {
		boolean result = dao.memberlogin(vo);
		if(result) {//true일 경우 session에 등록
			MemberVO vo2 = viewMember(vo);
			//세션변수 등록
			session.setAttribute("id", vo2.getId());
			session.setAttribute("pw", vo2.getPw());
			session.setAttribute("name", vo2.getName());
			session.setAttribute("fullemail", vo2);
			session.setAttribute("email", vo2.getEmail());
			/*
			if(vo2.getEmail().contains("@")) {
				if(vo2.getEmail().split("@").length>2) {
					session.setAttribute("email", vo2.getEmail().split(",")[0]);
					session.setAttribute("domain", vo2.getEmail().split(",")[2]);	
				}			
			}else {
				session.setAttribute("email", vo2.getEmail());
			}*/
			session.setAttribute("phone_number", vo2.getPhone_number());
			session.setAttribute("nickname", vo2.getNickname());
		}
		return result;
	}
	
	//회원로그인 정보
	public MemberVO viewMember(MemberVO vo) {
		return dao.viewmember(vo);
		
	}
	
	//로그아웃
	@Override
	public void logOut(HttpSession session) {
		//세션 정보를 초기화 시킴
		session.invalidate();
	}
	
	//회원 id입력시 회원정보 불러오기
	@Override
	public MemberVO memberOne(String id) {
		return dao.memberone(id);
	}

	//관리자 계정 회원관리
	@Override
	public List<MemberVO> memberList() {
		List<MemberVO> list = dao.memberlist();
		return list;
	}

	//회원정보 수정
	@Override
	public void updateMember(MemberVO vo) {
		dao.updatemember(vo);
		
	}

	//회원삭제
	@Override
	public void deleteMember(String id) {
		dao.deletemember(id);
		
	}

	

}
