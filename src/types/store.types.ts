import { Post } from "./common.types";

export interface RootState {
  projectName: string;
}

export interface PostState {
  postList: Post[];
  postDetails: Post;
  error: boolean;
}
