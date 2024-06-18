import { Routes, Route, Navigate } from "react-router-dom";
import { Dashboard, Auth, News } from "@/layouts";
import { AUTH, DASHBOARD, HOME, NEWS } from "./types/paths";

const App = () => {
  return (
    <Routes>
      <Route path={DASHBOARD + "/*"} element={<Dashboard />} />
      <Route path={AUTH + "/*"} element={<Auth />} />
      <Route path={NEWS + "/*"} element={<News />} />
      <Route path="*" element={<Navigate to={DASHBOARD + HOME} replace />} />
    </Routes>
  );
};

export default App;
