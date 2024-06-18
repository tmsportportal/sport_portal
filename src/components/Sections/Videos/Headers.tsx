import React, { useState } from "react";
import nextSvg from "../../../assets/svg/next.svg";
import prevSvg from "../../../assets/svg/prev.svg";
import { useSelector } from "react-redux";
import { RootState } from "../../../redux/store";
import { ISportCategory } from "../../../redux/interfaces/main";
import { useNavigate } from "react-router-dom";
import { VIDEO_NEWS_ALL } from "../../../tools/links";

export const HeaderWithCategories = () => {
  // Hooks
  const navigate = useNavigate();

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const categories: ISportCategory[] = useSelector(
    (state: RootState) => state.main.sport_categories.video
  );

  // useState
  const [cIndex, setCIndex] = useState(0);

  // Operation
  const sc_visible = categories.filter(
    (i, index) => index >= cIndex && index < cIndex + 4
  );

  // Function
  const linkToAllVideoNews = (categoryId?: string) => {
    navigate(VIDEO_NEWS_ALL, { state: { categoryId } });
  };

  return (
    <div className="h-11 flex justify-between font-oswald">
      <div className="max-w-[180px] w-full border-red-600 border-b text-2xl text-red-600">
        {prefLang === "Tm" ? "Wideo täzelikler" : "Видео новости"}
      </div>
      <div className="flex justify-end items-center border-b border-black w-full text-white text-xs gap-3">
        <div
          className={`h-6 px-4 bg-[#0088FF] flex items-center hover:bg-[#0088FF] cursor-pointer`}
          onClick={() => linkToAllVideoNews()}
        >
          {prefLang === "Tm" ? "Hemmesi" : "Все"}
        </div>
        {sc_visible.map((sc, index) => {
          return (
            <div
              key={index}
              className={`h-6 px-4 bg-[#0E2165] flex items-center hover:bg-[#0088FF] cursor-pointer`}
              onClick={() => linkToAllVideoNews(sc.id)}
            >
              {prefLang === "Tm" ? sc.nameTm : sc.nameRu}
            </div>
          );
        })}
        <div className="flex gap-3">
          <button
            disabled={!(cIndex > 0)}
            onClick={() => setCIndex(cIndex - 1)}
          >
            <img
              src={prevSvg}
              className={`h-6 w-6 ${
                !(cIndex > 0) ? "bg-[#6E748C]" : "bg-[#0E2165]"
              }`}
              alt=""
            />
          </button>
          <button
            disabled={cIndex === categories.length - 4}
            onClick={() => setCIndex(cIndex + 1)}
          >
            <img
              src={nextSvg}
              className={`${
                cIndex === categories.length - 4
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
