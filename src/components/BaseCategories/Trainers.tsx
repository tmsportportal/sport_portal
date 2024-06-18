import React from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { useSelector } from "react-redux";
import { IFederations } from "../../redux/interfaces/federations";
import { urlBack } from "../../redux/apiCalls";
import { RootState } from "../../redux/store";
import Rating from "./Rating";

const Trainers = ({ federation }: { federation: IFederations }) => {
  // Hooks
  const navigate = useNavigate();
  const { pathname } = useLocation();

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);

  // Function
  const linkToTrainerDetail = (trainerId: string) => {
    navigate(pathname + "/id", {
      state: { trainerId, federationId: federation.id },
    });
  };
  const linktoAllTrainers = () => {
    navigate(pathname + "/all", { state: { federationId: federation.id } });
  };

  return (
    <div className="flex flex-col gap-[5px]">
      <div className="pt-8 px-8">
        <div className="w-full h-[395px] flex flex-wrap justify-between overflow-auto">
          {federation.ftrainers.map((trainer, index) => {
            return (
              <button
                key={index}
                className="w-[345px] h-max flex gap-2 border border-[#0088FF]"
                onClick={() => linkToTrainerDetail(trainer.id)}
              >
                <img
                  src={urlBack + trainer.imagePath}
                  className="object-cover w-[95px] h-[112px] object-center"
                  alt=""
                />
                <div className="font-inter text-[#182135] flex flex-col justify-between w-full h-full overflow-hidden">
                  <p className="font-semibold text-left truncate">
                    {prefLang === "Tm" ? trainer.nameTm : trainer.nameRu}
                  </p>
                  <div className="text-[10px]">
                    <p className="h-[14px] flex items-center">
                      {(prefLang === "Tm" ? "Ýaşy:" : "Возраст:") +
                        (trainer.birthday != null
                          ? new Date().getFullYear() -
                            new Date(trainer.birthday).getFullYear()
                          : "-")}
                    </p>
                    <p className="h-[14px] flex items-center">
                      <p className="min-w-max">
                        {prefLang === "Tm" ? "Doglan ýeri:" : "Место рождения:"}
                      </p>
                      <p className="truncate">
                        {prefLang === "Tm"
                          ? trainer.birthPlaceTm
                          : trainer.birthPlaceRu}
                      </p>
                    </p>
                    <p className="h-[14px] flex items-center space-x-1">
                      <p className="min-w-max">
                        {prefLang === "Tm"
                          ? "Sport derejesi:"
                          : "Спортивный уровень"}
                      </p>
                      <p className=" truncate">
                        {prefLang === "Tm"
                          ? trainer.sportLevelTm
                          : trainer.sportLevelRu}
                      </p>
                    </p>
                    <p className="h-[14px] flex items-center space-x-1">
                      <p className="min-w-max">Iş wezipesi:</p>
                      <p className="truncate">
                        {prefLang === "Tm" ? trainer.jobTm : trainer.jobRu}
                      </p>
                    </p>
                    <p className="h-[14px] flex items-center">
                      {prefLang === "Tm"
                        ? `Iş tejribesi: ${trainer.experience} ýyl`
                        : `Опыт работы: ${trainer.experience} лет.`}
                    </p>
                  </div>
                  <div className="flex w-full justify-between items-center h-4">
                    <p className="bg-[#CCE6D8] text-[#00843D] px-2 h-full flex items-center justify-center rounded-md">
                      {prefLang === "Tm" ? trainer.madeTm : trainer.madeRu}
                    </p>
                    <Rating
                      className="h-full"
                      gap="gap-1"
                      readonly
                      value={trainer.rating}
                    />
                  </div>
                </div>
              </button>
            );
          })}
        </div>
      </div>
      <div className="px-[48px] py-1 flex justify-end">
        <button
          className="bg-[#077EE6] text-white h-[44px] w-[148px] font-oswald text-base"
          onClick={linktoAllTrainers}
        >
          {prefLang === "Tm" ? "Hemmesini görmek" : "Посмотреть все"}
        </button>
      </div>
    </div>
  );
};

export default Trainers;
