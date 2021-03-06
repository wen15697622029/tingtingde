package com.w.dao;


import com.w.model.Cultivate;

import java.util.List;

/**
 * Created by destiny on 2018/7/18/0018.
 */
public interface CultivateMapper {
    int getCultivateByCstate(int cstate);

    List<Cultivate> queryCurrentPageCultivateByCstate(int cstate, int begin, int end);

    int addCultivate(Cultivate cultivate);

    Cultivate getCultivateByCid(int cid);

    int updateCultivate(Cultivate cultivate);

    double getMinutesByCid(int cid);

    List<Cultivate> getCultivateBySid(int sid,int begin,int end);

    int getCountBySid(int sid);
}
