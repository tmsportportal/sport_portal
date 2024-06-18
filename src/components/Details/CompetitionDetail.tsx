import React, { useEffect, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import {
  BASE_CATEGORIES,
  APP_ADDRESS,
  SPORTS,
  COMPETITION_ALL,
} from "../../tools/links";
import { RootState } from "../../redux/store";
import { ICompetition } from "../../redux/interfaces/competitions";
import { urlBack } from "../../redux/apiCalls";
import { activateTab } from "../../redux/actions/main";
import { DateTimeFormation } from "../../tools/TimeConverter";

const CompetitionDetail = () => {
  // Hooks
  const { state, pathname } = useLocation();
  const navigate = useNavigate();
  const dispatch = useDispatch();
  useEffect(() => {
    dispatch(activateTab(6));
  }, []);

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const competitions: ICompetition[] = useSelector(
    (state: RootState) => state.competitions.competitions
  );

  // Functions
  const linkToSports = () => {
    navigate(APP_ADDRESS + BASE_CATEGORIES + SPORTS);
  };
  const linkToCompetitionDetail = (competitionId: string) => {
    navigate(pathname, { state: { competitionId } });
  };
  const linkToAllCompetitions = (competitionId?: number) => {
    navigate(pathname + COMPETITION_ALL, { state: { competitionId } });
  };

  // Operations
  const competition = competitions.find((c) => c.id === state.competitionId);
  const same_competitions = competitions.filter(
    (item) => item.typeId === competition?.typeId
  );

  return (
    <div className="flex justify-center pt-9">
      <div className="max-w-[1170px] w-full flex gap-12 font-inter">
        <div>
          <Sorted
            prefLang={prefLang}
            data={competitions}
            link={linkToCompetitionDetail}
          />
        </div>
        <div className="w-full flex flex-col items-center gap-5">
          <p className="font-oswald text-2xl text-[#0F1A42] text-center max-w-[700px] capitalize text-shadow">
            {prefLang === "Tm" ? competition?.nameTm : competition?.nameRu}
          </p>
          <div className="">
            <div className="flex justify-between items-center text-xs">
              <p className="flex justify-center items-center gap-1">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="14"
                  height="12"
                  viewBox="0 0 14 12"
                  fill="none"
                >
                  <path
                    d="M9.19529 6.07798C9.19529 7.29208 8.2142 8.27317 7.0001 8.27317C5.786 8.27317 4.80493 7.29208 4.80493 6.07798C4.80493 4.86388 5.786 3.88281 7.0001 3.88281C8.2142 3.88281 9.19529 4.86388 9.19529 6.07798Z"
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
                {competition?.views}
              </p>
              <p>
                {prefLang === "Tm"
                  ? competition?.locationTm
                  : competition?.locationRu}
                {competition?.createdAt
                  ? " - " + DateTimeFormation(prefLang, competition.createdAt)
                  : ""}
                {prefLang === "Tm" ? "ý" : "г"}
              </p>
            </div>
            <img src={urlBack + competition?.imagePath} alt="" className="max-w-[500px] max-h-[285px]"/>
          </div>
          <p className="text-justify font-inter leading-relaxed">
            {prefLang === "Tm" ? competition?.textTm : competition?.textRu}
          </p>
          <button
            className="uppercase bg-[#0F1A42] text-white font-inter font-semibold h-11 px-5"
            onClick={linkToSports}
          >
            {prefLang === "Tm" ? "GATNAŞMAK ÜÇIN" : "ДЛЯ УЧАСТИЯ"}
          </button>
          <div className="flex flex-col w-full pt-20">
            <div className="flex justify-between w-full font-oswald h-11">
              <p className="border-b border-[#F65050] text-[#F65050] text-2xl w-[350px]">
                {prefLang === "Tm"
                  ? "Meňzeş bäsleşikler"
                  : "Похожие соревнования"}
              </p>
              <div className="border-b border-black w-full" />
              <button
                className="bg-[#077EE6] text-white h-full w-56"
                onClick={() => linkToAllCompetitions(competition?.typeId)}
              >
                {prefLang === "Tm" ? "Hemmesini görmek" : "Посмотреть все"}
              </button>
            </div>
            <div className="flex justify-between pt-4">
              {same_competitions?.slice(0, 4).map((sc, index) => {
                return (
                  <div
                    className="flex flex-col w-[195px] gap-2 cursor-pointer"
                    key={index}
                    onClick={() => linkToCompetitionDetail(sc.id)}
                  >
                    <img
                      src={urlBack + sc.imagePath}
                      className="object-cover h-[145px]"
                      alt=""
                    />
                    <p className="text-[10px] font-inter">
                      {prefLang === "Tm" ? sc.locationTm : sc.locationRu}
                    </p>
                    <p className="text-sm font-oswald font-semibol">
                      {prefLang === "Tm" ? sc.nameTm : sc.nameRu}
                    </p>
                  </div>
                );
              })}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

const Sorted = ({
  prefLang,
  data,
  link,
}: {
  prefLang: string;
  data: ICompetition[];
  link: (competitionId: string) => void;
}) => {
  const [activeTab, setActiveTab] = useState(0);
  const changeTab = (activate: number) => {
    setActiveTab(activate);
    data = data.reverse();
  };

  return (
    <div className="w-[270px] min-w-[270px] mt-20">
      <div className="flex justify-between h-11 font-oswald cursor-pointer">
        <div
          className={`flex items-center border-b text-sm w-full ${
            activeTab === 0
              ? "border-red-600 text-red-600"
              : "border-black w-full text-black"
          }`}
          onClick={() => changeTab(0)}
        >
          {prefLang === "Tm" ? "Bäsleşikler" : "Соревнование"}
        </div>
        <div
          className={`flex items-center justify-center text-sm border-b w-full ${
            activeTab === 1
              ? "border-red-600 text-red-600"
              : "border-black w-full text-black"
          }`}
          onClick={() => changeTab(1)}
        >
          {prefLang === "Tm" ? "Sport çäre" : "Мероприятие"}
        </div>
        <div
          className={`flex items-center justify-end text-sm border-b w-full ${
            activeTab === 2
              ? "border-red-600 text-red-600"
              : "border-black w-full text-black"
          }`}
          onClick={() => changeTab(2)}
        >
          {prefLang === "Tm" ? "Sport okuw" : "Тренировки"}
        </div>
      </div>
      <div className="pt-5">
        {data?.map((e, index) => {
          return (
            <div
              key={index}
              className="flex justify-between items-center pb-4 cursor-pointer"
              onClick={() => link(e?.id)}
            >
              <div className="h-[70px] w-[70px] relative">
                <img
                  src={urlBack + e?.imagePath}
                  className="h-full w-full object-cover object-center"
                  alt=""
                />
              </div>
              <div className="flex flex-col justify-around max-w-[185px] w-full">
                <p className="font-inter text-[8px]">
                  {prefLang === "Tm" ? e?.locationTm : e?.locationRu}
                </p>
                <p className="font-oswald text-[15px] leading-5 max-h-16 overflow-hidden">
                  {prefLang === "Tm" ? e?.nameTm : e?.nameTm}
                </p>
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
};

export default CompetitionDetail;
