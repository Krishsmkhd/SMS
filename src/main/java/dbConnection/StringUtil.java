package dbConnection;

import java.security.MessageDigest;

public class StringUtil {
    //s==null or s=''
    public static boolean isEmpty(String s)
    {
        boolean ret=false;

        if(s==null){
            ret=true;
        }
        else{
            if(s.length()==0)
                ret=true;
        }

        return ret;

    }

    public static String page(int page,int totalPage,String basePath){
        String index=(page==1)?"Home":"<a href= ' "+basePath+"QueryController.do?page=1&pagesize=4'>Home</a>";
        String last=(page==totalPage)?"Last Page":"<a href='"+basePath+"QueryController.do?page="+totalPage+"&pagesize=4'>Last Page</a>";
        int prevPage=(page>=1)?page-1:1;
        int nextPage=(page>=totalPage)?totalPage:page+1;
        String prev=(page==1)?"Previous Page":"<a href='"+basePath+"QueryController.do?page="+prevPage+"&pagesize=4'>Previous Page</a>";
        String next=(page==totalPage)?"Next Page":"<a href='"+basePath+"QueryController.do?page="+nextPage+"&pagesize=4'>Next Page</a>";
        String str="Total"+totalPage+"Current Page"+page+"Page";
        String p="";
        String sep="&nbsp;";
        for(int i=1;i<=totalPage;i++){
            if(page==i){
                p+="["+i+"]";
            }else{
                p+="<a href='"+basePath+"QueryController.do?page="+i+"&pagesize=4'>["+i+"]</a>";
            }
        }
        String pageStr=str+sep+index+sep+prev+sep+p+sep+next+sep+last;
        return pageStr;
    }
    public static String MD5(String s){
        char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
        try {
            byte[] btInput = s.getBytes();
            // Get the `MessageDigest` object for the MD5 hash algorithm
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // Update the digest with the specified bytes
            mdInst.update(btInput);
            // Obtain ciphertext
            byte[] md = mdInst.digest();
            // Convert ciphertext into hexadecimal string representation
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) {
        System.out.println(StringUtil.MD5("111"));
        System.out.println(StringUtil.MD5("222"));
    }
}
