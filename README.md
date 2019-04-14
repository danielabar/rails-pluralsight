# Ruby on Rails 4: Getting Started

> Learning Rails with Pluralsight [course](https://app.pluralsight.com/library/courses/ruby-rails-4-getting-started/table-of-contents)

## Introduction

![route](doc-images/route.png "route")

- Will be building Q&A site.
- Every request goes through a cycle of Rails components
- Start with *Route* (URL entered in browser) + HTTP Verb
- Route figures out which *Controller* should be in charge of request and passes control to it
- Controller is responsible for preparing everything the *View* needs to render
- View is template - how data will be communicated back to user
- Rails is very modular - lots of internal concepts that should be understood
- Default database that comes with Rails is SQLite, will be used for this course. Self-contained transactional db, very easy to use

### Starting a Rails Project

Need recent version of Ruby

```shell
$ ruby -v
ruby 2.6.0p0 (2018-12-25 revision 66547) [x86_64-darwin16]
```

Install Rails, course using 4.2.0 but some incompatibility wrt numeric types with Ruby 2.6 therefore will be using 4.2.8, see [this SO post](https://stackoverflow.com/questions/41504106/ruby-2-4-and-rails-4-stack-level-too-deep-systemstackerror) for details.

```shell
$ gem install rails -v 4.2.8
```

To view all options for starting rails project:

```shell
$ rails new -h
```

To start a new project with default settings (HU is project name for this course):

```shell
$ rails new HU
$ cd HU
$ tree
.
├── Gemfile
├── Gemfile.lock
├── README.rdoc
├── Rakefile
├── app
│   ├── assets
│   │   ├── images
│   │   ├── javascripts
│   │   │   └── application.js
│   │   └── stylesheets
│   │       └── application.css
│   ├── controllers
│   │   ├── application_controller.rb
│   │   └── concerns
│   ├── helpers
│   │   └── application_helper.rb
│   ├── mailers
│   ├── models
│   │   └── concerns
│   └── views
│       └── layouts
│           └── application.html.erb
├── bin
│   ├── bundle
│   ├── rails
│   ├── rake
│   ├── setup
│   └── spring
├── config
│   ├── application.rb
│   ├── boot.rb
│   ├── database.yml
│   ├── environment.rb
│   ├── environments
│   │   ├── development.rb
│   │   ├── production.rb
│   │   └── test.rb
│   ├── initializers
│   │   ├── assets.rb
│   │   ├── backtrace_silencers.rb
│   │   ├── cookies_serializer.rb
│   │   ├── filter_parameter_logging.rb
│   │   ├── inflections.rb
│   │   ├── mime_types.rb
│   │   ├── session_store.rb
│   │   └── wrap_parameters.rb
│   ├── locales
│   │   └── en.yml
│   ├── routes.rb
│   └── secrets.yml
├── config.ru
├── db
│   └── seeds.rb
├── lib
│   ├── assets
│   └── tasks
├── log
├── public
│   ├── 404.html
│   ├── 422.html
│   ├── 500.html
│   ├── favicon.ico
│   └── robots.txt
├── test
│   ├── controllers
│   ├── fixtures
│   ├── helpers
│   ├── integration
│   ├── mailers
│   ├── models
│   └── test_helper.rb
├── tmp
│   └── cache
│       └── assets
└── vendor
    └── assets
        ├── javascripts
        └── stylesheets
```

Start a web server for project, then navigate to [http://localhost:3000](http://localhost:3000)

```shell
$ rails server
```

Worked for instructor but I was getting error related to sqllite3, had to install older version, update Gemfile:

```ruby
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.3.13'
```

Then update deps and run server again:

```shell
$ bundle update
$ rails server
```

Note server console in terminal from navigating to root index - indicates HTTP Verb, Route and which Controller and action handled that route, in this case `/` was handled by `Rails::WelcomeController` and `index` action within that controller.

```
Started GET "/" for ::1 at 2019-04-14 15:55:30 -0400
Processing by Rails::WelcomeController#index as HTML
  Rendered /Users/someuser/.rvm/gems/ruby-2.6.0/gems/railties-4.2.8/lib/rails/templates/rails/welcome/index.html.erb (2.1ms)
Completed 200 OK in 18ms (Views: 10.1ms | ActiveRecord: 0.0ms)
```

In browser, clicking `About your application's environment` link shows some env info and server log shows route `/rails/info/properties` handled by `InfoController`, `properties` action.

```
Started GET "/rails/info/properties" for ::1 at 2019-04-14 15:59:16 -0400
Processing by Rails::InfoController#properties as */*
  Rendered /Users/someuser/.rvm/gems/ruby-2.6.0/gems/railties-4.2.8/lib/rails/templates/rails/info/properties.html.erb (0.3ms)
Completed 200 OK in 43ms (Views: 8.4ms | ActiveRecord: 5.6ms)
```