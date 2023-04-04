package sn.noflayetach.springTest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class SpringTestApplication {

	@GetMapping
	public String sayHello(){
		return "Hello from Noflaye Tech version 2";
	}
	public static void main(String[] args) {
		SpringApplication.run(SpringTestApplication.class, args);
	}

}
