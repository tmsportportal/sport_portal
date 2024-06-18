import React from "react";
import { useSelector } from "react-redux";
import { RootState } from "../../../redux/store";
import Item from "./Item";
import { ICompetition } from "../../../redux/interfaces/competitions";

const List = () => {
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const competitions: ICompetition[] = useSelector(
    (state: RootState) => state.competitions.competitions
  );

  return (
    <div className="flex flex-col w-full mt-5 gap-14">
      <p className="uppercase ml-16 font-inter text-2xl text-[#182135] text-shadow font-semibold">
        {prefLang === "Tm"
          ? "Tapylan sport bäsleşikleriň netijesi:"
          : "Результаты спортивных соревнований найдены:"}{" "}
        {competitions.length}
      </p>
      <div className="flex flex-wrap justify-between gap-y-14">
        {competitions.map((competition, index) => {
          return <Item data={competition} lang={prefLang} key={index} />;
        })}
      </div>
      <div></div>
    </div>
  );
};

export default List;
