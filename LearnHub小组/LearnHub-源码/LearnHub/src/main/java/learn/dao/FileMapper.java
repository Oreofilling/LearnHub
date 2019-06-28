package learn.dao;

import learn.entity.MyFile;

public interface FileMapper{

    MyFile selectFileId(int fileId);

    MyFile selectCourseIdAndSectionId(Integer sectionId);
}
