package com.mbakovic.template.resources;

import com.google.common.collect.Lists;
import com.mbakovic.template.api.NewsService;
import com.mbakovic.template.auth.AuthUser;
import com.mbakovic.template.core.NewsComparator;
import com.mbakovic.template.db.*;
import com.mbakovic.template.model.*;
import org.apache.commons.lang3.tuple.Pair;

import javax.ws.rs.NotFoundException;
import javax.ws.rs.PathParam;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.*;


public class NewsResource implements NewsService {

    private final NewsDAO newsDAO;
    private final NewsLinkDAO newsLinkDAO;
    private final SourceDAO sourceDAO;
    private final UserDAO userDAO;
    private final UserCategoryDAO userCategoryDAO;

    public NewsResource(NewsDAO newsDAO, NewsLinkDAO newsLinksDAO, SourceDAO sourceDAO, UserDAO userDAO, UserCategoryDAO userCategoryDAO) {
        this.newsLinkDAO = newsLinksDAO;
        this.newsDAO = newsDAO;
        this.sourceDAO = sourceDAO;
        this.userDAO = userDAO;
        this.userCategoryDAO = userCategoryDAO;
    }

    @Override
    public List<News> getAll() {
        return newsDAO.getAll();
    }

    @Override
    public List<Category> getAllCategories() {
        return newsDAO.getAllCategories();
    }

    @Override
    public News getById(int id) throws NotFoundException {
        News news = newsDAO.findById(id);
        if (news == null){
            throw new NotFoundException();
        }
        return news;
    }

    @Override
    public News getByTitle(String title) throws NotFoundException {
        News news = newsDAO.findByTitle(title);
        if (news == null){
            throw new NotFoundException();
        }
        return news;
    }

    @Override
    public List<News> getByCategory(int category_id) throws NotFoundException {
        List<News> news = newsDAO.getAllByCategory(category_id);
        if (news == null){
            throw new NotFoundException();
        }
        return news;
    }

    @Override
    public List<NewsLinkSource> getNewsLinks(int id) throws NotFoundException {
        List<NewsLink> newsLinks = newsLinkDAO.getAllByNews(id);
        List<NewsLinkSource> newsLinkSources = new ArrayList<>();

        for (NewsLink link : newsLinks) {
            NewsLinkSource withSource = new NewsLinkSource();
            withSource.setId(link.getId());
            withSource.setNews_id(link.getNews_id());
            withSource.setLink(link.getLink());
            withSource.setSource_link(sourceDAO.getById(link.getSource_id()).getWebsite());
            withSource.setSource_name(sourceDAO.getById(link.getSource_id()).getName());
            newsLinkSources.add(withSource);
        }

        return newsLinkSources;
    }

    private Float coefKeywordScore = new Float(1.0);
    private Float coefNewsCountScore = new Float(0.1); // per 100 counts
    private Float coefNewsDateScore = new Float(-0.25); // per hour

    private Float NewsCountScore(News news) {
        return coefNewsCountScore * new Float(news.getCount() / 100);
    }

    private Float NewsDateScore(News news) {
        long diff = Math.abs( (new Date()).getTime() - news.getDate().getTime());
        long diffHours = diff / (60 * 60 * 1000);

        return new Float(coefNewsDateScore * diffHours);
    }

    private Float getScoreNewsUser(News news, User user) {
        List<String> newsKeywords = newsDAO.getKeywordsByNewsId(news.getId());

        Float score = new Float(0);

        score = score + NewsCountScore(news);
        score = score + NewsDateScore(news);

        for(String keyword : newsKeywords) {
            Float keywordScore = userDAO.getKeywordScoreByUserId(user.getId(), keyword);
            if (keywordScore != null) {
                score += coefKeywordScore * keywordScore;
            }
        }

        return score;
    }

    @Override
    public List<News> getRecommendedNewsForUser(int id) throws NotFoundException {
        return getRecommendedNewsForUser(id, 5);
    }

