import {
  Accordion,
  AccordionHeader,
  AccordionBody,
} from "@material-tailwind/react";
import React, { FC } from "react";
import { useSelector } from "react-redux";
import { RootState } from "../../../redux/store";
import { IChampionship } from "../../../redux/interfaces/home";
import { urlBack } from "../../../redux/apiCalls";

interface Props {
  champIndex: number;
}

const ChampionshipsBody: FC<Props> = ({ champIndex }) => {
  const [open, setOpen] = React.useState(0);
  const handleOpen = (value: number) => setOpen(open === value ? 0 : value);
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const chempionships: IChampionship[] = useSelector(
    (state: RootState) => state.home.championships[champIndex]
  );

  return (
    <div className="pt-6 font-inter">
      {chempionships?.map((chempionship, index) => {
        return (
          <Accordion
            key={index}
            open={open === index}
            className="pb-2"
            icon={
              <svg
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                className={`${open === index ? "rotate-90" : ""}`}
              >
                <g clip-path="url(#clip0_1_770)">
                  <path
                    d="M14.9744 12L10.7386 16.243L9.32703 14.828L12.1512 12L9.32703 9.17198L10.7386 7.75698L14.9744 12Z"
                    fill="#393939"
                  />
                </g>
                <defs>
                  <clipPath id="clip0_1_770">
                    <rect
                      width="24"
                      height="23.959"
                      fill="white"
                      transform={`translate(0 24) rotate(-90)`}
                    />
                  </clipPath>
                </defs>
              </svg>
            }
            placeholder=""
          >
            <AccordionHeader
              className="border-0 p-0"
              onClick={() => handleOpen(index)}
              placeholder=""
            >
              {chempionship.imagePath && (
                <img
                  src={urlBack + chempionship.imagePath}
                  alt=""
                  className="w-5 h-5"
                />
              )}
              <p className="text-sm font-normal flex justify-start w-full ml-3">
                {prefLang === "Tm" ? chempionship.nameTm : chempionship.nameRu}
              </p>
            </AccordionHeader>
            <AccordionBody>
              <div className={`${open !== index ? "hidden" : ""} text-xs`}>
                <div className="flex justify-between items-center text-[#636363] ml-2 mr-4">
                  <div>{prefLang === "Tm" ? "Toparlar" : "Команды"}</div>
                  <div className="flex">
                    <p className="flex justify-center items-center w-[23px]">
                      {prefLang === "Tm" ? "O" : "И"}
                    </p>
                    <p className="flex justify-center items-center w-[23px]">
                      {prefLang === "Tm" ? "Ý" : "В"}
                    </p>
                    <p className="flex justify-center items-center w-[23px]">
                      {prefLang === "Tm" ? "D" : "Н"}
                    </p>
                    <p className="flex justify-center items-center w-[23px]">
                      {prefLang === "Tm" ? "U" : "П"}
                    </p>
                    <p className="flex justify-center items-center w-[27px]">
                      {prefLang === "Tm" ? "Utuk" : "Счет"}
                    </p>
                  </div>
                </div>
                <div className=" overflow-auto max-h-[320px]">
                  <div className={`flex flex-col gap-1 pr-2`}>
                    {chempionship?.team?.map((team, index) => {
                      return (
                        <div
                          key={index}
                          className={`flex rounded-md p-1 justify-between ${
                            index + 1 < 8 ? "bg-[#F2F0F9]" : "bg-[#FEE6EB]"
                          } 
                      `}
                        >
                          <div className="flex items-center">
                            <p className="pr-2">{index + 1}</p>
                            {team.imagePath && (
                              <div className="w-5 h-5 flex justify-center items-center">
                                <img
                                  src={urlBack + team.imagePath}
                                  className="object-contain object-center w-full h-full"
                                  alt=""
                                />
                              </div>
                            )}
                            <p className="flex items-center pl-1 w-full">
                              {prefLang === "Tm" ? team.nameTm : team.nameRu}
                            </p>
                          </div>
                          <div className="flex justify-between items-center pr-1">
                            <p className="flex justify-center items-center w-[23px]">
                              {team.played}
                            </p>
                            <p className="flex justify-center items-center w-[23px]">
                              {team.win}
                            </p>
                            <p className="flex justify-center items-center w-[23px]">
                              {team.draw}
                            </p>
                            <p className="flex justify-center items-center w-[23px]">
                              {team.loss}
                            </p>
                            <p className="flex justify-center items-center w-[27px]">
                              {team.points}
                            </p>
                          </div>
                        </div>
                      );
                    })}
                  </div>
                </div>
              </div>
            </AccordionBody>
          </Accordion>
        );
      })}
    </div>
  );
};

export default ChampionshipsBody;
