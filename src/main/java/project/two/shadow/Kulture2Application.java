package project.two.shadow;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import contents.ContentsController;
import contents.ContentsDAO;
import contents.ContentsVO;
import member.MemberController;
import member.MemberDAOImpl;
import stt.STTController;
import study.StudyController;
import study.StudyDAOImpl;
import translation.PapagoController;
import tts.TTSController;
import upload.UploadController;
import users.TestController2;
import users.UsersDAO;

@SpringBootApplication
@ComponentScan
@ComponentScan(basePackageClasses = STTController.class)
@ComponentScan(basePackageClasses = UploadController.class)
@ComponentScan(basePackageClasses = PapagoController.class)
@ComponentScan(basePackageClasses = TTSController.class)
//수민
@ComponentScan(basePackageClasses = MemberController.class)
@MapperScan(basePackageClasses = MemberDAOImpl.class)

//다은
@ComponentScan(basePackageClasses = ContentsVO.class)
@ComponentScan(basePackageClasses = ContentsController.class)
@MapperScan(basePackageClasses = ContentsDAO.class)

//호연
@MapperScan(basePackageClasses = UsersDAO.class)
@ComponentScan(basePackageClasses = TestController2.class)

//종섭
@MapperScan(basePackageClasses = StudyDAOImpl.class)
@ComponentScan(basePackageClasses = StudyController.class)

public class Kulture2Application {

	public static void main(String[] args) {
		SpringApplication.run(Kulture2Application.class, args);
		System.out.println("project_two실행(port:9007)");
	}

}
