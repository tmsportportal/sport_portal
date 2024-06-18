import React, { useState } from "react";
import { useSelector } from "react-redux";
import { RootState } from "../../../redux/store";
import { ESection, IWorldNews } from "../../../redux/interfaces/home";
import { urlBack } from "../../../redux/apiCalls";
import { useNavigate } from "react-router-dom";
import { NEWS_DETAILS_PAGE } from "../../../tools/links";
import { BG_COLORS } from "../../../tools/constants";

const Body = () => {
  // Hooks
  const navigate = useNavigate();
  const [scaleImage, setScaleImage] = useState("scale-100");

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const world_news: IWorldNews[] = useSelector(
    (state: RootState) => state.home.world_news
  );

  // Operation
  const [world_news_main, ...world_news_other] = world_news;

  // Function
  const linkToNewsDetail = (newsId: string) => {
    navigate(NEWS_DETAILS_PAGE, { state: { newsId, section: ESection.World } });
  };

  return (
    <div className="flex justify-between pt-5 gap-7">
      <div
        className="flex flex-col max-w-[400px] w-full cursor-pointer"
        onClick={() => linkToNewsDetail(world_news_main.id)}
        onMouseEnter={() => setScaleImage("scale-125")}
        onMouseLeave={() => setScaleImage("scale-100")}
      >
        <div className="relative overflow-hidden">
          <img
            src={urlBack + world_news_main?.imagePath}
            className={`object-cover h-64 w-full ${scaleImage} transition duration-300`}
            alt=""
          />
          <div className="absolute inset-0 m-0 bg-gradient-to-t from-black/60 to-black/50 " />
          <div
            className={`absolute top-6 left-6 h-5 w-max text-white text-[9px] flex items-center ${
              BG_COLORS[Math.floor(Math.random() * BG_COLORS.length)]
            }`}
          >
            <p className="px-3">
              {prefLang === "Tm"
                ? world_news_main?.category.nameTm
                : world_news_main?.category.nameRu}
            </p>
          </div>
        </div>
        <div className="flex flex-col pt-6">
          <p className="pb-[6px] font-inter text-[10px]">
            {prefLang === "Tm"
              ? world_news_main?.locationTm
              : world_news_main?.locationRu}
          </p>
          <p className="pb-4 font-oswald text-lg tracking-wide font-semibold capitalize">
            {prefLang === "Tm"
              ? world_news_main?.nameTm
              : world_news_main?.nameRu}
          </p>
          <p className="font-inter text-sm text-ellipsis overflow-hidden h-[60px]">
            {prefLang === "Tm"
              ? world_news_main?.textTm
              : world_news_main?.textRu}
          </p>
        </div>
      </div>
      <div className="w-full flex flex-col justify-between">
        {world_news_other?.slice(0, 5).map((wn, index) => {
          return (
            <div
              className="flex cursor-pointer"
              key={index}
              onClick={() => linkToNewsDetail(wn.id)}
            >
              <img
                src={urlBack + wn.imagePath}
                className="h-[70px] w-[90px] object-cover"
                alt=""
              />
              <div className="pl-4">
                <p className="font-inter text-[10px]">
                  {prefLang === "Tm" ? wn.locationTm : wn.locationRu}
                </p>
                <p className="font-oswald text-[16px] max-w-[280px] capitalize text-ellipsis overflow-hidden h-12">
                  {prefLang === "Tm" ? wn.nameTm : wn.nameRu}
                </p>
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
};

export default Body;
