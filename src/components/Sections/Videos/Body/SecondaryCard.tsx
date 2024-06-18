import { FC, useState } from "react";
import { urlBack } from "../../../../redux/apiCalls";
import playVideoSvg from "../../../../assets/svg/playvideo.svg";
import { IVideoNews } from "../../../../redux/interfaces/home";
import { BG_COLORS } from "../../../../tools/constants";
import { DateTimeFormation } from "../../../../tools/TimeConverter";

interface Props {
  video: IVideoNews;
  prefLang: string;
  linkToVideoDetail: (videoId: string) => void;
}

const SecondaryCard: FC<Props> = ({ video, prefLang, linkToVideoDetail }) => {
  // Hooks
  const [scaleImage, setScaleImage] = useState("scale-100");

  return video ? (
    <div
      className="flex flex-col w-full max-w-[270px] cursor-pointer font-inter"
      onClick={() => linkToVideoDetail(video.id)}
      onMouseEnter={() => setScaleImage("scale-125")}
      onMouseLeave={() => setScaleImage("scale-100")}
    >
      <div className="relative h-[200px] overflow-hidden">
        <img
          src={urlBack + video.imagePath}
          className={`object-cover h-full w-full ${scaleImage} transition duration-300`}
          alt=""
        />
        <div className="absolute inset-0 m-0 bg-gradient-to-t from-black/60 to-black/50 " />
        <img
          src={playVideoSvg}
          className="absolute top-1/2 left-1/2 h-[38px] w-[38px] -translate-x-1/2 -translate-y-1/2"
          alt=""
        />
        <div
          className={`absolute top-6 left-6 h-5 ${
            BG_COLORS[Math.floor(Math.random() * BG_COLORS.length)]
          } w-max text-white text-[9px] flex items-center`}
        >
          <p className="px-3">
            {prefLang === "Tm" ? video.category.nameTm : video.category.nameRu}
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
  ) : (
    <></>
  );
};

export default SecondaryCard;
