# README

https://microverse.pathwright.com/library/fast-track-curriculum/69047/path/step/40298864/

https://www.theodinproject.com/courses/ruby-on-rai...

# Note:

1. Skip point 16 about setting up a mailer - you will be able to do it if you complete extra task in next steps (which is optional).

2. According to requirements first you should:

  a. "Think through the data architecture required to make this work. There are a lot of models and a lot of associations, so take the time to plan out your approach."

  b. Please prepare some documentation (e.g.  Entity Relationship Diagram or mockups) and review it with your mentor before writing any code (send link to review guidelines to your mentor)

3. Once you've decided that part of the project is ready, your mentor will review it. For that:

  a. Get the link of your Pull Request/Merge Request

  b. Copy this link and send it to your mentor along with the link to your Pull Request/Merge Request (you can't see this doc, but your mentor can).

  c. Submit a link to your project's repository in order to complete this step.

1. Use Postgresql for your database from the beginning (not sqlite3), that way your deployment to Heroku will go much more smoothly. See the Heroku Docs for setup info.

2. Users must sign in to see anything except the sign in page.

3. User sign-in should use the Devise gem. Devise gives you all sorts of helpful methods so you no longer have to write your own user passwords, sessions, and #current_user methods. See the Railscast (which uses Rails 3) for a step-by-step introduction. The docs will be fully current.

4. Users can send Friend Requests to other Users.

5. A User must accept the Friend Request to become friends.

6. The Friend Request shows up in the notifications section of a User’s navbar.

7. Users can create Posts (text only to start).

8. Users can Like Posts.

9. Users can Comment on Posts.

10. Posts should always display with the post content, author, comments and likes.

11. Treat the Posts Index page like the real Facebook’s “Timeline” feature – show all the recent posts from the current user and users she is friends with.

12. Users can create a Profile with a Photo (just start by using the Gravatar image like you did in the Rails Tutorial).

13. The User Show page contains their Profile information, photo, and Posts.

14. The Users Index page lists all users and buttons for sending Friend Requests to those who are not already friends or who don’t already have a pending request.

15. Sign in should use Omniauth to allow a user to sign in with their real Facebook account. See the RailsCast on FB authentication with Devise for a step-by-step look at how it works.

16. Set up a mailer to send a welcome email when a new user signs up. Use the letter_opener gem (see docs here) to test it in development mode.

17. Deploy your App to Heroku.

18. Set up the SendGrid add-on and start sending real emails. It’s free for low usage tiers.

#Extra Credit

1. Make posts also allow images (either just via a URL or, more complicated, by uploading one).

2. Use the Paperclip gem to allow users to upload a photo to their profile.
Make your post able to be either a text OR a photo by using a polymorphic association (so users can still like or comment on it while being none-the-wiser).

3. Style it up nicely! We’ll dive into HTML/CSS in the next course.

#Getting Started

1. Think through the data architecture required to make this work. There are a lot of models and a lot of associations, so take the time to plan out your approach.

2. Build the new postgresql rails app $ rails new odin-facebook --database=postgresql, initialize the Git repo, and update the README to link back to this page.

3. Work your way down the list above! Each step will involve a new challenge but you’ve got the tools.

4. You can populate data like users and posts using the Faker gem, which is basically just a library of sample names and emails. It may just be easier, though, for you to write your own seeds in the db/seeds.rb file, which gets run if you type $ rake db:seed.
