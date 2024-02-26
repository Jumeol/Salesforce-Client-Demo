public class HTTPRequestApex {
    
    
    public static String getAuth(){
    HttpRequest req = new HttpRequest();
    
    req.setEndpoint('https://ca9fd551-3e10-4b63-b976-60b8432bc1d5.mock.pstmn.io/getAuth');
     req.setMethod('GET');
    
 
     String username = 'user';
     String password = 'pwd';
  
     Blob headerValue = Blob.valueOf(username + ':' + password);
     String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
     req.setHeader('Authorization', authorizationHeader);
   
  
     Http http = new Http();
     HTTPResponse res = http.send(req);
     return res.getBody();
    }

}