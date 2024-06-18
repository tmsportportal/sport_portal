import { ICAction, ICompetitionState } from "../interfaces/competitions";
import {
  GET_COMPETITIONS_SUCCESS,
  GET_COMPETITION_FILTERS_SUCCESS,
  POST_COMPETITION_FILTER_SUCCESS,
} from "../types";

const initialState: ICompetitionState = {
  competitions: [],
  filters: [],
};

export default function competitions(
  state: ICompetitionState = initialState,
  action: ICAction
) {
  const { type, payload } = action;

  switch (type) {
    case GET_COMPETITIONS_SUCCESS:
      return { ...state, competitions: payload };

    case GET_COMPETITION_FILTERS_SUCCESS:
      return { ...state, filters: payload };

    case POST_COMPETITION_FILTER_SUCCESS:
      return { ...state, competitions: payload };

    default:
      return state;
  }
}
