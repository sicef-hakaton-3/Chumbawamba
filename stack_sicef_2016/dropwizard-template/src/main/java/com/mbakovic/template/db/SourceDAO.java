package com.mbakovic.template.db;

import com.mbakovic.template.model.Category;
import com.mbakovic.template.model.Source;
import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.SqlQuery;
import org.skife.jdbi.v2.sqlobject.customizers.RegisterMapper;

import java.util.List;

/**
 * Created by DuX on 11/5/16.
 */
@RegisterMapper(SourceMapper.class)
public interface SourceDAO {

    @SqlQuery("select * from sources where id = :id")
    Source getById(@Bind("id") int id);

    @SqlQuery("select * from sources")
    List<Source> getAll();
}
