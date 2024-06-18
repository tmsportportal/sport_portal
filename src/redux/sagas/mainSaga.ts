import { call, put, takeLatest } from "redux-saga/effects";
import {
  GET_MAIN,
  GET_MAIN_FAILED,
  GET_MAIN_SUCCESS,
  GET_WEATHER,
  GET_WEATHER_FAILED,
  GET_WEATHER_SUCCESS,
  POST_LOGIN,
  POST_LOGIN_FAILED,
  POST_LOGIN_SUCCESS,
  POST_SEARCH,
  POST_SEARCH_FAILED,
  POST_SEARCH_SUCCESS,
} from "../types";
import { doLogin, doSearch, fetchMain, fetchWeather } from "../apiCalls";
import { IMain, IUser } from "../interfaces/main";
import {
  authDialogOpen,
  removeAuthMessage,
  setUserLocally,
} from "../actions/main";

function* getMain() {
  try {
    // @ts-ignore
    const main = yield call(fetchMain);

    yield put({ type: GET_MAIN_SUCCESS, payload: main });
  } catch (error: any) {
    yield put({ type: GET_MAIN_FAILED, message: error.message });
  }
}
function* getWeather() {
  try {
    // @ts-ignore
    const weather = yield call(fetchWeather);

    yield put({
      type: GET_WEATHER_SUCCESS,
      payload: Math.trunc(weather.main.temp),
    });
  } catch (error: any) {
    yield put({ type: GET_WEATHER_FAILED, payload: error });
  }
}
function* search(action: IMain) {
  try {
    // @ts-ignore
    const found = yield call(doSearch, action.payload);

    yield put({ type: POST_SEARCH_SUCCESS, payload: found });
  } catch (error: any) {
    yield put({ type: POST_SEARCH_FAILED, message: error.message });
  }
}
function* login(action: IMain) {
  try {
    // @ts-ignore
    const user: IUser = yield call(doLogin, action.payload);

    yield put(setUserLocally(user));
    yield put(authDialogOpen(false));
    yield put(removeAuthMessage());
    yield put({ type: POST_LOGIN_SUCCESS });
  } catch (error: any) {
    if (Math.trunc(error.response.data.statusCode / 100) === 4)
      yield put({
        type: POST_LOGIN_FAILED,
        payload: error.response.data.message,
      });
  }
}

export function* mainSaga() {
  yield takeLatest(GET_MAIN, getMain);
}
export function* weatherSaga() {
  yield takeLatest(GET_WEATHER, getWeather);
}
export function* searchSaga() {
  yield takeLatest(POST_SEARCH, search);
}
export function* loginSaga() {
  yield takeLatest(POST_LOGIN, login);
}
