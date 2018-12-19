# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(first_name: "Ian", last_name: "Carter", password: "password", email: "example@email.com")

topic_1 = Topic.create(title: "How to make a Youtube video",
                    goal: "To create a well edited Youtube video that I can be proud of",
                    complete: true,
                    user_id: user.id)

question_1 = Question.create(title: "What editing software should I use?",
                            notes_text: "After research I've found that Sony Vegas Pro seems to be the best editing software, but Final Cut Pro is really popular for MacOS users.",
                            topic_id: topic_1.id)

link_1 = Link.create(url: "https://www.wondershare.com/finalcutpro/final-cut-pro-vs-sony-vegas.html",
                    name: "Editing software Reviews",
                    question_id: question_1.id)

question_2 = Question.create(title: "What camera should I use?",
                            notes_text: "It seems that the Canon 70D and Sony a7R II are very popular among most amateur film makers.",
                            topic_id: topic_1.id)

link_2 = Link.create(url: "https://www.imaging-resource.com/cameras/canon/70d/vs/sony/a7r-ii/",
                    name: "Camrea Reviews",
                    question_id: question_2.id)






topic_2 = Topic.create(title: "How to set up a P.O. box.",
                    goal: "To make a P.O. box so I can receive mail for my business.",
                    complete: false,
                    user_id: user.id)

question_3 = Question.create(title: "What are the steps I need to take?",
                            notes_text: "Step 1. Pick a PO Box Location and Size, Step 2. Get a PO Box, Step 3. Redirect Your Mail",
                            topic_id: topic_2.id)

link_3 = Link.create(url: "https://www.virtualpostmail.com/blog/3-easy-steps-renting-po-box",
                    name: "3 Easy Steps on How To Get a PO Box",
                    question_id: question_3.id)

question_4 = Question.create(title: "Will it cost me money?",
                            notes_text: "Renting a small P.O. box for six months costs as little as $19 in some locations, while in other locations the cost is $75. A full breakdown of the costs in each region is available on the U.S. Postal Service website.",
                            topic_id: topic_2.id)

link_4 = Link.create(url: "https://www.bankrate.com/personal-finance/smart-money/how-much-does-a-po-box-cost/",
                    name: "How much does it cost to have a P.O. box?",
                    question_id: question_4.id)
