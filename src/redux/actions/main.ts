import { sp_local_user } from "../../tools/constants";
import { IMain, IUser } from "../interfaces/main";
import {
  ACTIVATE_TAB,
  AUTH_DIALOG_OPEN,
  REMOVE_AUTH_MESSAGE,
  SET_LANG,
  SET_TOKEN,
} from "../types";

export function setLangAction(lang: string): IMain {
  return { type: SET_LANG, payload: lang };
}
export function activateTab(index: number): IMain {
  return { type: ACTIVATE_TAB, payload: index };
}
export function authDialogOpen(open: boolean): IMain {
  return { type: AUTH_DIALOG_OPEN, payload: open };
}
export function setUserLocally(user?: IUser): IMain {
  user
    ? localStorage.setItem(sp_local_user, JSON.stringify(user))
    : localStorage.removeItem(sp_local_user);

  return { type: SET_TOKEN, payload: user };
}
export function removeAuthMessage(): IMain {
  return { type: REMOVE_AUTH_MESSAGE, payload: undefined };
}
