package com.mbakovic.template.db;

import com.mbakovic.template.model.Category;
import com.mbakovic.template.model.NewsKeywords;
import org.skife.jdbi.v2.StatementContext;
import org.skife.jdbi.v2.tweak.ResultSetMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by DuX on 11/6/16.
 */
public final class NewsKeywordsMapper implements ResultSetMapper<NewsKeywords> {

    @Override
    public NewsKeywords map(int i, ResultSet resultSet, StatementContext statementContext) throws SQLException {
        NewsKeywords newsKeywords = new NewsKeywords();
        newsKeywords.setNews_id(resultSet.getInt("news_id"));
        newsKeywords.setKeyword(resultSet.getString("keyword"));
        return newsKeywords;
    }
}