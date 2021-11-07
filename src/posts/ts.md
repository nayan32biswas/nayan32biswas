
## TS interface example

```ts
interface Category {
  name: string;
  slug: string;
  parent?: Category | number | null;
}

interface Image {
  width?: number;
  height?: number;
  src: string;
}

interface ImageDict {
  alt: string;
  original: Image;
  fallback_original: Image;
  tab?: Image;
  fallback_tab?: Image;
  mobile?: Image;
  fallback_mobile?: Image;
}

interface ProductList {
  category: Category | null;
  name: string;
  slug: string;
  image: ImageDict | null;
  price: number;
}

// eslint-disable-next-line
interface ProductAPI {
  count: number;
  next_page: string | null;
  previous_page: string | null;
  resutls: ProductList[];
}

interface ProductDetails extends ProductList {
  images: ImageDict[];
  description?: string | null;
  related_product: ProductList[];
}

interface ProductDetailsStore {
  [key: string]: ProductDetails;
}

const productDetailsData: ProductDetailsStore = {
  demo: {
    category: null,
    name: "demo",
    slug: "demo",
    price: 10,
    image: null,
    description: null,
    related_product: [
      {
        category: null,
        name: "demo",
        slug: "demo",
        price: 10,
        image: null,
      },
    ],
    images: [
      {
        alt: "demo",
        original: {
          width: 500,
          height: 500,
          src: "/media/demo/image.webp",
        },
        fallback_original: {
          width: 500,
          height: 500,
          src: "/media/demo/image.png",
        },
      },
      {
        alt: "demo",
        original: {
          width: 500,
          height: 500,
          src: "/media/demo/image.webp",
        },
        fallback_original: {
          width: 500,
          height: 500,
          src: "/media/demo/image.png",
        },
        mobile: {
          width: 500,
          height: 500,
          src: "/media/demo/image.webp",
        },
        fallback_mobile: {
          width: 500,
          height: 500,
          src: "/media/demo/image.png",
        },
      },
    ],
  },
  demo_one: {
    category: {
      name: "demo one",
      slug: "demo-one",
      parent: {
        name: "demo-one",
        slug: "demo-one",
      },
    },
    name: "demo-one",
    slug: "demo-one",
    price: 10,
    image: null,
    description: null,
    related_product: [
      {
        category: null,
        name: "demo-one",
        slug: "demo-one",
        price: 10,
        image: null,
      },
    ],
    images: [],
  },
  demo_two: {
    category: {
      name: "demo-two",
      slug: "demo-two",
    },
    name: "demo-two",
    slug: "demo-two",
    price: 10,
    image: null,
    description: null,
    related_product: [
      {
        category: null,
        name: "demo-two",
        slug: "demo-two",
        price: 10,
        image: null,
      },
    ],
    images: [],
  },
};

function printCategory(product: ProductDetails): void {
  const category = product.category;
  console.log(category);
  if (category?.name) {
    console.log("category name: ", category.name);
    console.log("Parent: ", <Category>category?.parent);
    if (<Category>category?.parent) {
      console.log("category parent name: ", (<Category>category?.parent)?.name);
    }
  }
  console.log("\n\n");
}

export function printProduct(): void {
  for (const key in productDetailsData) {
    printCategory(productDetailsData[key]);
  }
}
```
