import React from "react";
import { HeaderWithCategories } from "./Headers";
import Body from "./Body/Body";
import FilterNews from "./FilterNews";
import { useSelector } from "react-redux";
import { RootState } from "../../../redux/store";

const Videos = () => {
  const videos_other = useSelector((state: RootState) => state.home.video_news);

  return (
      <div className="flex w-full justify-between">
        <div className="flex flex-col max-w-[870px] w-full">
          <HeaderWithCategories />
          <Body />
        </div>
        <div className="flex flex-col max-w-[280px] w-full">
          <FilterNews data={videos_other} />
        </div>
      </div>
  );
};

export default Videos;
