import React from "react";
import Cards from "./Cards";
import Charts from "./Charts";
import Projects from "./Projects";
import Overview from "./Overview";

export function Home() {
  return (
    <div className="mt-12">
      <Cards />
      <Charts />
      <div className="mb-4 grid grid-cols-1 gap-6 xl:grid-cols-3">
        <Projects />
        <Overview />
      </div>
    </div>
  );
}

export default Home;
