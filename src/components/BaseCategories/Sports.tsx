import React from "react";
import { IFSports } from "../../redux/interfaces/federations";

const Sports = ({ data, prefLang }: { data: IFSports; prefLang: string }) => {
  return (
    <div
      className={`w-full flex justify-between p-8 font-inter text-xl gap-10`}
    >
      <div className="flex w-full">
        <div className="flex flex-col justify-between w-full">
          <p>
            {prefLang === "Tm"
              ? "Başlygy: " + data?.presidentTm
              : "Начальник: " + data?.presidentRu}
          </p>
          <p>{prefLang === "Tm" ? "Baş kätibi: " : "Главный секретарь: "}</p>
          <p>
            {prefLang === "Tm"
              ? "Baş tälimçi: " + data?.leaderTm
              : "Главный тренер: " + data?.leaderRu}
          </p>
          <p>
            {(prefLang === "Tm" ? "Döredilen ýyly: " : "Год учреждения: ") +
              data?.founded}
          </p>
        </div>
        <div className="h-[150px] border-r border-[#40A6FF]" />
      </div>
      <div className="flex flex-col justify-between w-full">
        <p>{(prefLang === "Tm" ? "Telefon: " : "Телефон: ") + data?.tel}</p>
        <p>{(prefLang === "Tm" ? "Faks: " : "Факс: ") + data?.fax}</p>
        <p>
          {prefLang === "Tm" ? "E-mail: " : "Эл. почта: "}
          <a href={`mailto:${data?.email}`}>{data?.email}</a>
        </p>
        <p className="flex gap-3">
          {prefLang === "Tm" ? "Web: " : "Веб: "}
          {data?.web.split(" ").map((item, index) => {
            return (
              <a
                href={item}
                className="hover:underline"
                target="_blank"
                key={index}
                rel="noreferrer"
              >
                {item}
              </a>
            );
          })}
        </p>
        <p>
          {prefLang === "Tm"
            ? "Ýerleşýän ýeri: " + data?.locationTm
            : "Местоположение: " + data?.locationRu}
        </p>
      </div>
    </div>
  );
};

export default Sports;
