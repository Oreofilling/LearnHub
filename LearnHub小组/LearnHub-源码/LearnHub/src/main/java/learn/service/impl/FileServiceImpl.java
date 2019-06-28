package learn.service.impl;

import learn.dao.FileMapper;
import learn.entity.MyFile;
import learn.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileServiceImpl implements FileService {

    @Autowired
    private FileMapper fileMapper;

    private MyFile myFile;

    @Override
    public MyFile SelectById(int fileId){
        myFile = fileMapper.selectFileId(fileId);
        return myFile;
    }

    @Override
    public int GetFileId(Integer sectionId){
        myFile = fileMapper.selectCourseIdAndSectionId(sectionId);
        return myFile.getFileId();
    }
}
