# gon = User.create(name: "Gon", email: "gon@email.com", password: "password")
# killua = User.create(name: "Killua", email: "killua@email.com", password: "password")

# BlogPost.create(title: "My First Move", content: "I knew the day would come when I had to leave the island.", user_id: gon.id)

# # Use AR to pre-associate data:
# killua.blog_posts.create(title: "Don't Forget Your Charger!", content: "I was out of fuel before I even started my move.")

# gons_post = gon.blog_posts.build(title: "I Almost Forgot My Fishing Pole", content: "Luckily I used Easy Move App to keep track of my items!!")
# gons_post.save

hallway = Box.create(name: "Hallway")
bedroom_1 = Box.create(name: "Bedroom 1")

tools = Category.create(name: "Tools")
electronics = Category.create(name: "Electronics")

fishing_pole = Item.create(name: "Fishing Pole", box_id: hallway.id, category_id: tools.id,  user_id: 1)
charger = Item.create(name: "Charger", box_id: bedroom_1.id, category_id: electronics.id, user_id: 2)