import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import Filter from "./Filter/Filter";
import ListofFacility from "./List";
import OpenStreetMap from "./Map";
import { useLocation } from "react-router-dom";
import GACDetail from "../../Details/GACDetail";
import {
  GET_GYMS_AND_CLUBS_FILTER,
  POST_GYMS_AND_CLUBS_FILTER,
} from "../../../redux/types";
import { RootState } from "../../../redux/store";

const GymsAndClubs = () => {
  const { pathname } = useLocation();
  const [isListed, setListed] = useState(false);
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const dispatch = useDispatch();
  dispatch({ type: GET_GYMS_AND_CLUBS_FILTER, payload: prefLang });

  if (pathname.includes("detail")) {
    dispatch({ type: POST_GYMS_AND_CLUBS_FILTER, payload: prefLang });

    return <GACDetail />;
  } else {
    return (
      <div className="flex justify-center pt-8">
        <div className="w-full flex flex-col items-center gap-16">
          <div className="max-w-[700px] w-full">
            <p className="text-[#0F1A42] font-oswald text-4xl text-center capitalize leading-normal text-shadow">
              {prefLang === "Tm"
                ? "Türkmenistandaky ähli sport toplumlary we onda hereket edýän sport toparlary"
                : "Все спортивные комплексы и спортивные команды, действующие в Туркменистане"}
            </p>
          </div>
          <Filter setListed={setListed} />
          <OpenStreetMap />
          <ListofFacility isListed={isListed} />
        </div>
      </div>
    );
  }
};

export default GymsAndClubs;
