import { call, put, takeLatest } from "redux-saga/effects";
import {
  GET_COMPETITIONS,
  GET_COMPETITIONS_FAILED,
  GET_COMPETITIONS_SUCCESS,
  GET_COMPETITION_FILTERS,
  GET_COMPETITION_FILTERS_FAILED,
  GET_COMPETITION_FILTERS_SUCCESS,
  POST_COMPETITION_FILTER,
  POST_COMPETITION_FILTER_FAILED,
  POST_COMPETITION_FILTER_SUCCESS,
} from "../types";
import {
  fetchCompetitionFilters,
  fetchCompetitions,
  filterCompetitions,
} from "../apiCalls";
import { ICAction } from "../interfaces/competitions";

function* getCompetitions() {
  try {
    // @ts-ignore
    const competitions = yield call(fetchCompetitions);

    yield put({ type: GET_COMPETITIONS_SUCCESS, payload: competitions });
  } catch (error: any) {
    yield put({ type: GET_COMPETITIONS_FAILED, message: error.message });
  }
}
function* getCompetitionFilters(action: ICAction) {
  try {
    // @ts-ignore
    const filters = yield call(fetchCompetitionFilters, action.payload);

    yield put({ type: GET_COMPETITION_FILTERS_SUCCESS, payload: filters });
  } catch (error: any) {
    yield put({ type: GET_COMPETITION_FILTERS_FAILED, message: error.message });
  }
}
function* postCompetitionFilter(action: ICAction) {
  try {
    // @ts-ignore
    const competitions = yield call(filterCompetitions, action.payload);

    yield put({ type: POST_COMPETITION_FILTER_SUCCESS, payload: competitions });
  } catch (error: any) {
    yield put({ type: POST_COMPETITION_FILTER_FAILED, message: error.message });
  }
}

export function* competitionsSaga() {
  yield takeLatest(GET_COMPETITIONS, getCompetitions);
}
export function* getCompetitionFiltersSaga() {
  yield takeLatest(GET_COMPETITION_FILTERS, getCompetitionFilters);
}
export function* postCompetitionFilterSaga() {
  yield takeLatest(POST_COMPETITION_FILTER, postCompetitionFilter);
}
