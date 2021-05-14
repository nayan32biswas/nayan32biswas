export interface Post {
  slug: string;
  name: string;
  filePath: string;
  isPublish: boolean;
  tags: string[];
  shortDescription: string;
}
