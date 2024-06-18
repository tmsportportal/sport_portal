import React from "react";
import { ICompetition } from "../../../redux/interfaces/competitions";
import competition from "../../../assets/svg/competition.svg";
import actitvity from "../../../assets/svg/actitvity.svg";
import training from "../../../assets/svg/training.svg";
import { useLocation, useNavigate } from "react-router-dom";
import { urlBack } from "../../../redux/apiCalls";
import { monthsRu, monthsTm } from "../../../tools/constants";
import { DateTimeFormation } from "../../../tools/TimeConverter";

const icons = [
  { key: "bäsleşik", svg: competition },
  { key: "sport çäre", svg: actitvity },
  { key: "sport okuw", svg: training },
];

const Item = ({ data, lang }: { data: ICompetition; lang: string }) => {
  const navigate = useNavigate();
  const { pathname } = useLocation();
  const linkTo = () => {
    navigate(pathname + "/id", { state: { competitionId: data.id } });
  };

  return (
    <div
      className="flex flex-col w-[260px] text-center font-inter gap-3 cursor-pointer"
      onClick={linkTo}
    >
      <div className="border border-black ">
        <div className="bg-[#DBEEFF] py-2 flex justify-center gap-3 items-center">
          <img
            src={
              icons.find((i) =>
                data.competitionType?.nameTm.toLocaleLowerCase().includes(i.key)
              )?.svg
            }
            alt=""
          />
          <p className="font-semibold">
            {lang === "Tm"
              ? data.competitionType?.nameTm
              : data.competitionType?.nameRu}
          </p>
        </div>
        <div>
          <img
            src={urlBack + data.imagePath}
            alt=""
            className="w-full h-[200px] object-cover object-center"
          />
        </div>
      </div>
      <p className="text-[10px] text-start">
        {`${lang === "Tm" ? data.locationTm : data.locationRu}` +
          " - " +
          DateTimeFormation(lang, data.createdAt)}
        {lang === "Tm" ? "ý" : "г"}
      </p>
      <p className="font-oswald text-sm text-left text-shadow">
        {lang === "Tm" ? data.nameTm : data.nameRu}
      </p>
    </div>
  );
};

export default Item;
