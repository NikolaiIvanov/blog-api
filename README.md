# Blog on Rails API

| Travis-CI Build Status | Code Climate: Maintainability | Code Climate: Test Coverage |
| :---- | :------ | :---- |
[ ![Travis-CI build status][1]][2] | [![Code Climate][3]][4] | [![Test Coverage][5]][6] |

[1]: https://travis-ci.org/NikolaiIvanov/blog-api.svg?branch=master
[2]: https://travis-ci.org/NikolaiIvanov/blog-api
[3]: https://api.codeclimate.com/v1/badges/ee7d4001f3ec17cb9ec7/maintainability
[4]: https://codeclimate.com/github/NikolaiIvanov/blog-api/maintainability
[5]: https://api.codeclimate.com/v1/badges/ee7d4001f3ec17cb9ec7/test_coverage
[6]: https://codeclimate.com/github/NikolaiIvanov/blog-api/test_coverage


## Setup

* App prepare
  `bundle install`
  `rake db:create && rake db:migrate && rake db:seed`

* Run the test suite
  `rspec` or
  `bundle exec guard`

### Try online requests:  [blog-api-on-rails.herokuapp.com](https://blog-api-on-rails.herokuapp.com/posts)

> Auth required for interact with Blog-Api.  
It support GET/POST/PUT/DELETE for /posts/:id, /posts/:id/comments/:id

> Auth POST request /auth/login  
`curl -X POST https://blog-api-on-rails.herokuapp.com/auth/login --data "email=user@example.com&password=password"`

> GET Posts index /posts/  
`curl -X GET https://blog-api-on-rails.herokuapp.com/posts -H "Authorization:Here Your Auth Key Token, which you have got from Auth request"`

> GET Selected Post /posts/1  
`curl -X GET https://blog-api-on-rails.herokuapp.com/posts/1 -H "Authorization:Here Your Auth Key Token, which you have got from Auth request"`
