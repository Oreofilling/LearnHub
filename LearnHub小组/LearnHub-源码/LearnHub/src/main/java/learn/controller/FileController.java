package learn.controller;


import learn.entity.MyFile;
import learn.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;


@Controller
public class FileController {

    @Autowired
    public FileService fileService;
    private MyFile myFile;
    @ResponseBody
    @RequestMapping(value = "/download")
    public void FileDownload(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String id = request.getParameter("fileId");
        int fileId = Integer.parseInt(id);
        myFile = fileService.SelectById(fileId);
        String rootPath = request.getSession().getServletContext().getRealPath("/") + "/style/file/";
        String filePath = rootPath + myFile.getFilePath();
        String fileName = myFile.getFileName();
        InputStream inputStream=null;
        OutputStream outputStream=null;
        try {
            File file=new File(filePath,fileName);
            inputStream = new FileInputStream(file);
            outputStream = response.getOutputStream();
            // 设置响应头，控制浏览器下载该文件，点击下载后，出现下载地址框
            response.setHeader("content-disposition",
                    "attachment;filename=" + URLEncoder.encode(fileName, "utf-8"));
            // 读取要下载的文件，保存到文件输入流
            byte buffer[] = new byte[1024];
            int len = 0;
            // 循环将输入流中的内容读取到缓冲区中
            while ((len = inputStream.read(buffer)) > 0) {
                // 输出缓冲区内容到浏览器，实现文件下载
                outputStream.write(buffer, 0, len);
            }
            } catch (FileNotFoundException e) {
            e.printStackTrace();
            } catch (IOException e) {
            e.printStackTrace();
             }finally {
            //关闭输入输出流
            if(outputStream!=null) {
             outputStream.close();
             }
            if(inputStream!=null) {
                inputStream.close();
             }
            }
    }

    @RequestMapping(value = "/setFileId")
    public String CourseIdToFileId(Integer sectionId){
        int fileId = fileService.GetFileId(sectionId);
        return "redirect:/download?fileId="+fileId;
    }
}