    @Override
    public List<News> getRecommendedNewsForUser(int id, int numberOfNews) throws NotFoundException {
        List<News> sortedNews = new ArrayList<>();

        User user = userDAO.findById(id);

        if (user == null){
            throw new NotFoundException();
        }

        // hashmap<category_id, pq< pair<news_id, SCORE> >>
        HashMap<Integer, PriorityQueue<Pair<News, Float>>> allNews = new HashMap<>();

        Float sum_probabilities = new Float(0.0);

        List<UserCategory> categories = userCategoryDAO.getAllByUser(user.getId());
        for (UserCategory userCategory : categories) {

            List<News> newsInCategory = newsDAO.getAllByCategory(userCategory.getCategory_id());
            NewsComparator comparator = new NewsComparator();
            PriorityQueue<Pair<News, Float>> newsQueue = new PriorityQueue<>(1000, comparator);

            for(News news : newsInCategory) {
                newsQueue.add(Pair.of(news, getScoreNewsUser(news, user)));
            }

            allNews.put(userCategory.getCategory_id(), newsQueue);

            sum_probabilities += userCategory.getScore();

            //myNews.addAll(newsDAO.getAllByCategory(userCategory.getCategory_id()));
        }

        Random rand = new Random();

        for(int i=0; i<numberOfNews; i++) {
            if (categories.isEmpty()) break;

            float r = rand.nextFloat() * sum_probabilities;
            float s = 0;
            for(Iterator<UserCategory> it = categories.iterator(); it.hasNext(); ) {
                UserCategory userCategory = it.next();

                s += userCategory.getScore();
                if (s >= r) {

                    Pair<News, Float> nextNews = allNews.get(userCategory.getCategory_id()).poll();
                    sortedNews.add(nextNews.getLeft());

                    if (allNews.get(userCategory.getCategory_id()).isEmpty()) {
                        sum_probabilities -= userCategory.getScore();
                        //categories.remove(userCategory);
                        it.remove();
                    }

                    //sortedNews.add(getNextNews(allNews, userCategory.getCategory_id()));
                }
            }
        }

        return sortedNews;
    }

    @Override
    public List<News> getSimilarNews(int id) throws NotFoundException {
        News news = newsDAO.findById(id);
        if (news == null) return Lists.newArrayList();
        return newsDAO.getSimilar(news.getId(), news.getCategory_id());
    }

    @Override
    public void votePlus(AuthUser authUser, int news_id) throws NotFoundException {
        User user = userDAO.findByEmail(authUser.getName());
        News news = newsDAO.findById(news_id);

        if (userDAO.getVoted(user.getId(), news.getId()) != null) {
            // already voted
            return;
        }

        float currentScore = userCategoryDAO.getScoreCategory(user.getId(), news.getCategory_id());

        float newScore = currentScore + (float)0.3;

        userCategoryDAO.updateScoreCategory(user.getId(), news.getCategory_id(), newScore);

        userDAO.setVoted(user.getId(), news.getCategory_id());
    }

    @Override
    public void voteMinus(AuthUser authUser, int news_id) throws NotFoundException {
        User user = userDAO.findByEmail(authUser.getName());
        News news = newsDAO.findById(news_id);

        if (userDAO.getVoted(user.getId(), news.getId()) != null) {
            // already voted
            return;
        }

        float currentScore = userCategoryDAO.getScoreCategory(user.getId(), news.getCategory_id());

        float newScore = currentScore - (float)0.3;

        userCategoryDAO.updateScoreCategory(user.getId(), news.getCategory_id(), newScore);

        userDAO.setVoted(user.getId(), news.getCategory_id());
    }

    @Override
    public void voteVisited(AuthUser authUser, int news_id) throws NotFoundException {
        User user = userDAO.findByEmail(authUser.getName());
        News news = newsDAO.findById(news_id);

        if (userDAO.getVisited(user.getId(), news.getId()) != null) {
            // already visited
            return;
        }

        float currentScore = userCategoryDAO.getScoreCategory(user.getId(), news.getCategory_id());

        float newScore = currentScore + (float)0.1;

        userCategoryDAO.updateScoreCategory(user.getId(), news.getCategory_id(), newScore);

        userDAO.setVisited(user.getId(), news.getCategory_id());
    }

    public News getNewsForFacebook() throws NotFoundException {
        List<News> allNews = newsDAO.getAll();
        Random randomizer = new Random();
        return allNews.get(randomizer.nextInt(allNews.size()));
    }

    public News getNewsForFacebook(int category_id) throws NotFoundException {
        List<News> allNews = newsDAO.getAllByCategory(category_id);
        if (allNews.isEmpty()) return null;
        Random randomizer = new Random();
        return allNews.get(randomizer.nextInt(allNews.size()));
    }


    @Override
    public void delete(int id) {
        newsDAO.deleteById(id);
    }

}
