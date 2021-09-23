import POST from "./postData";
import { Search as SearchType } from "@/types/common.types";
import { Post } from "../types/common.types";

function searchPost(query: string): Array<SearchType> {
  const reg = new RegExp(query, "i");
  const results = POST.flatMap((post: Post): SearchType => {
    if (post.tags.indexOf(query) > -1) {
      return {
        name: post.name,
        link: {
          name: "home",
          query: { route: "blog-details", slug: post.slug },
        },
        priority: 7,
      };
    }
    if (post.name.search(reg) > -1) {
      return {
        name: post.name,
        link: {
          name: "home",
          query: { route: "blog-details", slug: post.slug },
        },
        priority: 3,
      };
    }
    // eslint-disable-next-line
    return [] as any;
  });
  return results;
}

const search = (query: string): Array<SearchType> => {
  query = query.toLowerCase();
  const results = searchPost(query);
  return results;
};

export default search;
