import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { NEWS_DETAILS_PAGE } from "../../../tools/links";
import { urlBack } from "../../../redux/apiCalls";
import { ESection, ILocalNews } from "../../../redux/interfaces/home";
import { BG_COLORS } from "../../../tools/constants";

type CardData = {
  news: ILocalNews;
  cardSize: string;
  prefLang: string;
};

const NewsCard: React.FC<CardData> = ({ news, cardSize, prefLang }) => {
  // Hooks
  const navigate = useNavigate();
  const [scaleImage, setScaleImage] = useState("scale-100");

  // Operation
  let textSize = "text-xl",
    titleMaxWidth = "max-w-[300px]",
    bottom = "bottom-5";
  switch (cardSize) {
    case "max":
      textSize = "text-2xl";
      titleMaxWidth = "max-w-[340px]";
      bottom = "bottom-7";
      break;

    case "mid":
      textSize = "text-xl";
      titleMaxWidth = "max-w-[300px]";
      bottom = "bottom-6";
      break;

    case "min":
      textSize = "text-sm";
      titleMaxWidth = "max-w-[195px]";
      bottom = "bottom-2";
      break;

    default:
      break;
  }

  // Function
  const linkToNewsDetail = (newsId: string) => {
    navigate(NEWS_DETAILS_PAGE, { state: { newsId, section: ESection.Local } });
  };

  return (
    <figure
      className={`relative w-full h-full m-0 cursor-pointer`}
      onClick={() => linkToNewsDetail(news?.id)}
      onMouseEnter={() => setScaleImage("scale-125")}
      onMouseLeave={() => setScaleImage("scale-100")}
    >
      <div className="w-full h-full overflow-hidden">
        <img
          className={`h-full w-full object-cover object-center ${scaleImage} transition duration-300`}
          src={urlBack + news?.imagePath}
          alt=""
        />
      </div>
      <div className="absolute inset-0 m-0 bg-gradient-to-t from-black/60 via-black/50 " />
      <div
        className={`absolute top-6 left-6 h-5 ${
          BG_COLORS[Math.floor(Math.random() * BG_COLORS.length)]
        } w-max text-white text-[9px] flex items-center`}
      >
        <p className="px-3">
          {prefLang === "Tm" ? news?.category.nameTm : news?.category.nameRu}
        </p>
      </div>
      <figcaption
        className={`absolute text-white ${
          bottom + " " + titleMaxWidth
        } left-0 w-full ml-4`}
      >
        <p className="font-inter text-[10px] max-w-[131px]">
          {prefLang === "Tm" ? news?.locationTm : news?.locationRu}
        </p>
        <p className={`font-oswald capitalize ${textSize}`}>
          {prefLang === "Tm" ? news?.nameTm : news?.nameRu}
        </p>
      </figcaption>
    </figure>
  );
};

export default NewsCard;
