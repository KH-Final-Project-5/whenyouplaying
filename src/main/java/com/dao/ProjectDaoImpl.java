package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.commons.Criteria;
import com.dto.CalendarDto;
import com.dto.FinishDealDto;
import com.dto.ProjectDto;
import com.dto.ReviewDto;
import com.dto.ScheduleDto;
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
	public int insertReview(ReviewDto dto) {
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

	public List<ReviewDto> newest() {
		
		List<ReviewDto> list = new ArrayList<>();
		try {
			list = sqlSession.selectList(NAMESPACE + "newest");
		} catch (Exception e) {
			System.out.println("newest 에러");
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<ReviewDto> popularity() {
		List<ReviewDto> list = new ArrayList<>();
		try {
			list = sqlSession.selectList(NAMESPACE + "popularity");
		} catch (Exception e) {
			System.out.println("popularity 에러");
			e.printStackTrace();
			
		}
		return list;
	}


	public List<ReviewDto> reviewSelect(int prNo) {
		List<ReviewDto> list = new ArrayList<>();
		
		
		try {
			list = sqlSession.selectList(NAMESPACE + "reviewSelect", prNo);
		} catch (Exception e) {
			System.out.println("review Select 에러");

			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<FinishDealDto> selectReview(FinishDealDto dto) {
		
		List<FinishDealDto> list = new ArrayList<FinishDealDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectReview",dto);
			System.out.println(dto);
		} catch (Exception e) {
			System.out.println("리뷰를 찾지 못했습니다");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int reviewUpdate(ReviewDto dto) {
		int res = 0;
		System.out.println(dto.getRvNo());
		try {
			res = sqlSession.update(NAMESPACE+"reviewUpdate", dto);
		} catch (Exception e) {
			System.out.println("reviewUpdate 실패");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int reviewDelete(int rvNo) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"reviewDelete", rvNo);
			System.out.println("reviewDelete 실행"+":"+ rvNo);
		} catch (Exception e) {
			System.out.println("reviewDelete 실패");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<ProjectDto> prSearch(ProjectDto dto,Criteria cri) {
		List<ProjectDto> list = new ArrayList<>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "prSearch",dto);
		} catch (Exception e) {
			System.out.println("prsearch 에러");

			e.printStackTrace();
			
		}
		return list;
	}

	@Override
	public int insertCalendar(ProjectDto dto) {

		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertCalendar", dto);
		} catch (Exception e) {
			System.out.println("[error] : insertCalendar에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<ScheduleDto> scheduleList(int prNo) {
		
		List<ScheduleDto> list = new ArrayList<ScheduleDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"scheduleList", prNo);
		} catch (Exception e) {
			System.out.println("[error] : scheduleList 에러");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int insertSchedule(ScheduleDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertSchedule", dto);
		} catch (Exception e) {
			System.out.println("[error] : insertSchedule 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public CalendarDto selectCalendar(int prNo) {
		
		CalendarDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectCalendar", prNo);
		} catch (Exception e) {
			System.out.println("[error] : selectCalendar 에러");
			e.printStackTrace(); 
		}
		
		return res;
	}

	@Override
	public int deleteSchedule(ScheduleDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deleteSchedule", dto);
		} catch (Exception e) {
			System.out.println("[error] : deleteSchedule 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	



	


}
