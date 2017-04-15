package com.mbakovic.template.db;

import com.mbakovic.template.model.NewsLink;
import org.skife.jdbi.v2.sqlobject.Bind;
import org.skife.jdbi.v2.sqlobject.SqlQuery;
import org.skife.jdbi.v2.sqlobject.SqlUpdate;
import org.skife.jdbi.v2.sqlobject.customizers.RegisterMapper;

import java.util.List;

@RegisterMapper(NewsLinkMapper.class)
public interface NewsLinkDAO {

    @SqlUpdate("insert into news_links (source_id, news_id, link)" +
            "values (:source_id, :news_id, :link)")
    void insert(@Bind("source_id") int source_id,
                @Bind("news_id") int news_id,
                @Bind("link") String link);

    @SqlQuery("select * from news_links where source_id = :source_id")
    List<NewsLink> getAllBySource(@Bind("source_id") int source_id);

    @SqlQuery("select * from news_links where news_id = :news_id")
    List<NewsLink> getAllByNews(@Bind("news_id") int news_id);

    @SqlQuery("select * from news_links")
    List<NewsLink> getAll();

    @SqlUpdate("delete from news_links where id = :id")
    void deleteById(@Bind("id") int id);
}
