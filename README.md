# Image repository 🌇 🌌 🌉 🏞 🌄

### [https://polar-chamber-64904.herokuapp.com/](https://polar-chamber-64904.herokuapp.com/)

*This app is hosted on heroku free tier, the first loading might be slow.*

#### This app is focused on scalability. I wanted to implement something that would be able to handle uploads of hundreds or thousands of pictures.

## How I handle enormous amount of images

I used `Ruby on Rails` because it’s great for hacking a small project quickly. First, I’ve implemented the basic `CRUD` for `uploading a single image` using the `Active Storage` library.

Then I implemented the multiple images upload feature. This feature needed some optimization for not having too much load on my `Rails app` and not getting timed out when working with an enormous amount of files.

The first thing I did is set up an `Amazon S3` bucket to store my files. This is one of the best solution for file storing and is in the cloud. This will scale well if my app would become the next [burst.shopify.com](burst.shopify.com) or [unsplash.com](unsplash.com).

Now that I can save a large amount of files easily, I wanted to prevent my Rails app to be overloaded with the uploads of many images. To solve this problem I used what is called `direct upload`. So instead of sending the files to my rails application and then storing them to `S3`, the client (my website) sends them directly to `S3` and only send the file id to my server. This remove load to my `Rails app` but also reduce network usage.

Finally, for each file, I create a record in my `PostgreSQL` database with a reference to my image store in the cloud. To make the client request never time out, I used `Active Job` for creating my records.

In other words, my Rails application can handle the upload of hundreds if not thousands of files with no problem.

So now we have huge amount of photo into our image repository. Showing all the pictures in one web page would just be insane and not convenient. The right solution for this is to add `pagination` and `search` to our application. Now I’m confident that my application can handle all the basic use cases of a big image repository app. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.
### Prerequisites

The latest version of

```
Ruby
Rails
PostgreSQL
```

### Installing

* Clone the repository
* Launch your PostgreSQL database
* Run `bundle install` to install the dependencies
* Run `rails db:create && rails db:migrate` to set up your db.
* Run `rails server` to launch and here you go 🎉

## Deployment

I used heroku for deploying my application. If you want to deploy your own version just follow this [guide](https://devcenter.heroku.com/articles/getting-started-with-rails6).
