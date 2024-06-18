import React, { useEffect } from "react";
import playVideoSvg from "../../assets/svg/playvideo.svg";
import { useDispatch, useSelector } from "react-redux";
import { RootState } from "../../redux/store";
import { ESection, ILocalNews, IVideoNews } from "../../redux/interfaces/home";
import { urlBack } from "../../redux/apiCalls";
import { NEWS_DETAILS_PAGE, VIDEO_DETAILS_PAGE } from "../../tools/links";
import { useLocation, useNavigate } from "react-router-dom";
import { POST_SEARCH } from "../../redux/types";

const SearchResult = () => {
  // useSelector
  const prefLang = useSelector((state: RootState) => state.main.prefLang);
  const news: ILocalNews[] = useSelector(
    (state: RootState) => state.main.search.news
  );
  const videos: IVideoNews[] = useSelector(
    (state: RootState) => state.main.search.videos
  );

  // Hooks
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { state } = useLocation();
  useEffect(() => {
    dispatch({
      type: POST_SEARCH,
      payload: { name: state.searchString, lang: state.prefLang },
    });
  }, []);

  // Function
  const linkToNewsDetail = (newsId: string, section: ESection) => {
    console.log(section);

    navigate("/../" + NEWS_DETAILS_PAGE, {
      state: { newsId, section },
    });
  };
  const linkToVideoDetail = (videoId: string) => {
    navigate("/../" + VIDEO_DETAILS_PAGE, { state: { videoId } });
  };

  return (
    <div className="flex justify-center">
      <div className="max-w-[1170px] w-full pt-9 flex flex-col items-center gap-10">
        {/* Search String */}
        <p className="w-full text-center font-inter text-red-600 text-xl italic">
          {prefLang === "Tm"
            ? `"${state.searchString}" üçin gözleg netijeleri`
            : `Результаты поиска для "${state.searchString}"`}
        </p>
        {/* News */}
        <div className="w-full">
          <div className="flex">
            <p className="border-blue-500 text-blue-500 border-b w-40 font-oswald text-lg">
              {prefLang === "Tm" ? "Täzelikler" : "Новости"}
            </p>
            <span className="border-b border-black w-full" />
          </div>
          <div className="grid grid-cols-2 mx-10 my-5 justify- gap-5">
            {news?.map((item, index) => {
              return (
                <div
                  className="flex cursor-pointer"
                  key={index}
                  onClick={() =>
                    linkToNewsDetail(item.id, item.category.section)
                  }
                >
                  <img
                    src={urlBack + item.imagePath}
                    className="h-[70px] w-[90px] object-cover"
                    alt=""
                  />
                  <div className="pl-4">
                    <p className="font-inter text-[10px]">
                      {prefLang === "Tm" ? item.locationTm : item.locationRu}
                    </p>
                    <p className="font-oswald text-[16px] max-w-[380px] capitalize">
                      {prefLang === "Tm" ? item.nameTm : item.nameRu}
                    </p>
                  </div>
                </div>
              );
            })}
          </div>
        </div>
        {/* Video News */}
        <div className="w-full">
          <div className="flex">
            <p className="border-blue-500 border-b w-40 text-blue-500 font-oswald text-lg">
              {prefLang === "Tm" ? "Wideo täzelikler" : "Видео новости"}
            </p>
            <span className="border-b border-black w-full" />
          </div>
          <div className="flex flex-wrap mx-20 my-5 justify-between gap-5">
            {videos?.map((video, index) => {
              return (
                <div
                  className="flex flex-col max-w-[270px] w-full cursor-pointer"
                  key={index}
                  onClick={() => linkToVideoDetail(video.id)}
                >
                  <div className="relative h-[200px]">
                    <img
                      src={urlBack + video.imagePath}
                      className="object-cover h-full w-full"
                      alt=""
                    />
                    <div className="absolute inset-0 m-0 bg-gradient-to-t from-black/60 to-black/50 " />
                    <div className="absolute top-1/2 left-1/2 h-[38px] w-[38px] ">
                      <img
                        src={playVideoSvg}
                        className="-translate-x-1/2 -translate-y-1/2"
                        alt=""
                      />
                    </div>
                  </div>
                  <p className="pt-6 font-inter text-[10px]">
                    {new Date(video?.updatedAt).toLocaleDateString()}
                  </p>
                  <p className="pt-1 font-oswald text-sm font-semibold">
                    {prefLang === "Tm" ? video.nameTm : video.nameRu}
                  </p>
                </div>
              );
            })}
          </div>
        </div>
      </div>
    </div>
  );
};

export default SearchResult;
