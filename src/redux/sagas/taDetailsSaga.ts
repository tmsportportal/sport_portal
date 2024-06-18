import { takeLatest } from "redux-saga/effects";
import { PATCH_TRAINER_VIEWS } from "../types";

function* patchTrainerViews() {}

export function* taDetailsSaga() {
  yield takeLatest(PATCH_TRAINER_VIEWS, patchTrainerViews);
}
