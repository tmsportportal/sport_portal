import { call, put, takeLatest } from "redux-saga/effects";
import {
  GET_LOCAL_NEWS_SUCCESS,
  GET_LOCAL_NEWS_FAILED,
  GET_LOCAL_NEWS,
  GET_VIDEO_NEWS,
  GET_VIDEO_NEWS_SUCCESS,
  GET_VIDEO_NEWS_FAILED,
  GET_GLOBAL_NEWS,
  GET_GLOBAL_NEWS_FAILED,
  GET_GLOBAL_NEWS_SUCCESS,
  GET_CHAMPIONSHIPS,
  GET_CHAMPIONSHIPS_FAILED,
  GET_CHAMPIONSHIPS_SUCCESS,
} from "../types";
import {
  fetchChampionships,
  fetchGlobalNews,
  fetchLocalNews,
  fetchVideoNews,
} from "../apiCalls";
import { IHome } from "../interfaces/home";

function* getLocalNews(action: IHome) {
  try {
    // @ts-ignore
    const localNews = yield call(fetchLocalNews, action.payload);

    yield put({ type: GET_LOCAL_NEWS_SUCCESS, payload: localNews });
  } catch (error: any) {
    yield put({ type: GET_LOCAL_NEWS_FAILED, message: error.message });
  }
}

function* getGlobalNews(action: IHome) {
  try {
    // @ts-ignore
    const worldNews = yield call(fetchGlobalNews, action.payload);

    yield put({ type: GET_GLOBAL_NEWS_SUCCESS, payload: worldNews });
  } catch (error: any) {
    yield put({ type: GET_GLOBAL_NEWS_FAILED, message: error.message });
  }
}

function* getChampionships() {
  try {
    // @ts-ignore
    const championships = yield call(fetchChampionships);

    yield put({ type: GET_CHAMPIONSHIPS_SUCCESS, payload: championships });
  } catch (error: any) {
    yield put({ type: GET_CHAMPIONSHIPS_FAILED, message: error.message });
  }
}

function* getVideoNews(action: IHome) {
  try {
    // @ts-ignore
    const videoNews = yield call(fetchVideoNews, action.payload);

    yield put({ type: GET_VIDEO_NEWS_SUCCESS, payload: videoNews });
  } catch (error: any) {
    yield put({ type: GET_VIDEO_NEWS_FAILED, message: error.message });
  }
}

export function* localNewsSaga() {
  yield takeLatest(GET_LOCAL_NEWS, getLocalNews);
}

export function* globalNewsSaga() {
  yield takeLatest(GET_GLOBAL_NEWS, getGlobalNews);
}

export function* championshipSaga() {
  yield takeLatest(GET_CHAMPIONSHIPS, getChampionships);
}

export function* videoNewsSaga() {
  yield takeLatest(GET_VIDEO_NEWS, getVideoNews);
}
