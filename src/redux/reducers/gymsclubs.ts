import { IGymsClubs, IGymsClubsState } from "../interfaces/gymsclubs";
import {
  GET_GYMS_AND_CLUBS_FILTER_SUCCESS,
  POST_GYMS_AND_CLUBS_FILTER_SUCCESS,
} from "../types";

const initialState: IGymsClubsState = {
  filters: [],
  gymsclubs: [],
};

export default function gymsclubs(
  state: IGymsClubsState = initialState,
  action: IGymsClubs
) {
  const { type, payload } = action;

  switch (type) {
    case GET_GYMS_AND_CLUBS_FILTER_SUCCESS:
      return { ...state, filters: payload };

    case POST_GYMS_AND_CLUBS_FILTER_SUCCESS:
      return { ...state, gymsclubs: payload };

    default:
      return state;
  }
}
