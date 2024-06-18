export interface IHealthCare {
  type: string;
  payload: any;
}
export interface IHCEmployee {
  id: string;
  birthday: Date;
  jobTm: null;
  jobRu: null;
  nameTm: null;
  nameRu: null;
  links: object;
  views: number;
  rating: number;
  workAtTm: null;
  workAtRu: null;
  imagePath: string;
  experience: number;
  departmentId: string;
  createdAt: Date;
  updatedAt: Date;
}
export interface IHCDepartment {
  id: string;
  nameTm: string;
  nameRu: string;
  createdAt: Date;
  updatedAt: Date;
  employees: IHCEmployee[];
}
export interface IHealthCareState {
  health_care_departments: IHCDepartment[];
}
