package com.w.service;


import com.w.model.Interview;

import java.util.List;

/**
 * Created by destiny on 2018/7/25/0025.
 */
public interface InterviewService {

    int addInterview(Interview interview);

    int getInterviewByUidIstate(int uid, int istate);

    List<Interview> queryCurrentInterviewByUidIstate(int uid, int istate, int begin, int end);

    Interview getInterviewByIid(int iid);

    int updateInterview(Interview interview);

    int getInterviewByRiid(int riid, int istate);

    List<Interview> queryCurrentPageInterviewByRiid(int riid, int istate, int begin, int end);
}
