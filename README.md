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

> Current callbacks `/posts` and `/posts/:id/comments`
