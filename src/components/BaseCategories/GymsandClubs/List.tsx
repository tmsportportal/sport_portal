import React, { useState } from "react";
import { useSelector } from "react-redux";
import nextSvg from "../../../assets/svg/next.svg";
import prevSvg from "../../../assets/svg/prev.svg";
import { useLocation, useNavigate } from "react-router-dom";
import { RootState } from "../../../redux/store";
import { IGymsAndClubs } from "../../../redux/interfaces/gymsclubs";

const theadersTm = [
  "№",
  "Ady",
  "Ýerleşýän ýeri",
  "Tel belgisi",
  "Sport görnüşleri",
  "Iş wagty",
];
const theadersRu = [
  "№",
  "Имя",
  "Расположение",
  "Номер телефона",
  "Виды спорта",
  "Рабочее время",
];

const List = ({ isListed }: { isListed: boolean }) => {
  // Hooks
  const { pathname } = useLocation();
  const navigate = useNavigate();

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const gymsclubs: IGymsAndClubs[] = useSelector(
    (state: RootState) => state.gymsclubs.gymsclubs
  );

  // useState
  const [paginate, setPaginate] = useState(0);

  // Operation
  const table_body = gymsclubs.filter(
    (b, i) => i >= paginate && i < paginate + 5
  );
  let paginator = [];
  for (let i = 0; i < gymsclubs.length / 5; i++) {
    paginator.push(
      <button className="bg-[#0F1A42] px-2" onClick={() => setPaginate(i * 5)}>
        {i + 1}
      </button>
    );
  }

  // Function
  const linkToGACDetail = (gymsclubsId: string) => {
    navigate(pathname + (pathname.includes("/detail") ? "" : "/detail"), {
      state: { gymsclubsId },
    });
  };

  return isListed ? (
    <div className="max-w-[1170px] w-full font-inter text-[#182135] font-semibold">
      <p className="uppercase text-xl px-8 py-10 text-shadow">
        {prefLang === "Tm"
          ? "TAPYLAN SPORT DESGALARYŇ SANAWY:"
          : "СПИСОК НАЙДЕННЫХ СПОРТИВНЫХ ОБЪЕКТОВ:"}
      </p>
      <table className="border border-[#0088FF] w-full">
        <thead className="bg-[#A9CFEF] h-[74px] font-inter">
          {theadersTm.map((header, index) => {
            return (
              <th className="" key={index}>
                {prefLang === "Tm" ? header : theadersRu[index]}
              </th>
            );
          })}
        </thead>
        <br />
        <br />
        <tbody>
          {table_body.length ? (
            table_body.map((tb, index) => {
              return (
                <tr
                  key={index}
                  className={`${
                    index % 2 !== 0 ? "bg-[#A9CFEF4D]" : ""
                  } cursor-pointer`}
                  onClick={() => linkToGACDetail(tb.id)}
                >
                  <td className=" min-w-[30px]">
                    <p className="flex items-center justify-center">
                      {index + 1}.
                    </p>
                  </td>
                  <td className="border-l px-4 py-8 max-w-[220px]">
                    <p className="flex items-center justify-center text-center">
                      {prefLang === "Tm" ? tb.nameTm : tb.nameRu}
                    </p>
                  </td>
                  <td className="border-l px-4 py-8 max-w-[220px]">
                    <p className="flex items-center justify-center text-center">
                      {prefLang === "Tm" ? tb.locationTm : tb.locationRu}
                    </p>
                  </td>
                  <td className="border-l px-4 py-8">
                    <p className="flex flex-col items-center justify-center">
                      {tb.tel.map((t, i) => {
                        return <p key={i}>{t}</p>;
                      })}
                    </p>
                  </td>
                  <td className="border-l max-w-[200px] px-4 py-8">
                    <p className="text-center">
                      {tb.sportsTm.map((s, i) => {
                        return (prefLang === "Tm" ? s : tb.sportsRu[i]) + " ";
                      })}
                    </p>
                  </td>
                  <td className="border-l px-4 py-8">
                    <p className="flex flex-col items-center justify-center">
                      {tb.openAtTm.map((o, i) => {
                        return (
                          <p key={i}>
                            {prefLang === "Tm" ? o : tb.openAtRu[i]}
                          </p>
                        );
                      })}
                    </p>
                  </td>
                </tr>
              );
            })
          ) : (
            <p className=" text-right">
              {prefLang === "Tm" ? "Maglumat ýok" : "Нет доступных данных"}
            </p>
          )}
        </tbody>
        <tfoot>
          <th colSpan={6}>
            <div className="py-5 px-14 w-full flex justify-end text-white font-normal gap-2 text-xs">
              {paginator}
              <button
                disabled={paginate < 1}
                onClick={() => setPaginate(paginate - 5)}
              >
                <img
                  src={prevSvg}
                  className={`cursor-pointer ${
                    paginate > 0 ? "bg-[#0F1A42]" : "bg-[#6E748C]"
                  }`}
                  alt=""
                />
              </button>
              <button
                disabled={table_body.length < 5}
                onClick={() => setPaginate(paginate + 5)}
              >
                <img
                  src={nextSvg}
                  className={`cursor-pointer ${
                    table_body.length === 5 ? "bg-[#0F1A42]" : "bg-[#6E748C]"
                  }`}
                  alt=""
                />
              </button>
            </div>
          </th>
        </tfoot>
      </table>
    </div>
  ) : (
    <></>
  );
};

export default List;
