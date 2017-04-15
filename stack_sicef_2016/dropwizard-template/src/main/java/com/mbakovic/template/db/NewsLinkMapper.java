package com.mbakovic.template.db;

import com.mbakovic.template.model.NewsLink;
import org.skife.jdbi.v2.StatementContext;
import org.skife.jdbi.v2.tweak.ResultSetMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public final class NewsLinkMapper implements ResultSetMapper<NewsLink> {
    @Override
    public NewsLink map(int i, ResultSet resultSet, StatementContext statementContext) throws SQLException {
        NewsLink newsLink = new NewsLink();
        newsLink.setId(resultSet.getInt("id"));
        newsLink.setLink(resultSet.getString("link"));
        newsLink.setNews_id(resultSet.getInt("news_id"));
        newsLink.setSource_id(resultSet.getInt("source_id"));
        return newsLink;
    }
}
