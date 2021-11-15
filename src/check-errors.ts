import POST from "./store/postData";
import POST_CONTENT from "./store/postContent";

function checkError() {
  for (let idx = 0; idx < POST.length; idx++) {
    const post = POST[idx];
    if (POST_CONTENT.length > idx) {
      if (POST_CONTENT[idx].slug !== post.slug) {
        throw new Error(
          `Post "${post.slug}" not match with "${POST_CONTENT[idx].slug}"`
        );
      }
    } else {
      throw new Error(`Post ${post.slug} was missing`);
    }
  }
  if (POST.length !== POST_CONTENT.length) {
    throw new Error(
      `There are more posts than expected. Last post was "${
        POST[POST.length - 1].slug
      }"`
    );
  }
  console.log(`No errors found, Number of post was "${POST.length}"`);
}

checkError();
