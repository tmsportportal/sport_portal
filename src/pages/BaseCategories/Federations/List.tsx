import {
  Accordion,
  AccordionHeader,
  AccordionBody,
} from "@material-tailwind/react";
import React, { Fragment, useState } from "react";
import { useSelector } from "react-redux";
import Athlete from "../../../components/BaseCategories/Athlete";
import Sports from "../../../components/BaseCategories/Sports";
import Trainers from "../../../components/BaseCategories/Trainers";
import { IFederations } from "../../../redux/interfaces/federations";
import { RootState } from "../../../redux/store";
import { urlBack } from "../../../redux/apiCalls";

const List = ({ indexComponent }: { indexComponent: number }) => {
  // useState
  const [open, setOpen] = useState("");

  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const federations: IFederations[] = useSelector((state: RootState) => {
    switch (indexComponent) {
      case 0:
        return state.federations.federation_sports;
      case 1:
        return state.federations.federation_trainers;

      default:
        return state.federations.federation_athletes;
    }
  });

  // Operation
  const handleOpen = (value: string) => setOpen(open === value ? "" : value);

  return (
    <Fragment>
      {federations.map((federation, index) => {
        return (
          <Accordion
            open={open === federation.id}
            className="border-b-2 border-r-[1px] border-blue-200 w-full bg-white" //
            key={index}
            placeholder=""
          >
            <AccordionHeader
              onClick={() => handleOpen(federation.id)}
              className="h-[73px] border-none"
              placeholder=""
            >
              <div className="flex justify-between w-full">
                <p className="text-[#0088FF] text-2xl flex items-center justify-center pl-8 uppercase">
                  {prefLang === "Tm" ? federation.nameTm : federation.nameRu}
                </p>
                <img
                  src={urlBack + federation.imagePath}
                  className="w-[76px] h-[65px] object-contain object-center"
                  alt=""
                />
              </div>
            </AccordionHeader>
            <AccordionBody>
              <div
                className={`w-full h-max ${
                  open !== federation.id ? "hidden" : ""
                }`}
              >
                {indexComponent === 0 ? (
                  federation.fsports != null ? (
                    <Sports data={federation.fsports} prefLang={prefLang} />
                  ) : (
                    <></>
                  )
                ) : indexComponent === 1 ? (
                  federation.ftrainers.length ? (
                    <Trainers federation={federation} />
                  ) : (
                    <></>
                  )
                ) : federation.fathlete.length ? (
                  <Athlete federation={federation} />
                ) : (
                  <></>
                )}
              </div>
            </AccordionBody>
          </Accordion>
        );
      })}
    </Fragment>
  );
};

export default List;
