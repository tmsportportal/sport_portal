import React, { useEffect } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { IFAthletes } from "../../../redux/interfaces/federations";
import { urlBack } from "../../../redux/apiCalls";
import { useDispatch, useSelector } from "react-redux";
import { RootState } from "../../../redux/store";
import { flags } from "../Athlete";
import { activateTab } from "../../../redux/actions/main";
import Rating from "../Rating";

const AllAhtlete = ({ athletes }: { athletes: IFAthletes[] }) => {
  // Hooks
  const { pathname, state } = useLocation();
  const navigate = useNavigate();
  const dispatch = useDispatch();
  useEffect(() => {
    dispatch(activateTab(3));
  }, []);

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);

  // Function
  const linkToAthleteDetail = (athleteId: string) => {
    navigate(pathname + "/../id", {
      state: { athleteId, federationId: state.federationId },
    });
  };

  return (
    <div className="w-full min-h-screen font-inter">
      <table className="w-full">
        <thead>
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
          {athletes.map((athlete, index) => {
            return (
              <tr
                className="border border-[#0088FF]"
                onClick={() => linkToAthleteDetail(athlete.id)}
              >
                <td className="p-2 font-semibold" align="center">
                  {index + 1}
                </td>
                <td className="p-2 font-semibold cursor-pointer" align="center">
                  <img
                    src={urlBack + athlete.imagePath}
                    className="w-[60px] h-[60px] object-cover"
                    alt=""
                  />
                </td>
                <td
                  className="p-2 font-semibold cursor-pointer uppercase"
                >
                  {prefLang === "Tm" ? athlete.nameTm : athlete.nameRu}
                </td>
                <td className="p-2 font-semibold capitalize" align="center">
                  {prefLang === "Tm" ? athlete.positionTm : athlete.positionRu}
                </td>
                <td className="p-2 font-semibold" align="center">
                  <div className="flex gap-1 w-max items-center capitalize">
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
                <td className="p-2 font-semibold" align="center">
                  <p className="bg-[#CCE6D8] text-[#00843D] uppercase px-2 flex items-center rounded-md w-max text-[10px]">
                    {prefLang === "Tm" ? athlete.madeTm : athlete.madeRu}
                  </p>
                </td>
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );
};

export default AllAhtlete;
