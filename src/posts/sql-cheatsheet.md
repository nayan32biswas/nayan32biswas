# SQL cheatsheet

## Intro

In this cheatsheet we will use [blog-with-Django](https://github.com/nayan32biswas/blog-with-Django) as a reference database. We will add raw query as well as django query as a reference.

Let's follow the `README.md` of **blog-with-Django** to populate the database with dummy data.

#### Retrieve first 10 posts

```sql
SELECT * FROM public.post_post ORDER BY id ASC LIMIT 10;
```

```py
Post.objects.all().order_by('-id')[:10]
```

#### Retrieve post with author

```sql
SELECT * FROM post_post p LEFT JOIN user_user u ON u.id = p.author_id;
```

```py
Post.objects.select_related('author')
```

#### Retrieve first 10 post with maximum comment

```sql
SELECT post.*, COUNT(comment.post_id) AS comment_count FROM post_post post
LEFT JOIN post_comment comment ON post.id = comment.post_id
GROUP BY post.id ORDER BY comment_count DESC
LIMIT 10;
```

```py
from django.db.models import Count
Post.objects.annotate(comment_count=Count('comments')).order_by('-comment_count')[:10]
```

#### Retrieve author wise comment count order by total_comment

```sql
SELECT 
    p.author_id, COUNT(c.id) AS total_comments
FROM post_post p
LEFT JOIN post_comment c ON p.id = c.post_id
GROUP BY p.author_id
ORDER BY total_comments DESC;
```

```py
User.objects.annotate(total_comments=Count('posts__comments')).order_by('-total_comments')
```

#### Retrieve author wise post with maximum comment

```sql
WITH temporary_table AS (
    SELECT 
        p.author_id, c.post_id, COUNT(*) AS comment_count,
        ROW_NUMBER() OVER (PARTITION BY p.author_id ORDER BY COUNT(*) DESC) AS rn
    FROM post_post p
    JOIN post_comment c ON p.id = c.post_id
    GROUP BY p.author_id, c.post_id
)
SELECT tt.author_id, tt.post_id, tt.comment_count
FROM temporary_table tt WHERE tt.rn = 1
-- ORDER BY tt.comment_count DESC limit 10;
```

```py
from django.db.models import Count, OuterRef, Subquery
max_comment_post_subquery = Comment.objects.filter(post__author=OuterRef('pk')).values('post__author').annotate(
    max_comment_count=Count('id')
).order_by('-max_comment_count').values('max_comment_count')[:1]

author_wise_max_comment_posts = User.objects.annotate(
    max_comment_post_title=Subquery(Post.objects.filter(author=OuterRef('pk')).annotate(
        comment_count=Count('comments')
    ).filter(comment_count=Subquery(max_comment_post_subquery)).values('title')[:1])
)
```
