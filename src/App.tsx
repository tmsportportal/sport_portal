import React from "react";
import HomePage from "./pages/home";
import { Route, Routes } from "react-router-dom";
import NF404 from "./pages/404";
import NewsDetails from "./pages/News/NewsDetails";
import {
  ABOUTUS,
  BASE_CATEGORIES,
  NEWS_ALL,
  NEWS_DETAILS_PAGE,
  PRIVACY,
  SEARCH,
  VIDEO_DETAILS_PAGE,
  VIDEO_NEWS_ALL,
} from "./tools/links";
import Footer from "./components/Footer";
import Banner from "./components/Headers";
import BaseCategoriesList from "./components/Headers/BaseCategory";
import ToolBox from "./components/Headers/ToolBox";
import NewsAll from "./pages/News";
import { useDispatch } from "react-redux";
import { GET_MAIN, GET_WEATHER } from "./redux/types";
import Info from "./pages/Info";
import BaseCategories from "./pages/BaseCategories";
import VideoNewsAll from "./pages/VideoNews";
import VideoNewsDetails from "./pages/VideoNews/VideoNewsDetails";
import ScrollToTop from "./ScrollToTop";
import SearchResult from "./pages/SearchResult";
import Navbar from "./components/Navbar";

const App = () => {
  const dispatch = useDispatch();
  dispatch({ type: GET_MAIN });
  dispatch({ type: GET_WEATHER });

  return (
    <Routes>
      <Route
        element={
          <TemplateApp>
            <HomePage />
          </TemplateApp>
        }
        path="/"
      />
      <Route
        element={
          <TemplateApp>
            <Info />
          </TemplateApp>
        }
        path={ABOUTUS}
      />
      <Route
        element={
          <TemplateApp>
            <Info privacy />
          </TemplateApp>
        }
        path={PRIVACY}
      />
      <Route
        element={
          <TemplateApp>
            <SearchResult />
          </TemplateApp>
        }
        path={SEARCH}
      />
      <Route
        element={
          <TemplateApp>
            <NewsDetails />
          </TemplateApp>
        }
        path={NEWS_DETAILS_PAGE}
      />
      <Route
        element={
          <TemplateApp>
            <VideoNewsDetails />
          </TemplateApp>
        }
        path={VIDEO_DETAILS_PAGE}
      />
      <Route
        element={
          <TemplateApp>
            <BaseCategories />
          </TemplateApp>
        }
        path={BASE_CATEGORIES + "/*"}
      />
      <Route
        element={
          <TemplateApp>
            <NewsAll />
          </TemplateApp>
        }
        path={NEWS_ALL}
      />
      <Route
        element={
          <TemplateApp>
            <VideoNewsAll />
          </TemplateApp>
        }
        path={VIDEO_NEWS_ALL}
      />
      <Route
        element={
          <TemplateApp>
            <NF404 />
          </TemplateApp>
        }
        path="*"
      />
    </Routes>
  );
};

const TemplateApp = ({ children }: { children: JSX.Element }) => {
  return process.env.REACT_APP_ENVIRONMENT === "DEV" ? (
    <div className="flex justify-center">
      <ScrollToTop />
      <div className="w-full max-w-[1256px]">
        <Banner />
        <ToolBox />
        <div className="border border-b-0 "></div>
        <BaseCategoriesList />
        <div className=""></div>
        <Navbar />
        <div className="min-h-[500px]">{children}</div>
        <Footer />
      </div>
    </div>
  ) : (
    <div className="flex w-screen h-screen justify-center items-center flex-col gap-10">
      <a href="https://www.instagram.com/sportportal.tm" target="_blank">
        <img src="icons/toolbox/logo.png" alt="" className="w-96" />
      </a>
      <p className="text-5xl text-gray-500">Tehniki işler geçirilýär...</p>
    </div>
  );
};

export default App;
