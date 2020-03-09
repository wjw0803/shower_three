package com.dj.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.ssm.pojo.ExpertPrevoir;

import java.util.zip.DataFormatException;

public interface ExpertPrevoirMapper extends BaseMapper<ExpertPrevoir> {

    void insret(ExpertPrevoir expertPrevoir) throws DataFormatException;
}
