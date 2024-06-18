import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { RootState } from "../../redux/store";
import { ESection, ILocalNews } from "../../redux/interfaces/home";
import { useLocation, useNavigate } from "react-router-dom";
import { urlBack } from "../../redux/apiCalls";
import { NEWS_DETAILS_PAGE } from "../../tools/links";
import { GET_LOCAL_NEWS, GET_GLOBAL_NEWS } from "../../redux/types";
import { ChampionshipStats } from "../../components/Sections/World";

const NewsAll = () => {
  // Hooks
  const navigate = useNavigate();
  const dispatch = useDispatch();
  useEffect(() => {
    dispatch({
      type: GET_LOCAL_NEWS,
      payload: { section: ESection.Local, lang: prefLang },
    });
    dispatch({
      type: GET_GLOBAL_NEWS,
      payload: { section: ESection.World, lang: prefLang },
    });
  }, []);
  const { state: r_state } = useLocation();

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  var news: ILocalNews[] = useSelector((state: RootState) =>
    r_state.section === ESection.Local
      ? state.home.local_news
      : state.home.world_news
  );

  // Operation
  news =
    (r_state.categoryId &&
      news.filter((ln) => ln.categoryId === r_state.categoryId)) ||
    news;

  // Function
  const linkToNewsDetail = (newsId: string, categoryId: string) => {
    navigate("/../" + NEWS_DETAILS_PAGE, {
      state: { newsId, categoryId, section: r_state.section },
    });
  };

  return (
    <div className="w-full flex justify-center font-inter">
      <div className="w-full max-w-[1170px] flex justify-between gap-8 pt-8">
        <div className="w-[445px]">
          <ChampionshipStats />
        </div>
        <div className="w-full">
          <div className="flex h-11 font-oswald text-2xl w-full">
            <div
              className={`flex items-center max-w-[160px] w-full border-b border-[#F65050] text-[#F65050]`}
            >
              {prefLang === "Tm"
                ? r_state.categoryId
                  ? news[0]?.category?.nameTm
                  : "Hemmesi"
                : r_state.categoryId
                ? news[0]?.category?.nameRu
                : "Все"}
            </div>
            <span className="border-b border-black w-full"></span>
          </div>
          <div className="grid grid-cols-4 w-full pt-5 gap-4">
            {news?.map((item, index) => {
              return (
                <div
                  className="flex flex-col gap-1 cursor-pointer hover:underline"
                  key={index}
                  onClick={() => linkToNewsDetail(item.id, item.categoryId)}
                >
                  <img
                    src={urlBack + item.imagePath}
                    className="w-[195px] h-[145px] object-cover"
                    alt=""
                  />
                  <p className="text-[10px]">
                    {prefLang === "Tm" ? item.locationTm : item.locationRu}
                  </p>
                  <p className="text-sm font-oswald">
                    {prefLang === "Tm" ? item.nameTm : item.nameRu}
                  </p>
                </div>
              );
            })}
          </div>
        </div>
      </div>
    </div>
  );
};

export default NewsAll;
