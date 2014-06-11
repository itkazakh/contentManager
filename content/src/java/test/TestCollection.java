package test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class TestCollection {
	public static void main(String[] args) {
		TestCollection test = new TestCollection();
		String aa = test.findPolMasterDtoByXml("hello");
		System.out.println(aa);
	}
	
	public String findPolMasterDtoByXml(String conditions){
		StringBuffer buffer = new StringBuffer();
        String strMessage = "";
        String strURL = "";
        InputStream inputStream = null;
        OutputStream outputStream = null;

        BufferedReader reader = null;
        OutputStreamWriter writer = null;
        URL url = null;
        HttpURLConnection connection = null;
        String sUrl = "http://localhost:8080/expense/generate/helloTest.do";
        strURL = sUrl;
		String requestXML = "hello";
		String request = "";
		try {
			System.out.println("URL_ODYSSEY = " + sUrl);
			url = new URL(strURL);
			connection = (HttpURLConnection) url.openConnection();
            connection.setDoInput(true);
            connection.setDoOutput(true);
            connection.setRequestMethod("POST");
            connection.setAllowUserInteraction(true);
//            connection.set
            connection.connect();
            outputStream = connection.getOutputStream();
            writer = new OutputStreamWriter(outputStream);
            writer.write(requestXML);
            writer.flush();
            writer.close();
            
            inputStream = connection.getInputStream();
            reader = new BufferedReader(new InputStreamReader(inputStream));
            while ((strMessage = reader.readLine()) != null) {
                buffer.append(strMessage);
            }
            request = buffer.toString();
            System.out.println(request + "========================");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return request;
	}
}
