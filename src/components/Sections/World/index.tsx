import React, { useState } from "react";
import { WorldNewsHeader, ChampionshipsHeader } from "./Headers";
import WorldNewsBody from "./WorldNewsBody";
import ChampionshipsBody from "./ChampionshipsBody";

const World = () => {
  return (
    <div className="flex justify-between">
      <div className="max-w-[870px] flex flex-col w-full">
        <WorldNewsHeader />
        <WorldNewsBody />
      </div>
      <div className="max-w-[270px] flex flex-col w-full">
        <ChampionshipStats />
      </div>
    </div>
  );
};

export const ChampionshipStats = () => {
  const [champIndex, setChampIndex] = useState(0);

  return (
    <>
      <ChampionshipsHeader
        champIndex={champIndex}
        setChampIndex={setChampIndex}
      />
      <ChampionshipsBody champIndex={champIndex} />
    </>
  );
};

export default World;
