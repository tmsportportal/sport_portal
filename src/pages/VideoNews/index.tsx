import React, { useEffect } from "react";
import playVideoSvg from "../../assets/svg/playvideo.svg";
import { useDispatch, useSelector } from "react-redux";
import { useLocation, useNavigate } from "react-router-dom";
import { RootState } from "../../redux/store";
import { ESection, IVideoNews } from "../../redux/interfaces/home";
import { VIDEO_DETAILS_PAGE } from "../../tools/links";
import { urlBack } from "../../redux/apiCalls";
import { BG_COLORS } from "../../tools/constants";
import { GET_VIDEO_NEWS } from "../../redux/types";
import { DateTimeFormation } from "../../tools/TimeConverter";

const VideoNewsAll = () => {
  // Hooks
  const navigate = useNavigate();
  const { state } = useLocation();
  const dispatch = useDispatch();
  useEffect(() => {
    dispatch({
      type: GET_VIDEO_NEWS,
      payload: { section: ESection.Video, lang: prefLang },
    });
  }, []);

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  var videos: IVideoNews[] = useSelector(
    (state: RootState) => state.home.video_news
  );

  // Operation
  videos =
    (state.categoryId &&
      videos.filter((vna) => vna.categoryId === state.categoryId)) ||
    videos;

  // Function
  const linkToVideoDetail = (videoId: string) => {
    navigate("/../" + VIDEO_DETAILS_PAGE, { state: { videoId } });
  };

  return videos ? (
    <div className="flex justify-center pt-9 font-inter">
      <div className="max-w-[1170px] flex flex-col w-full">
        <div className="flex">
          <p className="border-b border-[#077EE6] text-[#077EE6] w-full max-w-xs font-oswald text-2xl">
            {prefLang === "Tm"
              ? state.categoryId
                ? videos[0]?.category.nameTm
                : "Hemmesi"
              : state.categoryId
              ? videos[0]?.category.nameRu
              : "Все"}
          </p>
          <p className="w-full border-b border-black"></p>
        </div>
        <div className="flex flex-wrap gap-5 pt-3 justify-center">
          {videos.map((video, index) => {
            return (
              <div
                className="flex flex-col max-w-[270px] w-full cursor-pointer"
                key={index}
                onClick={() => linkToVideoDetail(video.id)}
              >
                <div className="relative h-[200px]">
                  <img
                    src={urlBack + video.imagePath}
                    className="object-cover h-full w-full"
                    alt=""
                  />
                  <div className="absolute inset-0 m-0 bg-gradient-to-t from-black/60 to-black/50 " />
                  <div className="absolute top-1/2 left-1/2 h-[38px] w-[38px] ">
                    <img
                      src={playVideoSvg}
                      className="-translate-x-1/2 -translate-y-1/2"
                      alt=""
                    />
                  </div>
                  <div
                    className={`absolute top-6 left-6 h-5 ${
                      BG_COLORS[Math.floor(Math.random() * BG_COLORS.length)]
                    } w-max text-white text-[9px] flex items-center`}
                  >
                    <p className="px-3">
                      {video.category
                        ? prefLang === "Tm"
                          ? video.category.nameTm
                          : video.category.nameRu
                        : ""}
                    </p>
                  </div>
                </div>
                <p className="pt-6 text-[10px]">
                  {DateTimeFormation(prefLang, video.createdAt)}
                </p>
                <p className="pt-1 font-oswald text-sm font-semibold">
                  {prefLang === "Tm" ? video.nameTm : video.nameRu}
                </p>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  ) : (
    <></>
  );
};

export default VideoNewsAll;
