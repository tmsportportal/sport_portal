import React from "react";
import SearchBar from "./SearchBar";
import SelectLang from "./SelectLang";
import Account from "./Account";
import { useSelector } from "react-redux";
import { useNavigate } from "react-router-dom";
import { RootState } from "../../../redux/store";
import { daysRu, daysTm, monthsRu, monthsTm } from "../../../tools/constants";

const ToolBox = () => {
  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const weather = useSelector((state: RootState) => state.main.weather);

  // Hooks
  const navigate = useNavigate();

  // Operations
  const d = new Date();
  let year = `${d.getFullYear()}${prefLang === "Tm" ? "ý" : "г"}`;
  let month =
    prefLang === "Tm" ? monthsTm[d.getMonth()] : monthsRu[d.getMonth()];
  let date = d.getDate();
  let day = prefLang === "Tm" ? daysTm[d.getDay()] : daysRu[d.getDay()];

  // Function
  const linkToBase = () => {
    navigate("/");
  };

  return (
    <section className="w-full h-16 font-inter text-xs flex justify-center">
      <div className="flex justify-between max-w-[1170px] w-full h-full">
        <div className="flex flex-col justify-around w-full">
          <p>{day + ", " + date + " " + month + " " + year}</p>
          <p>
            {prefLang === "Tm"
              ? `${weather}°C Aşgabat`
              : `В Ашхабаде ${weather}°C`}
          </p>
        </div>
        <div
          className="flex gap-3 items-center cursor-pointer min-w-max"
          onClick={linkToBase}
        >
          <img
            src="/icons/toolbox/logo.png"
            className="w-[90px] h-[50px] object-cove object-contain"
            alt=""
          />
          <span className="flex">
            <p className="text-[#0F1A42] text-4xl font-oswald uppercase">
              Sport
            </p>
            <p className="text-[#08F] text-4xl font-oswald uppercase">Portal</p>
          </span>
        </div>
        <div className="flex flex-col justify-around items-end w-full">
          <div className="flex items-center gap-3">
            <SearchBar prefLang={prefLang} />
            <hr className="border-l h-full" />
            <SelectLang />
          </div>
          <Account />
        </div>
      </div>
    </section>
  );
};

export default ToolBox;
