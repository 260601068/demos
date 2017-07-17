package com.wjl.ajaxupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class UploadAction extends ActionSupport{
//  file名字自定义，但是文件名和文件内容必须以下列格式命名
	private File myfile;
	private String myfileFileName;
	private String myfileContentType;
	
	public File getMyfile() {
		return myfile;
	}

	public void setMyfile(File myfile) {
		this.myfile = myfile;
	}

	public String getMyfileFileName() {
		return myfileFileName;
	}

	public void setMyfileFileName(String myfileFileName) {
		this.myfileFileName = myfileFileName;
	}

	public String getMyfileContentType() {
		return myfileContentType;
	}

	public void setMyfileContentType(String myfileContentType) {
		this.myfileContentType = myfileContentType;
	}

	@Override
	public String execute() throws Exception {
		InputStream in=new FileInputStream(myfile);
		String uploadPath=ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/")+"upload";
		File file=new File(uploadPath,myfileFileName);
		File parentDir=file.getParentFile();
		if(!parentDir.exists()) parentDir.mkdirs();
		OutputStream out= new FileOutputStream(file);
		byte[] bytes=new byte[1024];
		int length=0;
		while((length=in.read(bytes))!=-1){
			out.write(bytes, 0, length);
		}
		in.close();
		out.close();
		return SUCCESS;
	}
}
