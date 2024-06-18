import React from "react";
import NewsCard from "./NewsCard";
import AdsCard from "./AdsCard";
import { useSelector } from "react-redux";
import { RootState } from "../../../redux/store";
import { ADS } from "../../../tools/constants";

const NewsCards = () => {
  const news = useSelector((state: RootState) => state.home.local_news);
  const prefLang = useSelector((state: RootState) => state.main.prefLang);

  return (
    <div className="flex justify-between">
      <div className="w-[440px] h-[570px]">
        <NewsCard key={0} news={news[0]} cardSize="max" prefLang={prefLang} />
      </div>
      <div className="flex flex-col justify-between">
        <div className="flex justify-between">
          <div className="w-[231px] h-[275px]">
            <NewsCard
              key={1}
              news={news[1]}
              cardSize="min"
              prefLang={prefLang}
            />
          </div>
          <div className="w-[231px] h-[275px]">
            <NewsCard
              key={2}
              news={news[2]}
              cardSize="min"
              prefLang={prefLang}
            />
          </div>
        </div>
        <div className="w-[484px] h-[278px]">
          <NewsCard key={3} news={news[3]} cardSize="mid" prefLang={prefLang} />
        </div>
      </div>
      <div className="flex flex-col justify-between">
        {ADS.map((ad, index) => {
          return (
            <AdsCard imgLink={ad?.imgLink} title={ad?.title} key={index} />
          );
        })}
      </div>
    </div>
  );
};

export default NewsCards;
