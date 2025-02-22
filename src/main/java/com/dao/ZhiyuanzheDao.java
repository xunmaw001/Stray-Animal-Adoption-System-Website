package com.dao;

import com.entity.ZhiyuanzheEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.ZhiyuanzheView;

/**
 * 志愿者 Dao 接口
 *
 * @author 
 * @since 2021-04-26
 */
public interface ZhiyuanzheDao extends BaseMapper<ZhiyuanzheEntity> {

   List<ZhiyuanzheView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
