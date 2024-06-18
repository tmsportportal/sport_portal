import React from "react";
import { useNavigate } from "react-router-dom";
import { NEWS_ALL } from "../../../tools/links";
import { useSelector } from "react-redux";
import { urlBack } from "../../../redux/apiCalls";
import { RootState } from "../../../redux/store";
import { ILocalNews, IWorldNews } from "../../../redux/interfaces/home";

const viewsIcon = (
  <svg width="14" height="12" viewBox="0 0 14 12" fill="none">
    <path
      d="M9.19529 6.07725C9.19529 7.29135 8.2142 8.27244 7.0001 8.27244C5.786 8.27244 4.80493 7.29135 4.80493 6.07725C4.80493 4.86315 5.786 3.88208 7.0001 3.88208C8.2142 3.88208 9.19529 4.86315 9.19529 6.07725Z"
      stroke="#0088FF"
      stroke-opacity="0.4"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
    <path
      d="M7.00001 11.1482C9.16454 11.1482 11.1819 9.87277 12.5861 7.66531C13.138 6.80072 13.138 5.34748 12.5861 4.48288C11.1819 2.27542 9.16454 1 7.00001 1C4.83546 1 2.81809 2.27542 1.4139 4.48288C0.862034 5.34748 0.862034 6.80072 1.4139 7.66531C2.81809 9.87277 4.83546 11.1482 7.00001 11.1482Z"
      stroke="#0088FF"
      stroke-opacity="0.4"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
  </svg>
);

interface Props {
  news_data: ILocalNews | IWorldNews;
  same_news: ILocalNews[] | IWorldNews[];
  linkToNewsDetail: (newsId: string, categoryId: string) => void;
}

const NewsDetail = ({ news_data, same_news, linkToNewsDetail }: Props) => {
  // Hooks
  const navigate = useNavigate();

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);

  // Function
  const linkToAllNews = () => {
    navigate(NEWS_ALL, {
      state: {
        categoryId: news_data?.categoryId,
        section: news_data.category.section,
      },
    });
  };

  return (
    <div className="flex flex-col items-center justify-between gap-5 w-full font-inter">
      <div className="flex items-center">
        <p className="text-[26px] font-oswald capitalize max-w-[570px] text-center text-[#0F1A42] text-shadow">
          {prefLang === "Tm" ? news_data?.nameTm : news_data?.nameRu}
        </p>
      </div>
      <div>
        <div className="flex justify-between font-inter text-xs">
          <p className="flex gap-1">
            {viewsIcon}
            {news_data?.views}
          </p>
          <p>
            {prefLang === "Tm" ? news_data?.locationTm : news_data?.locationRu}
          </p>
        </div>
        <img
          src={urlBack + news_data?.imagePath}
          className="object-cover max-w-[500px] object-center"
          alt=""
        />
      </div>
      <p className="w-full h-max text-justify text-base whitespace-pre-line leading-relaxed">
        {prefLang === "Tm" ? news_data?.textTm : news_data?.textRu}
      </p>
      <div className="flex flex-col w-full pt-20">
        <div className="flex justify-between w-full font-oswald h-11">
          <p className="border-b border-[#F65050] text-[#F65050] text-2xl w-[280px]">
            {prefLang === "Tm" ? "Meňzeş täzelikler" : "Подобные новости"}
          </p>
          <div className="border-b border-black flex justify-end w-full" />
          <button
            className="bg-[#077EE6] text-white h-full w-56"
            onClick={linkToAllNews}
          >
            {prefLang === "Tm" ? "Hemmesini görmek" : "Посмотреть все"}
          </button>
        </div>
        <div className="flex flex-wrap justify-between pt-4">
          {same_news.map((sn, index) => {
            return (
              <div
                className="flex flex-col w-[195px] gap-2 cursor-pointer"
                key={index}
                onClick={() => linkToNewsDetail(sn.id, sn.categoryId)}
              >
                <img
                  src={urlBack + sn.imagePath}
                  className="object-cover h-[145px]"
                  alt=""
                />
                <p className="text-[10px]">
                  {prefLang === "Tm" ? sn.locationTm : sn.locationRu}
                </p>
                <p className="text-sm font-oswald text-shadow">
                  {prefLang === "Tm" ? sn.nameTm : sn.nameRu}
                </p>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
};

export default NewsDetail;
