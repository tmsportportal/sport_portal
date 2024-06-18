import { call, put, takeLatest } from "redux-saga/effects";
import {
  GET_FEDERATION_ATHLETES,
  GET_FEDERATION_ATHLETES_SUCCESS,
  GET_FEDERATION_SPORTS,
  GET_FEDERATION_SPORTS_FAILED,
  GET_FEDERATION_SPORTS_SUCCESS,
  GET_FEDERATION_TRAINERS,
  GET_FEDERATION_TRAINERS_FAILED,
  GET_FEDERATION_TRAINERS_SUCCESS,
} from "../types";
import {
  fetchFederationAthletes,
  fetchFederationSports,
  fetchFederationTrainers,
} from "../apiCalls";

function* getFederationSports() {
  try {
    // @ts-ignore
    const fsports = yield call(fetchFederationSports);

    yield put({ type: GET_FEDERATION_SPORTS_SUCCESS, payload: fsports });
  } catch (error: any) {
    yield put({ type: GET_FEDERATION_SPORTS_FAILED, message: error.message });
  }
}

function* getFederationTrainers() {
  try {
    // @ts-ignore
    const ftrainers = yield call(fetchFederationTrainers);

    yield put({ type: GET_FEDERATION_TRAINERS_SUCCESS, payload: ftrainers });
  } catch (error: any) {
    yield put({ type: GET_FEDERATION_TRAINERS_FAILED, message: error.message });
  }
}

function* getFederationAthletes() {
  try {
    // @ts-ignore
    const fathletes = yield call(fetchFederationAthletes);

    yield put({ type: GET_FEDERATION_ATHLETES_SUCCESS, payload: fathletes });
  } catch (error: any) {
    yield put({ type: GET_FEDERATION_TRAINERS_FAILED, message: error.message });
  }
}

export function* fsportsSaga() {
  yield takeLatest(GET_FEDERATION_SPORTS, getFederationSports);
}

export function* ftrainersSaga() {
  yield takeLatest(GET_FEDERATION_TRAINERS, getFederationTrainers);
}

export function* fathletesSaga() {
  yield takeLatest(GET_FEDERATION_ATHLETES, getFederationAthletes);
}
