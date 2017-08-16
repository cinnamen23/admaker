package org.cg.controller;


import java.io.FileOutputStream;
import java.util.UUID;


import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admaker")
public class ADMakerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ADMakerController.class);
	
	@GetMapping()
	public void ADMakerGet(){
		
		
	}
	@ResponseBody
	@PostMapping("/getjpg")
	public String registerPost(@RequestParam("file")MultipartFile file ) {		
			
				logger.info("get jpg!!!!!");
		
				UUID uid = UUID.randomUUID();
				
				String fileName=file.getOriginalFilename();
				
				String fpohto=uid+fileName;							
				
				try {
					IOUtils.copy(file.getInputStream(), new FileOutputStream("C:\\zzz\\upload\\"+fpohto));
				} catch (Exception e) {
					e.printStackTrace();
				} 
				
				
		return fpohto;

	}
	
	@PostMapping("/delete")
	public void admdel(){
		
		
	}
	
	@ResponseBody
	@PostMapping("/onepage")
	public String onepage(@RequestParam("image") String image,String sid ) {		
			
				logger.info("get jpg!!!!!");
		
				UUID uid = UUID.randomUUID();
				
				logger.info(image);
				logger.info(sid);				
				
				//파일저장
				//qservice.imgeinsert();
				
				
				
		return image;

	}
	
	
	

	


}


