export interface Post {
  slug: string;
  name: string;
  isPublished: boolean;
  coverImage?: string;
  tags: string[];
  relatedPosts: string[];
  shortDescription: string;
}

export interface PostContent {
  slug: string;
  content: string;
}

export interface PostDetails extends Post {
  content: string | null;
}

export interface pageFilter {
  page: number;
  limit: number;
}
