export interface IGymsClubs {
  type: string;
  payload: any;
}
export interface IGymsClubsFilter {
  name: string;
  filters: string[];
}
export interface IGymsAndClubs {
  id: string;
  name: string;
  link: string;
  views: number;
  email: string;
  nameTm: string;
  nameRu: string;
  latitude: number;
  longitude: number;
  locationTm: string;
  locationRu: string;
  tel: string[];
  sports: string[];
  openAt: string[];
  sportsTm: string[];
  sportsRu: string[];
  openAtTm: string[];
  openAtRu: string[];
  imagePath1: string;
  imagePath2: string;
  imagePath3: string;
  imagePath4: string;
  imagePath5: string;
  location: string;
  createdAt: Date;
  updatedAt: Date;
}
export interface IGymsClubsState {
  filters: IGymsClubsFilter[];
  gymsclubs: IGymsAndClubs[];
}
