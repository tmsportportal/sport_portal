import React, { useEffect, useState } from "react";
import List from "../BaseCategories/GymsandClubs/List";
import { useLocation } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import location from "../../assets/svg/location.svg";
import call from "../../assets/svg/call.svg";
import email from "../../assets/svg/email.svg";
import link from "../../assets/svg/link.svg";
import left from "../BaseCategories/GymsandClubs/svg/left.svg";
import right from "../BaseCategories/GymsandClubs/svg/right.svg";
import { RootState } from "../../redux/store";
import { IGymsAndClubs } from "../../redux/interfaces/gymsclubs";
import { urlBack } from "../../redux/apiCalls";
import { activateTab } from "../../redux/actions/main";

const GACDetail = () => {
  // Hooks
  const { pathname, state } = useLocation();
  const dispatch = useDispatch();
  useEffect(() => {
    dispatch(activateTab(4));
  }, [pathname]);

  // useState
  const [indexImage, setIndexImage] = useState(0);

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const gymsclubs: IGymsAndClubs[] = useSelector(
    (state: RootState) => state.gymsclubs.gymsclubs
  );

  // Operation
  const data = gymsclubs.find((gc) => gc.id === state.gymsclubsId);
  const images = [
    data?.imagePath1,
    data?.imagePath2,
    data?.imagePath3,
    data?.imagePath4,
    data?.imagePath5,
  ];

  return data ? (
    <div className="flex justify-center pt-9 font-inter">
      <div className="flex flex-col max-w-[1170px] w-full">
        <div className="flex justify-end">
          <p className="max-w-[850px] w-full text-center font-oswald text-[26px] text-[#0F1A42] px-72 capitalize text-shadow">
            {prefLang === "Tm" ? data.nameTm : data.nameRu}
          </p>
        </div>
        <div className="flex w-full justify-between">
          <div className="w-full max-w-[300px]">
            <p className="uppercase text-[#0088FF] font-oswald text-sm h-6 px-5">
              {prefLang === "Tm" ? "Habarlaşmak üçin" : "Контакты"}
            </p>
            <div className="flex flex-col border border-[#0088FF] p-5 gap-7">
              <p className="flex text-sm gap-7 text-[#182135]">
                <img src={location} alt="" />
                {prefLang === "Tm" ? data.locationTm : data.locationRu}
              </p>
              <p className="flex text-sm gap-7 text-[#182135]">
                <img src={call} alt="" />
                <div>
                  {data.tel.map((t, i) => {
                    return <p key={i}>{t}</p>;
                  })}
                </div>
              </p>
              <p className="flex text-sm gap-7 text-[#182135]">
                <img src={email} alt="" />
                {data.email}
              </p>
              <p className="flex text-sm gap-7 text-[#182135]">
                <img src={link} alt="" />
                <a
                  href={data.link}
                  className="hover:underline truncate"
                  target="_blank"
                  rel="noreferrer"
                >
                  {data.link}
                </a>
              </p>
            </div>
            <div className="flex flex-col bg-[#0088FF] text-white py-5 gap-4 font-semibold">
              <div className="flex">
                <p className="flex justify-center items-center max-w-[70px] w-full">
                  {data.sportsTm.length > 0 ? data.sportsTm.length : "-"}
                </p>
                <p className="w-full">
                  {prefLang === "Tm" ? "Sport görnüşi" : "Видов спорта"}
                </p>
              </div>
              <div className="flex">
                <p className="flex justify-center items-center max-w-[70px] w-full">
                  -
                </p>
                <p className="w-full">
                  {prefLang === "Tm" ? "Tälimçileriň sany" : "Тренеров"}
                </p>
              </div>
              <div className="flex">
                <p className="flex justify-center items-center max-w-[70px] w-full">
                  -
                </p>
                <p className="w-full">
                  {prefLang === "Tm" ? "Türgenleriň sany" : "Спортсменов"}
                </p>
              </div>
            </div>
          </div>
          <div className="max-w-[850px] w-full">
            <p className="text-base flex items-center gap-2 h-6">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="20"
                height="18"
                viewBox="0 0 20 18"
                fill="none"
                className="w-[18px] h-4"
              >
                <path
                  d="M13.2931 8.616C13.2931 10.4371 11.8214 11.9088 10.0003 11.9088C8.17912 11.9088 6.70752 10.4371 6.70752 8.616C6.70752 6.79484 8.17912 5.32324 10.0003 5.32324C11.8214 5.32324 13.2931 6.79484 13.2931 8.616Z"
                  stroke="#0088FF"
                  stroke-opacity="0.4"
                  stroke-width="1.8"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                />
                <path
                  d="M10 16.2223C13.2468 16.2223 16.2729 14.3092 18.3792 10.998C19.2069 9.70109 19.2069 7.52122 18.3792 6.22432C16.2729 2.91313 13.2468 1 10 1C6.75319 1 3.72713 2.91313 1.62085 6.22432C0.793051 7.52122 0.793051 9.70109 1.62085 10.998C3.72713 14.3092 6.75319 16.2223 10 16.2223Z"
                  stroke="#0088FF"
                  stroke-opacity="0.4"
                  stroke-width="1.8"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                />
              </svg>
              {data.views}
            </p>
            <div className="relative max-w-[850px]">
              <img
                alt=""
                src={urlBack + images[indexImage]}
                className="h-[550px] w-full object-cover"
              />
              <img
                alt=""
                src={right}
                onClick={() =>
                  setIndexImage(
                    indexImage < 1 ? images.length - 1 : indexImage - 1
                  )
                }
                className="absolute top-[50%] left-10 cursor-pointer hover:scale-125 transition-transform duration-300"
              />
              <img
                alt=""
                src={left}
                onClick={() => setIndexImage((indexImage + 1) % 5)}
                className="absolute top-[50%] right-10 cursor-pointer hover:scale-125 transition-transform duration-300"
              />
            </div>
            <div className="flex justify-between w-full pt-5">
              {images.map((image, index) => {
                return (
                  index !== indexImage && (
                    <img
                      src={urlBack + image}
                      className="w-[195px] h-[145px] object-cover"
                      alt=""
                    />
                  )
                );
              })}
            </div>
          </div>
        </div>
        <div className="pt-10">
          <List isListed />
        </div>
      </div>
    </div>
  ) : (
    <></>
  );
};

export default GACDetail;
