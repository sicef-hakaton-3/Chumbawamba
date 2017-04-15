package com.mbakovic.template.db;

import com.mbakovic.template.model.Category;
import com.mbakovic.template.model.News;
import com.mbakovic.template.model.Source;
import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.SqlQuery;
import org.skife.jdbi.v2.sqlobject.SqlUpdate;
import org.skife.jdbi.v2.sqlobject.customizers.RegisterMapper;

import java.util.Date;
import java.util.List;

@RegisterMapper(NewsMapper.class)
public interface NewsDAO {

    @SqlUpdate("insert into news (title, summary, date, category_id)" +
            "values (:title, :summary, :date, :category_id)")
    void insert(@Bind("title") String title,
                @Bind("summary") String summary,
                @Bind("date") Date date,
                @Bind("category_id") int category_id);

    @SqlQuery("select * from news where id = :id")
    News findById(@Bind("id") Integer id);

    @SqlQuery("select * from news where title = :title")
    News findByTitle(@Bind("id") String title);

    @SqlQuery("select * from news where category_id = :category_id")
    List<News> getAllByCategory(@Bind("category_id") int category_id);

    @SqlQuery("select * from news")
    List<News> getAll();

    @SqlUpdate("delete from news where id = :id")
    void deleteById(@Bind("id") int id);

    @SqlQuery("select * from news where category_id = :category_id and id <> :news_id order by date desc limit 3")
    List<News> getSimilar(@Bind("news_id") int news_id, @Bind("category_id") int category_id);

    @SqlQuery("select * from categories")
    @RegisterMapper(CategoryMapper.class)
    List<Category> getAllCategories();

    @SqlQuery("select * from sources")
    @RegisterMapper(SourceMapper.class)
    List<Source> getAllSources();

    @SqlQuery("select * from news_keywords where news_id = :news_id")
    @RegisterMapper(NewsKeywordsMapper.class)
    List<String> getKeywordsByNewsId(@Bind("news_id") int news_id);
}