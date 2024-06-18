import React from "react";
import VideoDetail from "../../components/Details/VideoDetail";
import { useDispatch, useSelector } from "react-redux";
import { ESection } from "../../redux/interfaces/home";
import { GET_VIDEO_NEWS } from "../../redux/types";
import { RootState } from "../../redux/store";

const VideoNewsDetails = () => {
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const dispatch = useDispatch();
  dispatch({
    type: GET_VIDEO_NEWS,
    payload: { section: ESection.Video, lang: prefLang },
  });
  
  return <VideoDetail />;
};

export default VideoNewsDetails;
