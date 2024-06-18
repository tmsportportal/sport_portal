import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { RootState } from "../../redux/store";
import { ESection, ILocalNews, IWorldNews } from "../../redux/interfaces/home";
import { useLocation, useNavigate } from "react-router-dom";
import {
  GET_GLOBAL_NEWS,
  GET_LOCAL_NEWS,
  PATCH_SPORT_NEWS_VIEWS,
} from "../../redux/types";
import FilterNews from "../../components/Details/NewsDetail/FilterNews";
import NewsDetail from "../../components/Details/NewsDetail/NewsDetail";

const NewsDetails = () => {
  const { state: r_state } = useLocation();

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const news: ILocalNews[] | IWorldNews[] = useSelector((state: RootState) =>
    r_state.section === ESection.Local
      ? state.home.local_news
      : state.home.world_news
  );

  // Hooks
  const navigate = useNavigate();
  const dispatch = useDispatch();
  useEffect(() => {
    dispatch({
      type: PATCH_SPORT_NEWS_VIEWS,
      payload: { newsId: r_state.newsId, categoryId: news_data?.categoryId },
    });
    // Renews
    dispatch({
      type: GET_LOCAL_NEWS,
      payload: { section: ESection.Local, lang: prefLang },
    });
    dispatch({
      type: GET_GLOBAL_NEWS,
      payload: { section: ESection.World, lang: prefLang },
    });
  }, [prefLang]);

  // Operation
  const news_data =
    r_state.newsId && news.find((ln) => ln.id === r_state.newsId);
  const same_news = news.filter(
    (ln) => ln.categoryId === news_data.categoryId && ln.id !== r_state.newsId
  );

  // Function
  const linkToNewsDetail = (newsId: string, categoryId: string) => {
    navigate("", { state: { newsId, categoryId, section: r_state.section } });
  };

  return (
    <div className="flex pt-9 w-full justify-center">
      <div className="flex max-w-[1170px] w-full gap-12">
        <FilterNews data={news} linkToNewsDetail={linkToNewsDetail} />
        <NewsDetail
          news_data={news_data}
          same_news={same_news.slice(0, 4)}
          linkToNewsDetail={linkToNewsDetail}
        />
      </div>
    </div>
  );
};

export default NewsDetails;
