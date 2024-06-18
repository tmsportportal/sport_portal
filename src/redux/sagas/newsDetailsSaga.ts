import { call, put, takeLatest } from "redux-saga/effects";
import {
  PATCH_SPORT_NEWS_VIEWS,
  PATCH_SPORT_NEWS_VIEWS_FAILED,
  PATCH_SPORT_NEWS_VIEWS_SUCCESS,
} from "../types";
import { INewsDetails } from "../interfaces/newsDetails";
import { increaseNewsView } from "../apiCalls";

function* updateViews(action: INewsDetails) {
  const { newsId, categoryId } = action.payload;
  try {
    yield call(increaseNewsView, newsId, categoryId);

    yield put({ type: PATCH_SPORT_NEWS_VIEWS_SUCCESS });
  } catch (error: any) {
    yield put({ type: PATCH_SPORT_NEWS_VIEWS_FAILED, message: error.message });
  }
}

export function* newsDetailsSaga() {
  yield takeLatest(PATCH_SPORT_NEWS_VIEWS, updateViews);
}
