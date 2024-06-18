import { useLocation, Link } from "react-router-dom";
import { Breadcrumbs, Typography } from "@material-tailwind/react";
import React from "react";
import { useMaterialTailwindController } from "@/context";

const Breadcrumb = () => {
  const [controller] = useMaterialTailwindController();
  const { fixedNavbar } = controller;
  const { pathname } = useLocation();
  const [layout, page] = pathname.split("/").filter((el) => el !== "");

  return (
    <div className="capitalize">
      <Breadcrumbs
        className={`bg-transparent p-0 transition-all ${
          fixedNavbar ? "mt-1" : ""
        }`}
      >
        <Link to={`/${layout}`}>
          <Typography
            variant="small"
            color="blue-gray"
            className="font-normal opacity-50 transition-all hover:text-blue-500 hover:opacity-100"
          >
            {layout}
          </Typography>
        </Link>
        <Typography variant="small" color="blue-gray" className="font-normal">
          {page}
        </Typography>
      </Breadcrumbs>
      <Typography variant="h6" color="blue-gray">
        {page}
      </Typography>
    </div>
  );
};

export default Breadcrumb;
