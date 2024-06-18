import { EUserState, IMain, IMainState } from "../interfaces/main";
import {
  ACTIVATE_TAB,
  AUTH_DIALOG_OPEN,
  GET_MAIN_SUCCESS,
  GET_WEATHER_FAILED,
  GET_WEATHER_SUCCESS,
  POST_LOGIN_FAILED,
  POST_LOGIN_SUCCESS,
  POST_SEARCH_SUCCESS,
  REMOVE_AUTH_MESSAGE,
  SET_LANG,
} from "../types";

const initialState: IMainState = {
  user_state: EUserState.Unauthorized,
  active_tab: 0,
  search: {},
  langs: [{ id: "", name: "" }],
  base_categories: [],
  sport_categories: {
    local: [],
    world: [],
    video: [],
  },
  prefLang: "",
  auth_dialog_open: false,
};

export default function main(state: IMainState = initialState, action: IMain) {
  const { payload, type } = action;

  switch (type) {
    case GET_MAIN_SUCCESS:
      return {
        ...state,
        langs: payload.lang,
        base_categories: payload.base_categories,
        sport_categories: payload.sport_categories,
      };

    case GET_WEATHER_SUCCESS:
      return { ...state, weather: payload };

    case GET_WEATHER_FAILED:
      return { ...state, message: payload };

    case SET_LANG:
      return { ...state, prefLang: payload };

    case ACTIVATE_TAB:
      return { ...state, active_tab: payload };

    case AUTH_DIALOG_OPEN:
      return { ...state, auth_dialog_open: payload };

    case POST_SEARCH_SUCCESS:
      return { ...state, search: payload };

    case POST_LOGIN_SUCCESS:
      return { ...state, user_state: EUserState.Authorized };

    case POST_LOGIN_FAILED:
      return { ...state, auth_message: payload };

    case REMOVE_AUTH_MESSAGE:
      return { ...state, auth_message: payload };

    default:
      return state;
  }
}
