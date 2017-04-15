package com.mbakovic.template.db;

import com.mbakovic.template.model.Category;
import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.SqlQuery;
import org.skife.jdbi.v2.sqlobject.SqlUpdate;
import org.skife.jdbi.v2.sqlobject.customizers.RegisterMapper;

import java.util.List;


@RegisterMapper(CategoryMapper.class)
public interface CategoryDAO {

    @SqlUpdate("insert into categories (name)" +
                "values (:name)")
    void insert(@Bind("name") String name);

    @SqlQuery("select * from categories where id = :id")
    Category findById(@Bind("id") Integer id);

    @SqlQuery("select * from categories")
    List<Category> getAll();

    @SqlUpdate("delete from categories where id = :id")
    void deleteById(@Bind("id") Integer id);
}
