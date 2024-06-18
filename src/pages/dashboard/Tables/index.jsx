import Authors from "./Authors";
import Projects from "./Projects";

export function Tables() {
  return (
    <div className="mt-12 mb-8 flex flex-col gap-12">
      <Authors />
      <Projects />
    </div>
  );
}

export default Tables;
