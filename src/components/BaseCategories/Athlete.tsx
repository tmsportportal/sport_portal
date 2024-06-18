import React from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { IFederations } from "../../redux/interfaces/federations";
import { urlBack } from "../../redux/apiCalls";
import { RootState } from "../../redux/store";
import { useSelector } from "react-redux";
import Rating from "./Rating";

export const flags = [
  { flag: "/images/federations/flag_2.png", key: "kitchee" },
  { flag: "/images/federations/flag_1.png", key: "ahal" },
  { flag: "/images/federations/flag_1.png", key: "arkadag" },
];

const Athlete = ({ federation }: { federation: IFederations }) => {
  // Hooks
  const navigate = useNavigate();
  const { pathname } = useLocation();

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);

  // Function
  const linkToAthleteDetail = (athleteId: string) => {
    navigate(pathname + "/id", {
      state: { athleteId, federationId: federation.id },
    });
  };
  const linkToAllAthlete = () => {
    navigate(pathname + "/all", {
      state: { federationId: federation.id },
    });
  };

  return (
    <div className="text-[#0F1A42] font-inter px-8 pt-8">
      <div className="w-full h-[410px] overflow-auto">
        <table className="w-full max-w-[99%]">
          <thead className="">
            <tr className="h-[13px] text-[11px] border border-[#0088FF]">
              <td className="" align="center">
                №
              </td>
              <td className="" align="center">
                {prefLang === "Tm" ? "Surady" : "Фото"}
              </td>
              <td className="" align="center">
                {prefLang === "Tm" ? "Ady we familiýasy" : "Имя и фамилия"}
              </td>
              {/* <td className="" align="center">
                Sport görnüşi
              </td> */}
              <td className="" align="center">
                {prefLang === "Tm" ? "Orny" : "Позиция"}
              </td>
              <td className="" align="center">
                {prefLang === "Tm" ? "Toparynyň ady" : "Название команды"}
              </td>
              <td className="" align="center">
                {prefLang === "Tm" ? "Reýtingi" : "Рейтинг"}
              </td>
              <td className="" align="center"></td>
            </tr>
          </thead>
          <tbody className="text-base lowercase">
            {federation.fathlete?.map((athlete, index) => {
              return (
                <tr
                  key={index}
                  className="border border-[#0088FF]"
                  onClick={() => linkToAthleteDetail(athlete.id)}
                >
                  <td className="p-2 font-semibold" align="center">
                    {index + 1}
                  </td>
                  <td
                    className="p-2 font-semibold cursor-pointer"
                    align="center"
                  >
                    <img
                      src={urlBack + athlete.imagePath}
                      className="w-[60px] h-[60px] object-cover"
                      alt=""
                    />
                  </td>
                  <td className="p-2 font-semibold cursor-pointer capitalize">
                    {prefLang === "Tm" ? athlete.nameTm : athlete.nameRu}
                  </td>
                  <td className="p-2 font-semibold capitalize" align="center">
                    {prefLang === "Tm"
                      ? athlete.positionTm
                      : athlete.positionRu}
                  </td>
                  <td className="p-2 font-semibold" align="center">
                    <div className="flex gap-1 w-max capitalize items-center">
                      <img
                        src={
                          flags.find((f) =>
                            athlete.club?.toLocaleLowerCase().includes(f.key)
                          )?.flag
                        }
                        className="w-[26px] h-[18px] object-cover"
                        alt=""
                      />
                      {athlete.club}
                    </div>
                  </td>
                  <td className="p-2 font-semibold w-0" align="center">
                    <Rating
                      className="h-[15px]"
                      value={athlete.rating}
                      readonly
                      gap="gap-1"
                    />
                  </td>
                  <td className="p-2 font-semibold uppercase" align="center">
                    <p className="bg-[#CCE6D8] text-[#00843D] px-2 flex items-center rounded-md w-max text-[10px]">
                      {prefLang === "Tm" ? athlete.madeTm : athlete.madeRu}
                    </p>
                  </td>
                </tr>
              );
            })}
          </tbody>
        </table>
      </div>
      <div className="px-[15px] py-1 flex justify-end">
        <button
          className="bg-[#077EE6] text-white h-[44px] w-[148px] font-oswald text-base"
          onClick={() => {
            linkToAllAthlete();
          }}
        >
          {prefLang === "Tm" ? "Hemmesini görmek" : "Посмотреть все"}
        </button>
      </div>
    </div>
  );
};

export default Athlete;
