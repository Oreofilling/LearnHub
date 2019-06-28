package learn.service.impl;

import learn.dao.CourseSectionMapper;
import learn.entity.CourseSection;
import learn.entity.CourseSectionVO;
import learn.service.CourseSectionService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Kai on 2019/4/10.
 */

@Service
public class CourseSectionServiceImpl implements CourseSectionService{

    @Autowired
    private CourseSectionMapper courseSectionMapper;

    @Override
    public CourseSection selectByPrimaryKey(Integer id) {
        CourseSection courseSection = courseSectionMapper.selectByPrimaryKey(id);
        return courseSection;
    }

    @Override
    public int deleteByPrimaryKey(Integer courseId) {
        return 0;
    }

    @Override
    public int insert(CourseSection record) {
        return 0;
    }

    @Override
    public int insertSelective(CourseSection record){
        return 0;
    }

    @Override
    public int updateByPrimaryKeySelective(CourseSection record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(CourseSection record) {
        return 0;
    }


    @Override
    public List<CourseSectionVO> queryCourseSection(Integer courseId) {
        List<CourseSectionVO> resultList = new ArrayList<>();
        LinkedHashMap<Integer, CourseSectionVO> map = new LinkedHashMap<>();
        Iterator<CourseSection> iterator = courseSectionMapper.selectByCourseId(courseId).iterator();
        while (iterator.hasNext()) {
            CourseSection section = iterator.next();
            if (section.getParentId() == 0) {
                CourseSectionVO vo = new CourseSectionVO();
                BeanUtils.copyProperties(section, vo);
                map.put(section.getId(), vo);
            }else {
                map.get(section.getParentId()).getSections().add(section);
            }
        }
        for (CourseSectionVO item : map.values()) {
            resultList.add(item);
        }
        return resultList;
    }

    @Override
    public int selectCourseIdBySectionId(Integer id){
        return courseSectionMapper.selectCourseIdBySectionId(id);
    }
}
