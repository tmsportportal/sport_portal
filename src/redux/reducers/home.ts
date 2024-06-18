import { IHomeState } from "../interfaces/home";
import { IMain } from "../interfaces/main";
import {
  GET_CHAMPIONSHIPS_SUCCESS,
  GET_GLOBAL_NEWS_SUCCESS,
  GET_LOCAL_NEWS_SUCCESS,
  GET_VIDEO_NEWS_SUCCESS,
} from "../types";

const initialState: IHomeState = {
  local_news: [],
  world_news: [],
  championships: [[]],
  video_news: [],
};

export default function home(state: IHomeState = initialState, action: IMain) {
  const { payload, type } = action;

  switch (type) {
    case GET_LOCAL_NEWS_SUCCESS:
      return { ...state, local_news: payload };

    case GET_GLOBAL_NEWS_SUCCESS:
      return { ...state, world_news: payload };

    case GET_CHAMPIONSHIPS_SUCCESS:
      return { ...state, championships: payload };

    case GET_VIDEO_NEWS_SUCCESS:
      return { ...state, video_news: payload };

    default:
      return state;
  }
}
