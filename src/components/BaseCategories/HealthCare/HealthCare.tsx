import {
  Accordion,
  AccordionHeader,
  AccordionBody,
} from "@material-tailwind/react";
import React from "react";
import { useDispatch, useSelector } from "react-redux";
import { useLocation, useNavigate } from "react-router-dom";
import { activateTab } from "../../../redux/actions/main";
import HCDetail from "../../Details/HCDetail";
import { GET_HEALTH_CARE_DEPARTMENTS } from "../../../redux/types";
import { RootState } from "../../../redux/store";
import { urlBack } from "../../../redux/apiCalls";
import { IHCDepartment } from "../../../redux/interfaces/hcdepartment";
import AllHCDEmployees from "./AllEmployees";
import Rating from "../Rating";

const descriptionRu =
  'Медицинские осмотры спортсменов, взрослых и детей, проводятся в соответствии с Приказом МЗ РФ от 23 октября 2020 г. N 1144н "Об утверждении порядка организации оказания медицинской помощи лицам, занимающимся физической культурой и спортом (в том числе при подготовке и проведении физкультурных мероприятий и спортивных мероприятий), включая порядок медицинского осмотра лиц, желающих пройти спортивную подготовку, заниматься физической культурой и спортом в организациях и (или) выполнить нормативы испытаний (тестов) Всероссийского физкультурно-спортивного комплекса "Готов к труду и обороне" (Г ТО)" и форм медицинских заключений о допуске к участию физкультурных и спортивных мероприятиях" Цены ниже муниципальных.';
const descriptionTm =
  "Türgenleriň, ulularyň we çagalaryň lukmançylyk barlaglary Döwlet Saglygy goraýyş ministrliginiň 2020-nji ýylyň 23-nji oktýabryndaky N 1144n Buýruga gatnaşýan adamlara lukmançylyk kömegini bermegiň tertibi tassyklanylandan soň buýrugy boýunça geçirilýär. bedenterbiýe we sport (bedenterbiýe we sport çärelerini taýýarlamakda we geçirmekde), şol sanda sport tälimini almak, guramalarda bedenterbiýe we sport bilen meşgullanmak we synag standartlaryny ýerine ýetirmek isleýän adamlary lukmançylyk barlagynyň tertibini goşmak bilen (Zähmet we goranmaga taýyn) bedenterbiýe we sport toplumynyň (synaglar) we bedenterbiýe we sport çärelerine gatnaşmaga kabul edilmek.";

