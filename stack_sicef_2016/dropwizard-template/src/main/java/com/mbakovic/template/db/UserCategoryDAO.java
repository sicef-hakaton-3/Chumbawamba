package com.mbakovic.template.db;

import com.mbakovic.template.model.UserCategory;
import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.SqlQuery;
import org.skife.jdbi.v2.sqlobject.SqlUpdate;
import org.skife.jdbi.v2.sqlobject.customizers.RegisterMapper;

import java.util.List;

/**
 * Created by DuX on 11/5/16.
 */
@RegisterMapper(UserCategoryMapper.class)
public interface UserCategoryDAO {

    @SqlUpdate("insert into user_categories (user_id, categories_id, score) " +
            "values (:user_id, :categories_id, 0.0)")
    void insert(@Bind("user_id") int user_id,
                @Bind("category_id") int category_id);

    @SqlQuery("select * from user_categories where user_id = :user_id")
    List<UserCategory> getAllByUser(@Bind("user_id") int user_id);

    @SqlQuery("select * from user_categories where category_id = :category_id")
    List<UserCategory> getAllByCategory(@Bind("category_id") int category_id);

    @SqlQuery("select * from user_categories")
    List<UserCategory> getAll();

    @SqlUpdate("delete from user_categories where id = :id")
    void deleteById(@Bind("id") int id);

    @SqlUpdate("delete from user_categories where user_id = :user_id and category_id = :category_id")
    void deleteByUserIdCategoryId(@Bind("user_id") int user_id,
                                  @Bind("category_id") int category_id);

    @SqlUpdate("update user_categories set score = :score where user_id = :user_id and category_id = :category_id")
    void updateScoreCategory(@Bind("user_id") int user_id,
                               @Bind("category_id") int category_id,
                               @Bind("score") float score);

    @SqlQuery("select score from user_categories where user_id = :user_id and category_id = :category_id")
    float getScoreCategory(@Bind("user_id") int user_id,
                             @Bind("category_id") int category_id);

    //@SqlQuery("select * from user_categories where user_id = :user_id and category_id = :category_id")
    //UserCategory getUserCategory(@Bind("user_id") int user_id, @Bind("category_id") int category_id);
}
