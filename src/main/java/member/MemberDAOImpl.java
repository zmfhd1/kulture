package member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;
@Mapper
@Primary
@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	SqlSession sqlSession;
	@Autowired
	MemberDAO dao;

	@Override
	public void insertmember(MemberVO vo) {
		dao.insertmember(vo);

	}

	@Override
	public MemberVO memberone(String id) {
		return dao.memberone(id);
	}
	
	//id중복 체크
	@Override
	public int idCheck(String id) throws Exception {
		return dao.idCheck(id);
	}
	//비밀번호 확인
	@Override
	public int pwCheck(MemberVO vo) throws Exception {
		int count = sqlSession.selectOne("pwCheck", vo);
		return count;
	}
	
	
	//로그인체크
	@Override
	public boolean memberlogin(MemberVO vo) {
		String nickname = sqlSession.selectOne("memberlogin",vo);
		return(nickname == null) ? false:true; 
	}

	//회원 로그인 정보
	@Override
	public MemberVO viewmember(MemberVO vo) {
		return sqlSession.selectOne("viewmember", vo);
	}

	@Override
	public void logout(HttpSession session) {

	}

	@Override
	public List<MemberVO> memberlist() {
		return dao.memberlist();
	}

	@Override
	public void updatemember(MemberVO vo) {
		dao.updatemember(vo);

	}

	@Override
	public void deletemember(String id) {
		dao.deletemember(id);

	}

}
