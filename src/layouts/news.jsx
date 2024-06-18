import { setOpenConfigurator, useMaterialTailwindController } from "@/context";
import routes from "@/routes";
import {
  Configurator,
  DashboardNavbar,
  Footer,
  Sidenav,
} from "@/widgets/layout";
import { Cog6ToothIcon } from "@heroicons/react/24/solid";
import { IconButton } from "@material-tailwind/react";
import React from "react";

export const News = () => {
  const [controller, dispatch] = useMaterialTailwindController();

  return (
    <div className="min-h-screen">
      <Sidenav routes={routes} />
      <div className="p-4 xl:ml-80">
        <DashboardNavbar />
        <Configurator />
        <IconButton
          size="lg"
          color="white"
          className="fixed bottom-14 right-8 z-40 rounded-full shadow-orange-500/80"
          onClick={() => setOpenConfigurator(dispatch, true)}
        >
          <Cog6ToothIcon className="w-5 h-5" color="orange"/>
        </IconButton>
        <Footer />
      </div>
    </div>
  );
};

News.displayName = "/src/layout/News.jsx";

export default News;
