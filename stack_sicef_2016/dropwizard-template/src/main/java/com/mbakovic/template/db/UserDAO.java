package com.mbakovic.template.db;

import com.mbakovic.template.model.User;
import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.GetGeneratedKeys;
import org.skife.jdbi.v2.sqlobject.SqlQuery;
import org.skife.jdbi.v2.sqlobject.SqlUpdate;
import org.skife.jdbi.v2.sqlobject.customizers.RegisterMapper;

import java.util.List;

@RegisterMapper(UserMapper.class)
public interface UserDAO {

    @SqlUpdate("insert into users (email, password)" +
               "values (:email, :password)")
    @GetGeneratedKeys
    Integer insert(@Bind("email") String email,
                @Bind("password") String password);

    @SqlQuery("select * from users where email = :email")
    User findByEmail(@Bind("email") String email);

    @SqlQuery("select * from users where id = :id")
    User findById(@Bind("id") Integer id);

    @SqlQuery("select * from users")
    List<User> getAll();

    @SqlUpdate("delete from users where id = :id")
    void deleteById(@Bind("id") Integer id);

    @SqlQuery("select password from users where id = :id")
    String getPasswordById(@Bind("id") Integer id);

    @SqlQuery("select score from user_keywords where user_id = :user_id and keyword = :keyword limit 1")
    Float getKeywordScoreByUserId(@Bind("user_id") int id, @Bind("keyword") String keyword);

    @SqlQuery("select voted from user_votes where user_id = :user_id and news_id = :news_id")
    Boolean getVoted(@Bind("user_id") int id, @Bind("news_id") int news_id);

    @SqlQuery("select visited from user_votes where user_id = :user_id and news_id = :news_id")
    Boolean getVisited(@Bind("user_id") int id, @Bind("news_id") int news_id);

    @SqlUpdate("update user_votes set voted = 1 where user_id = :user_id and news_id = :news_id")
    void setVoted(@Bind("user_id") int id, @Bind("news_id") int news_id);

    @SqlUpdate("update user_votes set visited = 1 where user_id = :user_id and news_id = :news_id")
    void setVisited(@Bind("user_id") int id, @Bind("news_id") int news_id);
}
