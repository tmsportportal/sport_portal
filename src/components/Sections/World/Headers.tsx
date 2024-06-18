import React, { FC, useState } from "react";
import nextSvg from "../../../assets/svg/next.svg";
import prevSvg from "../../../assets/svg/prev.svg";
import { useSelector } from "react-redux";
import { RootState } from "../../../redux/store";
import { ISportCategory } from "../../../redux/interfaces/main";
import { useNavigate } from "react-router-dom";
import { NEWS_ALL } from "../../../tools/links";
import { ESection, IChampionship } from "../../../redux/interfaces/home";
import { champshipNames } from "../../../tools/constants";

export const WorldNewsHeader = () => {
  // Hooks
  const navigate = useNavigate();

  // useState
  const [categoryIndex, setCategoryIndex] = useState(0);

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const categories: ISportCategory[] = useSelector(
    (state: RootState) => state.main.sport_categories.world
  );

  // Operation
  const filtered_categories = categories.filter(
    (fc, index) => index >= categoryIndex && index < categoryIndex + 4
  );

  // Function
  const linkToAllNews = (categoryId?: string) => {
    navigate(NEWS_ALL, {
      state: { categoryId, section: ESection.World },
    });
  };

  return (
    <div className="h-11 flex justify-between font-oswald">
      <div className="max-w-[180px] w-full border-b-red-600 border-b text-2xl text-red-600">
        {prefLang === "Tm" ? "Dünýä täzelikler" : "Мировые новости"}
      </div>
      <div
        className="flex justify-end items-center border-b border-black w-full text-white text-xs 
                            gap-3"
      >
        <div
          className={`h-6 px-4 bg-[#0088FF] flex items-center hover:bg-[#0088FF] cursor-pointer`}
          onClick={() => linkToAllNews()}
        >
          {prefLang === "Tm" ? "Hemmesi" : "Все"}
        </div>
        {filtered_categories.map((fc, index) => {
          return (
            <div
              className={`h-6 px-4 bg-[#0E2165] flex items-center hover:bg-[#0088FF] cursor-pointer`}
              key={index}
              onClick={() => linkToAllNews(fc.id)}
            >
              {prefLang === "Tm" ? fc.nameTm : fc.nameRu}
            </div>
          );
        })}
        <div className="flex gap-3">
          <button
            disabled={!(categoryIndex > 0)}
            onClick={() => setCategoryIndex(categoryIndex - 1)}
          >
            <img
              src={prevSvg}
              className={`h-6 w-6 ${
                !(categoryIndex > 0) ? "bg-[#6E748C]" : "bg-[#0E2165]"
              }`}
              alt=""
            />
          </button>
          <button
            disabled={categoryIndex === categories.length - 4}
            onClick={() => setCategoryIndex(categoryIndex + 1)}
          >
            <img
              src={nextSvg}
              className={`${
                categoryIndex === categories.length - 4
                  ? "bg-[#6E748C]"
                  : "bg-[#0E2165]"
              } h-6 w-6 cursor-pointer`}
              alt=""
            />
          </button>
        </div>
      </div>
    </div>
  );
};

interface Props {
  champIndex: number;
  setChampIndex: (i: number) => void;
}

export const ChampionshipsHeader: FC<Props> = ({
  champIndex,
  setChampIndex,
}) => {
  // Hooks
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const championships: [IChampionship[]] = useSelector(
    (state: RootState) => state.home.championships
  );

  return (
    <div className="flex h-11 font-oswald w-full">
      <div
        className={`flex items-center max-w-[150px] w-full border-b border-[#0088FF] text-[#0088FF] 
                  text-sm`}
      >
        {prefLang === "Tm"
          ? champshipNames[championships[champIndex][0]?.type]?.tm
          : champshipNames[championships[champIndex][0]?.type]?.ru}
      </div>
      <span className="border-b border-black w-full flex justify-end">
        <div className="flex gap-3">
          <button
            disabled={!(champIndex > 0)}
            onClick={() => setChampIndex(champIndex - 1)}
          >
            <img
              src={prevSvg}
              className={`h-6 w-6 ${
                !(champIndex > 0) ? "bg-[#6E748C]" : "bg-[#0E2165]"
              }`}
              alt=""
            />
          </button>
          <button
            disabled={champIndex === championships.length - 1}
            onClick={() => setChampIndex(champIndex + 1)}
          >
            <img
              src={nextSvg}
              className={`${
                champIndex === championships.length - 1
                  ? "bg-[#6E748C]"
                  : "bg-[#0E2165]"
              } h-6 w-6 cursor-pointer`}
              alt=""
            />
          </button>
        </div>
      </span>
    </div>
  );
};
