package com.easyhousing.util;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 工具类
 * 1.发送密码到指定邮箱，入口：sendPassword(String receiveMailAccount, String password)
 * 2.上传图片到七牛云：upload(String FilePath, String newPhotoName) !newPhotoName可以不加数据类型后缀，随意!
 */
public class Tool {
    //==================七牛云相关配置======================================

	private final static String  ACCESS_KEY = "tx9tJcDUJfIdKo0Oqo72bEdxjCBZ0NWme3aAbd2g"; 
	private final static String SECRET_KEY = "X_SrniW7DV03vvfx-OOsx1Qh3fhFdSrfjW-QbWXz";  

    private final static String myEmailAccount = "18059739987@163.com";
    private final static String myEmailPassword = "163shouquan";


    public static String myEmailSMTPHost = "smtp.163.com";
    
    public static void sendPassword(String receiveMailAccount, String password) throws Exception {

        Properties props = new Properties();                    
        props.setProperty("mail.transport.protocol", "smtp");  

        props.setProperty("mail.smtp.host", myEmailSMTPHost);
        props.setProperty("mail.smtp.auth", "true"); 
        

        Session session = Session.getDefaultInstance(props);
        session.setDebug(true);                         
   
        MimeMessage message = createMimeMessage(session, myEmailAccount, receiveMailAccount, password);

     
        Transport transport = session.getTransport();

        transport.connect(myEmailAccount, myEmailPassword);


        transport.sendMessage(message, message.getAllRecipients());

        transport.close();
    }

    
    private static MimeMessage createMimeMessage(Session session, String sendMail, 
    		String receiveMail, String password) throws Exception {
    	//使用smtp的形式发送邮件
        MimeMessage message = new MimeMessage(session);

        message.setFrom(new InternetAddress(sendMail, "易购房", "UTF-8"));

        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "亲爱的用户", "UTF-8"));

        // 4. Subject: 主题
        message.setSubject("找回密码", "UTF-8");

        // 5. Content: 内容
        message.setContent("您好，以下为您的密码，请及时修改~\n" + "密码：" + password, "text/html;charset=UTF-8");

        message.setSentDate(new Date());

        message.saveChanges();

        return message;
    }
    

//测试域名oxnvfyqo7.bkt.clouddn.com

    String bucketname = "ibicfly-store"; //存储名字

    Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);  
    
    Configuration cfg = new Configuration(Zone.zone1());

    UploadManager uploadManager = new UploadManager(cfg);  
    

    public String getUpToken(){  
        return auth.uploadToken(bucketname);  
    }

    public void upload(String FilePath, String fileName) throws IOException{
    	try {  
    		//BucketManager bucketMgr = new BucketManager(auth, cfg);
    		//bucketMgr.delete(bucketname, newPhotoName);
	        Response res = uploadManager.put(FilePath, fileName, getUpToken());  
	        System.out.println(res.isOK());
	        System.out.println(res.bodyString());
	    } catch (QiniuException e) {  
            Response r = e.response;  
            System.out.println(r.toString());  
            try {  
              System.out.println(r.bodyString());  
            } catch (QiniuException e1) {  
                //ignore  
            }
        }         
    }
    
    public static void main(String[] args) throws Exception {
    	File originalURL =new File("D:/zhanglang_bishe/Untitled2.txt");
    	FileReader fileReader=new FileReader(originalURL);
    	BufferedReader bufferedReader=new BufferedReader(fileReader);
    	HashSet<String> set=new HashSet<String>();
    	while(bufferedReader.readLine()!=null&&!bufferedReader.readLine().equals(""))
    	{
    		String temp=new String(bufferedReader.readLine().getBytes(),"UTF-8");
    		Pattern pattern=Pattern.compile("http://oxnvfyqo7.bkt.clouddn.com/[(\\w)(\\.)]*");
    		Matcher  matcher=pattern.matcher(temp);
    		if(matcher.find())
    		{
        		System.out.println(matcher.group());
        		set.add(matcher.group());
    		}
    	}
    	Iterator<String> iterator=set.iterator();
    	while(iterator.hasNext())
    	{
    		System.out.println(iterator.next());
    	}

    	
    	
    	
//    	fileReader.r
//    	new Tool().upload("http://oxnvfyqo7.bkt.clouddn.com/defaultPhoto.png", "testIO");
//    	new Tool().upload("C:\\Users\\张东南\\Desktop\\Pic2.jpg", "Pic2");
//    	new Tool().upload("C:\\Users\\张东南\\Desktop\\Pic3.jpg", "Pic3");
//    	new Tool().upload("C:\\Users\\张东南\\Desktop\\Pic4.jpg", "Pic4");
    }
}
