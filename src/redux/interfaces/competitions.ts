export interface ICAction {
  type: string;
  payload: any;
}

export interface ICompetitionType {
  id: number;
  nameTm: string;
  nameRu: string;
  createdAt: Date;
  updatedAt: Date;
}

export interface IVenues {
  id: number;
  nameTm: string;
  nameRu: string;
  createdAt: Date;
  updatedAt: Date;
}

export interface ICompetition {
  id: string;
  views: number;
  typeId: number;
  nameTm: string;
  nameRu: string;
  textTm: string;
  textRu: string;
  startDate: Date;
  endDate: Date;
  imagePath: string;
  locationTm: string;
  locationRu: string;
  venues: IVenues;
  competitionType: ICompetitionType;
  createdAt: Date;
  updatedAt: Date;
}
export interface ICompetitionFilter {
  name: string;
  filters: string[];
}
export interface ICompetitionState {
  competitions: ICompetition[];
  filters: ICompetitionFilter[];
}
