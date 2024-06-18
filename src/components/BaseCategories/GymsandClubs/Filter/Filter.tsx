import React, { useEffect, useState, FormEvent } from "react";
import { POST_GYMS_AND_CLUBS_FILTER } from "../../../../redux/types";
import { useDispatch, useSelector } from "react-redux";
import { RootState } from "../../../../redux/store";
import { Popover } from "./Popover";

const search = (
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
);

const Filter = ({ setListed }: { setListed: (isIt: boolean) => void }) => {
  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const sportTypes: string[] = useSelector(
    (state: RootState) => state.gymsclubs.filters[0]?.filters
  );
  const venues: string[] = useSelector(
    (state: RootState) => state.gymsclubs.filters[1]?.filters
  );
  const environments: string[] = useSelector(
    (state: RootState) => state.gymsclubs.filters[2]?.filters
  );

  // useState
  const [searchString, setSearchString] = useState("");
  const [sportTypesFilter, setSportTypesFilter] = useState("");
  const [venuesFilter, setVenuesFilter] = useState("");
  const [sportEnvironment, setSportEnvironment] = useState("");

  // Hooks
  const dispatch = useDispatch();
  useEffect(() => {
    setVenuesFilter(prefLang === "Tm" ? "Türkmenistan" : "Туркменистан");
    setSportTypesFilter(prefLang === "Tm" ? "Hemmesi" : "Все виды");
    setSportEnvironment(prefLang === "Tm" ? "Hemmesi" : "Все комплексы");
    setSearchString("");
  }, [prefLang]);

  // Functions
  const handleSubmit = (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    setListed(true);
    dispatch({
      type: POST_GYMS_AND_CLUBS_FILTER,
      payload: {
        name: searchString != "" ? searchString : undefined,
        sports: sportTypes.includes(sportTypesFilter)
          ? sportTypesFilter
          : undefined,
        venues: venues.includes(venuesFilter) ? venuesFilter : undefined,
        lang: prefLang,
      },
    });
    setSearchString("");
    window.scrollTo({ top: 850, behavior: "smooth" });
  };

  return (
    <form
      onSubmit={handleSubmit}
      className="border border-[#0088FF] w-full max-w-[1000px] p-9 font-inter flex flex-col gap-7"
    >
      <label htmlFor="" className="flex border border-[#0088FF] px-8 py-5">
        <input
          type="text"
          placeholder={
            prefLang === "Tm"
              ? "Desgalaryň we sport görnüşleriniň adyny giriz..."
              : "Введите название учреждения и спорта..."
          }
          className="w-full font-inter text-base outline-none"
          value={searchString}
          onChange={(e) => setSearchString(e.target.value)}
        />
        {search}
      </label>
      <div className="py-3 text-white font-inter flex justify-between">
        <div className="w-full flex flex-wrap justify-between">
          {/* LOCATIONS */}
          <Popover
            name={venuesFilter}
            all={prefLang === "Tm" ? "Türkmenistan" : "Туркменистан"}
            items={venues}
            setName={setVenuesFilter}
          />
          {/* SPORT TYPES */}
          <Popover
            name={sportTypesFilter}
            all={prefLang === "Tm" ? "Hemmesi" : "Все виды"}
            items={sportTypes}
            setName={setSportTypesFilter}
          />
          {/* SPORT ENVIRONMENTS */}
          <Popover
            name={sportEnvironment}
            all={prefLang === "Tm" ? "Hemmesi" : "Все комплексы"}
            items={environments}
            setName={setSportEnvironment}
          />
        </div>
      </div>
      <button
        type="submit"
        className="uppercase text-white bg-[#0F1A42] h-16 font-inter text-[32px] font-semibold"
      >
        {prefLang === "Tm" ? "Gözlemek" : "Поиск"}
      </button>
    </form>
  );
};

export default Filter;
