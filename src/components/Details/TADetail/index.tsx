import React from "react";
import { useLocation } from "react-router-dom";
import { TRAINERS } from "../../../tools/links";
import TrainerDetail from "./TrainerDetail";
import AthleteDetail from "./AthleteDetail";
import {
  GET_FEDERATION_TRAINERS,
  GET_FEDERATION_ATHLETES,
} from "../../../redux/types";
import { useDispatch } from "react-redux";

const BCFDetail = () => {
  // Hooks
  const dispatch = useDispatch();
  const { pathname } = useLocation();
  pathname.includes(TRAINERS)
    ? dispatch({ type: GET_FEDERATION_TRAINERS })
    : dispatch({ type: GET_FEDERATION_ATHLETES });
  return pathname.includes(TRAINERS) ? <TrainerDetail /> : <AthleteDetail />;
};

export default BCFDetail;
