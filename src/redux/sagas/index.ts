import { all } from "redux-saga/effects";
import { loginSaga, mainSaga, searchSaga, weatherSaga } from "./mainSaga";
import {
  championshipSaga,
  globalNewsSaga,
  localNewsSaga,
  videoNewsSaga,
} from "./homeSaga";
import { fathletesSaga, fsportsSaga, ftrainersSaga } from "./federations";
import { newsDetailsSaga } from "./newsDetailsSaga";
import {
  competitionsSaga,
  getCompetitionFiltersSaga,
  postCompetitionFilterSaga,
} from "./competitions";
import { gymsclubsSaga, gymsclubspostfilterSaga } from "./gymsclubsSaga";
import { hcdepartmentsSaga } from "./healthcare";

export default function* rootSaga() {
  yield all([
    mainSaga(),
    weatherSaga(),
    loginSaga(),
    searchSaga(),
    localNewsSaga(),
    globalNewsSaga(),
    championshipSaga(),
    videoNewsSaga(),
    fsportsSaga(),
    ftrainersSaga(),
    fathletesSaga(),
    gymsclubsSaga(),
    gymsclubspostfilterSaga(),
    hcdepartmentsSaga(),
    competitionsSaga(),
    getCompetitionFiltersSaga(),
    postCompetitionFilterSaga(),
    newsDetailsSaga(),
  ]);
}