const Component = () => {
  // Hooks
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const { pathname, state } = useLocation();

  // useState
  const [open, setOpen] = React.useState("");

  // useSelector
  const prefLang = useSelector((state: any) => state.main.prefLang);
  const hcdepartmnts: IHCDepartment[] = useSelector(
    (state: RootState) => state.healthcare.health_care_departments
  );

  // Function
  const handleOpen = (value: string) => setOpen(open === value ? "" : value);
  const linkToEmployeeDetail = (employeeId: string, departmentId: string) => {
    navigate(pathname + "/detail", { state: { employeeId, departmentId } });
    dispatch(activateTab(5));
  };
  const linkToAllEmployees = (departmentId: string) => {
    navigate(pathname + "/all", { state: { departmentId } });
  };

  return pathname.includes("detail") ? (
    <HCDetail />
  ) : pathname.includes("all") ? (
    <AllHCDEmployees
      department={
        state.departmentId &&
        hcdepartmnts.find((department) => department.id === state.departmentId)
      }
    />
  ) : (
    <div className="flex justify-center pt-8">
      <div className="max-w-[1170px] w-full flex flex-col gap-10">
        <div className="px-16">
          <p className="text-center text-shadow font-oswald text-4xl text-[#0F1A42] capitalize leading-relaxed">
            {prefLang === "Tm" ? "Sport lukmançylygy" : "Спортивная медицина"}
          </p>
          <p className="font-inter text-lg text-center max-w-[1000px]">
            {prefLang === "Tm" ? descriptionTm : descriptionRu}
          </p>
        </div>
        <div className="text-[#182135] flex flex-col gap-5 font-inter text-xl font-semibold">
          <p>
            {prefLang === "Tm" ? "Ýükläp al: " : "Скачать: "}
            Tälimçiler üçin Medisina barlagy
          </p>
          <p>
            {prefLang === "Tm" ? "Ýükläp al: " : "Скачать: "}
            Türgenler üçin Medisina barlagy
          </p>
        </div>
        <div className="flex flex-col gap-8">
          {hcdepartmnts.map((department, index) => {
            return (
              <Accordion
                open={open === department.id}
                className="border-b-2 border-r-2 border-blue-100 w-full bg-white"
                key={index}
                placeholder=""
              >
                <AccordionHeader
                  onClick={() => handleOpen(department.id)}
                  className="h-[73px] border-none"
                  placeholder=""
                >
                  <p className="text-[#0088FF] text-2xl flex items-center justify-center pl-8 uppercase font-oswald font-semibold">
                    {prefLang === "Tm" ? department.nameTm : department.nameRu}
                  </p>
                </AccordionHeader>
                <AccordionBody>
                  <div
                    className={`w-full h-max px-8 ${
                      open !== department.id ? "hidden" : ""
                    }`}
                  >
                    <div className="overflow-auto h-60 gap-y-4 flex flex-wrap justify-between pr-2">
                      {department.employees.map((employee, index) => {
                        return (
                          <button
                            key={index}
                            className="flex w-[345px] border border-[#0088FF] h-[108px]"
                            onClick={() =>
                              linkToEmployeeDetail(employee.id, department.id)
                            }
                          >
                            <img
                              src={urlBack + employee.imagePath}
                              className="w-[95px] h-full object-cover"
                              alt=""
                            />
                            <div className="flex flex-col font-inter text-[#0F1A42] justify-between h-full pl-2 pb-1 w-[250px]">
                              <p className="font-semibold text-left h-4 uppercase">
                                {prefLang === "Tm"
                                  ? employee.nameTm
                                  : employee.nameRu}
                              </p>
                              <div className="w-full">
                                <p className="h-[14px] text-[10px] text-left overflow-hidden w-full">
                                  {(prefLang === "Tm"
                                    ? `Ýaşy: `
                                    : `Возраст: `) +
                                    (employee.birthday != null
                                      ? new Date().getFullYear() -
                                        new Date(
                                          employee.birthday
                                        ).getFullYear()
                                      : "-")}
                                </p>
                                <p className="h-[14px] text-[10px] text-left truncate w-full">
                                  {prefLang === "Tm"
                                    ? `Iş ýeri: ${employee.workAtTm}`
                                    : `Место работы: ${employee.workAtRu}`}
                                </p>
                                <p className="h-[14px] text-[10px] text-left overflow-hidden w-full">
                                  {prefLang === "Tm"
                                    ? `Iş bölümi: ${department.nameTm}`
                                    : `Кафедра: ${department.nameRu}`}
                                </p>
                                <p className="h-[14px] text-[10px] text-left overflow-hidden w-full">
                                  {prefLang === "Tm"
                                    ? `Iş tejribesi: ${employee.experience}ýyl`
                                    : `Опыт работы: ${employee.experience}г`}
                                </p>
                                <p className="h-[14px] text-[10px] text-left overflow-hidden w-full">
                                  {prefLang === "Tm"
                                    ? `Iş wezipesi: ${employee.jobTm}`
                                    : `Должность: ${employee.jobRu}`}
                                </p>
                              </div>
                              <div className="flex justify-end">
                                <img src={""} className="h-3 pr-1" alt="" />
                                <Rating
                                  className="h-3"
                                  gap="gap-1"
                                  readonly
                                  value={employee.rating}
                                />
                              </div>
                            </div>
                          </button>
                        );
                      })}
                    </div>
                    <div className="flex justify-end py-4 px-6">
                      <button
                        className="bg-[#077EE6] text-white h-11 font-oswald px-4"
                        onClick={() => linkToAllEmployees(department.id)}
                      >
                        {prefLang === "Tm"
                          ? "Hemmesini görmek"
                          : "Посмотреть все"}
                      </button>
                    </div>
                  </div>
                </AccordionBody>
              </Accordion>
            );
          })}
        </div>
      </div>
    </div>
  );
};

const HealthCare = () => {
  const dispatch = useDispatch();
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  dispatch({ type: GET_HEALTH_CARE_DEPARTMENTS, payload: prefLang });

  return <Component />;
};

export default HealthCare;
