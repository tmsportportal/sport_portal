import React, { FC, useState } from "react";
import { IVideoNews } from "../../../../redux/interfaces/home";
import { urlBack } from "../../../../redux/apiCalls";
import playVideoSvg from "../../../../assets/svg/playvideo.svg";
import { BG_COLORS } from "../../../../tools/constants";
import { DateTimeFormation } from "../../../../tools/TimeConverter";

interface Props {
  video: IVideoNews;
  prefLang: string;
  linkToVideoDetail: (videoId: string) => void;
}

const PrimaryCard: FC<Props> = ({ video, prefLang, linkToVideoDetail }) => {
  // Hooks
  const [scaleImage, setScaleImage] = useState("scale-100");

  return video ? (
    <div
      className="relative h-[400px] w-full font-inter cursor-pointer overflow-hidden transform"
      onClick={() => linkToVideoDetail(video.id)}
      onMouseEnter={() => setScaleImage("scale-125")}
      onMouseLeave={() => setScaleImage("scale-100")}
    >
      <img
        src={urlBack + video.imagePath}
        className={`object-cover h-full w-full ${scaleImage} transition duration-300`}
        alt=""
      />
      <div className="absolute inset-0 m-0 bg-gradient-to-t from-black/60 to-black/50" />
      <div
        className={`absolute top-6 left-6 h-5  ${
          BG_COLORS[Math.floor(Math.random() * BG_COLORS.length)]
        } w-max text-white text-[9px] flex items-center`}
      >
        <p className="px-3">
          {prefLang === "Tm" ? video.category?.nameTm : video.category?.nameRu}
        </p>
      </div>
      <img
        src={playVideoSvg}
        alt=""
        className="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2"
      />
      <div
        className={`absolute text-white bottom-6 max-w-[60%] left-0 w-full ml-6`}
      >
        <p className="font-inter text-[10px] max-w-[131px]">
          {DateTimeFormation(prefLang, video.createdAt)}
        </p>
        <p className={`font-oswald text-4xl`}>
          {prefLang === "Tm" ? video.nameTm : video.nameRu}
        </p>
      </div>
    </div>
  ) : (
    <></>
  );
};

export default PrimaryCard;
