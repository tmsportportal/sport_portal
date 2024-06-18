import { EnumType } from "typescript";
import { ESection, ILocalNews, IVideoNews } from "./home";

export interface IMain {
  type: string;
  payload: any;
}
export interface IUser {
  id: string;
  name: string;
  surname: string;
  email: string;
  roles: string[];
  token: string;
}
export enum EUserState {
  Authorized = "Authorized",
  Unauthorized = "Unauthorized",
}
export interface ISearchResult {
  news?: ILocalNews[];
  videos?: IVideoNews[];
}
export interface ILanguage {
  id: string;
  name: string;
  createdAt?: Date;
  updatedAt?: Date;
}
export interface IBaseCategory {
  id: string;
  nameTm: string;
  nameRu: string;
  active: boolean;
  createdAt: Date;
  updatedAt: Date;
}
export interface ISportCategory {
  id: string;
  nameTm: string;
  nameRu: string;
  section: ESection;
  createdAt: Date;
  updatedAt: Date;
}
export interface ISportCategories {
  local: ISportCategory[];
  world: ISportCategory[];
  video: ISportCategory[];
}
export interface IMainState {
  user?: IUser;
  auth_message?: string;
  user_state: EUserState;
  message?: string;
  prefLang: string;
  active_tab: number;
  weather?: object;
  search: ISearchResult;
  langs: ILanguage[];
  base_categories: IBaseCategory[];
  sport_categories: ISportCategories;
  auth_dialog_open: boolean;
}
