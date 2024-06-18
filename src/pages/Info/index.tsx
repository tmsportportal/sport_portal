import React, { FC } from "react";
import { useSelector } from "react-redux";
import { RootState } from "../../redux/store";
import AboutUs from "./AboutUs";
import Privacy from "./Privacy";

interface Props {
  privacy?: boolean;
}

const Info: FC<Props> = ({ privacy }) => {
  const prefLang = useSelector((state: RootState) => state.main.prefLang);

  return (
    <div className="flex justify-center font-inter">
      <div className="max-w-[1170px] flex pt-9 gap-20">
        {/* Part 1 */}
        <div className="min-w-[270px] flex flex-col items-center gap-5 pt-10">
          <img
            src="images/aboutus.png"
            alt=""
            className="w-[270px] h-[190px]"
          />
          <div className="text-center max-w-[]">
            <p className="font-semibold">SPORTPORTAL</p>
            <p>
              {prefLang === "Tm"
                ? "Ýurdumyzyň ilkinji sport platformasy"
                : "Первая спортивная платформа страны"}
            </p>
          </div>
          <table className="text-white bg-[#0088FF] w-full text-center">
            <tr>
              <td className="text-3xl p-3 font-semibold">-</td>
              <td className="text-start pl-2">
                {prefLang === "Tm" ? "Sport toplum" : "Спорт комплексы"}
              </td>
            </tr>
            <tr>
              <td className="text-3xl p-3 font-semibold">-</td>
              <td className="text-start pl-2">
                {prefLang === "Tm" ? "Sport mekdep" : "Спорт школы"}
              </td>
            </tr>
            <tr>
              <td className="text-3xl p-3 font-semibold">-</td>
              <td className="text-start pl-2">
                {prefLang === "Tm" ? "Sport görnüş" : "Тип спорта"}
              </td>
            </tr>
            <tr>
              <td className="text-3xl p-3 font-semibold">-</td>
              <td className="text-start pl-2">
                {prefLang === "Tm" ? "Türgenleşik zal" : "Тренажерные залы"}
              </td>
            </tr>
          </table>
        </div>

        {/* Part 2 */}
        {privacy ? <Privacy /> : <AboutUs lang={prefLang} />}
      </div>
    </div>
  );
};

export default Info;
