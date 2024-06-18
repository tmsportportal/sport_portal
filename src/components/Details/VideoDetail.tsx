import React from "react";
import { useSelector } from "react-redux";
import { useLocation, useNavigate } from "react-router-dom";
import { urlBack } from "../../redux/apiCalls";
import playvideo from "../../assets/svg/playvideo.svg";
import { IVideoNews } from "../../redux/interfaces/home";
import { RootState } from "../../redux/store";
import {
  DateTimeFormation,
  DateTimeToPassedTime,
} from "../../tools/TimeConverter";
import { VIDEO_NEWS_ALL } from "../../tools/links";

const VideoDetail = () => {
  // Hooks
  const { state } = useLocation();
  const navigate = useNavigate();

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const videos: IVideoNews[] = useSelector(
    (state: RootState) => state.home.video_news
  );

  // Operation
  const video = videos.find((video) => video.id === state.videoId);
  const uploadedAt = DateTimeToPassedTime(prefLang, video?.updatedAt);

  const [same_video_main, ...same_videos] = videos.filter(
    (v) => v.id !== video?.id
  );

  // Function
  const linkToVideoDetail = (videoId: string) => {
    navigate("", { state: { videoId } });
  };
  const linkToAllVideos = (categoryId?: string) => {
    navigate("/.." + VIDEO_NEWS_ALL, { state: { categoryId } });
  };

  return (
    <div className="flex justify-center w-full pt-9 font-inter">
      <div className="flex items-center w-full flex-col text-[#0F1A42] max-w-[1170px]">
        <p className="font-oswald text-[50px] max-w-[90%] text-center">
          {prefLang === "Tm" ? video?.nameTm : video?.nameRu}
        </p>
        <div className="w-full">
          <div className="flex w-full justify-between">
            <p className="text-base flex justify-center items-center gap-2">
              <svg width="20" height="18" viewBox="0 0 20 18" fill="none">
                <path
                  d="M13.2931 8.61587C13.2931 10.437 11.8214 11.9087 10.0003 11.9087C8.17912 11.9087 6.70752 10.437 6.70752 8.61587C6.70752 6.79472 8.17912 5.32312 10.0003 5.32312C11.8214 5.32312 13.2931 6.79472 13.2931 8.61587Z"
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
              {video?.views}
            </p>
            <p className="text-base">{uploadedAt}</p>
          </div>
          <video
            src={urlBack + video?.videoPath}
            width={"100%"}
            controls
            autoPlay
          >
            {prefLang === "Tm"
              ? "Siziň browseriňiz bu wideony açyp bilmeýär!"
              : "Ваш браузер не поддерживает это видео"}
          </video>
        </div>
        <div className="w-full pt-24 flex flex-col gap-8">
          <div className="flex justify-between font-oswald">
            <div className="border-b border-[#F65050] w-60">
              <p className="text-2xl text-[#F65050] my-1">
                {prefLang === "Tm" ? "Meňzeş täzelikler" : "Подобные новости"}
              </p>
            </div>
            <div className="w-full border-b border-black flex justify-end" />
            <button
              className="text-sm bg-[#077EE6] text-white h-full w-40"
              onClick={() => linkToAllVideos(video?.categoryId)}
            >
              {prefLang === "Tm" ? "Hemmesini görmek" : "Посмотреть все"}
            </button>
          </div>
          <div className="flex justify-between text-2xl">
            <div
              className="flex flex-col justify-between cursor-pointer"
              onClick={() => linkToVideoDetail(same_video_main?.id)}
            >
              <div className="h-[400px] w-[660px] relative">
                <img
                  src={playvideo}
                  className="absolute top-[160px] left-[300px]"
                  alt=""
                />
                <img
                  src={urlBack + same_video_main?.imagePath}
                  className="object-cover h-full w-full"
                  alt=""
                />
              </div>
              <p className="text-xs">
                {DateTimeFormation(prefLang, same_video_main.createdAt)}
              </p>
              <p className="font-semibold max-w-[550px] font-oswald">
                {prefLang === "Tm"
                  ? same_video_main?.nameTm
                  : same_video_main?.nameRu}
              </p>
            </div>
            <div className="flex flex-col gap-4">
              {same_videos.slice(0, 3).map((sv, index) => {
                return (
                  <div
                    className="flex h-[165px] gap-4 cursor-pointer"
                    key={index}
                    onClick={() => linkToVideoDetail(sv.id)}
                  >
                    <div className="relative w-[182px] h-full">
                      <img
                        src={playvideo}
                        className="absolute w-[38px] h-[38px] top-[40%] left-[40%]"
                        alt=""
                      />
                      <img
                        src={urlBack + sv.imagePath}
                        className="object-cover w-full h-full"
                        alt=""
                      />
                    </div>
                    <div className="flex flex-col justify-center gap-4">
                      <p className="text-xs">
                        {DateTimeFormation(prefLang, sv.createdAt)}
                      </p>
                      <p className="max-w-[290px] font-semibold font-oswald">
                        {prefLang === "Tm" ? sv.nameTm : sv.nameRu}
                      </p>
                    </div>
                  </div>
                );
              })}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default VideoDetail;
