MVP
As a user, hasmany blog posts
- be able to signup, login and logout 
- view all blog posts
- view one particular blog post
- create blog post 
- edit/delete own blogpost

As a blog post, belongs to a user
- title
- content
- user id
- date

STRETCH
- user can choose to make blog post public or private
- AR validations
- error messages in flash
- create user homepage to view all items, boxes, categories

From user homepage concerning items,
- create new item, if not listed, with category & box
- edit item
- delete item 

From user homepage to one particular box,
- view all items in box and from there, all options from items page (add new item, edit/delete particular item)
- create new box 
- edit name
- delete box

From user homepage to one particular category,
- view all items in category and from there, all options from items page (add new item, edit/delete particular item)
- create new box 
- edit name
- delete box

Assocations:
User
- has many items, boxes & categories
Item
- belongs to user
- belongs to box
- belongs to category
Category
- has many items
- has many boxes through items
Box
- has many items
- has many categories, through items