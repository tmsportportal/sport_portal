import React, { useState, FormEvent } from "react";
import { useDispatch, useSelector } from "react-redux";
import { RootState } from "../../../redux/store";
import Datepicker from "react-tailwindcss-datepicker";
import { DateValueType } from "react-tailwindcss-datepicker/dist/types";
import { POST_COMPETITION_FILTER } from "../../../redux/types";
import { Popover } from "../GymsandClubs/Filter/Popover";

const Filter = () => {
  // Hooks
  const dispatch = useDispatch();

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const competitionTypes: string[] = useSelector(
    (state: RootState) => state.competitions.filters[0]?.filters
  );
  const venues: string[] = useSelector(
    (state: RootState) => state.competitions.filters[1]?.filters
  );

  // useState
  const [searchString, setSearchString] = useState("");
  const [filterType, setFilterType] = useState("");
  const [filterVenues, setFilterVenues] = useState("");
  const [filterDate, setFilterDate] = useState<DateValueType>({
    startDate: null,
    endDate: null,
  });

  // Functions
  const handleFilterDate = (newDate: DateValueType) => {
    setFilterDate(newDate);
  };
  const searchCompetition = (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    dispatch({
      type: POST_COMPETITION_FILTER,
      payload: {
        lang: prefLang,
        name: searchString ? searchString : undefined,
        competitionTypes: competitionTypes.includes(filterType)
          ? filterType
          : undefined,
        venues: venues.includes(filterVenues) ? filterVenues : undefined,
        startDate:
          filterDate?.startDate != null ? filterDate?.startDate : undefined,
        endDate: filterDate?.endDate != null ? filterDate?.endDate : undefined,
      },
    });
    window.scrollTo({ top: 950, behavior: "smooth" });
  };

  return (
    <form
      className="max-w-[1000px] w-full border border-[#0088FF] p-9 flex gap-7 font-inter"
      onSubmit={searchCompetition}
    >
      <div className="w-full flex flex-col gap-7">
        <label htmlFor="" className="flex border border-[#0088FF] px-8 py-5">
          <input
            type="text"
            value={searchString}
            placeholder={
              prefLang === "Tm"
                ? "Ýurdumyzda geçirilýän bäsleşikleri gözle..."
                : "Поиск соревнований, проводимых в стране..."
            }
            className="w-full font-inter text-base outline-none"
            onChange={(e) => setSearchString(e.target.value)}
          />
          <svg width="32" height="32" viewBox="0 0 32 32" fill="none">
            <path
              d="M0.75 15.3027C0.75 23.3247 7.2807 29.8554 15.3027 29.8554C23.3247 29.8554 29.8554 23.3247 29.8554 15.3027C29.8554 7.2807 23.3247 0.75 15.3027 0.75C7.2807 0.75 0.75 7.2807 0.75 15.3027ZM3.34308 15.3027C3.34308 8.71482 8.70124 3.34308 15.3027 3.34308C21.9041 3.34308 27.2623 8.71482 27.2623 15.3027C27.2623 21.8906 21.9041 27.2623 15.3027 27.2623C8.70124 27.2623 3.34308 21.8906 3.34308 15.3027Z"
              fill="#182135"
              stroke="#182135"
              stroke-width="0.5"
            />
            <path
              d="M29.0386 30.8693C29.2972 31.128 29.6271 31.2495 29.9549 31.2495C30.2828 31.2495 30.6126 31.128 30.8712 30.8693C31.3735 30.367 31.3735 29.5389 30.8712 29.0366L28.0805 26.2459C27.5782 25.7436 26.7501 25.7436 26.2478 26.2459C25.7455 26.7482 25.7455 27.5762 26.2478 28.0785L29.0386 30.8693Z"
              fill="#182135"
              stroke="#182135"
              stroke-width="0.5"
            />
          </svg>
        </label>
        <div className="w-full flex flex-wrap justify-between text-white">
          <Popover
            name={filterType}
            all={prefLang === "Tm" ? "Hemmesi" : "Все"}
            items={competitionTypes}
            setName={setFilterType}
          />
          <Popover
            name={filterVenues}
            all={prefLang === "Tm" ? "Türkmenistan" : "Туркменистан"}
            items={venues}
            setName={setFilterVenues}
          />
        </div>
        <button
          type="submit"
          className="h-[68px] bg-[#0F1A42] text-white text-[32px] font-semibold"
        >
          {prefLang === "Tm" ? "GÖZLEMEK" : "ПОИСК"}
        </button>
      </div>
      <div className="max-w-[314px] w-full">
        <Datepicker
          useRange={false}
          value={filterDate}
          onChange={handleFilterDate}
          placeholder={
            prefLang === "Tm"
              ? "Sene aralygynda saýlaň!"
              : "Выберите диапазон дат!"
          }
          i18n={prefLang === "Tm" ? "tk" : "ru"}
          popoverDirection="down"
          readOnly={true}
          startWeekOn={"mon"}
          inputClassName={`rounded-none w-full py-6 pl-8 outline-none border border-[#0088FF]`}
        />
      </div>
    </form>
  );
};

export default Filter;
