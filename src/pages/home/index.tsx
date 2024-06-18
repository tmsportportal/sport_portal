import React from "react";
import NewsCards from "../../components/Sections/Local";
import VideoNews from "../../components/Sections/Videos/Videos";
import WorldSportNews from "../../components/Sections/World";
import { useDispatch, useSelector } from "react-redux";
import {
  GET_CHAMPIONSHIPS,
  GET_GLOBAL_NEWS,
  GET_LOCAL_NEWS,
  GET_VIDEO_NEWS,
} from "../../redux/types";
import { ESection } from "../../redux/interfaces/home";
import { RootState } from "../../redux/store";

const HomePage = () => {
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const dispatch = useDispatch();
  dispatch({
    type: GET_LOCAL_NEWS,
    payload: { section: ESection.Local, lang: prefLang },
  });
  dispatch({
    type: GET_GLOBAL_NEWS,
    payload: { section: ESection.World, lang: prefLang },
  });
  dispatch({
    type: GET_VIDEO_NEWS,
    payload: { section: ESection.Video, lang: prefLang },
  });
  dispatch({ type: GET_CHAMPIONSHIPS });

  return (
    <div className="w-full flex justify-center pt-9">
      <div className="max-w-[1170px] flex flex-col gap-7 w-full">
        <NewsCards />
        <WorldSportNews />
        <VideoNews />
      </div>
    </div>
  );
};

export default HomePage;
