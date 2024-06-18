import React from "react";
import { useNavigate } from "react-router-dom";
import { VIDEO_DETAILS_PAGE } from "../../../../tools/links";
import { useSelector } from "react-redux";
import { RootState } from "../../../../redux/store";
import { IVideoNews } from "../../../../redux/interfaces/home";
import SecondaryCard from "./SecondaryCard";
import PrimaryCard from "./PrimaryCard";

const Body = () => {
  // Hooks
  const navigate = useNavigate();

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const videos: IVideoNews[] = useSelector(
    (state: RootState) => state.home.video_news
  );

  // Operation
  const [video_main, ...videos_other] = videos;

  // Function
  const linkToVideoDetail = (videoId: string) => {
    navigate(VIDEO_DETAILS_PAGE, { state: { videoId } });
  };

  return (
    <div className="flex pt-5 flex-col">
      <PrimaryCard
        video={video_main}
        prefLang={prefLang}
        linkToVideoDetail={linkToVideoDetail}
      />
      <div className="pt-6">
        <div className="flex justify-between">
          {videos_other.slice(0, 3).map((video, index) => {
            return (
              <SecondaryCard
                video={video}
                prefLang={prefLang}
                linkToVideoDetail={linkToVideoDetail}
                key={index}
              />
            );
          })}
        </div>
      </div>
    </div>
  );
};

export default Body;
