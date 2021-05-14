export interface Post {
  slug: string;
  name: string;
  filePath: string;
  isPublished: boolean;
  tags: string[];
  shortDescription: string;
}
