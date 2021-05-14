import { Post, PostDetails } from "./common.types";

export interface RootState {
  projectName: string;
}

export interface PostState {
  postList: Post[];
  postDetails: PostDetails;
  error: boolean;
}
