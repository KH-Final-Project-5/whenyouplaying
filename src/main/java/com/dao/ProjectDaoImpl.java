package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.commons.Criteria;
import com.dto.ProjectDto;
import com.dto.UserDto;

@Repository
public class ProjectDaoImpl implements ProjectDao {

    @Autowired
    private SqlSessionTemplate sqlSession;


    @Override
    public List<ProjectDto> selectCategory(Criteria cri) {

        List<ProjectDto> dto = new ArrayList<ProjectDto>();

        try {
            dto = sqlSession.selectList(NAMESPACE + "selectDesign", cri);
        } catch (Exception e) {
            System.out.println("[error] : selectDesign");
            e.printStackTrace();
        }


        return dto;
    }
    
    @Override
	public int listCount() throws Exception {
		
    	int res =0;
    	
    	res = sqlSession.selectOne(NAMESPACE+"prListCount");
    	
		return res;
	}
    

    @Override
    public ProjectDto selectDetail(int prNo) {
        ProjectDto dto = null;


        try {
            dto = sqlSession.selectOne(NAMESPACE + "detail", prNo);
        } catch (Exception e) {
            System.out.println("[error : detail");
            e.printStackTrace();
        }


        return dto;
    }


    @Override
    public int insertProject(ProjectDto dto) {
        int res = 0;

        try {
            res = sqlSession.insert(NAMESPACE + "insert", dto);

        } catch (Exception e) {
            System.out.println("[error] : insert");
            e.printStackTrace();
        }
        return res;
    }
    
    @Override
	public int insertReview(ProjectDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insertReview", dto);
		} catch (Exception e) {
			System.out.println("insertReview 에러");
			e.printStackTrace();
		}
		return res;
	}


    @Override
    public int updateProject(ProjectDto dto) {
        int res = 0;

        try {
            res = sqlSession.update(NAMESPACE + "update", dto);
        } catch (Exception e) {
            System.out.println("[error] : update");
            e.printStackTrace();
        }
        return res;
    }


    @Override
    public int deleteProject(int prNo) {
        int res = 0;

        try {
            res = sqlSession.delete(NAMESPACE + "delete", prNo);
        } catch (Exception e) {
            System.out.println("[error] : delete");
            e.printStackTrace();
        }
        return res;
    }


    @Override
    public UserDto selectSession(int usNo) {
        UserDto dto = null;

        try {
            dto = sqlSession.selectOne(NAMESPACE + "selectSession", usNo);
        } catch (Exception e) {
            System.out.println("[error] : selectSession");
            e.printStackTrace();
        }
        return dto;
    }

    public ProjectDto messagePopup(int prNo) {
        ProjectDto dto = null;

        try {
            dto = sqlSession.selectOne(NAMESPACE + "selectMessagePop", prNo);
        } catch (Exception e) {
            System.out.println("정보 가져오기 실패");
            e.printStackTrace();
        }

        return dto;
    }

	@Override
	public List<ProjectDto> search(ProjectDto dto) {
		
		List<ProjectDto> list = new ArrayList<>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "search",dto );
		} catch (Exception e) {
			System.out.println("search 에러");
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<ProjectDto> reviewSelect(int prNo) {
		List<ProjectDto> list = new ArrayList<>();
		
		
		try {
			list = sqlSession.selectList(NAMESPACE + "reviewSelect", prNo);
		} catch (Exception e) {
			System.out.println("review Select 에러");
			e.printStackTrace();
		}
		
		return list;
	}

	



	


}
