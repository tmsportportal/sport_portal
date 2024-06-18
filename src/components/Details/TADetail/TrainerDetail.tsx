import React, { useEffect } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { RootState } from "../../../redux/store";
import { IFederations } from "../../../redux/interfaces/federations";
import { urlBack } from "../../../redux/apiCalls";
import { activateTab } from "../../../redux/actions/main";
import Rating from "../../BaseCategories/Rating";

const TrainerDetail = () => {
  // Hooks
  const { state, pathname } = useLocation();
  const navigate = useNavigate();
  const dispatch = useDispatch();
  useEffect(() => {
    dispatch(activateTab(2));
  }, []);

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const f_trainers: IFederations[] = useSelector(
    (state: RootState) => state.federations.federation_trainers
  ); // Get all federations

  //   Operation
  const federation = f_trainers.find((ft) => ft.id === state.federationId); //Get current trainer's federation
  const trainer = federation?.ftrainers.find((ft) => ft.id === state.trainerId); // Get trainer

  // Function
  const linkToAllTrainers = () => {
    navigate(pathname + "/../all", { state: { federationId: federation?.id } });
  };

  return trainer ? (
    <div className="flex justify-center pt-9">
      <div className="flex justify-between max-w-[1170px] w-full">
        <div className="flex flex-col gap-2">
          <img
            src={urlBack + trainer.imagePath}
            className="w-[210px] h-[235px] object-cover object-center"
            alt=""
          />
          <div className="flex justify-between w-full items-center">
            <div className="flex gap-1 items-center">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="20"
                height="18"
                viewBox="0 0 20 18"
                fill="none"
                className="w-[18px] h-4"
              >
                <path
                  d="M13.2931 8.616C13.2931 10.4371 11.8214 11.9088 10.0003 11.9088C8.17912 11.9088 6.70752 10.4371 6.70752 8.616C6.70752 6.79484 8.17912 5.32324 10.0003 5.32324C11.8214 5.32324 13.2931 6.79484 13.2931 8.616Z"
                  stroke="#0088FF"
                  stroke-opacity="0.4"
                  stroke-width="1.8"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                />
                <path
                  d="M10 16.2223C13.2468 16.2223 16.2729 14.3092 18.3792 10.998C19.2069 9.70109 19.2069 7.52122 18.3792 6.22432C16.2729 2.91313 13.2468 1 10 1C6.75319 1 3.72713 2.91313 1.62085 6.22432C0.793051 7.52122 0.793051 9.70109 1.62085 10.998C3.72713 14.3092 6.75319 16.2223 10 16.2223Z"
                  stroke="#0088FF"
                  stroke-opacity="0.4"
                  stroke-width="1.8"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                />
              </svg>
              <p className="font-inter text-base h-max">{trainer.views}</p>
            </div>
            <img src="/images/bcfdetail/socials.png" alt="" />
          </div>
        </div>
        <div className="max-w-[900px] w-full flex flex-col gap-5">
          <div className="flex justify-between">
            <p className="font-oswald text-[50px] text-[#0088FF] uppercase">
              {prefLang === "Tm" ? trainer.nameTm : trainer.nameRu}
            </p>
            <img
              src={urlBack + federation?.imagePath}
              alt=""
              className="w-[57px] h-[65px]"
            />
          </div>
          <div className="font-inter text-2xl">
            <p>
              {(prefLang === "Tm" ? "Ýaşy: " : "Возраст: ") +
                (trainer.birthday != null
                  ? new Date().getFullYear() -
                    new Date(trainer.birthday).getFullYear()
                  : "-")}
            </p>
            <p>
              {prefLang === "Tm"
                ? `Doglan ýeri: ${trainer.birthPlaceTm}`
                : `Место рождения: ${trainer.birthPlaceRu}`}
            </p>
            <p>
              {prefLang === "Tm"
                ? `Iş tejribesi: ${trainer.experience} ýyl`
                : `Опыт работы: ${trainer.experience} лет.`}
            </p>
            <p>
              {prefLang === "Tm"
                ? `Sport derejesi: ${trainer.sportLevelTm}`
                : `Спортивный уровень: ${trainer.sportLevelRu}`}
            </p>
            <div className="flex justify-between">
              <p>{prefLang === "Tm" ? "Işlän ýerleri:" : "Места работы:"}</p>
              <div className="max-w-[680px] w-full">
                {trainer.workedAtTm.map((wa, index) => {
                  return (
                    <p key={index}>
                      {prefLang === "Ru" ? trainer.workedAtRu[index] : wa}
                    </p>
                  );
                })}
              </div>
            </div>
            <div className="flex justify-between">
              <p>{prefLang === "Tm" ? "Baýraklary:" : "Награды:"}</p>
              <div className="max-w-[680px] w-full">
                {trainer.badgesTm.map((badge, index) => {
                  return (
                    <p key={index}>
                      {prefLang === "Ru" ? trainer.badgesRu[index] : badge}
                    </p>
                  );
                })}
              </div>
            </div>
            <div className="flex justify-between">
              <p>{prefLang === "Tm" ? "Iş wezipesi:" : "Должность:"}</p>
              <div className="max-w-[680px] w-full">
                <p>{prefLang === "Tm" ? trainer.jobTm : trainer.jobRu}</p>
              </div>
            </div>
          </div>
          <div className="flex justify-between pt-3">
            <p className="bg-[#CAE4D6] text-[#00843D] uppercase text-[32px] px-5 rounded-sm font-semibold">
              {prefLang === "Tm" ? trainer.madeTm : trainer.madeRu}
            </p>
            <Rating value={trainer.rating || 0} />
            <button
              className="bg-[#077EE6] text-white font-oswald text-lg px-3"
              onClick={linkToAllTrainers}
            >
              {prefLang === "Tm" ? "Hemmesini görmek" : "Посмотреть все"}
            </button>
          </div>
        </div>
      </div>
    </div>
  ) : (
    <></>
  );
};

export default TrainerDetail;
