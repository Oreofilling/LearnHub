package learn.service;

import learn.entity.MyFile;



public interface FileService {

    MyFile SelectById(int fileId);

    int GetFileId(Integer sectionId);
}
