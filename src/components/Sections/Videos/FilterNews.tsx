import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import { urlBack } from "../../../redux/apiCalls";
import { useNavigate } from "react-router-dom";
import { VIDEO_DETAILS_PAGE } from "../../../tools/links";
import { IVideoNews } from "../../../redux/interfaces/home";
import { RootState } from "../../../redux/store";
import { DateTimeFormation } from "../../../tools/TimeConverter";

interface Props {
  data: IVideoNews[];
}

const FilterNews = ({ data }: Props) => {
  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);

  // useState
  const [activeTab, setActiveTab] = useState(false);
  const [videos, setNews] = useState(data);

  // Hooks
  const navigate = useNavigate();
  useEffect(() => {
    setNews(data);
  }, [data]);

  // Function
  const changeTab = (activate: boolean) => {
    setActiveTab(activate);
    setNews(data?.reverse());
  };
  const linkToVideoDetail = (videoId: string) => {
    navigate(VIDEO_DETAILS_PAGE, { state: { videoId } });
  };

  return (
    <div className="w-[270px] min-w-[270px] font-inter">
      <div className="flex justify-between h-11 font-oswald cursor-pointer">
        <div
          className={`flex items-center border-b text-sm w-full ${
            !activeTab
              ? "border-red-600 text-red-600"
              : "border-black w-full text-black"
          }`}
          onClick={() => changeTab(false)}
        >
          {prefLang === "Tm" ? "Täzeler" : "Новые"}
        </div>
        <div
          className={`flex items-center justify-end text-sm border-b w-full ${
            activeTab
              ? "border-red-600 text-red-600"
              : "border-black w-full text-black"
          }`}
          onClick={() => changeTab(true)}
        >
          {prefLang === "Tm" ? "Köp okalanlar" : "Самые читаемые"}
        </div>
      </div>
      <div className="pt-5">
        {videos?.slice(0, 8).map((video, index) => {
          return (
            <div
              key={index}
              className="flex justify-between items-center pb-4 cursor-pointer"
              onClick={() => linkToVideoDetail(video.id)}
            >
              <div className="h-[70px] w-[70px] relative">
                <img
                  src={urlBack + video.imagePath}
                  className="h-full w-full object-cover object-center"
                  alt=""
                />
              </div>
              <div className="flex flex-col justify-around max-w-[185px] w-full">
                <p className="text-[8px]">
                  {DateTimeFormation(prefLang, video.createdAt)}
                </p>
                <p className="font-oswald text-[14px] leading-4 text-ellipsis overflow-hidden h-8">
                  {prefLang === "Tm" ? video.nameTm : video.nameRu}
                </p>
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
};

export default FilterNews;
