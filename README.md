# API Skeleton

This project template highly inspired by HypoCard::Solid and [Service Skeleton](https://github.com/reverbdev/service-skeleton).

## How to use

* put your API into api/ (avoid heavy business logics, they should be in models.)
* [Roar](https://github.com/apotonick/roar) as representers instead of a raw representation.
* migrations will be automatically applied. (be careful in production)
* using Unicorn to deploy it. A sample unicorn.conf.rb is provided.

## tools
* script/console [RACK_ENV]
