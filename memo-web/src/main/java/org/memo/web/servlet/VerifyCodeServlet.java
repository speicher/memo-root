package org.memo.web.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class VerifyCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Random random = new Random();
	private static final String VERIFY_CODES = "23456789ABCDEFGHJKLMNPQRSTUVWXYZ";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("image/jpeg");
		int width = 100;
		int height = 30;
		int codeSize = 4;
//		Color bgColor = getBackgroundColor();
//		Color frontColor = getFrontColor(bgColor);
		String verifyCode = getCode(codeSize);
		request.getSession().setAttribute("rand", verifyCode);//保存到session里
		BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
//		Random rand = new Random();
		Graphics2D g = bi.createGraphics();//画布
//		g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		
//		g.setColor(bgColor);
        g.setColor(getRandColor(200, 250));// 设置背景色  
        g.fillRect(0, 0, width, height);
        g.setColor(getRandColor(100, 160));
        int fontSize = height-4; 
        g.setFont(new Font("Algerian", Font.BOLD, fontSize));
//		g.setColor(frontColor);
        
//        char[] chars = verifyCode.toCharArray();  
//        for(int i = 0; i < codeSize; i++){  
//            AffineTransform affine = new AffineTransform();  
//            affine.setToRotation(Math.PI / 4 * rand.nextDouble() * (rand.nextBoolean() ? 1 : -1), (width / codeSize) * i + fontSize/2, height/2);  
//            g.setTransform(affine);  
//            g.drawChars(chars, i, 1, ((width-10) / codeSize) * i + 5, height/2 + fontSize/2 - 10);  
//        }
        
		g.drawString(verifyCode, 18, 20);
		for(int i=0,n=random.nextInt(20) ; i<n ; i++){
            g.fillRect(random.nextInt(width),random.nextInt(height),1,1);
		}//产生至多20个噪点
		
		ServletOutputStream so = response.getOutputStream();
		JPEGImageEncoder je = JPEGCodec.createJPEGEncoder(so);
		je.encode(bi);
		so.flush();
	}
	
	private static Color getRandColor(int fc, int bc) {  
        if (fc > 255)  
            fc = 255;  
        if (bc > 255)  
            bc = 255;  
        int r = fc + random.nextInt(bc - fc);  
        int g = fc + random.nextInt(bc - fc);  
        int b = fc + random.nextInt(bc - fc);  
        return new Color(r, g, b);  
    }  
	
	protected static Color getBackgroundColor(){
		return new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255));
	}
	
	protected static Color getFrontColor(Color c){
		return new Color(255-c.getRed(),255-c.getGreen(),255-c.getBlue());
	}
	
	protected static String getCode(int size){
		Random rand = new Random(System.currentTimeMillis());
		int codeLength = VERIFY_CODES.length();
		StringBuffer randCode = new StringBuffer(size);
		for(int i=0 ; i<size ; i++){
			randCode.append(VERIFY_CODES.charAt(rand.nextInt(codeLength-1)));
		}
		return randCode.toString();
	}
}
