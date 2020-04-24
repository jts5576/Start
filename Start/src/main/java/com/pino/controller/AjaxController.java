package com.pino.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping(value = "/ajax/*")
public class AjaxController {
	
	@Resource(name = "uploadPath")
	private String uploadPath; // servlet-context.xml (id="uploadPath")
	
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public String uploadFile(MultipartFile uploadFile) throws Exception {
		
		System.out.println("Upload file name: " + uploadFile.getOriginalFilename());
		System.out.println("Upload file size:" + uploadFile.getSize());
		
		String uploadFileName = uploadFile.getOriginalFilename();
		
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
		
		String overName = overFile(uploadFileName);
		
		System.out.println("overName: " + overName);
		System.out.println("uploadFolder: " + uploadPath);
		
		File overFile = new File(uploadPath, overName);
		
		try {
			uploadFile.transferTo(overFile);
//			System.out.println("uploadFile : " + uploadFile);
		}catch (Exception e) {
			// TODO: handle exception
		}
		return overName;
	}

	@RequestMapping(value = "/display")
	public ResponseEntity<byte[]>display(@RequestParam("fileName") String fileName) throws Exception {
		String realPath = "";
		realPath = uploadPath + File.separator + fileName;
		
		System.out.println("realPath: " + realPath);
		InputStream is = null;
		ResponseEntity<byte[]> entity = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			int underScoreIndex = 0;
			String downName = "";
			underScoreIndex = fileName.indexOf("_", 1);
			downName = fileName.substring(underScoreIndex + 1);
			is = new FileInputStream(realPath);
			header.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			header.add("Content-disposition", "attachment); filename=\"" + downName + "\"");
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(is), header, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	private String overFile(String file) {
		
		// 랜덤값으로 돌리는것
		UUID uuid = UUID.randomUUID();
		
		String overName = uuid + "_" + file;
		
		return overName;
	}
}
