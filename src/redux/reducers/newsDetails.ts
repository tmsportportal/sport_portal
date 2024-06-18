import { INewsDetails, INewsDetailsState } from "../interfaces/newsDetails";

const initialState = {
  message: "",
};

export function newsDetails(
  state: INewsDetailsState = initialState,
  action: INewsDetails
) {
  const { payload, type } = action;

  switch (type) {
    default:
      return state;
  }
}
