export interface Post {
  slug: string;
  name: string;
  filePath: string;
  isPublished: boolean;
  coverImage?: string;
  tags: string[];
  relatedPosts: string[];
  shortDescription: string;
}
