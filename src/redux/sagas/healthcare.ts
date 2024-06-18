import { call, put, takeLatest } from "redux-saga/effects";
import {
  GET_HEALTH_CARE_DEPARTMENTS,
  GET_HEALTH_CARE_DEPARTMENTS_FAILED,
  GET_HEALTH_CARE_DEPARTMENTS_SUCCESS,
} from "../types";
import { IHealthCare } from "../interfaces/hcdepartment";
import { fetchHCDepartments } from "../apiCalls";

function* getHCDepartments(action: IHealthCare) {
  try {
    // @ts-ignore
    const departments = yield call(fetchHCDepartments, action.payload);

    yield put({
      type: GET_HEALTH_CARE_DEPARTMENTS_SUCCESS,
      payload: departments,
    });
  } catch (error: any) {
    yield put({
      type: GET_HEALTH_CARE_DEPARTMENTS_FAILED,
      message: error.message,
    });
  }
}

export function* hcdepartmentsSaga() {
  yield takeLatest(GET_HEALTH_CARE_DEPARTMENTS, getHCDepartments);
}
